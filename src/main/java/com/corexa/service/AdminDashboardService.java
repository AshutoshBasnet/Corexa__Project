package com.corexa.service;

import java.sql.Connection;

import java.sql.DatabaseMetaData;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import com.corexa.config.DbConfig;
import com.corexa.model.AddressModel;
import com.corexa.model.CategoryReportModel;
import com.corexa.model.MonthlySalesReportModel;
import com.corexa.model.ProductModel;
import com.corexa.model.UserModel;
import com.corexa.util.DataBaseSchemaUtil;

/**
 * Service class for interacting with the database to retrieve dashboard-related
 * data. This class handles database connections and performs queries to fetch
 * user information.
 */
public class AdminDashboardService {

	private Connection dbConn;
	private boolean isConnectionError = false;
	private Boolean hasAccountStatusColumn;
	private Boolean hasOrderDateTimeColumn;

	/**
	 * Constructor that initializes the database connection. Sets the connection
	 * error flag if the connection fails.
	 */
	public AdminDashboardService() {
		try {
			dbConn = DbConfig.getDbConnection();
			DataBaseSchemaUtil.ensureAccountStatusColumn(dbConn);
		} catch (SQLException | ClassNotFoundException ex) {
			// Log and handle exceptions related to database connection
			ex.printStackTrace();
			isConnectionError = true;
		}
	}

	/**
	 * Retrieves all user information from the database.
	 * 
	 * @return A list of UserModel objects containing user data. Returns null
	 *         if there is a connection error or if an exception occurs during query
	 *         execution.
	 */
	public List<UserModel> getAllUsersInfo() {
		if (isConnectionError) {
			System.out.println("Connection Error!");
			return null;
		}

		// SQL query to fetch user details
		boolean withStatus = hasAccountStatusColumn();
		String query = withStatus
				? "SELECT user_id, first_name, last_name, address_id, email, number, account_status FROM user WHERE userRole = 'customer'"
				: "SELECT user_id, first_name, last_name, address_id, email, number FROM user WHERE userRole = 'customer'";
		try (PreparedStatement stmt = dbConn.prepareStatement(query)) {
			ResultSet result = stmt.executeQuery();
			List<UserModel> userList = new ArrayList<>();

			while (result.next()) {
				// SQL query to fetch address name based on address_id
				String addressQuery = "SELECT address_id, name FROM address WHERE address_id = ?";
				try (PreparedStatement addressStmt = dbConn.prepareStatement(addressQuery)) {
					addressStmt.setInt(1, result.getInt("address_id"));
					ResultSet addressResult = addressStmt.executeQuery();

					AddressModel addressModel = new AddressModel();
					if (addressResult.next()) {
						// Set address name in the AddressModel
						addressModel.setName(addressResult.getString("name"));
						addressModel.setAddressId(addressResult.getInt("address_id"));
					}

					// Create and add UserModel to the list
					UserModel user = new UserModel(result.getInt("user_id"), // User ID
							result.getString("first_name"), // First Name
							result.getString("last_name"), // Last Name
							addressModel, // Associated Address
							result.getString("email"), // Email
							result.getString("number") // Phone Number
					);
					user.setAccountStatus(withStatus ? result.getString("account_status") : "PENDING");
					userList.add(user);

					addressResult.close(); // Close ResultSet to avoid resource leaks
				} catch (SQLException e) {
					// Log and handle exceptions related to address query execution
					e.printStackTrace();
					// Continue to process other users or handle this error appropriately
				}
			}
			return userList;
		} catch (SQLException e) {
			// Log and handle exceptions related to user query execution
			e.printStackTrace();
			return null;
		}
	}

	public UserModel getSpecificUserInfo(int userId) {
		if (isConnectionError) {
			System.out.println("Connection Error!");
			return null;
		}

		// SQL query to join user and address tables
		String query = "SELECT s.user_id, s.first_name, s.last_name, s.username, s.dob, s.gender, "
				+ "s.email, s.number, s.address_id, s.profilePic, "
				+ "p.name AS name " + "FROM user s "
				+ "JOIN address p ON s.address_id = p.address_id " + "WHERE s.user_id = ?";

		try (PreparedStatement stmt = dbConn.prepareStatement(query)) {
			stmt.setInt(1, userId);
			ResultSet result = stmt.executeQuery();
			UserModel user = null;

			if (result.next()) {
				// Extract data from the result set
				int id = result.getInt("user_id");
				String firstName = result.getString("first_name");
				String lastName = result.getString("last_name");
				String userName = result.getString("username");
				LocalDate dob = result.getDate("dob").toLocalDate(); // Assuming dob is of type DATE in SQL
				String gender = result.getString("gender");
				String email = result.getString("email");
				String number = result.getString("number");
				String imageUrl = result.getString("profilePic");

				// Create addresAModel instance
				AddressModel address = new AddressModel();
				address.setAddressId(result.getInt("address_id"));
				address.setName(result.getString("name"));

				// Create UserModel instance
				user = new UserModel(id, firstName, lastName, userName, dob, gender, email, number, null, address,
						imageUrl);

				// Add the user to the list
			}
			return user;
		} catch (SQLException e) {
			// Log and handle exceptions
			e.printStackTrace();
			return null;
		}
	}

	public String getTotalUsers() {
		if (isConnectionError) {
			return null;
		}

		String countQuery = "SELECT COUNT(*) AS total FROM user where userRole= 'customer';";
		try (PreparedStatement stmt = dbConn.prepareStatement(countQuery)) {

			ResultSet result = stmt.executeQuery();
			if (result.next()) {
				return result.getString("total");
			} else {
				return "";
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}

	public String getPendingUsers() {
		if (isConnectionError || !hasAccountStatusColumn()) {
			return "0";
		}

		String countQuery = "SELECT COUNT(*) AS total FROM user WHERE userRole = 'customer' AND account_status = 'PENDING'";
		try (PreparedStatement stmt = dbConn.prepareStatement(countQuery)) {
			ResultSet result = stmt.executeQuery();
			return result.next() ? result.getString("total") : "0";
		} catch (SQLException e) {
			e.printStackTrace();
			return "0";
		}
	}

	public boolean updateUserStatus(int userId, String accountStatus) {
		if (isConnectionError || !hasAccountStatusColumn()) {
			return false;
		}

		String query = "UPDATE user SET account_status = ? WHERE user_id = ? AND userRole = 'customer'";
		try (PreparedStatement stmt = dbConn.prepareStatement(query)) {
			stmt.setString(1, accountStatus);
			stmt.setInt(2, userId);
			return stmt.executeUpdate() > 0;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}

	public boolean updateUserActiveState(int userId, boolean active) {
		return updateUserStatus(userId, active ? "APPROVED" : "SUSPENDED");
	}
	
	public String getTotalProducts() {
		if (isConnectionError) {
			return null;
		}

		String countQuery = "SELECT COUNT(*) AS totalProduct FROM product;";
		try (PreparedStatement stmt = dbConn.prepareStatement(countQuery)) {

			ResultSet result = stmt.executeQuery();
			if (result.next()) {
				return result.getString("totalProduct");
			} else {
				return "";
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public String getKathmanduUsers() {
		if (isConnectionError) {
			return null;
		}

		String countQuery = "SELECT COUNT(*) AS total FROM user WHERE address_id = 1 and userRole = 'customer';";
		try (PreparedStatement stmt = dbConn.prepareStatement(countQuery)) {
			ResultSet result = stmt.executeQuery();
			if (result.next()) {
				return result.getString("total");
			} else {
				return "";
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}

	public String getLalitpurUsers() {
		if (isConnectionError) {
			return null;
		}

		String countQuery = "SELECT COUNT(*) AS total FROM user WHERE address_id = 2 and userRole = 'customer';";
		try (PreparedStatement stmt = dbConn.prepareStatement(countQuery)) {
			ResultSet result = stmt.executeQuery();
			if (result.next()) {
				return result.getString("total");
			} else {
				return "";
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}

	public String getBhaktapurUsers() {
		if (isConnectionError) {
			return null;
		}

		String countQuery = "SELECT COUNT(*) AS total FROM user WHERE address_id = 3 and userRole = 'customer';";
		try (PreparedStatement stmt = dbConn.prepareStatement(countQuery)) {
			ResultSet result = stmt.executeQuery();
			if (result.next()) {
				return result.getString("total");
			} else {
				return "";
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public String getTotalSales() {
		if (isConnectionError) {
			return null;
		}

		String query = "SELECT SUM(quantity * price_at_order) AS totalSales FROM order_items;";
		try (PreparedStatement stmt = dbConn.prepareStatement(query)) {
			ResultSet result = stmt.executeQuery();
			if (result.next()) {
				double sales = result.getDouble("totalSales");
				return String.format("%.2f", sales); // Example: 22300.00
			} else {
				return "0.00";
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}

	public String getTotalAvailableStock() {
		if (isConnectionError) {
			return "0";
		}

		String query = "SELECT COALESCE(SUM(quantity), 0) AS totalStock FROM product";
		try (PreparedStatement stmt = dbConn.prepareStatement(query)) {
			ResultSet result = stmt.executeQuery();
			return result.next() ? result.getString("totalStock") : "0";
		} catch (SQLException e) {
			e.printStackTrace();
			return "0";
		}
	}

	public String getTotalOrderedItems() {
		if (isConnectionError) {
			return "0";
		}

		String query = "SELECT COALESCE(SUM(quantity), 0) AS totalOrdered FROM order_items";
		try (PreparedStatement stmt = dbConn.prepareStatement(query)) {
			ResultSet result = stmt.executeQuery();
			return result.next() ? result.getString("totalOrdered") : "0";
		} catch (SQLException e) {
			e.printStackTrace();
			return "0";
		}
	}

	public List<ProductModel> getLowStockProducts() {
		List<ProductModel> products = new ArrayList<>();
		if (isConnectionError) {
			return products;
		}

		String query = "SELECT product_id, productName, description, price, quantity, category, productImage "
				+ "FROM product WHERE quantity <= 5 ORDER BY quantity ASC, productName ASC LIMIT 5";
		try (PreparedStatement stmt = dbConn.prepareStatement(query)) {
			ResultSet result = stmt.executeQuery();
			while (result.next()) {
				products.add(mapProduct(result));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return products;
	}

	public List<ProductModel> getTopOrderedProducts() {
		List<ProductModel> products = new ArrayList<>();
		if (isConnectionError) {
			return products;
		}

		String query = "SELECT p.product_id, p.productName, p.description, p.price, p.quantity, p.category, p.productImage, "
				+ "COALESCE(SUM(oi.quantity), 0) AS ordered_quantity "
				+ "FROM product p LEFT JOIN order_items oi ON p.product_id = oi.product_id "
				+ "GROUP BY p.product_id, p.productName, p.description, p.price, p.quantity, p.category, p.productImage "
				+ "ORDER BY ordered_quantity DESC, p.productName ASC LIMIT 5";
		try (PreparedStatement stmt = dbConn.prepareStatement(query)) {
			ResultSet result = stmt.executeQuery();
			while (result.next()) {
				ProductModel product = mapProduct(result);
				product.setQuantity(result.getInt("ordered_quantity"));
				products.add(product);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return products;
	}

	public List<CategoryReportModel> getCategoryReports() {
		List<CategoryReportModel> reports = new ArrayList<>();
		if (isConnectionError) {
			return reports;
		}

		String query = "SELECT stock.category, stock.available_quantity, COALESCE(sales.ordered_quantity, 0) AS ordered_quantity "
				+ "FROM (SELECT category, SUM(quantity) AS available_quantity FROM product GROUP BY category) stock "
				+ "LEFT JOIN (SELECT p.category, SUM(oi.quantity) AS ordered_quantity "
				+ "FROM order_items oi JOIN product p ON oi.product_id = p.product_id GROUP BY p.category) sales "
				+ "ON stock.category = sales.category "
				+ "ORDER BY ordered_quantity DESC, stock.category ASC";
		try (PreparedStatement stmt = dbConn.prepareStatement(query)) {
			ResultSet result = stmt.executeQuery();
			while (result.next()) {
				reports.add(new CategoryReportModel(result.getString("category"),
						result.getInt("ordered_quantity"),
						result.getInt("available_quantity")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return reports;
	}

	public List<MonthlySalesReportModel> getMonthlySalesReport(LocalDate startDate, LocalDate endDateExclusive) {
		List<MonthlySalesReportModel> reports = new ArrayList<>();
		if (isConnectionError) {
			return reports;
		}

		boolean withDateTime = hasOrderDateTimeColumn();
		String dateTimeExpression = withDateTime ? "o.order_datetime" : "o.order_date";
		String query = "SELECT o.order_id, " + dateTimeExpression + " AS order_moment, "
				+ "o.order_date, o.order_status, o.paymentMethod, "
				+ "u.first_name, u.last_name, u.email, u.number, "
				+ "p.productName, p.category, oi.quantity, oi.price_at_order, "
				+ "(oi.quantity * oi.price_at_order) AS line_total "
				+ "FROM order_table o "
				+ "JOIN user u ON o.user_id = u.user_id "
				+ "JOIN order_items oi ON o.order_id = oi.order_id "
				+ "JOIN product p ON oi.product_id = p.product_id "
				+ "WHERE o.order_date >= ? AND o.order_date < ? "
				+ "ORDER BY " + dateTimeExpression + " DESC, o.order_id DESC";

		try (PreparedStatement stmt = dbConn.prepareStatement(query)) {
			stmt.setDate(1, java.sql.Date.valueOf(startDate));
			stmt.setDate(2, java.sql.Date.valueOf(endDateExclusive));
			ResultSet result = stmt.executeQuery();

			while (result.next()) {
				reports.add(mapMonthlySalesReport(result, withDateTime));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return reports;
	}

	public double getMonthlySalesTotal(LocalDate startDate, LocalDate endDateExclusive) {
		if (isConnectionError) {
			return 0;
		}

		String query = "SELECT COALESCE(SUM(oi.quantity * oi.price_at_order), 0) AS monthly_total "
				+ "FROM order_table o "
				+ "JOIN order_items oi ON o.order_id = oi.order_id "
				+ "WHERE o.order_date >= ? AND o.order_date < ?";
		try (PreparedStatement stmt = dbConn.prepareStatement(query)) {
			stmt.setDate(1, java.sql.Date.valueOf(startDate));
			stmt.setDate(2, java.sql.Date.valueOf(endDateExclusive));
			ResultSet result = stmt.executeQuery();
			return result.next() ? result.getDouble("monthly_total") : 0;
		} catch (SQLException e) {
			e.printStackTrace();
			return 0;
		}
	}

	private MonthlySalesReportModel mapMonthlySalesReport(ResultSet result, boolean withDateTime) throws SQLException {
		MonthlySalesReportModel report = new MonthlySalesReportModel();
		report.setOrderId(result.getInt("order_id"));
		report.setOrderDateTime(resolveOrderDateTime(result, withDateTime));
		report.setCustomerName(result.getString("first_name") + " " + result.getString("last_name"));
		report.setEmail(result.getString("email"));
		report.setPhoneNumber(result.getString("number"));
		report.setProductName(result.getString("productName"));
		report.setCategory(result.getString("category"));
		report.setQuantity(result.getInt("quantity"));
		report.setPriceAtOrder(result.getDouble("price_at_order"));
		report.setLineTotal(result.getDouble("line_total"));
		report.setPaymentMethod(result.getString("paymentMethod"));
		report.setOrderStatus(result.getString("order_status"));
		return report;
	}

	private LocalDateTime resolveOrderDateTime(ResultSet result, boolean withDateTime) throws SQLException {
		if (withDateTime) {
			Timestamp timestamp = result.getTimestamp("order_moment");
			if (timestamp != null) {
				return timestamp.toLocalDateTime();
			}
		}

		java.sql.Date date = result.getDate("order_date");
		return date == null ? null : date.toLocalDate().atStartOfDay();
	}

	private ProductModel mapProduct(ResultSet result) throws SQLException {
		return new ProductModel(
				result.getInt("product_id"),
				result.getString("productName"),
				result.getString("description"),
				result.getDouble("price"),
				result.getInt("quantity"),
				result.getString("category"),
				result.getString("productImage"));
	}

	private boolean hasAccountStatusColumn() {
		if (hasAccountStatusColumn != null) {
			return hasAccountStatusColumn;
		}

		if (dbConn == null) {
			hasAccountStatusColumn = false;
			return false;
		}

		hasAccountStatusColumn = DataBaseSchemaUtil.ensureAccountStatusColumn(dbConn);

		return hasAccountStatusColumn;
	}

	private boolean hasOrderDateTimeColumn() {
		if (hasOrderDateTimeColumn != null) {
			return hasOrderDateTimeColumn;
		}

		if (dbConn == null) {
			hasOrderDateTimeColumn = false;
			return false;
		}

		try {
			DatabaseMetaData metadata = dbConn.getMetaData();
			try (ResultSet columns = metadata.getColumns(dbConn.getCatalog(), null, "order_table", "order_datetime")) {
				hasOrderDateTimeColumn = columns.next();
			}
		} catch (SQLException e) {
			hasOrderDateTimeColumn = false;
		}

		return hasOrderDateTimeColumn;
	}



}

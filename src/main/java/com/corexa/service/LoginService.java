package com.corexa.service;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.corexa.config.DbConfig;
import com.corexa.model.UserModel;
import com.corexa.util.DataBaseSchemaUtil;
import com.corexa.util.PasswordUtil;

/**
 * Service class for handling login operations. Connects to the database,
 * verifies user credentials, and returns login status.
 */
public class LoginService {

	private Connection dbConn;
	private boolean isConnectionError = false;
	private String lastFailureReason;

	/**
	 * Constructor initializes the database connection. Sets the connection error
	 * flag if the connection fails.
	 */
	public LoginService() {
		try {
			dbConn = DbConfig.getDbConnection();
			DataBaseSchemaUtil.ensureAccountStatusColumn(dbConn);
		} catch (SQLException | ClassNotFoundException ex) {
			ex.printStackTrace();
			isConnectionError = true;
		}
	}

	/**
	 * Validates the user credentials against the database records.
	 *
	 * @param userModel the UserModel object containing user credentials
	 * @return true if the user credentials are valid, false otherwise; null if a
	 *         connection error occurs
	 */
	/**
     * Retrieves the user from the database and validates the password.
     */
	public UserModel loginUser(String username, String password) {
	    lastFailureReason = null;
	    if (isConnectionError) {
	        System.out.println("Connection Error!");
	        lastFailureReason = "Login is temporarily unavailable. Please try again later.";
	        return null;
	    }

	    String query = "SELECT * FROM user WHERE username = ?";
	    try (PreparedStatement stmt = dbConn.prepareStatement(query)) {
	        stmt.setString(1, username);
	        ResultSet result = stmt.executeQuery();

	        if (result.next()) {
	            String dbPassword = result.getString("password");
	            String decryptedPassword = PasswordUtil.decrypt(dbPassword, username);

	            // Decrypt and compare
	            if (password != null && password.equals(decryptedPassword)) {
	            	String role = result.getString("userRole");
	            	String accountStatus = getOptionalString(result, "account_status");

	            	if (!"admin".equals(role) && (accountStatus == null
	            			|| !"APPROVED".equalsIgnoreCase(accountStatus))) {
	            		String displayStatus = accountStatus == null ? "pending" : accountStatus.toLowerCase();
	            		lastFailureReason = "Your registration request is " + displayStatus
	            				+ ". Please wait for admin approval.";
	            		return null;
	            	}

	                UserModel user = new UserModel();
	                user.setUserName(result.getString("username"));
	                user.setPassword(dbPassword);
	                user.setUserRole(role);
	                user.setAccountStatus(accountStatus);
	                user.setId(result.getInt("user_id"));
	                //Set the image URL
	                user.setImageUrl(result.getString("profilePic"));

	                return user;
	            }
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	        lastFailureReason = "Login failed due to a system error. Please try again later.";
	    }

	    if (lastFailureReason == null) {
	    	lastFailureReason = "User credential mismatch. Please try again!";
	    }
	    return null;
	}

	public String getLastFailureReason() {
		return lastFailureReason;
	}

	private String getOptionalString(ResultSet rs, String columnName) throws SQLException {
		for (int i = 1; i <= rs.getMetaData().getColumnCount(); i++) {
			if (columnName.equalsIgnoreCase(rs.getMetaData().getColumnLabel(i))) {
				return rs.getString(columnName);
			}
		}
		return null;
	}
}

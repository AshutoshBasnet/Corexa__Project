package com.corexa.controller.admin;

import jakarta.servlet.ServletException;


import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.YearMonth;
import java.time.format.DateTimeFormatter;
import java.util.List;

import com.corexa.model.MonthlySalesReportModel;
import com.corexa.service.AdminDashboardService;
import com.corexa.service.OrderService;
import com.corexa.util.RedirectionUtil;


/**
 * Servlet implementation for handling dashboard-related HTTP requests.
 * 
 * This servlet manages interactions with the AdminDashboardService to fetch users
 * information. 
 *
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/adminDashboard", "/admin/reports/monthly-sales" })
public class AdminDashboardController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// Instance of DashboardService for handling business logic
	private AdminDashboardService dashboardService;
	private OrderService orderService;
	
	/**
	 * Default constructor initializes the dashboardService and orderService instance.
	 */
	public AdminDashboardController() {
		
		try {
            this.orderService = new OrderService();
            this.dashboardService = new AdminDashboardService();
        } catch (SQLException e) {
            // Log the error and handle it appropriately
            e.printStackTrace();
            throw new RuntimeException("Failed to initialize OrderService", e);
        }
	}

	/**
	 * Handles HTTP GET requests by retrieving orders information and forwarding
	 * the request to the adminDashboard JSP page.
	 * 
	 * @param request  The HttpServletRequest object containing the request data.
	 * @param response The HttpServletResponse object used to return the response.
	 * @throws ServletException If an error occurs during request processing.
	 * @throws IOException      If an input or output error occurs.
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if ("/admin/reports/monthly-sales".equals(request.getServletPath())) {
			downloadMonthlySalesReport(request, response);
			return;
		}

		// Retrieve all student information from the AdminDashboardService
		request.setAttribute("orderList", orderService.getRecentOrders());
		request.setAttribute("totalProduct", dashboardService.getTotalProducts());
		request.setAttribute("totalsales", dashboardService.getTotalSales());
		request.setAttribute("total", dashboardService.getTotalUsers());
		request.setAttribute("pendingUsers", dashboardService.getPendingUsers());
		request.setAttribute("totalAvailableStock", dashboardService.getTotalAvailableStock());
		request.setAttribute("totalOrderedItems", dashboardService.getTotalOrderedItems());
		request.setAttribute("topOrderedProducts", dashboardService.getTopOrderedProducts());
		request.setAttribute("categoryReports", dashboardService.getCategoryReports());
		request.setAttribute("lowStockProducts", dashboardService.getLowStockProducts());

		// Forward the request to the dashboard JSP for rendering
		request.getRequestDispatcher(RedirectionUtil.adminDashboardUrl).forward(request, response);
	}

	private void downloadMonthlySalesReport(HttpServletRequest request, HttpServletResponse response) throws IOException {
		YearMonth reportMonth = resolveReportMonth(request);
		LocalDate startDate = reportMonth.atDay(1);
		LocalDate endDateExclusive = reportMonth.plusMonths(1).atDay(1);
		List<MonthlySalesReportModel> reports = dashboardService.getMonthlySalesReport(startDate, endDateExclusive);
		double monthlyTotal = dashboardService.getMonthlySalesTotal(startDate, endDateExclusive);

		String fileName = "corexa-monthly-sales-" + reportMonth + ".csv";
		response.setContentType("text/csv");
		response.setCharacterEncoding("UTF-8");
		response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\"");

		try (PrintWriter writer = response.getWriter()) {
			writer.println("Report Month," + csv(reportMonth.toString()));
			writer.println("Total Sales," + csv(String.format("%.2f", monthlyTotal)));
			writer.println();
			writer.println("Order ID,Customer Name,Email,Phone,Product,Category,Quantity,Price At Order,Line Total,Order Date,Order Time,Payment Method,Order Status");

			DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
			DateTimeFormatter timeFormatter = DateTimeFormatter.ofPattern("HH:mm:ss");

			for (MonthlySalesReportModel report : reports) {
				String orderDate = report.getOrderDateTime() == null ? "" : report.getOrderDateTime().format(dateFormatter);
				String orderTime = report.getOrderDateTime() == null ? "" : report.getOrderDateTime().format(timeFormatter);
				writer.println(report.getOrderId() + ","
						+ csv(report.getCustomerName()) + ","
						+ csv(report.getEmail()) + ","
						+ csv(report.getPhoneNumber()) + ","
						+ csv(report.getProductName()) + ","
						+ csv(report.getCategory()) + ","
						+ report.getQuantity() + ","
						+ csv(String.format("%.2f", report.getPriceAtOrder())) + ","
						+ csv(String.format("%.2f", report.getLineTotal())) + ","
						+ csv(orderDate) + ","
						+ csv(orderTime) + ","
						+ csv(report.getPaymentMethod()) + ","
						+ csv(report.getOrderStatus()));
			}
		}
	}

	private YearMonth resolveReportMonth(HttpServletRequest request) {
		try {
			String yearValue = request.getParameter("year");
			String monthValue = request.getParameter("month");
			if (yearValue != null && monthValue != null) {
				return YearMonth.of(Integer.parseInt(yearValue), Integer.parseInt(monthValue));
			}
		} catch (RuntimeException e) {
			return YearMonth.now();
		}

		return YearMonth.now();
	}

	private String csv(String value) {
		if (value == null) {
			return "";
		}
		return "\"" + value.replace("\"", "\"\"") + "\"";
	}

}
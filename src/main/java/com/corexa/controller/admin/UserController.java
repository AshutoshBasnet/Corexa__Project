package com.corexa.controller.admin;

import jakarta.servlet.ServletException;

import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.corexa.service.AdminDashboardService;
import com.corexa.util.RedirectionUtil;

/**
 * Servlet implementation class userController
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/modifyUsers" })
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
		maxFileSize = 1024 * 1024 * 10, // 10MB
		maxRequestSize = 1024 * 1024 * 50) // 50MB
public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// Instance of DashboardService for handling business logic
	private AdminDashboardService dashboardService;

	/**
	 * Default constructor initializes the DashboardService instance.
	 */
	public UserController() {
		this.dashboardService = new AdminDashboardService();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		transferSessionMessages(request);
		// Retrieve all user information from the DashboardService
		request.setAttribute("userList", dashboardService.getAllUsersInfo());

		request.setAttribute("total", dashboardService.getTotalUsers());
		request.setAttribute("pendingUsers", dashboardService.getPendingUsers());
		request.setAttribute("Kathmandu", dashboardService.getKathmanduUsers());
		request.setAttribute("Lalitpur", dashboardService.getLalitpurUsers());
		request.setAttribute("Bhaktapur", dashboardService.getBhaktapurUsers());
		// Forward the request to the Users JSP for rendering
		request.getRequestDispatcher(RedirectionUtil.userManagementUrl).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");
		String userIdValue = request.getParameter("userId");

		if (!"updateStatus".equals(action)) {
			response.sendRedirect(request.getContextPath() + "/modifyUsers");
			return;
		}

		try {
			int userId = Integer.parseInt(userIdValue);
			String status = normalizeStatus(request.getParameter("status"));
			if (status == null) {
				request.getSession().setAttribute("error", "Invalid user status.");
			} else if (dashboardService.updateUserStatus(userId, status)) {
				request.getSession().setAttribute("success", "User status updated to " + getDisplayStatus(status) + ".");
			} else {
				request.getSession().setAttribute("error", "Unable to update user status. Please check database setup.");
			}
		} catch (NumberFormatException e) {
			request.getSession().setAttribute("error", "Invalid user ID.");
		}

		response.sendRedirect(request.getContextPath() + "/modifyUsers");
	}

	private String normalizeStatus(String status) {
		if (status == null) {
			return null;
		}

		String upperStatus = status.trim().toUpperCase();
		return switch (upperStatus) {
			case "ACTIVE" -> "APPROVED";
			case "DEACTIVE", "DEACTIVATE", "INACTIVE" -> "SUSPENDED";
			case "PENDING", "APPROVED", "SUSPENDED" -> upperStatus;
			default -> null;
		};
	}

	private String getDisplayStatus(String status) {
		if ("APPROVED".equals(status)) {
			return "active";
		}
		if ("SUSPENDED".equals(status)) {
			return "deactive";
		}
		return status.toLowerCase();
	}

	private void transferSessionMessages(HttpServletRequest request) {
		String success = (String) request.getSession().getAttribute("success");
		if (success != null) {
			request.setAttribute("success", success);
			request.getSession().removeAttribute("success");
		}

		String error = (String) request.getSession().getAttribute("error");
		if (error != null) {
			request.setAttribute("error", error);
			request.getSession().removeAttribute("error");
		}
	}
}
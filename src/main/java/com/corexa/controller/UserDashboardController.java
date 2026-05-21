package com.corexa.controller;

import jakarta.servlet.ServletException;

import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;

import com.corexa.model.UserModel;
import com.corexa.service.UserDashboardService;
import com.corexa.util.RedirectionUtil;
import com.corexa.util.ValidationUtil;

/**
 * UserDashboardController is responsible for handling profile requests. It interacts with
 * the UserDashboardService to manipulate the logged user details.
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/userDashboard" })
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 1,  // 1 MB
    maxFileSize = 1024 * 1024 * 10,       // 10 MB
    maxRequestSize = 1024 * 1024 * 15     // 15 MB
)
public class UserDashboardController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private UserDashboardService dashboardService;

    /**
	 * Constructor initializes the UserDashboardService.
	 */
    public UserDashboardController() {
        this.dashboardService = new UserDashboardService();
    }

    /**
	 * Handles GET requests to the userDashboard page.
	 *
	 * @param request  HttpServletRequest object
	 * @param response HttpServletResponse object
	 * @throws ServletException if a servlet-specific error occurs
	 * @throws IOException      if an I/O error occurs
	 */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Integer userId = (Integer) request.getSession().getAttribute("id");

        if (userId == null) {
            response.sendRedirect(request.getContextPath() + RedirectionUtil.loginUrl);
            return;
        }

        UserModel user = dashboardService.getUserInfo(userId);
        if (user != null) {
            transferSessionMessagesToRequest(request);
            request.setAttribute("user", user);
            request.setAttribute("activity", dashboardService.getUserActivity(userId));
            request.getRequestDispatcher(RedirectionUtil.userDashboardUrl).forward(request, response);
        } else {
            request.setAttribute("error", "User information not found");
            request.getRequestDispatcher(RedirectionUtil.userDashboardUrl).forward(request, response);
        }
    }

    /**
	 * Handles POST requests for user info update.
	 *
	 * @param request  HttpServletRequest object
	 * @param response HttpServletResponse object
	 * @throws ServletException if a servlet-specific error occurs
	 * @throws IOException      if an I/O error occurs
	 */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Integer userId = (Integer) request.getSession().getAttribute("id");

        if (userId == null) {
            response.sendRedirect(request.getContextPath() + RedirectionUtil.loginUrl);
            return;
        }

        try {
            String action = request.getParameter("action");
            if ("updatePassword".equals(action)) {
                handlePasswordUpdate(request, userId);
                response.sendRedirect(request.getContextPath() + "/userDashboard");
                return;
            }

            String firstName = request.getParameter("firstName");
            String lastName = request.getParameter("lastName");
            String email = request.getParameter("email");
            String number = request.getParameter("number");
            String dob = request.getParameter("dob");

            String validationMessage = validateProfileForm(userId, firstName, lastName, email, number, dob, request);
            if (validationMessage != null) {
                request.getSession().setAttribute("errorMessage", validationMessage);
                response.sendRedirect(request.getContextPath() + "/userDashboard");
                return;
            }

            UserModel existingUser = dashboardService.getUserInfo(userId);
            String currentImage = (existingUser != null) ? existingUser.getImageUrl() : null;

            // Handle profile image upload
            Part filePart = request.getPart("profilePicture");
            String fileName = (filePart != null) ? Paths.get(filePart.getSubmittedFileName()).getFileName().toString() : null;

            String newFileName = null;
            if (filePart != null && fileName != null && !fileName.isEmpty()) {
                newFileName = "user_" + userId + "_" + System.currentTimeMillis() + "_" + fileName;

                // Upload path: /resources/user
                String uploadPath = getServletContext().getRealPath("") + File.separator + "resources" + File.separator + "user";
                File uploadDir = new File(uploadPath);
                if (!uploadDir.exists()) {
                    uploadDir.mkdirs(); // creates the directory if not already there
                }

                filePart.write(uploadPath + File.separator + newFileName);
            }

            // Set updated user info
            UserModel updatedUser = new UserModel();
            updatedUser.setId(userId);
            updatedUser.setFirstName(firstName);
            updatedUser.setLastName(lastName);
            updatedUser.setEmail(email);
            updatedUser.setNumber(number);

            if (dob != null && !dob.isEmpty()) {
                try {
                    updatedUser.setDob(java.time.LocalDate.parse(dob));
                } catch (Exception e) {
                    updatedUser.setDob(null);
                }
            }

            if (newFileName != null) {
                updatedUser.setImageUrl(newFileName);
            } else {
                updatedUser.setImageUrl(currentImage);
            }

            boolean success = dashboardService.updateUserInfo(updatedUser);

            if (success) {
                request.getSession().setAttribute("successMessage", "Profile updated successfully!");
            } else {
                request.getSession().setAttribute("errorMessage", "Failed to update profile. Please try again.");
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.getSession().setAttribute("errorMessage", "Something went wrong. Please check your inputs.");
        }

        response.sendRedirect(request.getContextPath() + "/userDashboard");
    }

    private String validateProfileForm(int userId, String firstName, String lastName, String email, String number,
            String dob, HttpServletRequest request) throws IOException, ServletException {
        if (ValidationUtil.isNullOrEmpty(firstName)) {
            return "First name is required.";
        }
        if (ValidationUtil.isNullOrEmpty(lastName)) {
            return "Last name is required.";
        }
        if (!ValidationUtil.isAlphabetic(firstName)) {
            return "First name must contain letters only.";
        }
        if (!ValidationUtil.isAlphabetic(lastName)) {
            return "Last name must contain letters only.";
        }
        if (!ValidationUtil.isValidEmail(email)) {
            return "Please enter a valid email address.";
        }
        if (ValidationUtil.isNullOrEmpty(number)) {
            return "Phone number is required.";
        }
        if (!ValidationUtil.isValidPhoneNumber(number)) {
            return "Phone number must be 10 digits and start with 98.";
        }
        if (!ValidationUtil.isNullOrEmpty(dob) && (!ValidationUtil.isValidDate(dob)
                || !ValidationUtil.isAgeAtLeast16(java.time.LocalDate.parse(dob)))) {
            return "You must be at least 16 years old.";
        }
        if (dashboardService.isEmailOrPhoneUsedByAnother(userId, email, number)) {
            return "Email or phone number is already used by another account.";
        }

        Part filePart = request.getPart("profilePicture");
        if (filePart != null && filePart.getSize() > 0 && !ValidationUtil.isValidImageExtension(filePart)) {
            return "Invalid image format. Only jpg, jpeg, png, and gif are allowed.";
        }

        return null;
    }

    private void handlePasswordUpdate(HttpServletRequest request, int userId) {
        String currentPassword = request.getParameter("currentPassword");
        String newPassword = request.getParameter("newPassword");
        String retypePassword = request.getParameter("retypePassword");

        if (ValidationUtil.isNullOrEmpty(currentPassword) || ValidationUtil.isNullOrEmpty(newPassword)
                || ValidationUtil.isNullOrEmpty(retypePassword)) {
            request.getSession().setAttribute("errorMessage", "Please fill all password fields.");
            return;
        }
        if (!ValidationUtil.isValidPassword(newPassword)) {
            request.getSession().setAttribute("errorMessage",
                    "New password must be at least 8 characters long, with 1 uppercase letter, 1 number, and 1 symbol.");
            return;
        }
        if (!ValidationUtil.doPasswordsMatch(newPassword, retypePassword)) {
            request.getSession().setAttribute("errorMessage", "New passwords do not match.");
            return;
        }

        if (dashboardService.updatePassword(userId, currentPassword, newPassword)) {
            request.getSession().setAttribute("successMessage", "Password updated successfully!");
        } else {
            request.getSession().setAttribute("errorMessage", "Current password is incorrect.");
        }
    }

    /**
	 * Transfers session messages to request by setting attributes and 
	 * setting success and error messages.
	 *
	 * @param req         HttpServletRequest object
	 */
    private void transferSessionMessagesToRequest(HttpServletRequest request) {
        String successMessage = (String) request.getSession().getAttribute("successMessage");
        if (successMessage != null) {
            request.setAttribute("successMessage", successMessage);
            request.getSession().removeAttribute("successMessage");
        }

        String errorMessage = (String) request.getSession().getAttribute("errorMessage");
        if (errorMessage != null) {
            request.setAttribute("errorMessage", errorMessage);
            request.getSession().removeAttribute("errorMessage");
        }
    }
}

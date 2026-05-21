package com.corexa.service;

import java.sql.Connection;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.corexa.config.DbConfig;
import com.corexa.model.UserActivityModel;
import com.corexa.model.UserModel;
import com.corexa.util.PasswordUtil;

/**
 * Service class for interacting with the database to retrieve and update
 * user profile information.
 */
public class UserDashboardService {

    private Connection dbConn;
    private boolean isConnectionError = false;

    public UserDashboardService() {
        try {
            dbConn = DbConfig.getDbConnection();
        } catch (SQLException | ClassNotFoundException ex) {
            ex.printStackTrace();
            isConnectionError = true;
        }
    }

    /**
     * Retrieves user information for the specified user ID.
     *
     * @param userId The ID of the user to retrieve
     * @return UserModel containing user information, or null if not found
     */
    public UserModel getUserInfo(int userId) {
        if (isConnectionError) {
            System.out.println("Connection Error!");
            return null;
        }

        String query = "SELECT user_id, first_name, last_name, username, email, number, dob, password, profilePic " +
                       "FROM user WHERE user_id = ?";

        try (PreparedStatement stmt = dbConn.prepareStatement(query)) {
            stmt.setInt(1, userId);
            ResultSet result = stmt.executeQuery();

            if (result.next()) {
                UserModel user = new UserModel();
                user.setId(result.getInt("user_id"));
                user.setFirstName(result.getString("first_name"));
                user.setLastName(result.getString("last_name"));
                user.setUserName(result.getString("username"));
                user.setEmail(result.getString("email"));
                user.setNumber(result.getString("number"));
                user.setPassword(result.getString("password"));

                Date dob = result.getDate("dob");
                if (dob != null) {
                    user.setDob(dob.toLocalDate());
                }

                user.setImageUrl(result.getString("profilePic"));
                return user;
            }
            return null;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }

    /**
     * Updates user information in the database, including profile picture.
     *
     * @param user The UserModel containing updated information
     * @return true if update was successful, false otherwise
     */
    public boolean updateUserInfo(UserModel user) {
        if (isConnectionError || dbConn == null) {
            System.err.println("Database connection error!");
            return false;
        }

        String updateQuery = "UPDATE user SET first_name = ?, last_name = ?, " +
                             "email = ?, number = ?, dob = ?, profilePic = ? WHERE user_id = ?";

        try (PreparedStatement stmt = dbConn.prepareStatement(updateQuery)) {
            stmt.setString(1, user.getFirstName());
            stmt.setString(2, user.getLastName());
            stmt.setString(3, user.getEmail());
            stmt.setString(4, user.getNumber());

            if (user.getDob() != null) {
                stmt.setDate(5, Date.valueOf(user.getDob()));
            } else {
                stmt.setNull(5, java.sql.Types.DATE);
            }

            if (user.getImageUrl() != null && !user.getImageUrl().isEmpty()) {
                stmt.setString(6, user.getImageUrl());
            } else {
                stmt.setNull(6, java.sql.Types.VARCHAR);
            }

            stmt.setInt(7, user.getId());

            int rowsUpdated = stmt.executeUpdate();
            return rowsUpdated > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean updatePassword(int userId, String currentPassword, String newPassword) {
        if (isConnectionError || dbConn == null) {
            return false;
        }

        String selectQuery = "SELECT username, password FROM user WHERE user_id = ?";
        String updateQuery = "UPDATE user SET password = ? WHERE user_id = ?";

        try (PreparedStatement selectStmt = dbConn.prepareStatement(selectQuery)) {
            selectStmt.setInt(1, userId);
            ResultSet result = selectStmt.executeQuery();

            if (!result.next()) {
                return false;
            }

            String username = result.getString("username");
            String encryptedPassword = result.getString("password");
            String decryptedPassword = PasswordUtil.decrypt(encryptedPassword, username);

            if (decryptedPassword == null || !decryptedPassword.equals(currentPassword)) {
                return false;
            }

            String newEncryptedPassword = PasswordUtil.encrypt(username, newPassword);
            try (PreparedStatement updateStmt = dbConn.prepareStatement(updateQuery)) {
                updateStmt.setString(1, newEncryptedPassword);
                updateStmt.setInt(2, userId);
                return updateStmt.executeUpdate() > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean isEmailOrPhoneUsedByAnother(int userId, String email, String number) {
        if (isConnectionError || dbConn == null) {
            return true;
        }

        String query = "SELECT COUNT(*) FROM user WHERE user_id <> ? AND (email = ? OR number = ?)";
        try (PreparedStatement stmt = dbConn.prepareStatement(query)) {
            stmt.setInt(1, userId);
            stmt.setString(2, email);
            stmt.setString(3, number);
            ResultSet result = stmt.executeQuery();
            return result.next() && result.getInt(1) > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return true;
        }
    }

    public UserActivityModel getUserActivity(int userId) {
        UserActivityModel activity = new UserActivityModel();
        if (isConnectionError || dbConn == null) {
            return activity;
        }

        activity.setTotalOrders(getIntValue("SELECT COUNT(*) FROM order_table WHERE user_id = ?", userId));
        activity.setTotalItems(getIntValue("SELECT COALESCE(SUM(oi.quantity), 0) "
                + "FROM order_table o JOIN order_items oi ON o.order_id = oi.order_id WHERE o.user_id = ?", userId));
        activity.setWishlistItems(getIntValue("SELECT COUNT(*) FROM wishlist_product wp "
                + "JOIN wishlist w ON wp.wishlist_id = w.wishlist_id WHERE w.user_id = ?", userId));
        activity.setFavoriteCategory(getFavoriteCategory(userId));
        return activity;
    }

    private int getIntValue(String query, int userId) {
        try (PreparedStatement stmt = dbConn.prepareStatement(query)) {
            stmt.setInt(1, userId);
            ResultSet result = stmt.executeQuery();
            return result.next() ? result.getInt(1) : 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return 0;
        }
    }

    private String getFavoriteCategory(int userId) {
        String query = "SELECT p.category, SUM(oi.quantity) AS ordered_count "
                + "FROM order_table o "
                + "JOIN order_items oi ON o.order_id = oi.order_id "
                + "JOIN product p ON oi.product_id = p.product_id "
                + "WHERE o.user_id = ? "
                + "GROUP BY p.category ORDER BY ordered_count DESC, p.category ASC LIMIT 1";
        try (PreparedStatement stmt = dbConn.prepareStatement(query)) {
            stmt.setInt(1, userId);
            ResultSet result = stmt.executeQuery();
            return result.next() ? result.getString("category") : "Not enough data";
        } catch (SQLException e) {
            e.printStackTrace();
            return "Not enough data";
        }
    }
}

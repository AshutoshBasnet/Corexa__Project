<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <title>My Account | Corexa</title>

    <link rel="shortcut icon" type="image/x-icon" href="${contextPath}/resources/logo/corexa.png">
    <link rel="stylesheet" type="text/css" href="${contextPath}/css/userDashboard.css" />

    <script src="https://kit.fontawesome.com/91fb88d05c.js" crossorigin="anonymous"></script>
    <link href="https://cdn.lineicons.com/5.0/lineicons.css" rel="stylesheet" />

    <script src="${contextPath}/js/userDashboard.js" defer></script>
</head>

<body>

    <main class="dashboard-page">

        <!-- SIDEBAR -->
        <aside class="dashboard-sidebar">

            <div class="sidebar-brand">
                <a href="${contextPath}/home">
                    <img src="${contextPath}/resources/logo/corexa2.png" alt="Corexa Logo">
                </a>
            </div>

            <div class="sidebar-user-card">
                <div class="sidebar-avatar">
                    <img
                        src="${contextPath}/resources/user/${user.imageUrl}"
                        alt="User Profile"
                        onerror="this.src='${contextPath}/resources/logo/onez.svg'">
                </div>

                <div>
                    <h3>${user.firstName} ${user.lastName}</h3>
                    <p>${user.email}</p>
                </div>
            </div>

            <nav class="sidebar-menu">

                <a href="${contextPath}/userDashboard" class="sidebar-link active">
                    <i class="fa-solid fa-user"></i>
                    <span>Account Details</span>
                </a>

                <a href="${contextPath}/orderHistory" class="sidebar-link">
                    <i class="fa-solid fa-clock-rotate-left"></i>
                    <span>Orders</span>
                </a>

                <a href="${contextPath}/wishlist" class="sidebar-link">
                    <i class="fa-regular fa-heart"></i>
                    <span>Wishlist</span>
                </a>

                <a href="${contextPath}/cart" class="sidebar-link">
                    <i class="fa-solid fa-cart-shopping"></i>
                    <span>Cart</span>
                </a>

            </nav>

            <form action="${contextPath}/logout" method="post" class="logout-form">
                <button type="submit" class="logout-btn">
                    <i class="fa-solid fa-right-from-bracket"></i>
                    Logout
                </button>
            </form>

        </aside>

        <!-- MAIN CONTENT -->
        <section class="dashboard-content">

            <div class="dashboard-hero">
                <div>
                    <span>Corexa Account</span>
                    <h1>Manage Your Profile</h1>
                    <p>
                        Keep your account details updated for faster checkout, better order support,
                        and a smoother Corexa shopping experience.
                    </p>
                </div>

               <button type="button" class="edit-profile-btn" id="editToggle">
    <span>Edit Profile</span>
    <i class="fa-solid fa-pen"></i>
</button>
            </div>

            <c:if test="${not empty successMessage}">
                <div class="alert alert-success">
                    <i class="fa-solid fa-circle-check"></i>
                    ${successMessage}
                </div>
            </c:if>

            <c:if test="${not empty errorMessage}">
                <div class="alert alert-danger">
                    <i class="fa-solid fa-circle-exclamation"></i>
                    ${errorMessage}
                </div>
            </c:if>

            <div class="dashboard-grid">

                <!-- PROFILE SUMMARY CARD -->
                <section class="profile-card">

                    <div class="profile-glow"></div>

                    <div class="profile-main">
                        <div class="profile-avatar">
                            <img
                                src="${contextPath}/resources/user/${user.imageUrl}"
                                alt="User Profile"
                                onerror="this.src='${contextPath}/resources/logo/onez.svg'">
                        </div>

                        <div>
                            <span>User Profile</span>
                            <h2>${user.firstName} ${user.lastName}</h2>
                            <p>${user.email}</p>
                        </div>
                    </div>

                    <div class="profile-mini-stats">
                        <div>
                            <i class="fa-solid fa-user-check"></i>
                            <span>Status</span>
                            <strong>Active</strong>
                        </div>

                        <div>
                            <i class="fa-solid fa-shield-halved"></i>
                            <span>Account</span>
                            <strong>Secured</strong>
                        </div>
                    </div>

                </section>

                <section class="account-panel activity-panel">
                    <div class="panel-heading">
                        <span>Account Records</span>
                        <h2>Your Activity</h2>
                    </div>

                    <div class="activity-grid">
                        <div class="activity-box">
                            <span>Orders</span>
                            <strong>${empty activity ? 0 : activity.totalOrders}</strong>
                        </div>

                        <div class="activity-box">
                            <span>Items Ordered</span>
                            <strong>${empty activity ? 0 : activity.totalItems}</strong>
                        </div>

                        <div class="activity-box">
                            <span>Wishlist</span>
                            <strong>${empty activity ? 0 : activity.wishlistItems}</strong>
                        </div>

                        <div class="activity-box wide">
                            <span>Favorite Category</span>
                            <strong>${empty activity ? 'Not enough data' : activity.favoriteCategory}</strong>
                        </div>
                    </div>
                </section>

                <!-- VIEW MODE -->
                <section class="account-panel" id="profileView">

                    <div class="panel-heading">
                        <span>Account Information</span>
                        <h2>Your Details</h2>
                    </div>

                    <div class="info-list">

                        <div class="info-row">
                            <div class="info-icon">
                                <i class="fa-solid fa-id-card"></i>
                            </div>

                            <div>
                                <span>First Name</span>
                                <strong>${user.firstName}</strong>
                            </div>
                        </div>

                        <div class="info-row">
                            <div class="info-icon">
                                <i class="fa-solid fa-id-card-clip"></i>
                            </div>

                            <div>
                                <span>Last Name</span>
                                <strong>${user.lastName}</strong>
                            </div>
                        </div>

                        <div class="info-row">
                            <div class="info-icon">
                                <i class="fa-solid fa-calendar-days"></i>
                            </div>

                            <div>
                                <span>Date of Birth</span>
                                <strong>${user.dob}</strong>
                            </div>
                        </div>

                        <div class="info-row">
                            <div class="info-icon">
                                <i class="fa-solid fa-envelope"></i>
                            </div>

                            <div>
                                <span>Email</span>
                                <strong>${user.email}</strong>
                            </div>
                        </div>

                        <div class="info-row">
                            <div class="info-icon">
                                <i class="fa-solid fa-phone"></i>
                            </div>

                            <div>
                                <span>Phone Number</span>
                                <strong>${user.number}</strong>
                            </div>
                        </div>

                    </div>

                </section>

                <!-- EDIT MODE -->
                <section class="account-panel edit-panel is-hidden" id="profileFormPanel">

                    <div class="panel-heading">
                        <span>Edit Profile</span>
                        <h2>Update Details</h2>
                    </div>

                    <form
                        id="profileForm"
                        action="${contextPath}/userDashboard"
                        method="post"
                        enctype="multipart/form-data">

                        <div class="upload-section">
                            <label for="profilePicture" class="profile-upload-label">

                                <div class="upload-box">
                                    <img
                                        id="previewImage"
                                        src="${contextPath}/resources/user/${user.imageUrl}"
                                        onerror="this.src='${contextPath}/resources/logo/onez.svg'"
                                        alt="Profile Preview">

                                    <div class="upload-overlay">
                                        <i class="fa-solid fa-camera"></i>
                                        <span>Change Photo</span>
                                    </div>
                                </div>

                            </label>

                            <input type="file" id="profilePicture" name="profilePicture" accept="image/*" hidden>

                            <p class="upload-note">
                                Upload a clear profile picture for your Corexa account.
                            </p>
                        </div>

                        <div class="form-grid">

                            <div class="form-group">
                                <label for="firstName">First Name</label>
                                <input
                                    type="text"
                                    id="firstName"
                                    name="firstName"
                                    value="${user.firstName}"
                                    required>
                            </div>

                            <div class="form-group">
                                <label for="lastName">Last Name</label>
                                <input
                                    type="text"
                                    id="lastName"
                                    name="lastName"
                                    value="${user.lastName}"
                                    required>
                            </div>

                            <div class="form-group">
                                <label for="dob">Date of Birth</label>
                                <input
                                    type="date"
                                    id="dob"
                                    name="dob"
                                    value="${user.dob}">
                            </div>

                            <div class="form-group">
                                <label for="email">Email</label>
                                <input
                                    type="email"
                                    id="email"
                                    name="email"
                                    value="${user.email}"
                                    required>
                            </div>

                            <div class="form-group full-width">
                                <label for="number">Phone Number</label>
                                <input
                                    type="tel"
                                    id="number"
                                    name="number"
                                    value="${user.number}"
                                    required>
                            </div>

                        </div>

                        <div class="form-actions">
                            <button type="submit" class="save-btn">
                                <span>Update Profile</span>
                                <i class="fa-solid fa-arrow-right"></i>
                            </button>

                            <button type="button" id="cancelEdit" class="cancel-btn">
                                Cancel
                            </button>
                        </div>

                    </form>

                </section>

                <section class="account-panel password-panel">
                    <div class="panel-heading">
                        <span>Security</span>
                        <h2>Update Password</h2>
                    </div>

                    <form action="${contextPath}/userDashboard" method="post">
                        <input type="hidden" name="action" value="updatePassword">

                        <div class="form-grid">
                            <div class="form-group full-width">
                                <label for="currentPassword">Current Password</label>
                                <input
                                    type="password"
                                    id="currentPassword"
                                    name="currentPassword"
                                    autocomplete="current-password"
                                    required>
                            </div>

                            <div class="form-group">
                                <label for="newPassword">New Password</label>
                                <input
                                    type="password"
                                    id="newPassword"
                                    name="newPassword"
                                    autocomplete="new-password"
                                    required>
                            </div>

                            <div class="form-group">
                                <label for="retypePassword">Repeat New Password</label>
                                <input
                                    type="password"
                                    id="retypePassword"
                                    name="retypePassword"
                                    autocomplete="new-password"
                                    required>
                            </div>
                        </div>

                        <div class="form-actions">
                            <button type="submit" class="save-btn">
                                <span>Update Password</span>
                                <i class="fa-solid fa-arrow-right"></i>
                            </button>
                        </div>
                    </form>
                </section>

            </div>

        </section>

    </main>

</body>
</html>

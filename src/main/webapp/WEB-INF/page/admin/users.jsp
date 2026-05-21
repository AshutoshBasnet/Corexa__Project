<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="currentUser" value="${sessionScope.username}" />

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer Management | Corexa</title>

    <link rel="shortcut icon" type="image/x-icon" href="${contextPath}/resources/logo/corexa2.png">
    <link rel="stylesheet" type="text/css" href="${contextPath}/css/user.css" />

    <script src="https://kit.fontawesome.com/91fb88d05c.js" crossorigin="anonymous"></script>
    <link href="https://cdn.lineicons.com/5.0/lineicons.css" rel="stylesheet" />
</head>

<body>

    <div class="admin-layout">

        <!-- SIDEBAR -->
        <aside class="admin-sidebar">

            <div class="sidebar-top">

                <a href="${contextPath}/adminDashboard" class="admin-logo">
                    <img src="${contextPath}/resources/logo/corexa2.png" alt="Corexa Logo">
                </a>

                <div class="admin-profile-card">
                    <div class="admin-avatar">
                        <i class="fa-solid fa-user-shield"></i>
                    </div>

                    <div>
                        <span>Admin Panel</span>
                        <h3>
                            <c:choose>
                                <c:when test="${not empty currentUser}">
                                    ${currentUser}
                                </c:when>
                                <c:otherwise>
                                    Corexa Admin
                                </c:otherwise>
                            </c:choose>
                        </h3>
                    </div>
                </div>

                <nav class="admin-nav">

                    <a href="${contextPath}/adminDashboard" class="admin-nav-link">
                        <i class="fa-solid fa-table-columns"></i>
                        <span>Dashboard</span>
                    </a>

                    <a href="${contextPath}/admin/orders" class="admin-nav-link">
                        <i class="fa-solid fa-boxes-stacked"></i>
                        <span>Orders</span>
                    </a>

                    <a href="${contextPath}/modifyUsers" class="admin-nav-link active">
                        <i class="fa-solid fa-users-gear"></i>
                        <span>Customer Details</span>
                    </a>

                    <a href="${contextPath}/products" class="admin-nav-link">
                        <i class="fa-solid fa-box-open"></i>
                        <span>Manage Products</span>
                    </a>

                </nav>

            </div>

            <form action="${contextPath}/logout" method="post" class="logout-form">
                <button type="submit" class="logout-btn">
                    <i class="fa-solid fa-right-from-bracket"></i>
                    Logout
                </button>
            </form>

        </aside>

        <!-- MAIN CONTENT -->
        <main class="user-management-dashboard">

            <jsp:include page="adminHeader.jsp" />

            <!-- HERO -->
            <section class="management-hero">

                <div class="hero-content">
                    <span>Corexa Management</span>
                    <h1>Customer Details</h1>
                    <p>
                        View registered customers, monitor location distribution,
                        and manage customer information from your Corexa admin panel.
                    </p>
                </div>

                <div class="hero-icon">
                    <i class="fa-solid fa-users"></i>
                </div>

            </section>

            <!-- LOCATION STATS -->
            <section class="stats-grid">

                <div class="stat-card kathmandu-stat">
                    <div class="stat-icon">
                        <i class="fa-solid fa-location-dot"></i>
                    </div>

                    <div class="stat-info">
                        <span>Kathmandu</span>
                        <h2>${empty Kathmandu ? 0 : Kathmandu}</h2>
                        <p>Customers from Kathmandu</p>
                    </div>
                </div>

                <div class="stat-card lalitpur-stat">
                    <div class="stat-icon">
                        <i class="fa-solid fa-map-location-dot"></i>
                    </div>

                    <div class="stat-info">
                        <span>Lalitpur</span>
                        <h2>${empty Lalitpur ? 0 : Lalitpur}</h2>
                        <p>Customers from Lalitpur</p>
                    </div>
                </div>

                <div class="stat-card bhaktapur-stat">
                    <div class="stat-icon">
                        <i class="fa-solid fa-city"></i>
                    </div>

                    <div class="stat-info">
                        <span>Bhaktapur</span>
                        <h2>${empty Bhaktapur ? 0 : Bhaktapur}</h2>
                        <p>Customers from Bhaktapur</p>
                    </div>
                </div>

                <div class="stat-card pending-stat">
                    <div class="stat-icon">
                        <i class="fa-solid fa-user-clock"></i>
                    </div>

                    <div class="stat-info">
                        <span>Pending</span>
                        <h2>${empty pendingUsers ? 0 : pendingUsers}</h2>
                        <p>Accounts waiting for approval</p>
                    </div>
                </div>

            </section>

            <!-- MESSAGES -->
            <c:if test="${not empty error}">
                <div class="alert alert-error">
                    <i class="fa-solid fa-circle-exclamation"></i>
                    <span>${error}</span>
                </div>
            </c:if>

            <c:if test="${not empty success}">
                <div class="alert alert-success">
                    <i class="fa-solid fa-circle-check"></i>
                    <span>${success}</span>
                </div>
            </c:if>

            <!-- TOP BAR -->
            <section class="users-top-bar">

                <div>
                    <span>Customer Records</span>
                    <h2>User List</h2>
                </div>

                <p>
                    <c:choose>
                        <c:when test="${not empty userList}">
                            ${fn:length(userList)} user(s)
                        </c:when>
                        <c:otherwise>
                            0 users
                        </c:otherwise>
                    </c:choose>
                </p>

            </section>

            <!-- USERS TABLE -->
            <section class="users-panel">

                <div class="table-container">

                    <table class="users-table">

                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Customer</th>
                                <th>Address</th>
                                <th>Email</th>
                                <th>Number</th>
                                <th>Status</th>
                                <th>Action</th>
                            </tr>
                        </thead>

                        <tbody>
                            <c:choose>

                                <c:when test="${not empty userList}">

                                    <c:forEach var="customer" items="${userList}">
                                        <c:set var="customerStatus" value="${empty customer.accountStatus ? 'APPROVED' : customer.accountStatus}" />
                                        <c:choose>
                                            <c:when test="${customerStatus eq 'APPROVED'}">
                                                <c:set var="customerStatusLabel" value="Active" />
                                                <c:set var="customerStatusClass" value="active" />
                                            </c:when>
                                            <c:when test="${customerStatus eq 'SUSPENDED'}">
                                                <c:set var="customerStatusLabel" value="Deactive" />
                                                <c:set var="customerStatusClass" value="deactive" />
                                            </c:when>
                                            <c:otherwise>
                                                <c:set var="customerStatusLabel" value="Pending" />
                                                <c:set var="customerStatusClass" value="pending" />
                                            </c:otherwise>
                                        </c:choose>
                                        <tr>

                                            <td>
                                                <span class="user-id">#${customer.id}</span>
                                            </td>

                                            <td>
                                                <div class="customer-cell">
                                                    <div class="customer-avatar">
                                                        <i class="fa-solid fa-user"></i>
                                                    </div>

                                                    <div>
                                                        <strong>${customer.firstName} ${customer.lastName}</strong>
                                                        <span>Registered Customer</span>
                                                    </div>
                                                </div>
                                            </td>

                                            <td>
                                                <span class="address-pill">
                                                    <i class="fa-solid fa-location-dot"></i>
                                                    <c:choose>
                                                        <c:when test="${not empty customer.address}">
                                                            ${customer.address.name}
                                                        </c:when>
                                                        <c:otherwise>
                                                            Not provided
                                                        </c:otherwise>
                                                    </c:choose>
                                                </span>
                                            </td>

                                            <td>
                                                <span class="email-text">${customer.email}</span>
                                            </td>

                                            <td>
                                                <span class="phone-text">
                                                    <c:choose>
                                                        <c:when test="${not empty customer.number}">
                                                            ${customer.number}
                                                        </c:when>
                                                        <c:otherwise>
                                                            Not provided
                                                        </c:otherwise>
                                                    </c:choose>
                                                </span>
                                            </td>

                                            <td>
                                                <span class="status-pill ${customerStatusClass}">
                                                    <c:out value="${customerStatusLabel}" />
                                                </span>
                                            </td>

                                            <td>
                                                <div class="user-action-buttons">
                                                    <c:if test="${customerStatus ne 'APPROVED'}">
                                                        <form action="${contextPath}/modifyUsers" method="post">
                                                            <input type="hidden" name="action" value="updateStatus">
                                                            <input type="hidden" name="userId" value="${customer.id}">
                                                            <input type="hidden" name="status" value="ACTIVE">
                                                            <button type="submit" class="approve-btn">
                                                                Activate
                                                            </button>
                                                        </form>
                                                    </c:if>

                                                    <c:if test="${customerStatus ne 'SUSPENDED'}">
                                                        <form action="${contextPath}/modifyUsers" method="post">
                                                            <input type="hidden" name="action" value="updateStatus">
                                                            <input type="hidden" name="userId" value="${customer.id}">
                                                            <input type="hidden" name="status" value="DEACTIVE">
                                                            <button type="submit" class="suspend-btn">
                                                                Deactivate
                                                            </button>
                                                        </form>
                                                    </c:if>
                                                </div>
                                            </td>

                                        </tr>
                                    </c:forEach>

                                </c:when>

                                <c:otherwise>
                                    <tr>
                                        <td colspan="7">
                                            <div class="empty-table">
                                                <i class="fa-solid fa-users-slash"></i>
                                                <h3>No users found</h3>
                                                <p>Registered customers will appear here.</p>
                                            </div>
                                        </td>
                                    </tr>
                                </c:otherwise>

                            </c:choose>
                        </tbody>

                    </table>

                </div>

            </section>

        </main>

    </div>

</body>
</html>
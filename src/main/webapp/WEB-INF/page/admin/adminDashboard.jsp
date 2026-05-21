<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="currentUser" value="${sessionScope.username}" />

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <title>Admin Dashboard | Corexa</title>

    <link rel="shortcut icon" type="image/x-icon" href="${contextPath}/resources/logo/corexa2.png">
    <link rel="stylesheet" type="text/css" href="${contextPath}/css/adminDashboard.css" />

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

                    <a href="${contextPath}/adminDashboard" class="admin-nav-link active">
                        <i class="fa-solid fa-table-columns"></i>
                        <span>Dashboard</span>
                    </a>

                    <a href="${contextPath}/admin/orders" class="admin-nav-link">
                        <i class="fa-solid fa-boxes-stacked"></i>
                        <span>Orders</span>
                    </a>

                    <a href="${contextPath}/modifyUsers" class="admin-nav-link">
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

        <!-- MAIN DASHBOARD -->
        <main class="admin-dashboard">

            <jsp:include page="adminHeader.jsp" />

            <!-- HERO -->
            <section class="dashboard-hero">

                <div class="hero-content">
                    <span>Corexa Management</span>
                    <h1>Welcome to Dashboard</h1>
                    <p>
                        Monitor products, sales, customers, and recent order activity
                        from your Corexa admin control center.
                    </p>
                </div>

                <div class="hero-icon">
                    <i class="fa-solid fa-chart-line"></i>
                </div>

            </section>

            <!-- STATS -->
            <section class="stats-grid">

                <div class="stat-card products-stat">
                    <div class="stat-icon">
                        <i class="fa-solid fa-box"></i>
                    </div>

                    <div class="stat-info">
                        <span>Total Products</span>
                        <h2>${not empty totalProduct ? totalProduct : 0}</h2>
                        <p>Products available in store</p>
                    </div>
                </div>

                <div class="stat-card sales-stat">
                    <div class="stat-icon">
                        <i class="fa-solid fa-money-bill-trend-up"></i>
                    </div>

                    <div class="stat-info">
                        <span>Total Sales</span>
                        <h2>Rs. ${not empty totalsales ? totalsales : "0.00"}</h2>
                        <p>Overall sales performance</p>
                    </div>
                </div>

                <div class="stat-card customers-stat">
                    <div class="stat-icon">
                        <i class="fa-solid fa-user-plus"></i>
                    </div>

                    <div class="stat-info">
                        <span>Total Customers</span>
                        <h2>${not empty total ? total : 0}</h2>
                        <p>Registered customer accounts</p>
                    </div>
                </div>

                <div class="stat-card customers-stat">
                    <div class="stat-icon">
                        <i class="fa-solid fa-user-clock"></i>
                    </div>

                    <div class="stat-info">
                        <span>Pending Users</span>
                        <h2>${not empty pendingUsers ? pendingUsers : 0}</h2>
                        <p>Registration requests to approve</p>
                    </div>
                </div>

                <div class="stat-card products-stat">
                    <div class="stat-icon">
                        <i class="fa-solid fa-warehouse"></i>
                    </div>

                    <div class="stat-info">
                        <span>Available Stock</span>
                        <h2>${not empty totalAvailableStock ? totalAvailableStock : 0}</h2>
                        <p>Units currently available</p>
                    </div>
                </div>

                <div class="stat-card sales-stat">
                    <div class="stat-icon">
                        <i class="fa-solid fa-boxes-packing"></i>
                    </div>

                    <div class="stat-info">
                        <span>Ordered Items</span>
                        <h2>${not empty totalOrderedItems ? totalOrderedItems : 0}</h2>
                        <p>Units issued through orders</p>
                    </div>
                </div>

            </section>

            <!-- QUICK ACTIONS -->
            <section class="quick-actions">

                <a href="${contextPath}/products" class="action-card">
                    <div>
                        <span>Products</span>
                        <h3>Manage Inventory</h3>
                    </div>
                    <i class="fa-solid fa-arrow-right"></i>
                </a>

                <a href="${contextPath}/admin/orders" class="action-card">
                    <div>
                        <span>Orders</span>
                        <h3>View Orders</h3>
                    </div>
                    <i class="fa-solid fa-arrow-right"></i>
                </a>

                <a href="${contextPath}/modifyUsers" class="action-card">
                    <div>
                        <span>Customers</span>
                        <h3>Manage Users</h3>
                    </div>
                    <i class="fa-solid fa-arrow-right"></i>
                </a>

                <a href="${contextPath}/admin/reports/monthly-sales" class="action-card report-download-card">
                    <div>
                        <span>This Month</span>
                        <h3>Download Sales Report</h3>
                    </div>
                    <i class="fa-solid fa-download"></i>
                </a>

            </section>

            <!-- REPORTS -->
            <section class="analytics-grid">

                <article class="analytics-panel">
                    <div class="section-heading compact-heading">
                        <div>
                            <span>Demand Report</span>
                            <h2>Top Ordered Products</h2>
                        </div>
                    </div>

                    <c:choose>
                        <c:when test="${not empty topOrderedProducts}">
                            <div class="report-list">
                                <c:forEach var="product" items="${topOrderedProducts}">
                                    <div class="report-row">
                                        <div>
                                            <strong>${product.productName}</strong>
                                            <span>${product.category}</span>
                                        </div>
                                        <b>${product.quantity} ordered</b>
                                    </div>
                                </c:forEach>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <p class="report-empty">No order data available yet.</p>
                        </c:otherwise>
                    </c:choose>
                </article>

                <article class="analytics-panel">
                    <div class="section-heading compact-heading">
                        <div>
                            <span>Genre Analysis</span>
                            <h2>Category Demand</h2>
                        </div>
                    </div>

                    <c:choose>
                        <c:when test="${not empty categoryReports}">
                            <div class="report-list">
                                <c:forEach var="report" items="${categoryReports}">
                                    <div class="report-row">
                                        <div>
                                            <strong>${report.category}</strong>
                                            <span>${report.availableQuantity} available</span>
                                        </div>
                                        <b>${report.orderedQuantity} ordered</b>
                                    </div>
                                </c:forEach>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <p class="report-empty">No category data available yet.</p>
                        </c:otherwise>
                    </c:choose>
                </article>

                <article class="analytics-panel">
                    <div class="section-heading compact-heading">
                        <div>
                            <span>Availability Report</span>
                            <h2>Low Stock</h2>
                        </div>
                    </div>

                    <c:choose>
                        <c:when test="${not empty lowStockProducts}">
                            <div class="report-list">
                                <c:forEach var="product" items="${lowStockProducts}">
                                    <div class="report-row">
                                        <div>
                                            <strong>${product.productName}</strong>
                                            <span>${product.category}</span>
                                        </div>
                                        <b>${product.quantity} left</b>
                                    </div>
                                </c:forEach>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <p class="report-empty">No low-stock products right now.</p>
                        </c:otherwise>
                    </c:choose>
                </article>

            </section>

            <!-- RECENT ORDERS -->
            <section class="recent-orders">

                <div class="section-heading">
                    <div>
                        <span>Latest Activity</span>
                        <h2>Recent Orders</h2>
                    </div>

                    <a href="${contextPath}/admin/orders" class="view-all-btn">
                        View All
                        <i class="fa-solid fa-arrow-right"></i>
                    </a>
                </div>

                <div class="table-container">

                    <table class="orders-table">

                        <thead>
                            <tr>
                                <th>Customer</th>
                                <th>Order ID</th>
                                <th>Status</th>
                                <th>Address</th>
                            </tr>
                        </thead>

                        <tbody>
                            <c:choose>

                                <c:when test="${not empty orderList}">
                                    <c:forEach var="order" items="${orderList}">
                                        <tr>
                                            <td>
                                                <div class="customer-cell">
                                                    <div class="customer-avatar">
                                                        <i class="fa-solid fa-user"></i>
                                                    </div>

                                                    <div>
                                                        <strong>${order.user.firstName} ${order.user.lastName}</strong>
                                                        <span>Customer</span>
                                                    </div>
                                                </div>
                                            </td>

                                            <td>
                                                <span class="order-id">#${order.orderId}</span>
                                            </td>

                                            <td>
                                                <span class="status-badge ${order.orderStatus.toLowerCase()}">
                                                    ${order.orderStatus}
                                                </span>
                                            </td>

                                            <td>
                                                <span class="address-text">${order.user.address.name}</span>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </c:when>

                                <c:otherwise>
                                    <tr>
                                        <td colspan="4">
                                            <div class="empty-table">
                                                <i class="fa-solid fa-box-open"></i>
                                                <h3>No recent orders found</h3>
                                                <p>Recent customer orders will appear here.</p>
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
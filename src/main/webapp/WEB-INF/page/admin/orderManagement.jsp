<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="currentUser" value="${sessionScope.username}" />

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <title>Order Management | Corexa</title>

    <link rel="shortcut icon" type="image/x-icon" href="${contextPath}/resources/logo/corexa2.png">
    <link rel="stylesheet" type="text/css" href="${contextPath}/css/orderManagement.css" />

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

                    <a href="${contextPath}/admin/orders" class="admin-nav-link active">
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

        <!-- MAIN CONTENT -->
        <main class="order-management-dashboard">

            <jsp:include page="adminHeader.jsp" />

            <!-- HERO -->
            <section class="management-hero">

                <div class="hero-content">
                    <span>Corexa Management</span>
                    <h1>Manage Orders</h1>
                    <p>
                        Review customer purchases, track order details, and update order status
                        from your Corexa admin panel.
                    </p>
                </div>

                <div class="hero-icon">
                    <i class="fa-solid fa-boxes-stacked"></i>
                </div>

            </section>

            <!-- MESSAGES -->
            <c:if test="${not empty message}">
                <div class="alert alert-success">
                    <i class="fa-solid fa-circle-check"></i>
                    <span>${message}</span>
                </div>
                <c:remove var="message" scope="session" />
            </c:if>

            <c:if test="${not empty error}">
                <div class="alert alert-error">
                    <i class="fa-solid fa-circle-exclamation"></i>
                    <span>${error}</span>
                </div>
                <c:remove var="error" scope="session" />
            </c:if>

            <!-- TOP BAR -->
            <section class="orders-top-bar">

                <div>
                    <span>Order Control</span>
                    <h2>Customer Orders</h2>
                </div>

                <p>
                    <c:choose>
                        <c:when test="${not empty orders}">
                            ${fn:length(orders)} order(s)
                        </c:when>
                        <c:otherwise>
                            0 order
                        </c:otherwise>
                    </c:choose>
                </p>

            </section>

            <!-- ORDERS TABLE -->
            <section class="orders-panel">

                <div class="table-container">

                    <table class="orders-table">

                        <thead>
                            <tr>
                                <th>Products</th>
                                <th>Customer</th>
                                <th>Order ID</th>
                                <th>Status</th>
                                <th>Address</th>
                                <th>Order Date</th>
                                <th>Payment</th>
                                <th>Total</th>
                            </tr>
                        </thead>

                        <tbody>
                            <c:choose>

                                <c:when test="${not empty orders}">

                                    <c:forEach var="order" items="${orders}">
                                        <tr>

                                            <td>
                                                <div class="product-stack">

                                                    <c:forEach var="item" items="${order.items}" varStatus="loop">
                                                        <c:if test="${loop.index < 3}">
                                                            <a href="${contextPath}/viewProduct?productId=${item.product.productId}" class="product-mini">
                                                                <img
                                                                    src="${contextPath}/resources/product/${item.product.productImage}"
                                                                    alt="${item.product.productName}"
                                                                    onerror="this.src='${contextPath}/resources/logo/onez.svg'">
                                                            </a>
                                                        </c:if>
                                                    </c:forEach>

                                                    <c:if test="${fn:length(order.items) > 3}">
                                                        <span class="more-products">
                                                            +${fn:length(order.items) - 3}
                                                        </span>
                                                    </c:if>

                                                </div>
                                            </td>

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
                                                <form action="${contextPath}/admin/orders" method="post" class="status-form">
                                                    <input type="hidden" name="action" value="updateStatus">
                                                    <input type="hidden" name="orderId" value="${order.orderId}">

                                                    <select name="status" class="status-dropdown ${fn:toLowerCase(order.orderStatus)}" onchange="this.form.submit()">
                                                        <option value="Pending" ${order.orderStatus eq 'Pending' ? 'selected' : ''}>Pending</option>
                                                        <option value="Processing" ${order.orderStatus eq 'Processing' ? 'selected' : ''}>Processing</option>
                                                        <option value="Completed" ${order.orderStatus eq 'Completed' ? 'selected' : ''}>Completed</option>
                                                        <option value="Cancelled" ${order.orderStatus eq 'Cancelled' ? 'selected' : ''}>Cancelled</option>
                                                    </select>
                                                </form>
                                            </td>

                                            <td>
                                                <span class="address-text">
                                                    <c:choose>
                                                        <c:when test="${not empty order.user.address}">
                                                            ${order.user.address.name}
                                                        </c:when>
                                                        <c:otherwise>
                                                            Not provided
                                                        </c:otherwise>
                                                    </c:choose>
                                                </span>
                                            </td>

                                            <td>
                                                <span class="date-text">${order.orderDate}</span>
                                            </td>

                                            <td>
                                                <span class="payment-pill">${order.paymentMethod}</span>
                                            </td>

                                            <td>
                                                <strong class="total-price">
                                                    <fmt:formatNumber value="${order.totalPrice}" type="currency" currencySymbol="Rs. " />
                                                </strong>
                                            </td>

                                        </tr>
                                    </c:forEach>

                                </c:when>

                                <c:otherwise>
                                    <tr>
                                        <td colspan="8">
                                            <div class="empty-table">
                                                <i class="fa-solid fa-box-open"></i>
                                                <h3>No orders found</h3>
                                                <p>Customer orders will appear here when purchases are placed.</p>
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order History | Corexa</title>

    <link rel="shortcut icon" type="image/x-icon" href="${contextPath}/resources/logo/logo.png">
    <link rel="stylesheet" href="${contextPath}/css/orderHistory.css">

    <script src="https://kit.fontawesome.com/91fb88d05c.js" crossorigin="anonymous"></script>
    <link href="https://cdn.lineicons.com/5.0/lineicons.css" rel="stylesheet" />

    <script src="${contextPath}/js/orderHistory.js" defer></script>
</head>

<body>

    <jsp:include page="header.jsp" />

    <main class="order-page">

        <!-- HERO -->
        <section class="order-hero">
            <div class="order-hero-content">
                <span>Corexa Account</span>
                <h1>Order History</h1>
                <p>
                    Track your previous gaming gear purchases, payment method,
                    order status and product details from one clean dashboard.
                </p>
            </div>
        </section>

        <section class="order-history-container">

            <c:if test="${not empty error}">
                <div class="message-box error-message">
                    <i class="fas fa-exclamation-circle"></i>
                    <span>${error}</span>
                </div>
            </c:if>

            <c:if test="${not empty orderSuccess}">
                <div class="message-box success-message">
                    <i class="fas fa-check-circle"></i>
                    <span>${orderSuccess}</span>
                </div>
                <c:remove var="orderSuccess" scope="session" />
            </c:if>

            <c:choose>

                <c:when test="${empty orders}">
                    <div class="empty-orders">
                        <div class="empty-icon">
                            <i class="fas fa-box-open"></i>
                        </div>

                        <h2>No Orders Yet</h2>
                        <p>
                            You have not placed any orders yet. Start exploring Corexa gaming gear
                            and build your perfect setup.
                        </p>

                        <a href="${contextPath}/home" class="btn-shop">
                            <i class="fas fa-arrow-left"></i>
                            Start Shopping
                        </a>
                    </div>
                </c:when>

                <c:otherwise>

                    <div class="order-top-bar">
                        <div>
                            <span>Purchase Timeline</span>
                            <h2>Your Orders</h2>
                        </div>

                        <p>${fn:length(orders)} order(s)</p>
                    </div>

                    <div class="orders-list">

                        <c:forEach var="order" items="${orders}">

                            <c:set var="orderTotal" value="0" />

                            <div class="order-card">

                                <div class="order-card-glow"></div>

                                <div class="order-header">

                                    <div class="order-title">
                                        <span>Order ID</span>
                                        <h3>#${order.orderId}</h3>
                                    </div>

                                    <div class="order-meta">

                                        <div class="meta-box">
                                            <i class="fa-solid fa-calendar-days"></i>
                                            <div>
                                                <span>Order Date</span>
                                                <strong>${order.orderDate}</strong>
                                            </div>
                                        </div>

                                        <div class="meta-box">
                                            <i class="fa-solid fa-box"></i>
                                            <div>
                                                <span>Items</span>
                                                <strong>${fn:length(order.items)}</strong>
                                            </div>
                                        </div>

                                        <div class="status-pill ${fn:toLowerCase(order.orderStatus)}">
                                            ${order.orderStatus}
                                        </div>

                                    </div>

                                    <form action="${contextPath}/orderHistory/delete" method="post" class="delete-form">
                                        <input type="hidden" name="orderId" value="${order.orderId}">

                                        <button type="submit" class="delete-btn">
                                            <i class="fas fa-trash-alt"></i>
                                            Delete
                                        </button>
                                    </form>

                                </div>

                                <div class="order-details">

                                    <div class="order-items">

                                        <c:forEach var="item" items="${order.items}">

                                            <c:set var="lineTotal" value="${item.priceAtOrder * item.quantity}" />
                                            <c:set var="orderTotal" value="${orderTotal + lineTotal}" />

                                            <div class="order-item">

                                                <div class="item-image-wrap">
                                                    <a href="${contextPath}/viewProduct?productId=${item.product.productId}">
                                                        <img
                                                            src="${contextPath}/resources/product/${item.product.productImage}"
                                                            alt="${item.product.productName}"
                                                            class="item-image"
                                                            onerror="this.src='${contextPath}/resources/logo/onez.svg'">
                                                    </a>
                                                </div>

                                                <div class="item-info">
                                                    <p class="item-category">${item.product.category}</p>

                                                    <h4>
                                                        <a href="${contextPath}/viewProduct?productId=${item.product.productId}">
                                                            ${item.product.productName}
                                                        </a>
                                                    </h4>

                                                    <div class="item-small-details">
                                                        <span>Qty: ${item.quantity}</span>
                                                        <span>
                                                            Rs. <fmt:formatNumber value="${item.priceAtOrder}" pattern="#,##0.##" /> each
                                                        </span>
                                                    </div>

                                                    <c:if test="${item.product.price != item.priceAtOrder}">
                                                        <p class="price-note">
                                                            Current price:
                                                            Rs. <fmt:formatNumber value="${item.product.price}" pattern="#,##0.##" />
                                                        </p>
                                                    </c:if>
                                                </div>

                                                <div class="item-line-total">
                                                    <span>Subtotal</span>
                                                    <strong>
                                                        Rs. <fmt:formatNumber value="${lineTotal}" pattern="#,##0.##" />
                                                    </strong>
                                                </div>

                                            </div>

                                        </c:forEach>

                                    </div>

                                    <aside class="order-summary">

                                        <div class="summary-icon">
                                            <i class="fa-solid fa-receipt"></i>
                                        </div>

                                        <h4>Order Summary</h4>

                                        <div class="summary-row">
                                            <span>Total Items</span>
                                            <strong>${fn:length(order.items)}</strong>
                                        </div>

                                        <div class="summary-row">
                                            <span>Payment</span>
                                            <strong>${order.paymentMethod}</strong>
                                        </div>

                                        <div class="summary-row">
                                            <span>Status</span>
                                            <strong>${order.orderStatus}</strong>
                                        </div>

                                        <div class="summary-row total">
                                            <span>Total</span>
                                            <strong>
                                                Rs. <fmt:formatNumber value="${orderTotal}" pattern="#,##0.##" />
                                            </strong>
                                        </div>

                                    </aside>

                                </div>

                            </div>

                        </c:forEach>

                    </div>

                </c:otherwise>

            </c:choose>

        </section>

    </main>

    <jsp:include page="footer.jsp" />

</body>
</html>
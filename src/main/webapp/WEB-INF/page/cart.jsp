<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Your Cart | Corexa</title>

    <link rel="shortcut icon" type="image/x-icon" href="${contextPath}/resources/logo/logo.png">
    <link rel="stylesheet" type="text/css" href="${contextPath}/css/cart.css">

    <script src="https://kit.fontawesome.com/91fb88d05c.js" crossorigin="anonymous"></script>
    <link href="https://cdn.lineicons.com/5.0/lineicons.css" rel="stylesheet" />
</head>

<body>

    <jsp:include page="header.jsp" />

    <main class="cart-page">

        <section class="cart-hero">
            <div class="cart-hero-content">
                <span>Shopping Cart</span>
                <h1>Your Gaming Loadout</h1>
                <p>Review your selected products before placing your order.</p>
            </div>
        </section>

        <section class="cart-container">

            <c:if test="${not empty error}">
                <div class="message-box error-message">
                    <i class="fas fa-exclamation-circle"></i>
                    <span>${error}</span>
                </div>
            </c:if>

            <c:if test="${not empty success}">
                <div class="message-box success-message">
                    <i class="fas fa-check-circle"></i>
                    <span>${success}</span>
                </div>
            </c:if>

            <c:choose>

                <c:when test="${empty cart or empty cart.items}">
                    <div class="empty-cart">
                        <div class="empty-cart-icon">
                            <i class="fas fa-shopping-basket"></i>
                        </div>

                        <h2>Your cart is empty</h2>
                        <p>You have not added any gaming products to your cart yet.</p>

                        <a href="${contextPath}/home" class="continue-shopping">
                            <i class="fas fa-arrow-left"></i>
                            Continue Shopping
                        </a>
                    </div>
                </c:when>

                <c:otherwise>

                    <div class="cart-layout">

                        <!-- CART ITEMS -->
                        <section class="cart-items-panel">

                            <div class="cart-panel-heading">
                                <div>
                                    <span>Selected Products</span>
                                    <h2>Cart Items</h2>
                                </div>

                                <p>${cart.totalItems} item(s)</p>
                            </div>

                            <div class="cart-items-list">

                                <c:forEach var="item" items="${cart.items}">

                                    <article class="cart-item-card">

                                        <div class="cart-product-image">
                                            <a href="${contextPath}/viewProduct?productId=${item.product.productId}">
                                                <img
                                                    src="${contextPath}/resources/product/${item.product.productImage}"
                                                    alt="${item.product.productName}"
                                                    onerror="this.src='${contextPath}/resources/logo/onez.svg'">
                                            </a>
                                        </div>

                                        <div class="cart-product-info">
                                            <p class="cart-category">${item.product.category}</p>

                                            <h3>
                                                <a href="${contextPath}/viewProduct?productId=${item.product.productId}">
                                                    ${item.product.productName}
                                                </a>
                                            </h3>

                                            <div class="cart-mobile-price">
                                                Rs. <fmt:formatNumber value="${item.product.price}" pattern="#,##0.##" />
                                            </div>
                                        </div>

                                        <div class="cart-price">
                                            <span>Price</span>
                                            <strong>
                                                Rs. <fmt:formatNumber value="${item.product.price}" pattern="#,##0.##" />
                                            </strong>
                                        </div>

                                        <div class="cart-quantity">
                                            <span>Quantity</span>

                                            <form action="${contextPath}/cart/update" method="post" class="quantity-form">
                                                <input type="hidden" name="productId" value="${item.product.productId}" />

                                                <button type="button" class="quantity-btn minus" onclick="changeQuantity(this, -1)">
                                                    -
                                                </button>

                                                <input
                                                    type="number"
                                                    name="quantity"
                                                    value="${item.productQuantity}"
                                                    min="1"
                                                    max="${item.product.quantity}"
                                                    class="quantity-input"
                                                    onchange="validateQuantity(this)">

                                                <button type="button" class="quantity-btn plus" onclick="changeQuantity(this, 1)">
                                                    +
                                                </button>
                                            </form>
                                        </div>

                                        <div class="cart-subtotal">
                                            <span>Subtotal</span>
                                            <strong>
                                                Rs. <fmt:formatNumber value="${item.productQuantity * item.product.price}" pattern="#,##0.##" />
                                            </strong>
                                        </div>

                                        <div class="cart-actions">
                                            <form action="${contextPath}/cart/remove" method="post">
                                                <input type="hidden" name="productId" value="${item.product.productId}" />

                                                <button type="submit" class="remove-btn">
                                                    <i class="fas fa-trash-alt"></i>
                                                    Remove
                                                </button>
                                            </form>
                                        </div>

                                    </article>

                                </c:forEach>

                            </div>

                        </section>

                        <!-- ORDER SUMMARY -->
                        <aside class="cart-summary">

                            <div class="summary-card">

                                <div class="summary-icon">
                                    <i class="fas fa-receipt"></i>
                                </div>

                                <h3>Order Summary</h3>

                                <div class="summary-row">
                                    <span>Total Items</span>
                                    <strong>${cart.totalItems}</strong>
                                </div>

                                <div class="summary-row">
                                    <span>Delivery</span>
                                    <strong>Calculated later</strong>
                                </div>

                                <div class="summary-row total">
                                    <span>Total Price</span>
                                    <strong>
                                        Rs. <fmt:formatNumber value="${cart.totalPrice}" pattern="#,##0.##" />
                                    </strong>
                                </div>

                                <form action="${contextPath}/order" method="get">
                                    <button type="submit" class="checkout-btn">
                                        <i class="fas fa-credit-card"></i>
                                        Place Order
                                    </button>
                                </form>

                                <a href="${contextPath}/home" class="summary-continue">
                                    <i class="fas fa-arrow-left"></i>
                                    Continue Shopping
                                </a>

                            </div>

                        </aside>

                    </div>

                </c:otherwise>

            </c:choose>

        </section>

    </main>

    <jsp:include page="footer.jsp" />

    <script>
        function changeQuantity(button, change) {
            const form = button.closest(".quantity-form");
            const input = form.querySelector(".quantity-input");

            let currentValue = parseInt(input.value);
            let maxValue = parseInt(input.max);

            if (isNaN(currentValue) || currentValue < 1) {
                currentValue = 1;
            }

            let newValue = currentValue + change;

            if (newValue < 1) {
                newValue = 1;
            }

            if (newValue > maxValue) {
                newValue = maxValue;
            }

            input.value = newValue;
            form.submit();
        }

        function validateQuantity(input) {
            let value = parseInt(input.value);
            let maxValue = parseInt(input.max);

            if (isNaN(value) || value < 1) {
                input.value = 1;
            }

            if (value > maxValue) {
                input.value = maxValue;
            }

            input.closest("form").submit();
        }
    </script>

</body>
</html>
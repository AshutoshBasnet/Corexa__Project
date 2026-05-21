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
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Your Wishlist | Corexa</title>

    <link rel="shortcut icon" type="image/x-icon" href="${contextPath}/resources/logo/logo.png">
    <link rel="stylesheet" type="text/css" href="${contextPath}/css/wishlist.css">

    <script src="https://kit.fontawesome.com/91fb88d05c.js" crossorigin="anonymous"></script>
    <link href="https://cdn.lineicons.com/5.0/lineicons.css" rel="stylesheet" />

    <script src="${contextPath}/js/wishlist.js" defer></script>
</head>

<body>

    <jsp:include page="header.jsp" />

    <main class="wishlist-page">

        <!-- HERO -->
        <section class="wishlist-hero">
            <div class="wishlist-hero-content">
                <span>Corexa Account</span>
                <h1>Your Wishlist</h1>
                <p>
                    Save your favorite gaming gear, compare products later, and quickly return
                    to the items you want for your next setup upgrade.
                </p>
            </div>
        </section>

        <section class="wishlist-container">

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

                <c:when test="${not empty wishlist and not empty wishlist.products}">

                    <div class="wishlist-layout">

                        <!-- WISHLIST PRODUCTS -->
                        <section class="wishlist-products-panel">

                            <div class="wishlist-top-bar">
                                <div>
                                    <span>Saved Products</span>
                                    <h2>Favorite Gear</h2>
                                </div>

                                <p>${fn:length(wishlist.products)} item(s)</p>
                            </div>

                            <div class="wishlist-grid">

                                <c:forEach var="product" items="${wishlist.products}">

                                    <article class="wishlist-card">

                                        <span class="wishlist-badge">
                                            <i class="fa-solid fa-heart"></i>
                                            Saved
                                        </span>

                                        <div class="wishlist-image">
                                            <a href="${contextPath}/viewProduct?productId=${product.productId}">
                                                <img
                                                    src="${contextPath}/resources/product/${product.productImage}"
                                                    alt="${product.productName}"
                                                    onerror="this.src='${contextPath}/resources/logo/onez.svg'">
                                            </a>
                                        </div>

                                        <div class="wishlist-info">

                                            <p class="product-category">${product.category}</p>

                                            <h3>
                                                <a href="${contextPath}/viewProduct?productId=${product.productId}">
                                                    ${product.productName}
                                                </a>
                                            </h3>

                                            <div class="product-price">
                                                Rs. <fmt:formatNumber value="${product.price}" pattern="#,##0.##" />
                                            </div>

                                            <div class="stock-status">
                                                <c:choose>
                                                    <c:when test="${product.quantity > 0}">
                                                        <span class="in-stock">
                                                            <i class="fas fa-check-circle"></i>
                                                            In Stock
                                                        </span>
                                                    </c:when>

                                                    <c:otherwise>
                                                        <span class="out-of-stock">
                                                            <i class="fas fa-times-circle"></i>
                                                            Out of Stock
                                                        </span>
                                                    </c:otherwise>
                                                </c:choose>
                                            </div>

                                            <div class="wishlist-actions">

                                                <a href="${contextPath}/viewProduct?productId=${product.productId}" class="view-btn">
                                                    View Product
                                                </a>

                                                <form action="${contextPath}/wishlist/remove" method="post" class="remove-form">
                                                    <input type="hidden" name="productId" value="${product.productId}" />

                                                    <button type="submit" class="remove-btn">
                                                        <i class="fas fa-trash-alt"></i>
                                                        Remove
                                                    </button>
                                                </form>

                                            </div>

                                        </div>

                                    </article>

                                </c:forEach>

                            </div>

                        </section>

                        <!-- SUMMARY -->
                        <aside class="wishlist-summary">

                            <div class="summary-card">

                                <div class="summary-icon">
                                    <i class="fa-solid fa-heart"></i>
                                </div>

                                <h3>Wishlist Summary</h3>

                                <div class="summary-row">
                                    <span>Total Items</span>
                                    <strong>${fn:length(wishlist.products)}</strong>
                                </div>

                                <div class="summary-row">
                                    <span>Status</span>
                                    <strong>Saved for later</strong>
                                </div>

                                <div class="summary-row">
                                    <span>Tip</span>
                                    <strong>Check stock often</strong>
                                </div>

                                <a href="${contextPath}/home" class="continue-shopping">
                                    <i class="fas fa-arrow-left"></i>
                                    Continue Shopping
                                </a>

                                <a href="${contextPath}/viewCategory" class="browse-products">
                                    <i class="fas fa-store"></i>
                                    Browse More
                                </a>

                            </div>

                        </aside>

                    </div>

                </c:when>

                <c:otherwise>

                    <div class="empty-wishlist">

                        <div class="empty-icon">
                            <i class="fas fa-heart"></i>
                        </div>

                        <h2>Your Wishlist is Empty</h2>

                        <p>
                            You have not added any items to your wishlist yet. Browse gaming
                            products and save the gear you like for later.
                        </p>

                        <a href="${contextPath}/viewCategory" class="browse-btn">
                            <i class="fas fa-store"></i>
                            Browse Products
                        </a>

                    </div>

                </c:otherwise>

            </c:choose>

        </section>

    </main>

    <jsp:include page="footer.jsp" />

</body>
</html>
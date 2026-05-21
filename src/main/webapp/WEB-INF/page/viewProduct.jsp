<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="productCategory" value="${product.category}" />

<c:choose>
    <c:when test="${productCategory == 'Keyboard'}">
        <c:set var="categoryClass" value="category-keyboard" />
        <c:set var="categoryIcon" value="fa-keyboard" />
        <c:set var="categoryEffectText" value="RGB Keyboard Mode" />
    </c:when>

    <c:when test="${productCategory == 'Mouse'}">
        <c:set var="categoryClass" value="category-mouse" />
        <c:set var="categoryIcon" value="fa-computer-mouse" />
        <c:set var="categoryEffectText" value="Precision Mouse Mode" />
    </c:when>

    <c:when test="${productCategory == 'Headset'}">
        <c:set var="categoryClass" value="category-headset" />
        <c:set var="categoryIcon" value="fa-headphones-simple" />
        <c:set var="categoryEffectText" value="Surround Sound Mode" />
    </c:when>

    <c:when test="${productCategory == 'Monitor'}">
        <c:set var="categoryClass" value="category-monitor" />
        <c:set var="categoryIcon" value="fa-desktop" />
        <c:set var="categoryEffectText" value="Display Boost Mode" />
    </c:when>

    <c:when test="${productCategory == 'Consoles'}">
        <c:set var="categoryClass" value="category-console" />
        <c:set var="categoryIcon" value="fa-gamepad" />
        <c:set var="categoryEffectText" value="Console Gaming Mode" />
    </c:when>

    <c:when test="${productCategory == 'CPU/GPU' or fn:contains(productCategory, 'CPU') or fn:contains(productCategory, 'GPU')}">
        <c:set var="categoryClass" value="category-chip" />
        <c:set var="categoryIcon" value="fa-microchip" />
        <c:set var="categoryEffectText" value="Performance Chip Mode" />
    </c:when>

    <c:when test="${productCategory == 'Storage'}">
        <c:set var="categoryClass" value="category-storage" />
        <c:set var="categoryIcon" value="fa-hard-drive" />
        <c:set var="categoryEffectText" value="Data Flow Mode" />
    </c:when>

    <c:otherwise>
        <c:set var="categoryClass" value="category-accessory" />
        <c:set var="categoryIcon" value="fa-bolt" />
        <c:set var="categoryEffectText" value="Gaming Accessory Mode" />
    </c:otherwise>
</c:choose>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${product.productName} | Corexa</title>

    <link rel="shortcut icon" type="image/x-icon" href="${contextPath}/resources/logo/logo.png">
    <link rel="stylesheet" type="text/css" href="${contextPath}/css/viewProduct.css" />

    <script src="https://kit.fontawesome.com/91fb88d05c.js" crossorigin="anonymous"></script>
    <link href="https://cdn.lineicons.com/5.0/lineicons.css" rel="stylesheet" />
</head>

<body>

    <jsp:include page="header.jsp" />

    <main class="product-page ${categoryClass}">

        <section class="product-hero">

            <div class="product-hero-bg"></div>

            <div class="product-shell">

                <div class="product-visual-panel">

                    <div class="effect-chip">
                        <i class="fa-solid ${categoryIcon}"></i>
                        <span>${categoryEffectText}</span>
                    </div>

                    <div class="device-stage">

                        <span class="aura aura-one"></span>
                        <span class="aura aura-two"></span>
                        <span class="orbit orbit-one"></span>
                        <span class="orbit orbit-two"></span>
                        <span class="scan-line"></span>
                        <span class="sound-wave sound-wave-one"></span>
                        <span class="sound-wave sound-wave-two"></span>
                        <span class="circuit-line circuit-line-one"></span>
                        <span class="circuit-line circuit-line-two"></span>
                        <span class="data-dot data-dot-one"></span>
                        <span class="data-dot data-dot-two"></span>
                        <span class="data-dot data-dot-three"></span>

                        <div class="image-container">
                            <img
                                src="${contextPath}/resources/product/${product.productImage}"
                                alt="${product.productName}"
                                onerror="this.src='${contextPath}/resources/logo/onez.svg'">
                        </div>

                    </div>

                </div>

                <div class="details-container">

                    <div class="product-path">
                        <a href="${contextPath}/home">Home</a>
                        <span>/</span>
                        <a href="${contextPath}/viewCategory?category=${product.category}">
                            ${product.category}
                        </a>
                    </div>

                    <span class="category-pill">
                        <i class="fa-solid ${categoryIcon}"></i>
                        ${product.category}
                    </span>

                    <h1 class="product-name">${product.productName}</h1>

                    <div class="price-container">
                        <p class="price">Rs. ${product.price}</p>

                        <div class="stock ${product.quantity <= 0 ? 'out-of-stock' : 'in-stock'}">
                            <c:choose>
                                <c:when test="${product.quantity <= 0}">
                                    Out of Stock
                                </c:when>
                                <c:otherwise>
                                    In Stock
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>

                    <div class="mini-info-grid">
                        <div>
                            <i class="fa-solid fa-box"></i>
                            <span>Available</span>
                            <strong>${product.quantity}</strong>
                        </div>

                        <div>
                            <i class="fa-solid fa-truck-fast"></i>
                            <span>Delivery</span>
                            <strong>Fast</strong>
                        </div>

                        <div>
                            <i class="fa-solid fa-shield-halved"></i>
                            <span>Warranty</span>
                            <strong>Included</strong>
                        </div>
                    </div>

                

                    <div class="colors">
                        <span class="option-label">Color Options</span>

                        <div class="color-options">
                            <button type="button" class="btn-color white active" aria-label="White color"></button>
                            <button type="button" class="btn-color black" aria-label="Black color"></button>
                        </div>
                    </div>

                    <c:choose>
                        <c:when test="${product.quantity > 0}">
                            <form action="${contextPath}/cart/add" method="post" class="cart-form">
                                <input type="hidden" name="productId" value="${product.productId}" />

                                <div class="quantity-control">
                                    <label for="quantity">Quantity</label>

                                    <div class="quantity-box">
                                        <button type="button" onclick="decreaseQty()">-</button>
                                        <input
                                            type="number"
                                            id="quantity"
                                            name="quantity"
                                            value="1"
                                            min="1"
                                            max="${product.quantity}" />
                                        <button type="button" onclick="increaseQty()">+</button>
                                    </div>
                                </div>

                                <button type="submit" class="add-to-cart">
                                    <i class="fa-solid fa-cart-shopping"></i>
                                    Add to Cart
                                </button>
                            </form>
                        </c:when>

                        <c:otherwise>
                            <button type="button" class="add-to-cart disabled-btn" disabled>
                                <i class="fa-solid fa-ban"></i>
                                Out of Stock
                            </button>
                        </c:otherwise>
                    </c:choose>

                    <form action="${contextPath}/wishlist/add" method="post" class="wishlist-form">
                        <input type="hidden" name="productId" value="${product.productId}">
                        <button type="submit" class="wishlist-btn">
                            <i class="fa-regular fa-heart"></i>
                            Add to Wishlist
                        </button>
                    </form>

                </div>

            </div>

        </section>

        <section class="description-section">
            <div class="description-wrapper">
                <span>Product Details</span>
                <h2>About this Product</h2>
                <p>${product.description}</p>
            </div>
        </section>

        <section class="related-products">

            <div class="section-heading">
                <span>Explore More</span>
                <h2>Other Products</h2>
            </div>

            <c:choose>
                <c:when test="${not empty recentProducts}">
                    <div class="product-box">

                        <c:forEach var="item" items="${recentProducts}">
                            <div class="product-container">

                                <span class="product-badge">${item.category}</span>

                                <div class="product-image">
                                    <a href="${contextPath}/viewProduct?productId=${item.productId}">
                                        <img
                                            src="${contextPath}/resources/product/${item.productImage}"
                                            alt="${item.productName}"
                                            onerror="this.src='${contextPath}/resources/logo/onez.svg'">
                                    </a>
                                </div>

                                <div class="product-info">
                                    <p class="product-category">${item.category}</p>
                                    <h4>${item.productName}</h4>

                                    <div class="product-bottom">
                                        <h5>Rs. ${item.price}</h5>

                                        <a href="${contextPath}/viewProduct?productId=${item.productId}">
                                            View Product
                                        </a>
                                    </div>
                                </div>

                            </div>
                        </c:forEach>

                    </div>
                </c:when>

                <c:otherwise>
                    <div class="empty-products">
                        <h3>No other products available right now.</h3>
                        <a href="${contextPath}/viewCategory?category=All">Browse All Products</a>
                    </div>
                </c:otherwise>
            </c:choose>

        </section>

    </main>

    <jsp:include page="footer.jsp" />

    <script>
        function increaseQty() {
            const input = document.getElementById("quantity");
            if (!input) return;

            const max = parseInt(input.max);
            let current = parseInt(input.value);

            if (isNaN(current) || current < 1) {
                input.value = 1;
                return;
            }

            if (current < max) {
                input.value = current + 1;
            }
        }

        function decreaseQty() {
            const input = document.getElementById("quantity");
            if (!input) return;

            let current = parseInt(input.value);

            if (isNaN(current) || current <= 1) {
                input.value = 1;
                return;
            }

            input.value = current - 1;
        }

        document.querySelectorAll(".btn-color").forEach(function(button) {
            button.addEventListener("click", function() {
                document.querySelectorAll(".btn-color").forEach(function(btn) {
                    btn.classList.remove("active");
                });

                button.classList.add("active");
            });
        });
    </script>

</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Corexa</title>

    <link rel="shortcut icon" type="image/x-icon" href="${contextPath}/resources/logo/corexa.png">

    <link rel="stylesheet" type="text/css" href="${contextPath}/css/home.css" />

    <script src="https://kit.fontawesome.com/91fb88d05c.js" crossorigin="anonymous"></script>
    <link href="https://cdn.lineicons.com/5.0/lineicons.css" rel="stylesheet" />

    <script src="${contextPath}/js/slider.js" defer></script>
</head>

<body>

    <jsp:include page="header.jsp" />

    <c:if test="${not empty error}">
        <p class="error-message">${error}</p>
    </c:if>

    <c:if test="${not empty success}">
        <p class="success-message">${success}</p>
    </c:if>

    <!-- HERO SLIDER -->
    <section class="slider hero-slider">

        <div class="slide">
            <img src="${contextPath}/resources/slider/image .png" alt="Corexa gaming banner">
            <img src="${contextPath}/resources/slider/slider image 2.png" alt="Corexa gaming banner">
            <img src="${contextPath}/resources/slider/slider image 3.png" alt="Corexa gaming banner">
            <img src="${contextPath}/resources/slider/slider image 4.png" alt="Corexa gaming banner">
        </div>

        <button class="hero-arrow hero-arrow-left" type="button">
            <i class="fa-solid fa-chevron-left"></i>
        </button>

        <button class="hero-arrow hero-arrow-right" type="button">
            <i class="fa-solid fa-chevron-right"></i>
        </button>

        <div class="hero-content">
            <span>Corexa Gaming Store</span>
            <h1>Upgrade Your Gaming Setup</h1>
            <p>Explore keyboards, mouse, headsets, consoles, monitors and gaming accessories.</p>

            <a href="${contextPath}/viewCategory?category=All" class="hero-btn">
                Shop Now
            </a>
        </div>

        <div class="hero-dots">
            <span></span>
            <span></span>
            <span></span>
            <span></span>
        </div>

    </section>

    <!-- TAGLINE -->
    <section class="home-tagline">
        <h2>Embark on an Epic Gaming Adventure with us.</h2>
    </section>

    <!-- BROWSE BY CATEGORY -->
    <section class="browse_by_category">
        <div class="section-heading">
            <span>Shop by category</span>
            <h3>Browse Gaming Essentials</h3>
        </div>

        <div class="category">

            <a href="${contextPath}/viewCategory">
                <div class="category-card">
                    <i class="fa-solid fa-globe"></i>
                    <p>Browse All</p>
                </div>
            </a>

            <a href="${contextPath}/viewCategory?category=Consoles">
                <div class="category-card">
                    <i class="fa-solid fa-gamepad"></i>
                    <p>Consoles</p>
                </div>
            </a>

            <a href="${contextPath}/viewCategory?category=Keyboard">
                <div class="category-card">
                    <i class="fa-solid fa-keyboard"></i>
                    <p>Keyboards</p>
                </div>
            </a>

            <a href="${contextPath}/viewCategory?category=Mouse">
                <div class="category-card">
                    <i class="fa-solid fa-computer-mouse"></i>
                    <p>Mouse</p>
                </div>
            </a>

            <a href="${contextPath}/viewCategory?category=Headset">
                <div class="category-card">
                    <i class="fa-solid fa-headphones-simple"></i>
                    <p>Headsets</p>
                </div>
            </a>

            <a href="${contextPath}/viewCategory?category=Monitor">
                <div class="category-card">
                    <i class="fa-solid fa-desktop"></i>
                    <p>Monitor</p>
                </div>
            </a>

            <a href="${contextPath}/viewCategory?category=CPU/GPU">
                <div class="category-card">
                    <i class="fa-solid fa-microchip"></i>
                    <p>CPU / GPU</p>
                </div>
            </a>

            <a href="${contextPath}/viewCategory?category=Storage">
                <div class="category-card">
                    <i class="fa-solid fa-hard-drive"></i>
                    <p>Storage</p>
                </div>
            </a>

            <a href="${contextPath}/viewCategory?category=Other">
                <div class="category-card">
                    <i class="fa-solid fa-ellipsis"></i>
                    <p>Others</p>
                </div>
            </a>

        </div>
    </section>

    <!-- NEW ARRIVAL -->
    <section class="new_arrival">
        <div class="wrapper">
            <div class="new-arrival-text">
                <span>New Arrival</span>
                <h3>Fresh Gaming Gear Just Dropped</h3>
                <p>Discover the latest products added to Corexa.</p>

                <a href="${contextPath}/viewCategory?category=All">
                    <button type="button">Shop New Arrival</button>
                </a>
            </div>

            <div class="new-arrival-image">
                <img src="${contextPath}/resources/product/Rog.png" alt="Keyboards">
            </div>
        </div>
    </section>

    <!-- TRENDING PRODUCTS -->
    <section class="trending-section">
        <div class="section-heading">
            <span>Popular Products</span>
            <h3 class="trnd">Trending Products</h3>
        </div>

        <section class="products">
            <div class="product-box">

                <c:choose>
                    <c:when test="${not empty products}">
                        <c:forEach var="product" items="${products}">
                            <div class="product-container">

                                <span class="product-badge">Trending</span>

                                <div class="product-image">
                                    <a href="${contextPath}/viewProduct?productId=${product.productId}">
                                        <img src="${contextPath}/resources/product/${product.productImage}" alt="${product.productName}">
                                    </a>
                                </div>

                                <div class="product-info">
                                    <p class="product-category">${product.category}</p>
                                    <h4>${product.productName}</h4>

                                    <div class="product-bottom">
                                        <h5>Rs. ${product.price}</h5>
                                        <a href="${contextPath}/viewProduct?productId=${product.productId}">
                                            View
                                        </a>
                                    </div>
                                </div>

                            </div>
                        </c:forEach>
                    </c:when>

                    <c:otherwise>
                        <div class="empty-products">
                            <h4>No products available right now.</h4>
                            <p>Please add products from the admin panel.</p>
                        </div>
                    </c:otherwise>
                </c:choose>

            </div>
        </section>
    </section>

    <jsp:include page="footer.jsp" />

</body>
</html>
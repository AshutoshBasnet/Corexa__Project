<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Products | Corexa</title>

    <link rel="shortcut icon" type="image/x-icon" href="${contextPath}/resources/logo/logo.png">
    <link rel="stylesheet" href="${contextPath}/css/viewCategory.css">

    <link href="https://cdn.lineicons.com/5.0/lineicons.css" rel="stylesheet" />
    <script src="https://kit.fontawesome.com/91fb88d05c.js" crossorigin="anonymous"></script>
    <script src="${contextPath}/js/sorting.js" defer></script>
</head>

<body>

    <jsp:include page="header.jsp" />

    <main class="category-page">

        <!-- HERO AREA -->
        <section class="category-hero">
            <div class="category-hero-content">
                <span>Corexa Store</span>

                <h1>
                    <c:choose>
                        <c:when test="${empty param.category || param.category == 'All'}">
                            All Gaming Products
                        </c:when>
                        <c:otherwise>
                            <c:out value="${param.category}" />
                        </c:otherwise>
                    </c:choose>
                </h1>

                <p>
                    Browse gaming gear, components, accessories and performance products made for every setup.
                </p>
            </div>
        </section>

        <div class="main-content">

            <!-- LEFT FILTER PANEL -->
            <aside class="left-panel">

                <div class="filter-card">
                    <div class="category-title">
                        <span>Filter</span>
                        <h3>Categories</h3>
                    </div>

                    <ul class="category-list">

                        <li class="category-items">
                            <a href="${contextPath}/viewCategory?category=All"
                               class="${empty param.category || param.category == 'All' ? 'active' : ''}">
                                <i class="fa-solid fa-border-all"></i>
                                All
                            </a>
                        </li>

                        <li class="category-items">
                            <a href="${contextPath}/viewCategory?category=Consoles"
                               class="${param.category == 'Consoles' ? 'active' : ''}">
                                <i class="fa-solid fa-gamepad"></i>
                                Consoles
                            </a>
                        </li>

                        <li class="category-items">
                            <a href="${contextPath}/viewCategory?category=Keyboard"
                               class="${param.category == 'Keyboard' ? 'active' : ''}">
                                <i class="fa-solid fa-keyboard"></i>
                                Keyboard
                            </a>
                        </li>

                        <li class="category-items">
                            <a href="${contextPath}/viewCategory?category=Mouse"
                               class="${param.category == 'Mouse' ? 'active' : ''}">
                                <i class="fa-solid fa-computer-mouse"></i>
                                Mouse
                            </a>
                        </li>

                        <li class="category-items">
                            <a href="${contextPath}/viewCategory?category=Headset"
                               class="${param.category == 'Headset' ? 'active' : ''}">
                                <i class="fa-solid fa-headphones-simple"></i>
                                Headset
                            </a>
                        </li>

                        <li class="category-items">
                            <a href="${contextPath}/viewCategory?category=Monitor"
                               class="${param.category == 'Monitor' ? 'active' : ''}">
                                <i class="fa-solid fa-desktop"></i>
                                Monitor
                            </a>
                        </li>

                        <li class="category-items">
                            <a href="${contextPath}/viewCategory?category=CPU/GPU"
                               class="${param.category == 'CPU/GPU' ? 'active' : ''}">
                                <i class="fa-solid fa-microchip"></i>
                                CPU/GPU
                            </a>
                        </li>

                        <li class="category-items">
                            <a href="${contextPath}/viewCategory?category=Storage"
                               class="${param.category == 'Storage' ? 'active' : ''}">
                                <i class="fa-solid fa-hard-drive"></i>
                                Storage
                            </a>
                        </li>

                        <li class="category-items">
                            <a href="${contextPath}/viewCategory?category=Other"
                               class="${param.category == 'Other' ? 'active' : ''}">
                                <i class="fa-solid fa-ellipsis"></i>
                                Other
                            </a>
                        </li>

                    </ul>
                </div>

            </aside>

            <!-- RIGHT PRODUCT PANEL -->
            <section class="right-panel">

                <div class="select-price">

                    <div class="text">
                        <span>Showing Products</span>
                        <h3>
                            <c:choose>
                                <c:when test="${empty param.category || param.category == 'All'}">
                                    All Products
                                </c:when>
                                <c:otherwise>
                                    <c:out value="${param.category}" />
                                </c:otherwise>
                            </c:choose>
                        </h3>
                    </div>

                    <div class="toolbar-actions">

                        <div class="selection">
                            <label for="sort-by">Sort By</label>
                            <select name="sort-by" id="sort-by">
                                <option value="default">Default</option>
                                <option value="priceHigh">High - Low</option>
                                <option value="priceLow">Low - High</option>
                            </select>
                        </div>

                        <div class="category-selection">
                            <form id="categoryForm" action="${contextPath}/viewCategory" method="get">
                                <label for="category">Category</label>
                                <select name="category" id="category" onchange="this.form.submit()">
                                    <option value="All" ${empty param.category || param.category == 'All' ? 'selected' : ''}>All</option>
                                    <option value="Consoles" ${param.category == 'Consoles' ? 'selected' : ''}>Consoles</option>
                                    <option value="Keyboard" ${param.category == 'Keyboard' ? 'selected' : ''}>Keyboard</option>
                                    <option value="Mouse" ${param.category == 'Mouse' ? 'selected' : ''}>Mouse</option>
                                    <option value="Headset" ${param.category == 'Headset' ? 'selected' : ''}>Headset</option>
                                    <option value="Monitor" ${param.category == 'Monitor' ? 'selected' : ''}>Monitor</option>
                                    <option value="CPU/GPU" ${param.category == 'CPU/GPU' ? 'selected' : ''}>CPU/GPU</option>
                                    <option value="Storage" ${param.category == 'Storage' ? 'selected' : ''}>Storage</option>
                                    <option value="Other" ${param.category == 'Other' ? 'selected' : ''}>Other</option>
                                </select>
                            </form>
                        </div>

                    </div>

                </div>

                <section class="product-section">

                    <c:choose>

                        <c:when test="${not empty products}">
                            <div class="product-box">

                                <c:forEach var="product" items="${products}">
                                    <div class="product-container">

                                        <span class="product-badge">
                                            <c:out value="${product.category}" />
                                        </span>

                                        <div class="product-image">
                                            <a href="${contextPath}/viewProduct?productId=${product.productId}">
                                                <img
                                                    src="${contextPath}/resources/product/${product.productImage}"
                                                    alt="${product.productName}"
                                                    onerror="this.src='${contextPath}/resources/logo/onez.svg'">
                                            </a>
                                        </div>

                                        <div class="product-info">
                                            <p class="product-category">${product.category}</p>
                                            <h4>${product.productName}</h4>

                                            <div class="product-bottom">
                                                <h5>Rs. ${product.price}</h5>

                                                <a href="${contextPath}/viewProduct?productId=${product.productId}">
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
                                <div class="empty-icon">
                                    <i class="fa-solid fa-box-open"></i>
                                </div>

                                <h3>No products found</h3>
                                <p>No products are available in this category right now.</p>

                                <a href="${contextPath}/viewCategory?category=All">
                                    Browse All Products
                                </a>
                            </div>
                        </c:otherwise>

                    </c:choose>

                </section>

            </section>

        </div>

    </main>

    <jsp:include page="footer.jsp" />

</body>
</html>
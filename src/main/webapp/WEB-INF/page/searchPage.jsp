<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Search Results | Corexa</title>

    <link rel="shortcut icon" type="image/x-icon" href="${contextPath}/resources/logo/logo.png">

    <link rel="stylesheet" type="text/css" href="${contextPath}/css/search.css" />

    <script src="https://kit.fontawesome.com/91fb88d05c.js" crossorigin="anonymous"></script>
    <link href="https://cdn.lineicons.com/5.0/lineicons.css" rel="stylesheet" />
</head>

<body>

    <jsp:include page="header.jsp" />

    <c:if test="${not empty error}">
        <p class="error-message">${error}</p>
    </c:if>

    <c:if test="${not empty success}">
        <p class="success-message">${success}</p>
    </c:if>

    <main class="search-page">

        <section class="search-hero">
            <div class="search-hero-content">
                <span>Search Results</span>
                <h1>
                    Results for 
                    “<c:out value="${param.search}" default="your search" />”
                </h1>
                <p>Explore matching gaming products available in Corexa.</p>
            </div>
        </section>

        <section class="search-results">

            <div class="search-results-top">
                <div>
                    <span class="small-label">Products</span>
                    <h2>Matching Products</h2>
                </div>

                <a href="${contextPath}/home" class="back-link">
                    <i class="fa-solid fa-arrow-left"></i>
                    Back to Home
                </a>
            </div>

            <c:choose>

                <c:when test="${not empty products}">
                    <div class="product-box">

                        <c:forEach var="product" items="${products}">
                            <div class="product-container">

                                <span class="product-badge">Result</span>

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
                                    <p class="product-meta">
                                        <c:out value="${empty product.brand ? 'Corexa' : product.brand}" />
                                        <c:if test="${not empty product.sku}">
                                            | <c:out value="${product.sku}" />
                                        </c:if>
                                    </p>
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
                    <div class="no-results">
                        <div class="no-results-icon">
                            <i class="fa-solid fa-magnifying-glass"></i>
                        </div>

                        <h3>No products found</h3>

                        <p>
                            We could not find any products matching 
                            “<c:out value="${param.search}" default="your search" />”.
                        </p>

                        <div class="no-results-actions">
                            <a href="${contextPath}/home" class="primary-btn">Back to Home</a>
                            <a href="${contextPath}/viewCategory" class="secondary-btn">Browse Products</a>
                        </div>
                    </div>
                </c:otherwise>

            </c:choose>

        </section>

    </main>

    <jsp:include page="footer.jsp" />

</body>
</html>

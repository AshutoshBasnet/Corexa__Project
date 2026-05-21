<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="currentUser" value="${sessionScope.username}" />
<c:set var="user" value="${sessionScope.user}" />

<link rel="stylesheet" type="text/css" href="${contextPath}/css/header.css" />
<script src="https://kit.fontawesome.com/91fb88d05c.js" crossorigin="anonymous"></script>
<link href="https://cdn.lineicons.com/5.0/lineicons.css" rel="stylesheet" />

<header class="site-header">

    <div class="header-top">
        <div class="header-top-left">
            <span><i class="fa-solid fa-phone"></i> +977 986-0000000</span>
            <span><i class="fa-solid fa-envelope"></i> support@corexa.com</span>
        </div>

        <div class="header-top-right">
            <span>Gaming gear for every player</span>
        </div>
    </div>

    <div class="header-main">

        <div class="header-logo">
            <a href="${contextPath}/home">
                <img src="${contextPath}/resources/logo/corexa.png" alt="Corexa Logo">
            </a>
        </div>

        <nav class="header-nav">
            <a href="${contextPath}/home">Home</a>
            <a href="${contextPath}/viewCategory?category=Keyboard">Keyboard</a>
            <a href="${contextPath}/viewCategory?category=Mouse">Mouse</a>
            <a href="${contextPath}/viewCategory?category=Headset">Headset</a>
            <a href="${contextPath}/viewCategory?category=Monitor">Monitor</a>
            <a href="${contextPath}/viewCategory?category=Other">Others</a>
        </nav>

        <form class="header-search" action="${contextPath}/search" method="get">
            <input 
                type="text" 
                name="search" 
                value="${param.search}" 
                placeholder="Search products..."
                autocomplete="off"
                required>
            <button type="submit" aria-label="Search">
                <i class="fa-solid fa-magnifying-glass"></i>
            </button>
        </form>

        <div class="header-actions">

            <a href="${contextPath}/contact" class="header-icon" title="Contact">
                <i class="fa-solid fa-headset"></i>
            </a>

            <a href="${contextPath}/wishlist" class="header-icon" title="Wishlist">
                <i class="fa-regular fa-heart"></i>
            </a>

            <a href="${contextPath}/cart" class="header-icon" title="Cart">
                <i class="fa-solid fa-cart-shopping"></i>
            </a>

            <a href="${contextPath}/orderHistory" class="header-icon" title="Order History">
                <i class="fa-solid fa-clock-rotate-left"></i>
            </a>

            <c:choose>
                <c:when test="${not empty currentUser}">
                    <a href="${contextPath}/userDashboard" class="user-profile" title="My Account">
                        <img 
                            src="${contextPath}/resources/user/${user.imageUrl}" 
                            alt="User Profile"
                            onerror="this.src='${contextPath}/resources/logo/onez.svg'">
                    </a>
                </c:when>

                <c:otherwise>
                    <a href="${contextPath}/login" class="header-icon" title="Login">
                        <i class="fa-solid fa-user"></i>
                    </a>
                </c:otherwise>
            </c:choose>

        </div>

    </div>

</header>
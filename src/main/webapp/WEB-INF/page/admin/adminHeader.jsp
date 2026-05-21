<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="currentUser" value="${sessionScope.username}" />
<c:set var="user" value="${sessionScope.user}" />

<link rel="stylesheet" type="text/css" href="${contextPath}/css/adminHeader.css" />

<header class="admin-top-header">

    <div class="admin-header-left">
        <span>Admin Control Center</span>
        <h2>Corexa Management</h2>
    </div>

    <div class="admin-header-right">

        <a href="${contextPath}/home" class="visit-store-btn">
            <i class="fa-solid fa-store"></i>
            Visit Store
        </a>

        <div class="admin-user-box">

            <div class="admin-user-image">
                <c:choose>
                    <c:when test="${not empty user and not empty user.imageUrl}">
                        <img
                            src="${contextPath}/resources/user/${user.imageUrl}"
                            alt="Admin Profile"
                            onerror="this.src='${contextPath}/resources/user/ashutosh.jpeg'">
                    </c:when>

                    <c:otherwise>
                        <img
                            src="${contextPath}/resources/logo/corexa.png"
                            alt="Admin Profile">
                    </c:otherwise>
                </c:choose>
            </div>

            <div class="admin-user-info">
                <span>Signed in as</span>

                <p>
                    <c:choose>
                        <c:when test="${not empty currentUser}">
                            ${currentUser}
                        </c:when>
                        <c:otherwise>
                            Admin
                        </c:otherwise>
                    </c:choose>
                </p>
            </div>

        </div>

    </div>

</header>
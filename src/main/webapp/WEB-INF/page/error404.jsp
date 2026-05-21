<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Page Not Found | Corexa</title>
    <link rel="shortcut icon" type="image/x-icon" href="${contextPath}/resources/logo/logo.png">
    <link rel="stylesheet" href="${contextPath}/css/error.css">
</head>
<body>
    <main class="error-page">
        <section class="error-panel">
            <span>404</span>
            <h1>Page Not Found</h1>
            <p>The page you requested is unavailable or has been moved.</p>
            <a href="${contextPath}/home">Back to Home</a>
        </section>
    </main>
</body>
</html>

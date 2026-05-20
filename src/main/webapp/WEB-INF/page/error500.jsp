<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>System Error | Corexa</title>
    <link rel="shortcut icon" type="image/x-icon" href="${contextPath}/resources/logo/logo.png">
    <link rel="stylesheet" href="${contextPath}/css/error.css">
</head>
<body>
    <main class="error-page">
        <section class="error-panel">
            <span>500</span>
            <h1>Something Went Wrong</h1>
            <p>We could not complete your request right now. Please try again later.</p>
            <a href="${contextPath}/home">Back to Home</a>
        </section>
    </main>
</body>
</html>

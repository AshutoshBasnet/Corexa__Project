<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login | Corexa</title>

    <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/logo/logo.png">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">
</head>

<body class="login-page">

    <main class="login-wrapper">
        <section class="login-card">

            <div class="login-heading">
                <p class="login-subtitle">Please enter your details</p>
                <h1>Welcome back</h1>
            </div>

            <c:if test="${not empty error}">
                <div class="login-alert login-alert-error">
                    <c:out value="${error}" />
                </div>
            </c:if>

            <c:if test="${not empty success}">
                <div class="login-alert login-alert-success">
                    <c:out value="${success}" />
                </div>
            </c:if>

            <div class="login-brand">
                Corexa
            </div>

            <form action="${pageContext.request.contextPath}/login" method="post" class="login-form">

                <div class="form-group">
                    <label for="username" class="sr-only">Username</label>
                    <input 
                        type="text"
                        id="username"
                        name="username"
                        placeholder="Username"
                        autocomplete="username"
                        required>
                </div>

                <div class="form-group">
                    <label for="password" class="sr-only">Password</label>
                    <input 
                        type="password"
                        id="password"
                        name="password"
                        placeholder="Password"
                        autocomplete="current-password"
                        required>
                </div>

                <label class="remember-row">
                    <input type="checkbox" name="rememberMe" value="true">
                    <span>Remember for 30 days</span>
                </label>

                <button type="submit" class="login-button">
                    SIGN IN
                </button>

            </form>
 <p class="login-switch-text">
                New here?
              <a href="${pageContext.request.contextPath}/register">Create an account</a>
            </p>
        </section>
    </main>

</body>
</html>
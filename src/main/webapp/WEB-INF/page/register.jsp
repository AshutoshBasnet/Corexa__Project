<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Account | Corexa</title>

    <link rel="shortcut icon" type="image/x-icon" href="${contextPath}/resources/logo/logo.png">
    <link rel="stylesheet" href="${contextPath}/css/register.css">
</head>

<body class="register-page">

    <main class="register-container">

        <section class="register-left">
            <h1>Create your<br>account</h1>
            <div class="yellow-circle"></div>
        </section>

        <section class="register-right">

            <h2 class="brand-title">Corexa</h2>

            <c:if test="${not empty error}">
                <div class="form-alert form-alert-error">
                    <c:out value="${error}" />
                </div>
            </c:if>

            <c:if test="${not empty success}">
                <div class="form-alert form-alert-success">
                    <c:out value="${success}" />
                </div>
            </c:if>

            <form action="${contextPath}/register" method="post" enctype="multipart/form-data" class="register-form">

                <div class="form-group">
                    <label for="firstName">First name</label>
                    <input 
                        type="text"
                        id="firstName"
                        name="firstName"
                        placeholder="Enter your name"
                        value="${fn:escapeXml(firstName)}"
                        required>
                </div>

                <div class="form-group">
                    <label for="lastName">last name</label>
                    <input 
                        type="text"
                        id="lastName"
                        name="lastName"
                        placeholder="Enter your last name"
                        value="${fn:escapeXml(lastName)}"
                        required>
                </div>

                <div class="form-group">
                    <label for="email">Email address</label>
                    <input 
                        type="email"
                        id="email"
                        name="email"
                        placeholder="Enter your email address"
                        value="${fn:escapeXml(email)}"
                        autocomplete="email"
                        required>
                </div>

                <div class="form-group">
                    <label for="phoneNumber">Phone Number</label>
                    <input 
                        type="tel"
                        id="phoneNumber"
                        name="phoneNumber"
                        placeholder="Enter your phone number"
                        value="${fn:escapeXml(phoneNumber)}"
                        required>
                </div>

                <div class="form-group">
                    <label for="username">Username</label>
                    <input 
                        type="text"
                        id="username"
                        name="username"
                        placeholder="Enter your username"
                        value="${fn:escapeXml(username)}"
                        autocomplete="username"
                        required>
                </div>

                <div class="form-group">
                    <label for="dob">Date of Birth</label>
                    <input 
                        type="date"
                        id="dob"
                        name="dob"
                        value="${fn:escapeXml(dob)}"
                        required>
                </div>

                <div class="form-group">
                    <label for="password">Password</label>
                    <input 
                        type="password"
                        id="password"
                        name="password"
                        placeholder="Enter your password"
                        autocomplete="new-password"
                        required>
                </div>

                <div class="form-group">
                    <label for="retypePassword">Repeat Password</label>
                    <input 
                        type="password"
                        id="retypePassword"
                        name="retypePassword"
                        placeholder="Enter your password"
                        autocomplete="new-password"
                        required>
                </div>

                <div class="form-group">
                    <label for="gender">Gender</label>
                    <select id="gender" name="gender" required>
                        <option value="">Select gender</option>
                        <option value="male" ${gender == 'male' ? 'selected' : ''}>Male</option>
                        <option value="female" ${gender == 'female' ? 'selected' : ''}>Female</option>
                    </select>
                </div>

                <div class="form-group">
                    <label for="address">Address</label>
                    <input 
                        type="text"
                        id="address"
                        name="address"
                        placeholder="Enter your address"
                        value="${fn:escapeXml(address)}"
                        required>
                </div>

                <div class="form-group form-group-full">
                    <label for="image">Profile Picture</label>
                    <input 
                        type="file"
                        id="image"
                        name="image"
                        accept="image/png,image/jpeg,image/gif"
                        required>
                </div>

      <div class="button-row">
    <button type="submit" class="signup-button">SIGNUP</button>
</div>

<div class="signin-link-row">
    <span>Already have an account?</span>
    <a href="${contextPath}/login">SIGN IN</a>
</div>
            </form>

        </section>

    </main>

</body>
</html>
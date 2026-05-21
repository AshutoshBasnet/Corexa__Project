<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <title>Terms &amp; Conditions | Corexa</title>

    <link rel="shortcut icon" type="image/x-icon" href="${contextPath}/resources/logo/logo.png">
    <link rel="stylesheet" href="${contextPath}/css/terms.css" />

    <script src="https://kit.fontawesome.com/91fb88d05c.js" crossorigin="anonymous"></script>
    <link href="https://cdn.lineicons.com/5.0/lineicons.css" rel="stylesheet" />
</head>

<body>

    <jsp:include page="header.jsp" />

    <main class="terms-page">

        <!-- HERO -->
        <section class="terms-hero">
            <div class="terms-hero-content">
                <span>Corexa Legal Center</span>
                <h1>Terms &amp; Conditions</h1>
                <p>
                    These terms explain the rules for using Corexa, placing orders,
                    managing your account, and interacting with our gaming store services.
                    Please read them carefully before using the website.
                </p>
            </div>

            <div class="terms-hero-icon">
                <i class="fa-solid fa-file-contract"></i>
            </div>
        </section>

        <!-- TERMS CONTENT -->
        <section class="terms-wrapper">

            <!-- SIDE NAV -->
            <aside class="terms-sidebar">
                <div class="sidebar-card">
                    <span>Legal Guide</span>
                    <h3>Quick Sections</h3>

                    <nav class="terms-nav">
                        <a href="#acceptance">
                            <i class="fa-solid fa-check"></i>
                            Acceptance
                        </a>

                        <a href="#responsibilities">
                            <i class="fa-solid fa-user-check"></i>
                            Responsibilities
                        </a>

                        <a href="#account">
                            <i class="fa-solid fa-user-lock"></i>
                            Account Access
                        </a>

                        <a href="#ordering">
                            <i class="fa-solid fa-cart-shopping"></i>
                            Ordering
                        </a>

                        <a href="#payment">
                            <i class="fa-solid fa-credit-card"></i>
                            Payment
                        </a>

                        <a href="#contact">
                            <i class="fa-solid fa-headset"></i>
                            Contact
                        </a>
                    </nav>
                </div>
            </aside>

            <!-- MAIN TERMS -->
            <div class="terms-content">

                <section class="terms-card highlight-card" id="acceptance">
                    <div class="terms-icon">
                        <i class="fa-solid fa-circle-check"></i>
                    </div>

                    <div class="terms-text">
                        <span>01</span>
                        <h2>Acceptance of Terms</h2>

                        <p>
                            By accessing or using Corexa, you agree to follow these Terms
                            &amp; Conditions and all applicable laws and regulations. If you
                            do not agree with these terms, you should not use the website or
                            place orders through Corexa.
                        </p>
                    </div>
                </section>

                <section class="terms-card" id="responsibilities">
                    <div class="terms-icon">
                        <i class="fa-solid fa-user-check"></i>
                    </div>

                    <div class="terms-text">
                        <span>02</span>
                        <h2>User Responsibilities</h2>

                        <ul>
                            <li>Use Corexa only for lawful purposes.</li>
                            <li>Provide accurate, complete, and up-to-date information.</li>
                            <li>Do not misuse, spam, hack, disrupt, or abuse the platform.</li>
                            <li>Do not attempt to access another user’s account or private information.</li>
                            <li>Respect the security, content, and services provided by Corexa.</li>
                        </ul>
                    </div>
                </section>

                <section class="terms-card" id="account">
                    <div class="terms-icon">
                        <i class="fa-solid fa-user-lock"></i>
                    </div>

                    <div class="terms-text">
                        <span>03</span>
                        <h2>Account &amp; Access</h2>

                        <p>
                            You are responsible for maintaining the confidentiality of your
                            account login details and for all activities carried out through
                            your account. Please contact Corexa support immediately if you
                            believe your account has been accessed without permission.
                        </p>
                    </div>
                </section>

                <section class="terms-card" id="ordering">
                    <div class="terms-icon">
                        <i class="fa-solid fa-box-open"></i>
                    </div>

                    <div class="terms-text">
                        <span>04</span>
                        <h2>Product Information &amp; Ordering</h2>

                        <ul>
                            <li>All products are subject to availability.</li>
                            <li>Product images, descriptions, and specifications are provided for customer guidance.</li>
                            <li>We try to keep product information accurate, but minor errors may occur.</li>
                            <li>Corexa may refuse, cancel, or review any order when necessary.</li>
                            <li>Orders are confirmed only after proper validation and processing.</li>
                        </ul>
                    </div>
                </section>

                <section class="terms-card" id="payment">
                    <div class="terms-icon">
                        <i class="fa-solid fa-credit-card"></i>
                    </div>

                    <div class="terms-text">
                        <span>05</span>
                        <h2>Pricing &amp; Payment</h2>

                        <p>
                            Product prices are displayed in the currency shown on the website.
                            Payments must be made using the accepted payment methods available
                            on Corexa. Prices, discounts, and offers may change without prior
                            notice.
                        </p>

                        <p>
                            If a pricing mistake is found, Corexa may contact you for confirmation
                            or cancel the affected order.
                        </p>
                    </div>
                </section>

                <section class="terms-card">
                    <div class="terms-icon">
                        <i class="fa-solid fa-copyright"></i>
                    </div>

                    <div class="terms-text">
                        <span>06</span>
                        <h2>Intellectual Property</h2>

                        <p>
                            All content, designs, graphics, logos, text, product presentation,
                            software, and website materials on Corexa belong to Corexa or its
                            respective licensors. You may not copy, reproduce, modify, or misuse
                            these materials without permission.
                        </p>
                    </div>
                </section>

                <section class="terms-card">
                    <div class="terms-icon">
                        <i class="fa-solid fa-triangle-exclamation"></i>
                    </div>

                    <div class="terms-text">
                        <span>07</span>
                        <h2>Limitation of Liability</h2>

                        <p>
                            Corexa is not responsible for indirect, incidental, or consequential
                            damages caused by use of the website, product misuse, external service
                            issues, or circumstances outside our reasonable control.
                        </p>

                        <p>
                            Customers should use purchased products according to manufacturer
                            guidance and safety instructions.
                        </p>
                    </div>
                </section>

                <section class="terms-card">
                    <div class="terms-icon">
                        <i class="fa-solid fa-scale-balanced"></i>
                    </div>

                    <div class="terms-text">
                        <span>08</span>
                        <h2>Governing Law</h2>

                        <p>
                            These terms shall be governed by and understood according to the
                            applicable laws of Nepal. Any dispute related to Corexa services,
                            products, or website use should first be addressed through customer
                            support.
                        </p>
                    </div>
                </section>

                <section class="terms-card">
                    <div class="terms-icon">
                        <i class="fa-solid fa-rotate"></i>
                    </div>

                    <div class="terms-text">
                        <span>09</span>
                        <h2>Changes to Terms</h2>

                        <p>
                            Corexa may update these Terms &amp; Conditions from time to time.
                            Updated terms will be posted on this page. Continued use of Corexa
                            after updates means you accept the revised terms.
                        </p>
                    </div>
                </section>

                <section class="terms-card contact-card" id="contact">
                    <div class="terms-icon">
                        <i class="fa-solid fa-headset"></i>
                    </div>

                    <div class="terms-text">
                        <span>10</span>
                        <h2>Contact Us</h2>

                        <p>
                            If you have questions about these Terms &amp; Conditions, contact
                            Corexa support through our contact page.
                        </p>

                        <a href="${contextPath}/contact" class="terms-btn">
                            Contact Support
                            <i class="fa-solid fa-arrow-right"></i>
                        </a>
                    </div>
                </section>

            </div>

        </section>

    </main>

    <jsp:include page="footer.jsp" />

</body>
</html>
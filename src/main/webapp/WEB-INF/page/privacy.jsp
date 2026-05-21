<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <title>Privacy Policy | Corexa</title>

    <link rel="shortcut icon" type="image/x-icon" href="${contextPath}/resources/logo/logo.png">
    <link rel="stylesheet" href="${contextPath}/css/privacy.css" />

    <script src="https://kit.fontawesome.com/91fb88d05c.js" crossorigin="anonymous"></script>
    <link href="https://cdn.lineicons.com/5.0/lineicons.css" rel="stylesheet" />
</head>

<body>

    <jsp:include page="header.jsp" />

    <main class="privacy-page">

        <!-- HERO -->
        <section class="privacy-hero">
            <div class="privacy-hero-content">
                <span>Corexa Legal Center</span>
                <h1>Privacy Policy</h1>
                <p>
                    Your privacy matters to us. This page explains what information Corexa collects,
                    why we collect it, how we use it, and how we protect your data while you use our
                    gaming store.
                </p>
            </div>

            <div class="privacy-hero-icon">
                <i class="fa-solid fa-shield-halved"></i>
            </div>
        </section>

        <!-- PRIVACY CONTENT -->
        <section class="privacy-wrapper">

            <!-- SIDE NAV -->
            <aside class="privacy-sidebar">
                <div class="sidebar-card">
                    <span>Policy Sections</span>
                    <h3>Quick Navigation</h3>

                    <nav class="policy-nav">
                        <a href="#info-collect">
                            <i class="fa-solid fa-database"></i>
                            Information We Collect
                        </a>

                        <a href="#why-collect">
                            <i class="fa-solid fa-bullseye"></i>
                            Why We Collect
                        </a>

                        <a href="#use">
                            <i class="fa-solid fa-user-lock"></i>
                            Information Use
                        </a>

                        <a href="#log-data">
                            <i class="fa-solid fa-chart-line"></i>
                            Log Data
                        </a>

                        <a href="#cookies">
                            <i class="fa-solid fa-cookie-bite"></i>
                            Cookies
                        </a>

                        <a href="#security">
                            <i class="fa-solid fa-lock"></i>
                            Security
                        </a>

                        <a href="#contact">
                            <i class="fa-solid fa-headset"></i>
                            Contact Us
                        </a>
                    </nav>
                </div>
            </aside>

            <!-- MAIN POLICY -->
            <div class="privacy-content">

                <section class="policy-card highlight-card" id="info-collect">
                    <div class="policy-icon">
                        <i class="fa-solid fa-database"></i>
                    </div>

                    <div class="policy-text">
                        <span>01</span>
                        <h2>Information We Collect</h2>

                        <ul>
                            <li>Your contact information, including name and email address.</li>
                            <li>Phone number, delivery details, and address when needed for orders.</li>
                            <li>IP address and browser information when necessary for security or site improvement.</li>
                            <li>Product, cart, wishlist, order, and support-related information.</li>
                        </ul>
                    </div>
                </section>

                <section class="policy-card" id="why-collect">
                    <div class="policy-icon">
                        <i class="fa-solid fa-bullseye"></i>
                    </div>

                    <div class="policy-text">
                        <span>02</span>
                        <h2>Why We Collect Your Information</h2>

                        <ul>
                            <li>To understand your gaming product needs better.</li>
                            <li>To process orders, returns, warranty requests, and customer support.</li>
                            <li>To improve our products, website experience, and service quality.</li>
                            <li>To send relevant updates, offers, or promotional messages when applicable.</li>
                            <li>To customize our website according to customer interests and shopping behavior.</li>
                        </ul>
                    </div>
                </section>

                <section class="policy-card" id="use">
                    <div class="policy-icon">
                        <i class="fa-solid fa-user-lock"></i>
                    </div>

                    <div class="policy-text">
                        <span>03</span>
                        <h2>Information Collection and Use</h2>

                        <p>
                            Corexa may ask you to provide personal information such as your name,
                            phone number, email address, and delivery address. This information helps
                            us complete your orders, provide customer support, identify your account,
                            and improve your shopping experience.
                        </p>

                        <p>
                            We do not sell your personal information. Your data is used only for
                            purposes connected to Corexa services, order management, support, security,
                            and website improvement.
                        </p>
                    </div>
                </section>

                <section class="policy-card" id="log-data">
                    <div class="policy-icon">
                        <i class="fa-solid fa-chart-line"></i>
                    </div>

                    <div class="policy-text">
                        <span>04</span>
                        <h2>Log Data</h2>

                        <p>
                            When you visit our website, we may collect log data such as your IP address,
                            browser version, pages visited, time spent on pages, device information, and
                            technical statistics. This helps us improve performance, detect errors, and
                            protect the website from misuse.
                        </p>
                    </div>
                </section>

                <section class="policy-card" id="cookies">
                    <div class="policy-icon">
                        <i class="fa-solid fa-cookie-bite"></i>
                    </div>

                    <div class="policy-text">
                        <span>05</span>
                        <h2>Cookies</h2>

                        <p>
                            We may use cookies to improve your browsing experience, remember preferences,
                            maintain sessions, and understand how users interact with Corexa. You can
                            accept or decline cookies through your browser settings. Declining cookies
                            may limit some website features.
                        </p>
                    </div>
                </section>

                <section class="policy-card">
                    <div class="policy-icon">
                        <i class="fa-solid fa-handshake"></i>
                    </div>

                    <div class="policy-text">
                        <span>06</span>
                        <h2>Service Providers</h2>

                        <p>
                            We may use third-party services to support store operations such as payments,
                            delivery, analytics, hosting, or customer service. These providers may access
                            limited information only when needed to perform their assigned tasks and are
                            expected to protect that information responsibly.
                        </p>
                    </div>
                </section>

                <section class="policy-card" id="security">
                    <div class="policy-icon">
                        <i class="fa-solid fa-lock"></i>
                    </div>

                    <div class="policy-text">
                        <span>07</span>
                        <h2>Security</h2>

                        <p>
                            We use reasonable security practices to protect your personal information.
                            However, no online transmission or digital storage system can be guaranteed
                            to be completely secure. We work to reduce risks and protect customer data
                            as carefully as possible.
                        </p>
                    </div>
                </section>

                <section class="policy-card">
                    <div class="policy-icon">
                        <i class="fa-solid fa-link"></i>
                    </div>

                    <div class="policy-text">
                        <span>08</span>
                        <h2>Links to Other Sites</h2>

                        <p>
                            Corexa may include links to external websites. We are not responsible for the
                            content, privacy policies, or practices of websites that we do not operate.
                            Please review the privacy policies of external sites before sharing personal
                            information with them.
                        </p>
                    </div>
                </section>

                <section class="policy-card">
                    <div class="policy-icon">
                        <i class="fa-solid fa-child"></i>
                    </div>

                    <div class="policy-text">
                        <span>09</span>
                        <h2>Children’s Privacy</h2>

                        <p>
                            Our service is not intended for children under 13. We do not knowingly collect
                            personal data from children. If we discover that such data has been provided,
                            we will take steps to remove it. Parents or guardians may contact us for help.
                        </p>
                    </div>
                </section>

                <section class="policy-card">
                    <div class="policy-icon">
                        <i class="fa-solid fa-rotate"></i>
                    </div>

                    <div class="policy-text">
                        <span>10</span>
                        <h2>Changes to This Privacy Policy</h2>

                        <p>
                            Corexa may update this Privacy Policy from time to time. Any changes will be
                            posted on this page. You are encouraged to review this page periodically so
                            you understand how your information is protected.
                        </p>
                    </div>
                </section>

                <section class="policy-card contact-card" id="contact">
                    <div class="policy-icon">
                        <i class="fa-solid fa-headset"></i>
                    </div>

                    <div class="policy-text">
                        <span>11</span>
                        <h2>Contact Us</h2>

                        <p>
                            If you have questions about this Privacy Policy or how your information is
                            handled, contact Corexa support.
                        </p>

                        <a href="${contextPath}/contact" class="privacy-btn">
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <title>Return Policy | Corexa</title>

    <link rel="shortcut icon" type="image/x-icon" href="${contextPath}/resources/logo/logo.png">
    <link rel="stylesheet" href="${contextPath}/css/return.css" />

    <script src="https://kit.fontawesome.com/91fb88d05c.js" crossorigin="anonymous"></script>
    <link href="https://cdn.lineicons.com/5.0/lineicons.css" rel="stylesheet" />
</head>

<body>

    <jsp:include page="header.jsp" />

    <main class="return-page">

        <!-- HERO -->
        <section class="return-hero">
            <div class="return-hero-content">
                <span>Corexa Support Center</span>
                <h1>Return Policy</h1>
                <p>
                    We want every Corexa customer to feel confident when buying gaming gear.
                    This page explains when products can be returned, what items may not be
                    eligible, and how refunds are handled.
                </p>
            </div>

            <div class="return-hero-icon">
                <i class="fa-solid fa-rotate-left"></i>
            </div>
        </section>

        <!-- RETURN CONTENT -->
        <section class="return-wrapper">

            <!-- SIDE CARD -->
            <aside class="return-sidebar">
                <div class="sidebar-card">
                    <span>Return Guide</span>
                    <h3>Before You Return</h3>

                    <p>
                        Please keep your product packaging, receipt, and accessories safe.
                        These details help us process your return faster.
                    </p>

                    <a href="${contextPath}/contact" class="sidebar-btn">
                        Contact Support
                        <i class="fa-solid fa-arrow-right"></i>
                    </a>
                </div>
            </aside>

            <!-- POLICY CARDS -->
            <div class="return-content">

                <section class="return-card highlight-card" id="eligibility">
                    <div class="return-icon">
                        <i class="fa-solid fa-circle-check"></i>
                    </div>

                    <div class="return-text">
                        <span>01</span>
                        <h2>Eligibility for Returns</h2>

                        <ul>
                            <li>Items must be returned within 30 days of purchase.</li>
                            <li>Products must be unused, undamaged, and in original packaging.</li>
                            <li>All included accessories, manuals, cables, and product parts must be returned.</li>
                            <li>Proof of purchase or order confirmation is required for all returns.</li>
                        </ul>
                    </div>
                </section>

                <section class="return-card" id="non-returnable">
                    <div class="return-icon">
                        <i class="fa-solid fa-ban"></i>
                    </div>

                    <div class="return-text">
                        <span>02</span>
                        <h2>Non-returnable Items</h2>

                        <p>
                            Some items may not be eligible for return, including damaged products caused
                            by misuse, missing accessories, opened digital items, customized products,
                            and products without proof of purchase.
                        </p>

                        <p>
                            Items that show physical damage, liquid damage, heavy wear, or missing serial
                            labels may be rejected during inspection.
                        </p>
                    </div>
                </section>

                <section class="return-card" id="refunds">
                    <div class="return-icon">
                        <i class="fa-solid fa-wallet"></i>
                    </div>

                    <div class="return-text">
                        <span>03</span>
                        <h2>Refunds</h2>

                        <p>
                            After we receive your returned product, our team will inspect the item.
                            If the return is approved, your refund will be processed through the original
                            payment method where possible.
                        </p>

                        <p>
                            Refund processing time may depend on your bank, wallet provider, or payment
                            service. Corexa will notify you once the refund decision has been made.
                        </p>
                    </div>
                </section>

                <section class="return-card" id="exchange">
                    <div class="return-icon">
                        <i class="fa-solid fa-right-left"></i>
                    </div>

                    <div class="return-text">
                        <span>04</span>
                        <h2>Exchange Requests</h2>

                        <p>
                            If your product is defective, incorrect, or damaged on arrival, you may request
                            an exchange instead of a refund. Exchange approval depends on product condition,
                            stock availability, and verification by our support team.
                        </p>
                    </div>
                </section>

                <section class="return-card" id="process">
                    <div class="return-icon">
                        <i class="fa-solid fa-list-check"></i>
                    </div>

                    <div class="return-text">
                        <span>05</span>
                        <h2>Return Process</h2>

                        <ul>
                            <li>Contact Corexa support with your order details.</li>
                            <li>Explain the issue and provide product photos if requested.</li>
                            <li>Wait for return approval before sending the item back.</li>
                            <li>Pack the product securely with all original items.</li>
                            <li>Our team will inspect the item and update you about refund or exchange status.</li>
                        </ul>
                    </div>
                </section>

                <section class="return-card contact-card" id="contact">
                    <div class="return-icon">
                        <i class="fa-solid fa-headset"></i>
                    </div>

                    <div class="return-text">
                        <span>06</span>
                        <h2>Need Help?</h2>

                        <p>
                            If you are unsure whether your product is eligible for return, contact our support
                            team before sending the item. We will guide you through the correct process.
                        </p>

                        <a href="${contextPath}/contact" class="return-btn">
                            Start Return Request
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <title>Warranty Policy | Corexa</title>

    <link rel="shortcut icon" type="image/x-icon" href="${contextPath}/resources/logo/logo.png">
    <link rel="stylesheet" href="${contextPath}/css/warranty.css" />

    <script src="https://kit.fontawesome.com/91fb88d05c.js" crossorigin="anonymous"></script>
    <link href="https://cdn.lineicons.com/5.0/lineicons.css" rel="stylesheet" />
</head>

<body>

    <jsp:include page="header.jsp" />

    <main class="warranty-page">

        <!-- HERO -->
        <section class="warranty-hero">
            <div class="warranty-hero-content">
                <span>Corexa Support Center</span>
                <h1>Warranty Policy</h1>
                <p>
                    Corexa provides warranty support for eligible gaming products so customers
                    can shop with confidence. This page explains warranty coverage, exclusions,
                    and how to start a warranty claim.
                </p>
            </div>

            <div class="warranty-hero-icon">
                <i class="fa-solid fa-shield-halved"></i>
            </div>
        </section>

        <!-- WARRANTY CONTENT -->
        <section class="warranty-wrapper">

            <!-- SIDE CARD -->
            <aside class="warranty-sidebar">
                <div class="sidebar-card">
                    <span>Warranty Guide</span>
                    <h3>Before You Claim</h3>

                    <p>
                        Keep your bill, order confirmation, product box, serial number,
                        and accessories safe. These details help us verify your warranty claim faster.
                    </p>

                    <a href="${contextPath}/contact" class="sidebar-btn">
                        Contact Support
                        <i class="fa-solid fa-arrow-right"></i>
                    </a>
                </div>
            </aside>

            <!-- POLICY CARDS -->
            <div class="warranty-content">

                <section class="warranty-card highlight-card" id="coverage">
                    <div class="warranty-icon">
                        <i class="fa-solid fa-circle-check"></i>
                    </div>

                    <div class="warranty-text">
                        <span>01</span>
                        <h2>Coverage</h2>

                        <ul>
                            <li>All eligible products are covered by a 1-year limited warranty.</li>
                            <li>Warranty covers manufacturing defects only.</li>
                            <li>Warranty applies from the original purchase date.</li>
                            <li>Proof of purchase is required for every warranty request.</li>
                        </ul>
                    </div>
                </section>

                <section class="warranty-card" id="covered-issues">
                    <div class="warranty-icon">
                        <i class="fa-solid fa-screwdriver-wrench"></i>
                    </div>

                    <div class="warranty-text">
                        <span>02</span>
                        <h2>Covered Issues</h2>

                        <p>
                            Warranty may apply to defects such as faulty switches, manufacturing-related
                            connection issues, hardware failure under normal use, or product defects that
                            are not caused by misuse.
                        </p>

                        <p>
                            The final warranty decision depends on inspection by our support or technical team.
                        </p>
                    </div>
                </section>

                <section class="warranty-card" id="exclusions">
                    <div class="warranty-icon">
                        <i class="fa-solid fa-ban"></i>
                    </div>

                    <div class="warranty-text">
                        <span>03</span>
                        <h2>Exclusions</h2>

                        <p>
                            The warranty does not cover damage caused by misuse, accidents, liquid damage,
                            unauthorized repair, unauthorized modification, power surges, physical damage,
                            or normal wear and tear.
                        </p>

                        <p>
                            Missing serial numbers, removed warranty stickers, broken parts due to impact,
                            and damage from improper installation may also void the warranty.
                        </p>
                    </div>
                </section>

                <section class="warranty-card" id="claim-process">
                    <div class="warranty-icon">
                        <i class="fa-solid fa-list-check"></i>
                    </div>

                    <div class="warranty-text">
                        <span>04</span>
                        <h2>Claims Process</h2>

                        <ul>
                            <li>Contact Corexa support with your order ID or purchase proof.</li>
                            <li>Share a clear description of the product issue.</li>
                            <li>Provide photos or videos if our support team requests them.</li>
                            <li>Wait for verification before sending the product for inspection.</li>
                            <li>Our team will confirm repair, replacement, rejection, or next steps.</li>
                        </ul>
                    </div>
                </section>

                <section class="warranty-card" id="repair-replacement">
                    <div class="warranty-icon">
                        <i class="fa-solid fa-right-left"></i>
                    </div>

                    <div class="warranty-text">
                        <span>05</span>
                        <h2>Repair or Replacement</h2>

                        <p>
                            If your warranty claim is approved, Corexa may offer repair, replacement,
                            or another suitable solution depending on product condition, stock availability,
                            and the nature of the issue.
                        </p>

                        <p>
                            If the same product is unavailable, we may recommend an equivalent product
                            or alternative support option.
                        </p>
                    </div>
                </section>

                <section class="warranty-card" id="important-notes">
                    <div class="warranty-icon">
                        <i class="fa-solid fa-circle-info"></i>
                    </div>

                    <div class="warranty-text">
                        <span>06</span>
                        <h2>Important Notes</h2>

                        <ul>
                            <li>Warranty does not extend after replacement unless stated by support.</li>
                            <li>Accessories may have different warranty conditions depending on product type.</li>
                            <li>Shipping or handling charges may apply depending on the claim situation.</li>
                            <li>Warranty approval is subject to product inspection and verification.</li>
                        </ul>
                    </div>
                </section>

                <section class="warranty-card contact-card" id="contact">
                    <div class="warranty-icon">
                        <i class="fa-solid fa-headset"></i>
                    </div>

                    <div class="warranty-text">
                        <span>07</span>
                        <h2>Need Warranty Help?</h2>

                        <p>
                            If your gaming product has a defect or you are unsure whether your product
                            is covered, contact Corexa support. We will guide you through the correct
                            warranty process.
                        </p>

                        <a href="${contextPath}/contact" class="warranty-btn">
                            Start Warranty Claim
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
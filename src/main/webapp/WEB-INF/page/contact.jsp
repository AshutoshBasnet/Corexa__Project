<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <link rel="shortcut icon" type="image/x-icon" href="${contextPath}/resources/logo/logo.png">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Contact Us | Corexa</title>

    <link rel="stylesheet" href="${contextPath}/css/contact.css" />

    <script src="https://kit.fontawesome.com/91fb88d05c.js" crossorigin="anonymous"></script>
    <link href="https://cdn.lineicons.com/5.0/lineicons.css" rel="stylesheet" />
</head>

<body>

    <jsp:include page="header.jsp" />

    <main class="contact-page">

        <!-- HERO SECTION -->
        <section class="contact-hero">
            <div class="hero-bg-glow"></div>

            <div class="contact-hero-content">
                <span class="page-tag">Contact Corexa</span>

                <h1>
                    Let’s Start a
                    <em>Conversation.</em>
                </h1>

                <p>
                    Need help choosing gaming gear, tracking an order, asking about warranty,
                    or solving a product issue? Our Corexa support team is here to help.
                </p>
            </div>

            <div class="quick-contact-grid">

                <a href="#contactFormArea" class="quick-card">
                    <div class="quick-card-text">
                        <span>Message Form</span>
                        <h3>Start a Dialogue.</h3>
                    </div>

                    <div class="quick-arrow">
                        <i class="fa-solid fa-arrow-right"></i>
                    </div>
                </a>

                <a href="mailto:support@corexa.com" class="quick-card">
                    <div class="quick-card-text">
                        <span>support@corexa.com</span>
                        <h3>Email Us.</h3>
                    </div>

                    <div class="quick-arrow">
                        <i class="fa-solid fa-arrow-right"></i>
                    </div>
                </a>

                <a href="tel:+9779813747090" class="quick-card">
                    <div class="quick-card-text">
                        <span>+977 9813747090</span>
                        <h3>Call Support.</h3>
                    </div>

                    <div class="quick-arrow">
                        <i class="fa-solid fa-arrow-right"></i>
                    </div>
                </a>

            </div>
        </section>

        <!-- SUPPORT INFO -->
        <section class="support-info-section">

            <div class="support-info-card">
                <i class="fa-solid fa-headset"></i>
                <h3>Support Hours</h3>
                <p>Sunday to Friday</p>
                <strong>8:00 AM - 5:00 PM</strong>
            </div>

            <div class="support-info-card">
                <i class="fa-solid fa-truck-fast"></i>
                <h3>Order Help</h3>
                <p>Need delivery or order status support?</p>
                <strong>We can help you track it.</strong>
            </div>

            <div class="support-info-card">
                <i class="fa-solid fa-shield-halved"></i>
                <h3>Warranty</h3>
                <p>Questions about returns or warranty?</p>
                <strong>Send us your product details.</strong>
            </div>

        </section>

        <!-- CONTACT FORM AREA -->
        <section class="contact-form-section" id="contactFormArea">

            <div class="form-side-panel">
                <div class="side-step active">
                    <span>01</span>
                    <p>Profile</p>
                </div>

                <div class="side-step active">
                    <span>02</span>
                    <p>Support Topic</p>
                </div>

                <div class="side-step">
                    <span>03</span>
                    <p>Message</p>
                </div>
            </div>

            <div class="contact-form-card">

                <div class="form-heading">
                    <span>Message Form</span>
                    <h2>Tell us what you need.</h2>
                    <p>
                        Fill in your details and choose the support topic that best matches
                        your request.
                    </p>
                </div>

                <div id="notification" class="notification">
                    <span id="notification-message">
                        <i class="fa-solid fa-circle-check"></i>
                        Your message has been sent successfully!
                    </span>

                    <button type="button" class="close-btn" onclick="hideNotification()">
                        &times;
                    </button>
                </div>

                <form action="#" method="post" class="contact-form" id="contactForm">

                    <!-- STEP 01 -->
                    <div class="form-step">
                        <div class="step-label">
                            <span>01.</span>
                            <p>Add your contact information.</p>
                        </div>

                        <div class="form-row">
                            <div class="form-group">
                                <input type="text" id="firstName" name="firstName" placeholder="First Name" required>
                                <label for="firstName">First Name</label>
                            </div>

                            <div class="form-group">
                                <input type="text" id="lastName" name="lastName" placeholder="Last Name" required>
                                <label for="lastName">Last Name</label>
                            </div>
                        </div>

                        <div class="form-group">
                            <input type="email" id="email" name="email" placeholder="Email Address" required>
                            <label for="email">Email</label>
                        </div>

                        <div class="form-group">
                            <input type="tel" id="phone" name="phone" placeholder="+977 98XXXXXXXX">
                            <label for="phone">Phone</label>
                        </div>
                    </div>

                    <!-- STEP 02 -->
                    <div class="form-step">
                        <div class="step-label">
                            <span>02.</span>
                            <p>Select your support topic.</p>
                        </div>

                        <input type="hidden" id="supportTopic" name="supportTopic" value="Product Advice">

                        <div class="topic-grid">

                            <button type="button" class="topic-card selected" data-topic="Product Advice">
                                <span></span>
                                <strong>Product Advice</strong>
                                <p>Need help choosing keyboard, mouse, headset or monitor?</p>
                            </button>

                            <button type="button" class="topic-card" data-topic="Order Support">
                                <span></span>
                                <strong>Order Support</strong>
                                <p>Questions about delivery, payment, or order status.</p>
                            </button>

                            <button type="button" class="topic-card" data-topic="Warranty and Returns">
                                <span></span>
                                <strong>Warranty / Returns</strong>
                                <p>Need help with return, replacement, or warranty claim.</p>
                            </button>

                            <button type="button" class="topic-card" data-topic="Technical Issue">
                                <span></span>
                                <strong>Technical Issue</strong>
                                <p>Product not working or need setup support.</p>
                            </button>

                        </div>
                    </div>

                    <!-- STEP 03 -->
                    <div class="form-step">
                        <div class="step-label">
                            <span>03.</span>
                            <p>Anything else we should know?</p>
                        </div>

                        <div class="form-group message-group">
                            <textarea id="message" name="message" placeholder="Type your message here..." required></textarea>
                            <label for="message">Message</label>
                        </div>
                    </div>

                    <div class="form-bottom">
                        <p>
                            By submitting this form, you agree that Corexa may contact you
                            about your inquiry.
                        </p>

                        <button type="submit" class="submit-btn">
                            <span>Submit</span>
                            <i class="fa-solid fa-arrow-right"></i>
                        </button>
                    </div>

                </form>
            </div>

        </section>

        <!-- LOCATION / CONTACT DETAILS -->
        <section class="contact-location-section">

            <div class="section-heading">
                <span>Corexa Support</span>
                <h2>Visit or Reach Us</h2>
                <p>
                    We are based in Nepal and ready to help you with gaming products,
                    order support and product guidance.
                </p>
            </div>

            <div class="location-contact-grid">

                <div class="location-card">
                    <i class="fa-solid fa-location-dot"></i>
                    <h3>Kathmandu Store</h3>
                    <p>Putalisadak, Kathmandu 44600</p>
                    <p>Near Computer Market Area</p>
                </div>

                <div class="location-card">
                    <i class="fa-solid fa-envelope"></i>
                    <h3>Email</h3>
                    <p>support@corexa.com</p>
                    <p>Response within 24 hours</p>
                </div>

                <div class="location-card">
                    <i class="fa-solid fa-phone"></i>
                    <h3>Phone</h3>
                    <p>+977 9813747090</p>
                    <p>Sunday - Friday, 8 AM - 5 PM</p>
                </div>

            </div>

        </section>

    </main>

    <jsp:include page="footer.jsp" />

    <script>
        const topicCards = document.querySelectorAll(".topic-card");
        const supportTopicInput = document.getElementById("supportTopic");

        topicCards.forEach(function(card) {
            card.addEventListener("click", function() {
                topicCards.forEach(function(item) {
                    item.classList.remove("selected");
                });

                card.classList.add("selected");
                supportTopicInput.value = card.getAttribute("data-topic");
            });
        });

        document.getElementById("contactForm").addEventListener("submit", function(e) {
            e.preventDefault();

            showNotification();
            this.reset();

            topicCards.forEach(function(item) {
                item.classList.remove("selected");
            });

            topicCards[0].classList.add("selected");
            supportTopicInput.value = "Product Advice";
        });

        function showNotification() {
            const notification = document.getElementById("notification");
            notification.classList.add("show");

            setTimeout(hideNotification, 5000);
        }

        function hideNotification() {
            document.getElementById("notification").classList.remove("show");
        }
    </script>

</body>
</html>
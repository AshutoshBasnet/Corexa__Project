<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us | Corexa</title>

    <link rel="shortcut icon" type="image/x-icon" href="${contextPath}/resources/logo/logo.png">
    <link rel="stylesheet" type="text/css" href="${contextPath}/css/aboutus.css" />

    <script src="https://kit.fontawesome.com/91fb88d05c.js" crossorigin="anonymous"></script>
    <link href="https://cdn.lineicons.com/5.0/lineicons.css" rel="stylesheet" />
</head>

<body>

    <jsp:include page="header.jsp" />

    <main class="about-page">

        <!-- HERO SECTION -->
        <section class="about-hero">
            <div class="about-hero-overlay"></div>

            <div class="about-hero-content">
                <span>Corexa Gaming Store</span>
                <h1>We Build for Players</h1>
                <p>
                    Corexa is built for gamers who care about performance, style and reliability.
                    From everyday gaming setups to competitive battlestations, we bring premium
                    gaming gear closer to every player.
                </p>

                <a href="${contextPath}/viewCategory?category=All" class="about-btn">
                    Discover Products
                    <i class="fa-solid fa-arrow-right"></i>
                </a>
            </div>
        </section>

        <!-- INTRO SECTION -->
        <section class="about-intro">
            <div class="section-heading">
                <span>Who We Are</span>
                <h2>Designed for Gaming. Built for Experience.</h2>
                <p>
                    At Corexa, we live and breathe gaming. Whether you are a casual player,
                    a setup enthusiast, or a competitive gamer, our mission is simple:
                    to provide gaming peripherals and accessories that improve your comfort,
                    control and overall experience.
                </p>
            </div>

            <div class="about-stats">
                <div class="stat-card">
                    <h3>2025</h3>
                    <p>Founded</p>
                </div>

                <div class="stat-card">
                    <h3>100+</h3>
                    <p>Gaming Products</p>
                </div>

                <div class="stat-card">
                    <h3>24/7</h3>
                    <p>Customer Support</p>
                </div>

                <div class="stat-card">
                    <h3>Nepal</h3>
                    <p>Based Store</p>
                </div>
            </div>
        </section>

        <!-- INNOVATION SECTION -->
        <section class="innovation-section">
            <div class="innovation-text">
                <span>Innovation in Design and Technology</span>
                <h2>Performance Gear for Modern Players</h2>
                <p>
                    Corexa focuses on products that match the needs of today’s gamers:
                    responsive keyboards, precise mice, immersive headsets, high-refresh
                    monitors and reliable gaming accessories.
                </p>

                <p>
                    Our goal is not only to sell gaming products, but to help players build
                    setups that feel powerful, comfortable and personal.
                </p>
            </div>

            <div class="innovation-grid">
                <div class="innovation-card large">
                    <img src="${contextPath}/resources/aboutus/about-gamer-focus.png" alt="Focused gamer using Corexa gaming setup">
                </div>

                <div class="innovation-card">
                    <img src="${contextPath}/resources/aboutus/about-innovation-pc.png" alt="Gaming PC with RGB lighting">
                </div>

                <div class="innovation-card">
                    <img src="${contextPath}/resources/aboutus/about-creator-community.png" alt="Gaming creator setup">
                </div>
            </div>
        </section>

        <!-- PASSION BANNER -->
        <section class="passion-banner">
            <div class="passion-bg"></div>

            <div class="passion-content">
                <span>Our Passion</span>
                <h2>A Passion for Play</h2>
                <p>
                    Gaming is more than entertainment. It is focus, creativity, competition
                    and community. Corexa exists to support that passion with gear that looks
                    good, performs well and lasts.
                </p>

                <a href="${contextPath}/contact" class="about-btn blue-btn">
                    Contact Us
                    <i class="fa-solid fa-arrow-right"></i>
                </a>
            </div>
        </section>

       <!-- TEAM SECTION -->
<section class="team-section">
    <div class="section-heading">
        <span>Corexa Team</span>
        <h2>Meet the People Behind Corexa</h2>
        <p>
            Corexa is built by a small team focused on gaming products, customer experience,
            technical reliability, and smooth online shopping for players.
        </p>
    </div>

    <div class="team-grid">

        <div class="team-card">
            <div class="team-image">
                <img src="${contextPath}/resources/user/ashutosh.jpeg" alt="Corexa team member">
            </div>

            <div class="team-info">
                <span>Project Lead</span>
                <h3>Ashutosh Basnet</h3>
                <p>
                    Leads the Corexa project vision, coordinates the team, and keeps the platform
                    focused on gaming users and business goals.
                </p>
            </div>
        </div>

        <div class="team-card">
            <div class="team-image">
                <img src="${contextPath}/resources/user/parjun.jpeg" alt="Corexa team member">
            </div>

            <div class="team-info">
                <span>Frontend UI Designer</span>
                <h3>Parjun Rai</h3>
                <p>
                    Designs the visual experience of Corexa, including page layouts, product cards,
                    animations, and responsive user interfaces.
                </p>
            </div>
        </div>

        <div class="team-card">
            <div class="team-image">
                <img src="${contextPath}/resources/user/anmol.png" alt="Corexa team member">
            </div>

            <div class="team-info">
                <span>Backend Developer</span>
                <h3>Anmol Poudel</h3>
                <p>
                    Handles servlet logic, product management, user sessions, cart flow, order
                    processing, and database integration.
                </p>
            </div>
        </div>

        <div class="team-card">
            <div class="team-image">
                <img src="${contextPath}/resources/user/sashank.jpeg" alt="Corexa team member">
            </div>

            <div class="team-info">
                <span>Product & Inventory Manager</span>
                <h3>Sashank Marasini</h3>
                <p>
                    Manages gaming product details, categories, stock quantity, pricing, product
                    images, and store content accuracy.
                </p>
            </div>
        </div>

        <div class="team-card">
            <div class="team-image">
                <img src="${contextPath}/resources/user/bishesta.jpeg" alt="Corexa team member">
            </div>

            <div class="team-info">
                <span>QA & Customer Support</span>
                <h3>Bishesta Siwakoti</h3>
                <p>
                    Tests the shopping experience, checks bugs, reviews order flow, and supports
                    customers with product and service issues.
                </p>
            </div>
        </div>

    </div>
</section>

        <!-- COMMUNITY SECTION -->
        <section class="community-section">
            <div class="community-text">
                <span>Community</span>
                <h2>Turn Your Passion into Performance</h2>
                <p>
                    Corexa wants to build a strong gaming community in Nepal by making
                    high-quality gaming equipment easier to access. We believe every gamer
                    deserves gear that matches their ambition.
                </p>

                <a href="${contextPath}/viewCategory?category=All" class="about-btn">
                    Shop Gaming Gear
                    <i class="fa-solid fa-arrow-right"></i>
                </a>
            </div>

            <div class="community-image">
                <img src="${contextPath}/resources/aboutus/about-esports-banner.png" alt="Corexa gaming community">
            </div>
        </section>

    </main>

    <jsp:include page="footer.jsp" />

</body>
</html>
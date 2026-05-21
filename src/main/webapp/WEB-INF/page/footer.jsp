<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<link rel="stylesheet" type="text/css" href="${contextPath}/css/footer.css" />
<link href="https://cdn.lineicons.com/5.0/lineicons.css" rel="stylesheet" />

<!-- WHY BUY FROM COREXA SECTION -->
<section class="corexa-benefits">
    <div class="benefits-container">

        <div class="benefits-left">
            <span class="section-tag">WHY COREXA?</span>
            <h2>Reasons to buy from Corexa.com</h2>
            <p>
                We believe in a direct connection between the maker and the player.
                By shopping with us, you're choosing transparent supply chain,
                global carbon-neutral shipping, and dedicated support for every
                component we build.
            </p>

         <a href="${contextPath}/viewCategory?category=All" class="benefits-btn">
                Shop Products
                <i class="lni lni-arrow-right"></i>
            </a>
        </div>

  <div class="benefits-grid">

    <div class="benefit-card">
        <div class="benefit-icon">
            <svg viewBox="0 0 24 24">
                <path d="M2 12s3.5-6 10-6 10 6 10 6-3.5 6-10 6S2 12 2 12Z"/>
                <circle cx="12" cy="12" r="3"/>
            </svg>
        </div>
        <h3>Full Transparency</h3>
        <p>Clear product details, honest pricing, and reliable product information before you buy.</p>
    </div>

    <div class="benefit-card">
        <div class="benefit-icon">
            <svg viewBox="0 0 24 24">
                <path d="M3 7h11v10H3V7Z"/>
                <path d="M14 10h4l3 3v4h-7v-7Z"/>
                <circle cx="7" cy="18" r="2"/>
                <circle cx="18" cy="18" r="2"/>
            </svg>
        </div>
        <h3>Free Shipping</h3>
        <p>Enjoy smooth delivery service on selected gaming products and eligible orders.</p>
    </div>

    <div class="benefit-card">
        <div class="benefit-icon">
            <svg viewBox="0 0 24 24">
                <path d="M12 2 20 5v6c0 5-3.4 9.4-8 11-4.6-1.6-8-6-8-11V5l8-3Z"/>
                <path d="m9 12 2 2 4-5"/>
            </svg>
        </div>
        <h3>Warranty</h3>
        <p>
            Shop confidently with warranty-backed products and support for eligible issues.
        </p>
    </div>

    <div class="benefit-card">
        <div class="benefit-icon">
            <svg viewBox="0 0 24 24">
                <path d="M20 12a8 8 0 1 1-2.3-5.7"/>
                <path d="M20 4v6h-6"/>
                <path d="M12 8v5l3 2"/>
            </svg>
        </div>
        <h3>Money-back Guarantee</h3>
        <p>
            Shop risk-free with easy return support and customer-friendly replacement guidance.
        </p>
    </div>

    <div class="benefit-card">
        <div class="benefit-icon">
            <svg viewBox="0 0 24 24">
                <path d="M4 13v-1a8 8 0 0 1 16 0v1"/>
                <path d="M4 13h3v6H4v-6Z"/>
                <path d="M17 13h3v6h-3v-6Z"/>
                <path d="M20 18c0 2-2 3-5 3h-2"/>
            </svg>
        </div>
        <h3>24/7 Customer Service</h3>
        <p>
            Get help with product selection, orders, warranty, returns, and technical issues.
        </p>
    </div>

    <div class="benefit-card">
        <div class="benefit-icon">
            <svg viewBox="0 0 24 24">
                <path d="M20 12v8H4v-8"/>
                <path d="M2 7h20v5H2V7Z"/>
                <path d="M12 7v13"/>
                <path d="M12 7H8.5A2.5 2.5 0 1 1 11 4.5L12 7Z"/>
                <path d="M12 7h3.5A2.5 2.5 0 1 0 13 4.5L12 7Z"/>
            </svg>
        </div>
        <h3>Exclusive Offers</h3>
        <p>
            Unlock special deals, gaming gear offers, and product bundles from Corexa.
        </p>
    </div>

</div>
    </div>
</section>


<!-- NEW FOOTER -->
<footer class="footer">
    <div class="footer-main">

        <div class="footer-brand">
            <h2>Corexa</h2>
            <p>
                Premium gaming products, trusted support, and reliable service
                for every player.
            </p>

            <div class="footer-socials">
                <a href="#" aria-label="Facebook">
                    <i class="lni lni-facebook"></i>
                </a>
                <a href="#" aria-label="Instagram">
                    <i class="lni lni-instagram"></i>
                </a>
                <a href="#" aria-label="Discord">
                    <i class="lni lni-discord"></i>
                </a>
                <a href="#" aria-label="X">
                    <i class="lni lni-x"></i>
                </a>
                <a href="#" aria-label="TikTok">
                    <i class="lni lni-tiktok-alt"></i>
                </a>
            </div>
        </div>

        <div class="footer-column">
            <h3>Company</h3>
            <ul>
                <li><a href="${contextPath}/aboutUs">About Us</a></li>
                <li><a href="${contextPath}/terms">Terms and Conditions</a></li>
                <li><a href="${contextPath}/privacy">Privacy Policy</a></li>
            </ul>
        </div>

        <div class="footer-column">
            <h3>Customer Service</h3>
            <ul>
                <li><a href="${contextPath}/return">Return Policy</a></li>
                <li><a href="${contextPath}/warranty">Warranty Policy</a></li>
                <li><a href="${contextPath}/contact">Contact Us</a></li>
            </ul>
        </div>

        <div class="footer-column">
            <h3>Quick Links</h3>
            <ul>
                <li><a href="${contextPath}/home">Home</a></li>
                <li><a href="${contextPath}/products">Products</a></li>
                <li><a href="${contextPath}/cart">Cart</a></li>
                <li><a href="${contextPath}/login">Login</a></li>
            </ul>
        </div>

        <div class="footer-column">
            <h3>Payment Options</h3>

            <ul class="payment-list">
                <li>
                    <img src="${contextPath}/resources/payments/esewa.png" alt="Esewa" />
                    <span>Esewa</span>
                </li>
                <li>
                    <img src="${contextPath}/resources/payments/imepay.png" alt="ImePay" />
                    <span>ImePay</span>
                </li>
                <li>
                    <img src="${contextPath}/resources/payments/khalti.png" alt="Khalti" />
                    <span>Khalti</span>
                </li>
            </ul>
        </div>

    </div>

    <div class="footer-bottom">
        <p>Copyright © 2025 Corexa Pvt. Ltd. All rights reserved.</p>

        <div class="footer-bottom-links">
            <a href="${contextPath}/terms">Terms</a>
            <a href="${contextPath}/privacy">Privacy</a>
            <a href="${contextPath}/contact">Support</a>
        </div>
    </div>
</footer>
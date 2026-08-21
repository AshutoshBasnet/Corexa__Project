# Corexa - Gaming E-Commerce Web Application

Corexa is a full-featured e-commerce web application specializing in gaming peripherals, hardware, and accessories. Built with Java EE / Jakarta EE, Servlets, JSP, JSTL, and MySQL.

---

## 🚀 Tech Stack

- **Backend:** Java 17+, Jakarta Servlet 6.0, Jakarta JSP 3.1, JSTL
- **Build Tool:** Apache Maven 3.9+
- **Database:** MySQL / MariaDB (JDBC)
- **Application Server:** Apache Tomcat 10.1+
- **Frontend:** HTML5, CSS3, JavaScript, FontAwesome 6, LineIcons

---

## 📁 Project Structure

```
Corexa/
├── src/
│   ├── main/
│   │   ├── java/com/corexa/
│   │   │   ├── config/          # Database configuration (DbConfig)
│   │   │   ├── controller/      # Customer & Admin Servlet Controllers
│   │   │   ├── filter/          # Authentication & Security Filter
│   │   │   ├── model/           # Data Models & POJOs
│   │   │   ├── service/         # Business Logic & DAO Layer
│   │   │   └── util/            # Security, Password Encryption, Redirection
│   │   └── webapp/
│   │       ├── css/             # Stylesheets
│   │       ├── js/              # Client-side scripts
│   │       ├── resources/       # Static assets, product images, banners
│   │       └── WEB-INF/
│   │           ├── page/        # JSP Views (Customer & Admin)
│   │           └── web.xml      # Web deployment descriptor
│   └── test/                    # Unit tests
├── scripts/                     # Database backup and utility scripts
├── corexa.sql                   # MySQL database schema & sample seed data
├── pom.xml                      # Maven project configuration
├── start-app.ps1                # One-command build & start script (Windows)
└── README.md                    # Project documentation
```

---

## ⚡ Quick Start

### Prerequisites
- **JDK 17** (or higher)
- **Apache Maven 3.8+**
- **MySQL / MariaDB** (running on `localhost:3306`)
- **Apache Tomcat 10.1+**

### 1. Database Setup
Create database `corexa` and import `corexa.sql`:
```bash
mysql -u root -e "CREATE DATABASE corexa;"
mysql -u root corexa < corexa.sql
```

### 2. Build & Run
Using the automated start script (Windows PowerShell):
```powershell
.\start-app.ps1
```

Or manually using Maven & Tomcat:
```bash
mvn clean package
# Copy target/Corexa_Project-0.0.1-SNAPSHOT.war to Tomcat's webapps folder as ROOT.war
```

Access the application in your browser:
```
http://localhost:8080
```

---

## 🔑 Default Accounts (Seed Data)

| Role | Username | Notes |
| :--- | :--- | :--- |
| **Admin** | `AshutoshBasnet` | Full admin dashboard access |
| **Customer** | `AnmolPoudel` | Pre-approved customer account |
| **Customer** | `ParjunRai` | Pre-approved customer account |
| **Customer** | `BishestaSiwakoti` | Pre-approved customer account |

---

## 🛡️ Key Features
- **Product Catalog & Categorization:** Keyboards, mice, headsets, monitors, components, and search functionality.
- **Shopping Cart & Checkout:** Add to cart, quantity management, order creation.
- **Wishlist & Order History:** User dashboard with previous orders and saved items.
- **Admin Dashboard:** Product inventory management (add/edit/delete), order status tracking, user management, and monthly sales analytics.
- **Security:** AES-GCM password encryption and session-based authentication filtering.

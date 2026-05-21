CREATE DATABASE IF NOT EXISTS corexa;
USE corexa;

CREATE TABLE IF NOT EXISTS address (
    address_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS user (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(60) NOT NULL,
    last_name VARCHAR(60) NOT NULL,
    username VARCHAR(60) NOT NULL UNIQUE,
    dob DATE NOT NULL,
    gender VARCHAR(10) NOT NULL,
    email VARCHAR(120) NOT NULL UNIQUE,
    number VARCHAR(20) NOT NULL UNIQUE,
    password VARCHAR(512) NOT NULL,
    address_id INT NOT NULL,
    profilePic VARCHAR(255),
    userRole VARCHAR(20) NOT NULL DEFAULT 'customer',
    account_status VARCHAR(20) NOT NULL DEFAULT 'PENDING',
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_user_address FOREIGN KEY (address_id) REFERENCES address(address_id),
    CONSTRAINT chk_user_role CHECK (userRole IN ('admin', 'customer')),
    CONSTRAINT chk_account_status CHECK (account_status IN ('PENDING', 'APPROVED', 'SUSPENDED')),
    INDEX idx_user_role_status (userRole, account_status),
    INDEX idx_user_address (address_id)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS product (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    productName VARCHAR(160) NOT NULL,
    description TEXT NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    quantity INT NOT NULL DEFAULT 0,
    category VARCHAR(80) NOT NULL,
    productImage VARCHAR(255),
    sku VARCHAR(60) NOT NULL UNIQUE,
    brand VARCHAR(100) NOT NULL,
    rackNumber VARCHAR(40) NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT chk_product_price CHECK (price > 0),
    CONSTRAINT chk_product_quantity CHECK (quantity >= 0),
    INDEX idx_product_category (category),
    INDEX idx_product_brand (brand),
    INDEX idx_product_sku (sku),
    INDEX idx_product_stock (quantity)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS cart (
    cart_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    total_items INT NOT NULL DEFAULT 0,
    total_price DECIMAL(10, 2) NOT NULL DEFAULT 0,
    createdAt DATE NOT NULL,
    CONSTRAINT fk_cart_user FOREIGN KEY (user_id) REFERENCES user(user_id) ON DELETE CASCADE,
    UNIQUE KEY uq_cart_user (user_id)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS cartitem (
    cartitem_id INT AUTO_INCREMENT PRIMARY KEY,
    cart_id INT NOT NULL,
    product_id INT NOT NULL,
    productQuantity INT NOT NULL,
    CONSTRAINT fk_cartitem_cart FOREIGN KEY (cart_id) REFERENCES cart(cart_id) ON DELETE CASCADE,
    CONSTRAINT fk_cartitem_product FOREIGN KEY (product_id) REFERENCES product(product_id),
    CONSTRAINT chk_cartitem_quantity CHECK (productQuantity > 0),
    UNIQUE KEY uq_cart_product (cart_id, product_id),
    INDEX idx_cartitem_product (product_id)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS wishlist (
    wishlist_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    wishlist_name VARCHAR(100) NOT NULL DEFAULT 'My Wishlist',
    addedAt DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_wishlist_user FOREIGN KEY (user_id) REFERENCES user(user_id) ON DELETE CASCADE,
    UNIQUE KEY uq_wishlist_user (user_id)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS wishlist_product (
    wishlist_id INT NOT NULL,
    product_id INT NOT NULL,
    PRIMARY KEY (wishlist_id, product_id),
    CONSTRAINT fk_wishlist_product_wishlist FOREIGN KEY (wishlist_id) REFERENCES wishlist(wishlist_id) ON DELETE CASCADE,
    CONSTRAINT fk_wishlist_product_product FOREIGN KEY (product_id) REFERENCES product(product_id) ON DELETE CASCADE,
    INDEX idx_wishlist_product_product (product_id)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS order_table (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    cart_id INT,
    order_date DATE NOT NULL,
    order_status VARCHAR(20) NOT NULL DEFAULT 'Processing',
    paymentMethod VARCHAR(40) NOT NULL,
    CONSTRAINT fk_order_user FOREIGN KEY (user_id) REFERENCES user(user_id),
    CONSTRAINT fk_order_cart FOREIGN KEY (cart_id) REFERENCES cart(cart_id) ON DELETE SET NULL,
    CONSTRAINT chk_order_status CHECK (order_status IN ('Pending', 'Processing', 'Completed', 'Cancelled')),
    INDEX idx_order_user_date (user_id, order_date),
    INDEX idx_order_status (order_status)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS order_items (
    order_item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    price_at_order DECIMAL(10, 2) NOT NULL,
    CONSTRAINT fk_order_items_order FOREIGN KEY (order_id) REFERENCES order_table(order_id) ON DELETE CASCADE,
    CONSTRAINT fk_order_items_product FOREIGN KEY (product_id) REFERENCES product(product_id),
    CONSTRAINT chk_order_item_quantity CHECK (quantity > 0),
    CONSTRAINT chk_order_item_price CHECK (price_at_order > 0),
    INDEX idx_order_items_product (product_id),
    INDEX idx_order_items_order (order_id)
) ENGINE=InnoDB;

INSERT IGNORE INTO address (address_id, name) VALUES
    (1, 'Kathmandu'),
    (2, 'Lalitpur'),
    (3, 'Bhaktapur');

-- Backup and recovery are implemented through scripts/backup-corexa.ps1 and scripts/restore-corexa.ps1.

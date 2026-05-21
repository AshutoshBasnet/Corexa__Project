USE corexa;

ALTER TABLE product
    ADD COLUMN IF NOT EXISTS sku VARCHAR(60) NULL AFTER productImage,
    ADD COLUMN IF NOT EXISTS brand VARCHAR(100) NULL AFTER sku,
    ADD COLUMN IF NOT EXISTS rackNumber VARCHAR(40) NULL AFTER brand,
    ADD COLUMN IF NOT EXISTS created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    ADD COLUMN IF NOT EXISTS updated_at TIMESTAMP NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP;

UPDATE product
SET sku = CONCAT('COREXA-', product_id)
WHERE sku IS NULL OR sku = '';

UPDATE product
SET brand = 'Corexa'
WHERE brand IS NULL OR brand = '';

UPDATE product
SET rackNumber = 'UNASSIGNED'
WHERE rackNumber IS NULL OR rackNumber = '';

ALTER TABLE product
    MODIFY sku VARCHAR(60) NOT NULL,
    MODIFY brand VARCHAR(100) NOT NULL,
    MODIFY rackNumber VARCHAR(40) NOT NULL;

CREATE UNIQUE INDEX idx_product_sku_unique ON product (sku);
CREATE INDEX idx_product_brand ON product (brand);
CREATE INDEX idx_product_category ON product (category);
CREATE INDEX idx_product_stock ON product (quantity);

ALTER TABLE user
    ADD COLUMN IF NOT EXISTS account_status VARCHAR(20) NOT NULL DEFAULT 'PENDING',
    ADD COLUMN IF NOT EXISTS created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP;

UPDATE user
SET account_status = 'APPROVED'
WHERE userRole = 'admin' OR account_status IS NULL OR account_status = '';

CREATE INDEX idx_user_role_status ON user (userRole, account_status);
CREATE INDEX idx_user_address ON user (address_id);

CREATE INDEX idx_order_user_date ON order_table (user_id, order_date);
CREATE INDEX idx_order_status ON order_table (order_status);
CREATE INDEX idx_order_items_product ON order_items (product_id);

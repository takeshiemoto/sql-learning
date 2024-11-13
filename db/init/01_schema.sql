-- テーブル: users
CREATE TABLE users
(
    user_id       SERIAL PRIMARY KEY,
    username      VARCHAR(50) UNIQUE  NOT NULL,
    email         VARCHAR(100) UNIQUE NOT NULL,
    password_hash VARCHAR(255)        NOT NULL,
    created_at    TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- テーブル: categories
CREATE TABLE categories
(
    category_id SERIAL PRIMARY KEY,
    name        VARCHAR(100) UNIQUE NOT NULL,
    description TEXT
);

-- テーブル: products
CREATE TABLE products
(
    product_id  SERIAL PRIMARY KEY,
    name        VARCHAR(150)   NOT NULL,
    description TEXT,
    price       DECIMAL(10, 2) NOT NULL,
    stock       INT            NOT NULL DEFAULT 0,
    category_id INT REFERENCES categories (category_id),
    created_at  TIMESTAMP               DEFAULT CURRENT_TIMESTAMP
);

-- テーブル: orders
CREATE TABLE orders
(
    order_id     SERIAL PRIMARY KEY,
    user_id      INT REFERENCES users (user_id),
    order_date   TIMESTAMP   DEFAULT CURRENT_TIMESTAMP,
    status       VARCHAR(50) DEFAULT 'Pending',
    total_amount DECIMAL(10, 2) NOT NULL
);

-- テーブル: order_items
CREATE TABLE order_items
(
    order_item_id SERIAL PRIMARY KEY,
    order_id      INT REFERENCES orders (order_id) ON DELETE CASCADE,
    product_id    INT REFERENCES products (product_id),
    quantity      INT            NOT NULL DEFAULT 1,
    unit_price    DECIMAL(10, 2) NOT NULL
);

-- テーブル: addresses
CREATE TABLE addresses
(
    address_id    SERIAL PRIMARY KEY,
    user_id       INT REFERENCES users (user_id),
    address_line1 VARCHAR(255) NOT NULL,
    address_line2 VARCHAR(255),
    city          VARCHAR(100) NOT NULL,
    state         VARCHAR(100) NOT NULL,
    postal_code   VARCHAR(20)  NOT NULL,
    country       VARCHAR(100) NOT NULL,
    created_at    TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- テーブル: payments
CREATE TABLE payments
(
    payment_id     SERIAL PRIMARY KEY,
    order_id       INT REFERENCES orders (order_id),
    payment_method VARCHAR(50),
    payment_date   TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    amount         DECIMAL(10, 2) NOT NULL
);

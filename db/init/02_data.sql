-- 初期ユーザー
INSERT INTO users (username, email, password_hash)
VALUES ('alice', 'alice@example.com', 'hashed_password_1'),
       ('bob', 'bob@example.com', 'hashed_password_2'),
       ('charlie', 'charlie@example.com', 'hashed_password_3');

-- 初期カテゴリー
INSERT INTO categories (name, description)
VALUES ('T-Shirts', 'Various styles of T-Shirts'),
       ('Jeans', 'Different cuts and washes of jeans'),
       ('Accessories', 'Belts, hats, and other accessories');

-- 初期商品
INSERT INTO products (name, description, price, stock, category_id)
VALUES ('Classic White T-Shirt', 'A plain white T-Shirt made from 100% cotton.', 19.99, 100, 1),
       ('Slim Fit Jeans', 'Blue slim fit jeans with a modern look.', 49.99, 50, 2),
       ('Leather Belt', 'Genuine leather belt in black.', 29.99, 75, 3),
       ('Graphic T-Shirt', 'T-Shirt with a cool graphic print.', 24.99, 80, 1),
       ('Skinny Jeans', 'Dark wash skinny jeans.', 54.99, 40, 2);

-- 初期住所
INSERT INTO addresses (user_id, address_line1, address_line2, city, state, postal_code, country)
VALUES (1, '123 Maple Street', 'Apt 4', 'Tokyo', 'Tokyo Prefecture', '100-0001', 'Japan'),
       (2, '456 Oak Avenue', NULL, 'Osaka', 'Osaka Prefecture', '530-0001', 'Japan'),
       (3, '789 Pine Road', 'Suite 12', 'Nagoya', 'Aichi Prefecture', '450-0001', 'Japan');

-- 初期注文
INSERT INTO orders (user_id, status, total_amount)
VALUES (1, 'Completed', 69.98),
       (2, 'Pending', 24.99),
       (3, 'Shipped', 54.99);

-- 初期注文アイテム
INSERT INTO order_items (order_id, product_id, quantity, unit_price)
VALUES (1, 1, 2, 19.99),
       (1, 3, 1, 29.99),
       (2, 4, 1, 24.99),
       (3, 5, 1, 54.99);

-- 初期支払い
INSERT INTO payments (order_id, payment_method, amount)
VALUES (1, 'Credit Card', 69.98),
       (2, 'PayPal', 24.99),
       (3, 'Credit Card', 54.99);

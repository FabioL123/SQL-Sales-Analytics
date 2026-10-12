Original path: sql-sales-analytics/schema.sql
Note: this PDF displays the file's text. It is not a runnable replacement for the original .py, .sql, .yml, or configuration file.
PRAGMA foreign_keys = ON;
DROP TABLE IF EXISTS order_items;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS customers;
CREATE TABLE customers (
 customer_id INTEGER PRIMARY KEY,
 customer_name TEXT NOT NULL,
 city TEXT NOT NULL,
 signup_date TEXT NOT NULL
);
CREATE TABLE products (
 product_id INTEGER PRIMARY KEY,
 product_name TEXT NOT NULL,
 category TEXT NOT NULL,
 unit_price NUMERIC NOT NULL CHECK (unit_price >= 0)
);
CREATE TABLE orders (
 order_id INTEGER PRIMARY KEY,
 customer_id INTEGER NOT NULL REFERENCES customers(customer_id),
 order_date TEXT NOT NULL,
 status TEXT NOT NULL CHECK (status IN ('completed', 'cancelled', 'pending'))
);
CREATE TABLE order_items (
 order_item_id INTEGER PRIMARY KEY,
 order_id INTEGER NOT NULL REFERENCES orders(order_id),
 product_id INTEGER NOT NULL REFERENCES products(product_id),
 quantity INTEGER NOT NULL CHECK (quantity > 0),
 unit_price_at_sale NUMERIC NOT NULL CHECK (unit_price_at_sale >= 0)
);
CREATE INDEX idx_orders_date ON orders(order_date);
CREATE INDEX idx_orders_customer ON orders(customer_id);
CREATE INDEX idx_order_items_order ON order_items(order_id);

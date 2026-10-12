Note: this PDF displays the file's text. It is not a runnable replacement for the original .py, .sql, .yml, or configuration file.
-- 1. Revenue by month (completed orders only)
SELECT substr(o.order_date, 1, 7) AS month,
 ROUND(SUM(oi.quantity * oi.unit_price_at_sale), 2) AS revenue
FROM orders AS o
JOIN order_items AS oi ON oi.order_id = o.order_id
WHERE o.status = 'completed'
GROUP BY substr(o.order_date, 1, 7)
ORDER BY month;
-- 2. Top products by completed-order revenue
SELECT p.product_name,
 SUM(oi.quantity) AS units_sold,
 ROUND(SUM(oi.quantity * oi.unit_price_at_sale), 2) AS revenue
FROM order_items AS oi
JOIN products AS p ON p.product_id = oi.product_id
JOIN orders AS o ON o.order_id = oi.order_id
WHERE o.status = 'completed'
GROUP BY p.product_id, p.product_name
ORDER BY revenue DESC;
-- 3. Customer lifetime spend and order count
SELECT c.customer_name,
 COUNT(DISTINCT o.order_id) AS completed_orders,
 ROUND(COALESCE(SUM(oi.quantity * oi.unit_price_at_sale), 0), 2) AS lifetime_spend
FROM customers AS c
LEFT JOIN orders AS o ON o.customer_id = c.customer_id AND o.status = 'completed'
LEFT JOIN order_items AS oi ON oi.order_id = o.order_id
GROUP BY c.customer_id, c.customer_name
ORDER BY lifetime_spend DESC;
-- 4. Revenue by category
SELECT p.category,
 ROUND(SUM(oi.quantity * oi.unit_price_at_sale), 2) AS revenue
FROM order_items AS oi
JOIN products AS p ON p.product_id = oi.product_id
JOIN orders AS o ON o.order_id = oi.order_id
WHERE o.status = 'completed'
GROUP BY p.category
ORDER BY revenue DESC;
-- 5. Rank customers by spend using a window function
WITH customer_spend AS (
 SELECT c.customer_id, c.customer_name,
 SUM(oi.quantity * oi.unit_price_at_sale) AS spend
 FROM customers AS c
 JOIN orders AS o ON o.customer_id = c.customer_id
 JOIN order_items AS oi ON oi.order_id = o.order_id
 WHERE o.status = 'completed'
 GROUP BY c.customer_id, c.customer_name
)
SELECT customer_name, ROUND(spend, 2) AS spend,
 DENSE_RANK() OVER (ORDER BY spend DESC) AS spend_rank
FROM customer_spend
ORDER BY spend_rank, customer_name;
-- 6. Order totals and statuses (including non-completed orders)
SELECT o.order_id, o.order_date, o.status,
 ROUND(COALESCE(SUM(oi.quantity * oi.unit_price_at_sale), 0), 2) AS order_total
FROM orders AS o
LEFT JOIN order_items AS oi ON oi.order_id = o.order_id
GROUP BY o.order_id, o.order_date, o.status
ORDER BY o.order_date, o.order_id;

Original path: sql-sales-analytics/sample_data.sql
Note: this PDF displays the file's text. It is not a runnable replacement for the original .py, .sql, .yml, or configuration file.
INSERT INTO customers VALUES
(1, 'Avery Johnson', 'Bridgeport', '2025-01-10'),
(2, 'Jordan Lee', 'New Haven', '2025-02-04'),
(3, 'Morgan Patel', 'Stamford', '2025-03-18'),
(4, 'Taylor Rivera', 'Norwalk', '2025-04-02'),
(5, 'Casey Chen', 'Bridgeport', '2025-05-20');
INSERT INTO products VALUES
(1, 'Wireless Mouse', 'Accessories', 24.99),
(2, 'USB-C Hub', 'Accessories', 39.50),
(3, 'Laptop Stand', 'Office', 34.00),
(4, 'Notebook Pack', 'Office', 12.00),
(5, 'Webcam', 'Electronics', 59.99);
INSERT INTO orders VALUES
(1001, 1, '2025-06-01', 'completed'),
(1002, 2, '2025-06-03', 'completed'),
(1003, 1, '2025-06-10', 'completed'),
(1004, 3, '2025-06-12', 'cancelled'),
(1005, 4, '2025-07-01', 'completed'),
(1006, 5, '2025-07-05', 'pending'),
(1007, 2, '2025-07-10', 'completed'),
(1008, 3, '2025-07-12', 'completed');
INSERT INTO order_items VALUES
(1, 1001, 1, 2, 24.99), (2, 1001, 4, 1, 12.00),
(3, 1002, 2, 1, 39.50), (4, 1002, 5, 1, 59.99),
(5, 1003, 3, 1, 34.00), (6, 1003, 1, 1, 24.99),
(7, 1004, 5, 1, 59.99),
(8, 1005, 4, 3, 12.00), (9, 1005, 3, 1, 34.00),
(10, 1006, 2, 2, 39.50),
(11, 1007, 1, 1, 24.99), (12, 1007, 2, 1, 39.50),
(13, 1008, 5, 2, 59.99), (14, 1008, 3, 1, 34.00);

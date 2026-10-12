Original path: sql-sales-analytics/README.md
Note: this PDF displays the file's text. It is not a runnable replacement for the original .py, .sql, .yml, or configuration file.
# SQL Sales Analytics
A self-contained SQLite analytics project using a fictional shop dataset. It includes a normalized
schema, constraints and indexes, sample data, and six business queries using joins, aggregates, CTEs,
`COALESCE`, and a window function.
## Requirements
- SQLite 3.25+ (for `DENSE_RANK()` window function)
## Run
From this folder:
```bash
sqlite3 sales.db < schema.sql
sqlite3 sales.db < sample_data.sql
sqlite3 -header -column sales.db < analysis_queries.sql
```
If your SQLite CLI is not installed, open the files in DB Browser for SQLite or another SQLite client
and execute them in the same order.
## Questions answered
1. How does completed revenue trend by month?
2. Which products generate the most revenue?
3. Which customers spend the most, and how many completed orders do they have?
4. Which product categories generate the most revenue?
5. How do customers rank by spend?
6. What are the totals and statuses of all orders?
## Data definitions
Revenue is `quantity * unit_price_at_sale`. Only `completed` orders count toward sales analytics, except
the final query, which deliberately shows all statuses. All names and transactions are synthetic.

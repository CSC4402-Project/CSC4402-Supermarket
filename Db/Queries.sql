-- ================================================================
-- HOW TO WRITE QUERIES FOR THE CLI (READ THIS BEFORE EDITING)
-- ================================================================
-- 1. Every query MUST start with a comment identifying it:
--        -- name: your_query_name
--
-- 2. On the line *after* the name, write the SQL query.
--    You can write it on one line or multiple lines.
--    Example:
--        -- name: get_all_products
--        SELECT *
--        FROM Product
--        WHERE is_active = 1;
--
-- 3. You may include a semicolon at the end OR leave it off.
--    Both are accepted by the Python app.
--
-- 4. Do NOT leave blank lines between the name and the SQL.
--    The query must follow IMMEDIATELY after:
--
--      Wrong:
--        -- name: example
--
--        SELECT * FROM Product;
--
--      Correct:
--        -- name: example
--        SELECT * FROM Product;
--
-- 5. You can add as many queries as you want in this file.
--    Just repeat the pattern:
--
--        -- name: identifier
--        SELECT ...
--
-- 6. Query names MUST be unique.
--    The Python program loads them by name.
--
-- 7. DO NOT remove or rename other teammates' queries.
--    Add your queries at the bottom of the file.
--
-- ================================================================
-- GOOD EXAMPLES (Copy these patterns)
-- ================================================================
-- -- name: sales_history
-- SELECT sale_id, sale_datetime, total_amount
-- FROM Sale
-- ORDER BY sale_datetime DESC
-- LIMIT 20;
--
-- -- name: top_selling_products
-- SELECT si.product_id, p.name, SUM(si.quantity) AS total_qty
-- FROM SaleItem si
-- JOIN Product p ON si.product_id = p.product_id
-- GROUP BY si.product_id, p.name
-- ORDER BY total_qty DESC
-- LIMIT 10;
-- ================================================================


-- ===== Your queries start here =====
-- name: products_with_stock
SELECT p.product_id AS id, p.name, p.category, p.unit_price, i.quantity AS stock
FROM Product p
JOIN Inventory i ON p.product_id = i.product_id
WHERE p.is_active = 1
ORDER BY p.product_id;

-- name: low_stock_products
SELECT p.product_id, p.name, p.category, i.quantity AS stock
FROM Product p
JOIN Inventory i ON p.product_id = i.product_id
WHERE i.quantity < 20
ORDER BY i.quantity ASC;

-- name: recent_sales
SELECT sale_id, sale_datetime, total_amount
FROM Sale
ORDER BY sale_datetime DESC
LIMIT 10;

-- name: revenue_by_day
SELECT DATE(sale_datetime) AS sale_date,
       SUM(total_amount) AS total_revenue,
       COUNT(*) AS num_sales
FROM Sale
GROUP BY DATE(sale_datetime)
ORDER BY sale_date DESC;

-- name: top_products_by_quantity
SELECT si.product_id, p.name, SUM(si.quantity) AS total_qty
FROM SaleItem si
JOIN Product p ON si.product_id = p.product_id
GROUP BY si.product_id, p.name
ORDER BY total_qty DESC
LIMIT 10;

-- name: revenue_by_product
SELECT p.product_id, p.name,
       SUM((si.unit_price - si.discount) * si.quantity) AS total_revenue
FROM SaleItem si
JOIN Product p ON si.product_id = p.product_id
GROUP BY p.product_id, p.name
ORDER BY total_revenue DESC;

-- name: revenue_by_category
SELECT p.category,
       SUM((si.unit_price - si.discount) * si.quantity) AS category_revenue,
       SUM(si.quantity) AS units_sold
FROM SaleItem si
JOIN Product p ON si.product_id = p.product_id
GROUP BY p.category
ORDER BY category_revenue DESC;

-- name: products_sold_today
SELECT SUM(si.quantity) AS total_units_sold
FROM SaleItem si
JOIN Sale s ON si.sale_id = s.sale_id
WHERE DATE(s.sale_datetime) = DATE('now');

-- name: inventory_value
SELECT p.product_id, p.name, i.quantity, p.unit_price,
       (i.quantity * p.unit_price) AS inventory_value
FROM Inventory i
JOIN Product p ON p.product_id = i.product_id
ORDER BY inventory_value DESC;

-- name: products_never_sold
SELECT p.product_id, p.name, p.category
FROM Product p
LEFT JOIN SaleItem si ON p.product_id = si.product_id
WHERE si.product_id IS NULL;


-- name: sales_history
SELECT sale_id, sale_datetime, total_amount
FROM Sale
ORDER BY sale_datetime DESC
LIMIT 20;

-- name: top_selling_products
SELECT si.product_id, p.name, SUM(si.quantity) AS total_qty
FROM SaleItem si
JOIN Product p ON si.product_id = p.product_id
GROUP BY si.product_id, p.name
ORDER BY total_qty DESC
LIMIT 10;

-- name: total_sales
SELECT ROUND(SUM(total_amount), 2) AS total_sales
FROM Sale;

-- name: revenue_per_day
SELECT 
    substr(s.sale_datetime, 1, 10) AS sale_date,
    ROUND(SUM(s.total_amount), 2) AS revenue
FROM Sale s
GROUP BY sale_date
ORDER BY sale_date;

-- name: inventory_counts
SELECT 
    sb.branch_id,
    sb.name AS branch_name,
    SUM(i.quantity) AS total_items
FROM Inventory i
JOIN StoreBranch sb ON i.branch_id = sb.branch_id
GROUP BY sb.branch_id, sb.name
ORDER BY sb.branch_id;

-- name: products_never_sold
SELECT 
    p.product_id,
    p.name,
    p.category,
    p.unit_price
FROM Product p
LEFT JOIN SaleItem si ON p.product_id = si.product_id
WHERE si.sale_id IS NULL
ORDER BY p.product_id;

-- name: revenue_by_category
SELECT 
    p.category,
    ROUND(SUM((si.unit_price - si.discount) * si.quantity), 2) AS revenue
FROM SaleItem si
JOIN Product p ON si.product_id = p.product_id
GROUP BY p.category
ORDER BY revenue DESC;
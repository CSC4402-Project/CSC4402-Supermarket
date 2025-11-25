
----- Data for Supermarket Database ----
INSERT INTO Product (name, barcode, unit_price, category, is_active) VALUES
('Whole Milk 1 Gal', 'LSU1001', 3.49, 'Dairy', 1),
('Cheddar Cheese 8oz', 'LSU1002', 3.99, 'Dairy', 1),

('Chicken Breast 1lb', 'LSU2001', 4.99, 'Meat', 1),
('Ground Beef 1lb', 'LSU2002', 5.49, 'Meat', 1),

('Romaine Lettuce Head', 'LSU3001', 1.49, 'Produce', 1),
('Gala Apples 1lb', 'LSU3002', 1.99, 'Produce', 1),

('Sliced Wheat Bread', 'LSU4001', 2.79, 'Bakery', 1),
('Croissants 6ct', 'LSU4002', 3.59, 'Bakery', 1),

('Long Grain Rice 5lb', 'LSU5001', 6.49, 'Pantry', 1),
('Black Beans Canned 15oz', 'LSU5002', 1.29, 'Pantry', 1);

-- ===== Inventory for LSU Market (branch_id = 1) =====

INSERT INTO Inventory (branch_id, product_id, quantity) VALUES
(1, 1, 40),  -- Whole Milk 1 Gal (Dairy)
(1, 2, 30),  -- Cheddar Cheese 8oz (Dairy)

(1, 3, 25),  -- Chicken Breast 1lb (Meat)
(1, 4, 20),  -- Ground Beef 1lb (Meat)

(1, 5, 50),  -- Romaine Lettuce Head (Produce)
(1, 6, 45),  -- Gala Apples 1lb (Produce)

(1, 7, 35),  -- Sliced Wheat Bread (Bakery)
(1, 8, 30),  -- Croissants 6ct (Bakery)

(1, 9, 60),  -- Long Grain Rice 5lb (Pantry)
(1, 10, 80); -- Black Beans Canned 15oz (Pantry)

-- ===== Sales =====
-- Each row = one full transaction (one receipt)

INSERT INTO Sale (branch_id, sale_datetime, total_amount) VALUES
-- Sale 1: basic milk + bread
(1, '2025-11-24 10:15:00', 9.77),
-- Sale 2: chicken + produce
(1, '2025-11-24 11:05:00', 8.47),
-- Sale 3: beef + rice + beans
(1, '2025-11-24 13:30:00', 14.56),
-- Sale 4: cheese + croissants
(1, '2025-11-25 09:10:00', 19.15);



-- ===== SaleItem rows for each sale =====
-- sale_id, product_id, quantity, unit_price, discount

-- === Sale 1: 2x Milk + 1x Bread ===
-- Total = 2 * 3.49 + 1 * 2.79 = 6.98 + 2.79 = 9.77
INSERT INTO SaleItem (sale_id, product_id, quantity, unit_price, discount) VALUES
(1, 1, 2, 3.49, 0),  -- Whole Milk 1 Gal
(1, 7, 1, 2.79, 0);  -- Sliced Wheat Bread


-- === Sale 2: Chicken + Lettuce + Apples ===
-- Total = 4.99 + 1.49 + 1.99 = 8.47
INSERT INTO SaleItem (sale_id, product_id, quantity, unit_price, discount) VALUES
(2, 3, 1, 4.99, 0),  -- Chicken Breast 1lb
(2, 5, 1, 1.49, 0),  -- Romaine Lettuce Head
(2, 6, 1, 1.99, 0);  -- Gala Apples 1lb


-- === Sale 3: Ground Beef + Rice + 2x Beans ===
-- Total = 5.49 + 6.49 + 2 * 1.29 = 5.49 + 6.49 + 2.58 = 14.56
INSERT INTO SaleItem (sale_id, product_id, quantity, unit_price, discount) VALUES
(3, 4, 1, 5.49, 0),  -- Ground Beef 1lb
(3, 9, 1, 6.49, 0),  -- Long Grain Rice 5lb
(3, 10, 2, 1.29, 0); -- Black Beans Canned 15oz


-- === Sale 4: 3x Cheese + 2x Croissants ===
-- Total = 3 * 3.99 + 2 * 3.59 = 11.97 + 7.18 = 19.15
INSERT INTO SaleItem (sale_id, product_id, quantity, unit_price, discount) VALUES
(4, 2, 3, 3.99, 0),  -- Cheddar Cheese 8oz
(4, 8, 2, 3.59, 0);  -- Croissants 6ct
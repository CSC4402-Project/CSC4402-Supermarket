
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
('Black Beans Canned 15oz', 'LSU5002', 1.29, 'Pantry', 1)

('Greek Yogurt 4ct', 'LSU1003', 4.29, 'Dairy', 1),
('Butter Salted 1lb', 'LSU1004', 3.89, 'Dairy', 1),

('Pork Chops 1lb', 'LSU2003', 4.79, 'Meat', 1),
('Bacon 12oz', 'LSU2004', 5.99, 'Meat', 1),

('Bananas 1lb', 'LSU3003', 0.89, 'Produce', 1),
('Tomatoes 1lb', 'LSU3004', 1.29, 'Produce', 1),

('Bagels 6ct', 'LSU4003', 3.19, 'Bakery', 1),
('Blueberry Muffins 4ct', 'LSU4004', 4.49, 'Bakery', 1),

('Pasta Spaghetti 1lb', 'LSU5003', 1.49, 'Pantry', 1),
('Olive Oil 16oz', 'LSU5004', 5.49, 'Pantry', 1),

('Frozen Pizza', 'LSU6001', 6.99, 'Frozen', 1),
('Vanilla Ice Cream 1qt', 'LSU6002', 4.99, 'Frozen', 1),

('Coca-Cola 12pk', 'LSU7001', 6.49, 'Drinks', 1),
('Orange Juice 52oz', 'LSU7002', 3.99, 'Drinks', 1),

('Potato Chips 8oz', 'LSU8001', 2.99, 'Snacks', 1),
('Chocolate Bar', 'LSU8002', 1.49, 'Snacks', 1),

('Paper Towels 6pk', 'LSU9001', 7.99, 'Household', 1),
('Laundry Detergent 50oz', 'LSU9002', 9.49, 'Household', 1);

('Eggs 12ct', 'LSU1005', 4.99, 'Dairy', 1),
('Salmon 1lb', 'LSU2005', 9.99, 'Meat', 1),
  
('Spinach 5oz', 'LSU3005', 3.49, 'Produce', 1),
('Sourdough Bread', 'LSU4005', 4.29, 'Bakery', 1),
  
('Peanut Butter 16oz', 'LSU5005', 3.99, 'Pantry', 1),
('Frozen Waffles 10ct', 'LSU6003', 3.79, 'Frozen', 1),
  
('Bottled Water 24pk', 'LSU7003', 4.49, 'Drinks', 1),
('Trail Mix 10oz', 'LSU8003', 5.99, 'Snacks', 1),
  
('Dish Soap 22oz', 'LSU9003', 3.29, 'Household', 1),
('Shredded Mozzarella 8oz', 'LSU1006', 3.69, 'Dairy', 1);

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
(1, 10, 80), -- Black Beans Canned 15oz (Pantry)

(1, 11, 40),  -- Greek Yogurt
(1, 12, 35),  -- Butter

(1, 13, 25),  -- Pork Chops
(1, 14, 20),  -- Bacon

(1, 15, 60),  -- Bananas
(1, 16, 55),  -- Tomatoes

(1, 17, 33),  -- Bagels
(1, 18, 28),  -- Blueberry Muffins

(1, 19, 70),  -- Pasta
(1, 20, 45),  -- Olive Oil

(1, 21, 22),  -- Frozen Pizza
(1, 22, 30),  -- Ice Cream

(1, 23, 48),  -- Coca-Cola
(1, 24, 40),  -- Orange Juice

(1, 25, 50),  -- Potato Chips
(1, 26, 65),  -- Chocolate Bar

(1, 27, 20),  -- Paper Towels
(1, 28, 18);  -- Laundry Detergent

(1, 29, 36),  -- Eggs
(1, 30, 15),  -- Salmon
  
(1, 31, 42),  -- Spinach
(1, 32, 25),  -- Sourdough Bread
  
(1, 33, 55),  -- Peanut Butter
(1, 34, 38),  -- Frozen Waffles
  
(1, 35, 60),  -- Bottled Water
(1, 36, 45),  -- Trail Mix
  
(1, 37, 30),  -- Dish Soap
(1, 38, 40);  -- Shredded Mozzarella

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
(1, '2025-11-25 09:10:00', 19.15)

(1, '2025-11-25 12:45:00', 12.67),
(1, '2025-11-25 15:20:00', 7.47),
(1, '2025-11-26 09:30:00', 21.95),
(1, '2025-11-26 18:10:00', 16.76),
(1, '2025-11-27 14:05:00', 11.89);

-- Sale 10: Eggs + Spinach + Salmon
(1, '2025-11-28 10:30:00', 18.47),
-- Sale 11: Water + Trail Mix + Peanut Butter + Waffles + Mozzarella
(1, '2025-11-28 14:15:00', 21.95),
-- Sale 12: Mozzarella + Dish Soap + Spinach + Sourdough
(1, '2025-11-29 09:45:00', 14.26);


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

-- === Sale 5: Yogurt + Bananas ===
INSERT INTO SaleItem (sale_id, product_id, quantity, unit_price, discount) VALUES
(5, 11, 1, 4.29, 0),
(5, 15, 3, 0.89, 0);

-- === Sale 6: Chips + Soda ===
INSERT INTO SaleItem (sale_id, product_id, quantity, unit_price, discount) VALUES
(6, 25, 1, 2.99, 0),
(6, 23, 1, 6.49, 2.01);  -- discount applied

-- === Sale 7: Pizza + Ice Cream + Juice ===
INSERT INTO SaleItem (sale_id, product_id, quantity, unit_price, discount) VALUES
(7, 21, 1, 6.99, 0),
(7, 22, 1, 4.99, 0),
(7, 24, 1, 3.99, 0);

-- === Sale 8: Beef + Bacon + Tomatoes ===
INSERT INTO SaleItem (sale_id, product_id, quantity, unit_price, discount) VALUES
(8, 4, 1, 5.49, 0),
(8, 14, 1, 5.99, 0),
(8, 16, 2, 1.29, 0);

-- === Sale 9: Pasta + Olive Oil + Bread ===
INSERT INTO SaleItem (sale_id, product_id, quantity, unit_price, discount) VALUES
(9, 19, 1, 1.49, 0),
(9, 20, 1, 5.49, 0),
(9, 7, 1, 2.79, 0);

-- === Sale 10: Eggs + Spinach + Salmon ===
INSERT INTO SaleItem (sale_id, product_id, quantity, unit_price, discount) VALUES
(10, 29, 1, 4.99, 0),  -- Organic Eggs
(10, 31, 1, 3.49, 0),  -- Baby Spinach
(10, 30, 1, 9.99, 0);  -- Salmon Fillet

-- === Sale 11: Water + Trail Mix + Peanut Butter + Waffles + Mozzarella ===
INSERT INTO SaleItem (sale_id, product_id, quantity, unit_price, discount) VALUES
(11, 35, 1, 4.49, 0),  -- Bottled Water
(11, 36, 1, 5.99, 0),  -- Trail Mix
(11, 33, 1, 3.99, 0),  -- Peanut Butter
(11, 34, 1, 3.79, 0),  -- Frozen Waffles
(11, 38, 1, 3.69, 0);  -- Shredded Mozzarella

-- === Sale 12: Mozzarella + Dish Soap + Spinach + Sourdough ===
INSERT INTO SaleItem (sale_id, product_id, quantity, unit_price, discount) VALUES
(12, 38, 1, 3.69, 0),  -- Shredded Mozzarella
(12, 37, 1, 3.29, 0),  -- Dish Soap
(12, 31, 1, 3.49, 0),  -- Baby Spinach
(12, 32, 1, 3.79, 0);  -- Sourdough Bread

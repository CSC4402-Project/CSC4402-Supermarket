----- Data for Supermarket Database ----
INSERT INTO StoreBranch (name, address, phone) VALUES
('LSU Market - Main Campus', '123 LSU Ave, Baton Rouge, LA', '225-555-1234');

-- ===== Products =====
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
('Black Beans Canned 15oz', 'LSU5002', 1.29, 'Pantry', 1),

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
('Laundry Detergent 50oz', 'LSU9002', 9.49, 'Household', 1),

('Eggs 12ct', 'LSU1005', 4.99, 'Dairy', 1),
('Salmon 1lb', 'LSU2005', 9.99, 'Meat', 1),
  
('Spinach 5oz', 'LSU3005', 3.49, 'Produce', 1),
('Sourdough Bread', 'LSU4005', 4.29, 'Bakery', 1),
  
('Peanut Butter 16oz', 'LSU5005', 3.99, 'Pantry', 1),
('Frozen Waffles 10ct', 'LSU6003', 3.79, 'Frozen', 1),
  
('Bottled Water 24pk', 'LSU7003', 4.49, 'Drinks', 1),
('Trail Mix 10oz', 'LSU8003', 5.99, 'Snacks', 1),
  
('Dish Soap 22oz', 'LSU9003', 3.29, 'Household', 1),
('Shredded Mozzarella 8oz', 'LSU1006', 3.69, 'Dairy', 1),

('Sour Cream 16oz', 'LSU1007', 2.49, 'Dairy', 1),
('Shrimp 1lb', 'LSU2006', 8.99, 'Meat', 1),
  
('Avocados 4ct', 'LSU3006', 4.49, 'Produce', 1),
('Cinnamon Rolls 6ct', 'LSU4006', 4.99, 'Bakery', 1),
  
('Honey 12oz', 'LSU5006', 5.99, 'Pantry', 1),
('Fish Sticks 12ct', 'LSU6004', 5.49, 'Frozen', 1),
  
('Coffee Ground 12oz', 'LSU7004', 7.99, 'Drinks', 1),
('Tortilla Chips 13oz', 'LSU8004', 3.79, 'Snacks', 1),
  
('Salsa 16oz', 'LSU8005', 3.49, 'Snacks', 1),
('Trash Bags 30ct', 'LSU9004', 8.49, 'Household', 1);

('Almond Milk 1 Gal', 'LSU1008', 3.79, 'Dairy', 1),
('Feta Cheese 8oz', 'LSU1009', 4.49, 'Dairy', 1),
  
('Cream Cheese 8oz', 'LSU1010', 2.99, 'Dairy', 1),
('Turkey Breast 1lb', 'LSU2007', 5.49, 'Meat', 1),
  
('Tilapia Fillet 1lb', 'LSU2008', 7.99, 'Meat', 1),
('Strawberries 1lb', 'LSU3007', 3.99, 'Produce', 1),
  
('Cucumber 1ct', 'LSU3008', 1.29, 'Produce', 1),
('Whole Wheat Bread', 'LSU4007', 3.49, 'Bakery', 1),
  
('Chocolate Chip Cookies 12ct', 'LSU4008', 5.99, 'Bakery', 1),
('Jelly Grape 16oz', 'LSU5007', 2.99, 'Pantry', 1);

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
(1, 28, 18),  -- Laundry Detergent

(1, 29, 36),  -- Eggs
(1, 30, 15),  -- Salmon
  
(1, 31, 42),  -- Spinach
(1, 32, 25),  -- Sourdough Bread
  
(1, 33, 55),  -- Peanut Butter
(1, 34, 38),  -- Frozen Waffles
  
(1, 35, 60),  -- Bottled Water
(1, 36, 45),  -- Trail Mix
  
(1, 37, 30),  -- Dish Soap
(1, 38, 40),  -- Shredded Mozzarella

(1, 39, 25),  -- Sour Cream
(1, 40, 18),  -- Shrimp
  
(1, 41, 30),  -- Avocados
(1, 42, 20),  -- Cinnamon Rolls
  
(1, 43, 35),  -- Honey
(1, 44, 28),  -- Fish Sticks
  
(1, 45, 22),  -- Coffee Ground
(1, 46, 40),  -- Tortilla Chips
  
(1, 47, 38),  -- Salsa
(1, 48, 25);  -- Trash Bags

(1, 49, 35),  -- Almond Milk 1 Gal
(1, 50, 28),  -- Feta Cheese 8oz
  
(1, 51, 40),  -- Cream Cheese 8oz
(1, 52, 22),  -- Turkey Breast 1lb
  
(1, 53, 18),  -- Tilapia Fillet 1lb
(1, 54, 50),  -- Strawberries 1lb
  
(1, 55, 45),  -- Cucumber 1ct
(1, 56, 30),  -- Whole Wheat Bread
  
(1, 57, 25),  -- Chocolate Chip Cookies 12ct
(1, 58, 40);  -- Jelly Grape 16oz

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
(1, '2025-11-25 09:10:00', 19.15),
(1, '2025-11-25 12:45:00', 12.67),
(1, '2025-11-25 15:20:00', 7.47),
(1, '2025-11-26 09:30:00', 21.95),
(1, '2025-11-26 18:10:00', 16.76),
(1, '2025-11-27 14:05:00', 11.89),

-- Sale 10: Eggs + Spinach + Salmon
(1, '2025-11-28 10:30:00', 18.47),
-- Sale 11: Water + Trail Mix + Peanut Butter + Waffles + Mozzarella
(1, '2025-11-28 14:15:00', 21.95),
-- Sale 12: Mozzarella + Dish Soap + Spinach + Sourdough
(1, '2025-11-29 09:45:00', 14.26),

-- Sale 13: Coffee + Cinnamon Rolls
(1, '2025-11-29 08:15:00', 12.98),
-- Sale 14: Tortilla Chips + Salsa + Sour Cream
(1, '2025-11-29 14:30:00', 9.77),
-- Sale 15: Shrimp + Rice + Avocados
(1, '2025-11-30 11:00:00', 19.97),
-- Sale 16: Fish Sticks + Frozen Waffles + Orange Juice
(1, '2025-11-30 17:45:00', 13.27),
-- Sale 17: Honey + Peanut Butter + Bread
(1, '2025-12-01 09:20:00', 12.77),
-- Sale 18: Trash Bags + Laundry Detergent + Dish Soap
(1, '2025-12-01 13:00:00', 21.27),
-- Sale 19: Coffee + Eggs + Bacon + Croissants
(1, '2025-12-01 07:30:00', 22.56),
-- Sale 20: Avocados + Tomatoes + Chicken + Tortilla Chips
(1, '2025-12-02 12:15:00', 14.56),

-- Sale 21: Shrimp dinner ingredients
(1, '2025-12-02 17:30:00', 23.96),
-- Sale 22: Breakfast run - coffee, honey, eggs
(1, '2025-12-03 07:45:00', 17.97),
-- Sale 23: Party supplies - chips, salsa, sour cream, soda
(1, '2025-12-03 15:00:00', 16.26),
-- Sale 24: Weekly cleaning supplies
(1, '2025-12-03 10:30:00', 19.77),
-- Sale 25: Fish sticks family dinner
(1, '2025-12-04 18:00:00', 18.46),
-- Sale 26: Brunch prep - cinnamon rolls, coffee, OJ, eggs
(1, '2025-12-04 09:15:00', 21.96),
-- Sale 27: Taco night - avocados, salsa, tortilla chips, beef, sour cream
(1, '2025-12-05 16:45:00', 20.25),
-- Sale 28: Mixed grocery run with honey and shrimp
(1, '2025-12-05 11:20:00', 26.45);


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

-- === Sale 13: Coffee + Cinnamon Rolls ===
-- Total = 7.99 + 4.99 = 12.98
INSERT INTO SaleItem (sale_id, product_id, quantity, unit_price, discount) VALUES
(13, 45, 1, 7.99, 0),  -- Coffee Ground 12oz
(13, 42, 1, 4.99, 0);  -- Cinnamon Rolls 6ct

-- === Sale 14: Tortilla Chips + Salsa + Sour Cream ===
-- Total = 3.79 + 3.49 + 2.49 = 9.77
INSERT INTO SaleItem (sale_id, product_id, quantity, unit_price, discount) VALUES
(14, 46, 1, 3.79, 0),  -- Tortilla Chips 13oz
(14, 47, 1, 3.49, 0),  -- Salsa 16oz
(14, 39, 1, 2.49, 0);  -- Sour Cream 16oz

-- === Sale 15: Shrimp + Rice + Avocados ===
-- Total = 8.99 + 6.49 + 4.49 = 19.97
INSERT INTO SaleItem (sale_id, product_id, quantity, unit_price, discount) VALUES
(15, 40, 1, 8.99, 0),  -- Shrimp 1lb
(15, 9, 1, 6.49, 0),   -- Long Grain Rice 5lb
(15, 41, 1, 4.49, 0);  -- Avocados 4ct

-- === Sale 16: Fish Sticks + Frozen Waffles + Orange Juice ===
-- Total = 5.49 + 3.79 + 3.99 = 13.27
INSERT INTO SaleItem (sale_id, product_id, quantity, unit_price, discount) VALUES
(16, 44, 1, 5.49, 0),  -- Fish Sticks 12ct
(16, 34, 1, 3.79, 0),  -- Frozen Waffles 10ct
(16, 24, 1, 3.99, 0);  -- Orange Juice 52oz

-- === Sale 17: Honey + Peanut Butter + Bread ===
-- Total = 5.99 + 3.99 + 2.79 = 12.77
INSERT INTO SaleItem (sale_id, product_id, quantity, unit_price, discount) VALUES
(17, 43, 1, 5.99, 0),  -- Honey 12oz
(17, 33, 1, 3.99, 0),  -- Peanut Butter 16oz
(17, 7, 1, 2.79, 0);   -- Sliced Wheat Bread

-- === Sale 18: Trash Bags + Laundry Detergent + Dish Soap ===
-- Total = 8.49 + 9.49 + 3.29 = 21.27
INSERT INTO SaleItem (sale_id, product_id, quantity, unit_price, discount) VALUES
(18, 48, 1, 8.49, 0),  -- Trash Bags 30ct
(18, 28, 1, 9.49, 0),  -- Laundry Detergent 50oz
(18, 37, 1, 3.29, 0);  -- Dish Soap 22oz

-- === Sale 19: Coffee + Eggs + Bacon + Croissants ===
-- Total = 7.99 + 4.99 + 5.99 + 3.59 = 22.56
INSERT INTO SaleItem (sale_id, product_id, quantity, unit_price, discount) VALUES
(19, 45, 1, 7.99, 0),  -- Coffee Ground 12oz
(19, 29, 1, 4.99, 0),  -- Eggs 12ct
(19, 14, 1, 5.99, 0),  -- Bacon 12oz
(19, 8, 1, 3.59, 0);   -- Croissants 6ct

-- === Sale 20: Avocados + Tomatoes + Chicken + Tortilla Chips ===
-- Total = 4.49 + 1.29 + 4.99 + 3.79 = 14.56
INSERT INTO SaleItem (sale_id, product_id, quantity, unit_price, discount) VALUES
(20, 41, 1, 4.49, 0),  -- Avocados 4ct
(20, 16, 1, 1.29, 0),  -- Tomatoes 1lb
(20, 3, 1, 4.99, 0),   -- Chicken Breast 1lb
(20, 46, 1, 3.79, 0);  -- Tortilla Chips 13oz

-- === Sale 21: Shrimp dinner - Shrimp + Avocados + Rice + Butter ===
-- Total = 8.99 + 4.49 + 6.49 + 3.89 = 23.86
INSERT INTO SaleItem (sale_id, product_id, quantity, unit_price, discount) VALUES
(21, 40, 1, 8.99, 0),  -- Shrimp 1lb
(21, 41, 1, 4.49, 0),  -- Avocados 4ct
(21, 9, 1, 6.49, 0),   -- Long Grain Rice 5lb
(21, 12, 1, 3.89, 0);  -- Butter Salted 1lb

-- === Sale 22: Breakfast - Coffee + Honey + Eggs ===
-- Total = 7.99 + 5.99 + 4.99 = 18.97 (discount applied)
INSERT INTO SaleItem (sale_id, product_id, quantity, unit_price, discount) VALUES
(22, 45, 1, 7.99, 0),  -- Coffee Ground 12oz
(22, 43, 1, 5.99, 0),  -- Honey 12oz
(22, 29, 1, 4.99, 1.00); -- Eggs 12ct (discount)

-- === Sale 23: Party - Tortilla Chips + Salsa + Sour Cream + Coca-Cola ===
-- Total = 3.79 + 3.49 + 2.49 + 6.49 = 16.26
INSERT INTO SaleItem (sale_id, product_id, quantity, unit_price, discount) VALUES
(23, 46, 1, 3.79, 0),  -- Tortilla Chips 13oz
(23, 47, 1, 3.49, 0),  -- Salsa 16oz
(23, 39, 1, 2.49, 0),  -- Sour Cream 16oz
(23, 23, 1, 6.49, 0);  -- Coca-Cola 12pk

-- === Sale 24: Cleaning - Trash Bags + Dish Soap + Paper Towels ===
-- Total = 8.49 + 3.29 + 7.99 = 19.77
INSERT INTO SaleItem (sale_id, product_id, quantity, unit_price, discount) VALUES
(24, 48, 1, 8.49, 0),  -- Trash Bags 30ct
(24, 37, 1, 3.29, 0),  -- Dish Soap 22oz
(24, 27, 1, 7.99, 0);  -- Paper Towels 6pk

-- === Sale 25: Fish Sticks dinner - Fish Sticks x2 + Frozen Waffles + Salsa ===
-- Total = 5.49 + 3.79 + 3.49 + 5.69 = 18.46
INSERT INTO SaleItem (sale_id, product_id, quantity, unit_price, discount) VALUES
(25, 44, 2, 5.49, 0), -- Fish Sticks 12ct x2
(25, 47, 1, 3.79, 0), -- Frozen Waffles 10ct
(25, 37, 1, 3.49, 0); -- Salsa 16oz

-- === Sale 26: Brunch - Cinnamon Rolls + Coffee + OJ + Eggs ===
-- Total = 4.99 + 7.99 + 3.99 + 4.99 = 21.96
INSERT INTO SaleItem (sale_id, product_id, quantity, unit_price, discount) VALUES
(26, 42, 1, 4.99, 0),  -- Cinnamon Rolls 6ct
(26, 45, 1, 7.99, 0),  -- Coffee Ground 12oz
(26, 24, 1, 3.99, 0),  -- Orange Juice 52oz
(26, 29, 1, 4.99, 0);  -- Eggs 12ct

-- === Sale 27: Taco Night - Avocados + Salsa + Tortilla Chips + Ground Beef + Sour Cream ===
-- Total = 4.49 + 3.49 + 3.79 + 5.49 + 2.49 = 19.75
INSERT INTO SaleItem (sale_id, product_id, quantity, unit_price, discount) VALUES
(27, 41, 1, 4.49, 0),  -- Avocados 4ct
(27, 47, 1, 3.49, 0),  -- Salsa 16oz
(27, 46, 1, 3.79, 0),  -- Tortilla Chips 13oz
(27, 4, 1, 5.49, 0),   -- Ground Beef 1lb
(27, 39, 1, 2.49, 0);  -- Sour Cream 16oz

-- === Sale 28: Mixed grocery - Shrimp + Honey + Cinnamon Rolls + Salmon ===
-- Total = 8.99 + 5.99 + 4.99 + 9.99 = 29.96 (discount applied)
INSERT INTO SaleItem (sale_id, product_id, quantity, unit_price, discount) VALUES
(28, 40, 1, 8.99, 0),  -- Shrimp 1lb
(28, 43, 1, 5.99, 0),  -- Honey 12oz
(28, 42, 1, 4.99, 0),  -- Cinnamon Rolls 6ct
(28, 30, 1, 9.99, 3.51); -- Salmon 1lb (discount)

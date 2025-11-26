🛒 CSC4402 Supermarket Database System

Fall 2025 — Group Project

Group Members:
Guido Manuel Fajardo Gabrie, Jonathan Martinez, Candor Alemu, Nathan Rodrigue, Yu Joo


This project implements a simplified supermarket management system using:
	•	SQLite as the database engine
	•	Python CLI as the application interface
	•	SQL scripts for schema, sample data, and statistics queries

The system supports inventory management, product listings, checkout functionality, and custom SQL-based analytics.

⸻

📁 Project Structure

CSC4402-Supermarket/
│
├── db/
│   ├── schema.sql        → Database table definitions
│   ├── data.sql          → Initial data (branch, products, inventory, sample sales)
│   ├── queries.sql       → User-created SQL queries for Statistics menu
│   └── supermarket.db    → The actual SQLite database file (generated after setup)
│
└── App/
    └── app.py            → Python CLI (main application)

You will mostly work inside the db/ directory.

⸻

🧱 Features Implemented

✔ Database Schema

Includes the following tables:
	•	StoreBranch
	•	Product
	•	Inventory
	•	Sale
	•	SaleItem

✔ CLI Application

The Python CLI supports:
	1.	List available products
	2.	Add product to cart
	3.	View cart
	4.	Checkout
	•	Inserts a new Sale record
	•	Inserts SaleItem rows
	•	Updates inventory automatically
	5.	Statistics
	•	Loads SQL queries from queries.sql
	•	Runs them dynamically
	6.	Exit

✔ Preloaded Data

data.sql includes:
	•	LSU Market branch
	•	Sample products
	•	Initial inventory
	•	Test sales data

⸻

🔧 Setup Instructions

1. Install SQLite (if needed)

macOS already has SQLite installed.
To verify:

sqlite3 --version

2. Build the database

From the project root:

cd db
rm supermarket.db
sqlite3 supermarket.db < schema.sql
sqlite3 supermarket.db < data.sql

3. Run the CLI

cd ../App
python3 app.py

You should see:

Connected to LSU Market database.
=== LSU Market CLI ===
1. List available products
2. Add product to cart
3. View cart
4. Checkout
5. Statistics
6. Exit


⸻

📝 Adding Products or Inventory (MAIN TASK FOR TEAM MEMBERS)

To add or update products, edit:

db/data.sql

Example:

INSERT INTO Product (name, barcode, unit_price, is_active)
VALUES ('Orange Juice', 'OJ-100', 2.99, 1);

INSERT INTO Inventory (branch_id, product_id, quantity)
VALUES (1, LAST_INSERTED_PRODUCT_ID, 50);

After editing, rebuild the database:

rm supermarket.db
sqlite3 supermarket.db < schema.sql
sqlite3 supermarket.db < data.sql


⸻

📊 Adding Queries (MAIN TASK FOR TEAM MEMBERS)

All analytics / test queries go in:

db/queries.sql

The Python app loads and executes them automatically.

FORMAT RULES (FOLLOW EXACTLY):

-- name: your_query_name
SELECT ...
FROM ...
WHERE ...;

Rules:
	•	Query name must be unique
	•	Query must start immediately after the -- name: line
	•	Semicolon is optional
	•	Add your queries at the bottom
	•	Do NOT modify other teammates’ queries

Example:

-- name: total_sales
SELECT COUNT(*) FROM Sale;

These queries show up automatically in the Statistics menu.

⸻

🧪 Required Test Queries

We must include 5 test queries for grading.
These can include:
	•	Total sales
	•	Top-selling product
	•	Daily revenue
	•	Inventory counts
	•	Products never sold

Each teammate can contribute one or more.

⸻

🧩 Code Overview (app.py)

app.py handles:
	•	Product listing
	•	Cart management
	•	Checkout logic
	•	Inventory updates
	•	Sale + SaleItem creation
	•	Query loader for statistics
	•	Main menu loop

You do NOT need to modify app.py unless adding extra features.

⸻

👥 Team Member Contributions

This is the work we have to do:

Each of us will do 10 groceries for the data population that way it wil be easier to fill it

E-R diagram: @Guido Fajardo @jack(yu joo) 
Relational schema: @JonathanMartinez @nathanielb @ccaannddyy112233 
Data generation: @everyone  10 each
Test queries: @jack(yu joo) 
Application user interfaces: @Guido Fajardo 


⸻

🧹 Notes
	•	Keep code and SQL clean and readable.
	•	Do NOT modify the database schema unless coordinated with the whole team.
	•	If you break the DB, simply rebuild using schema.sql + data.sql.

⸻

✅ Final Deliverables

PDF Report (8 pages max)

Includes:
	1.	Enterprise description
	2.	ER diagram
	3.	Relational schema
	4.	Sample test queries + outputs
	5.	Screenshots of CLI interfaces
	6.	Participation breakdown

ZIP File

Includes:
	•	db/ directory
	•	App/ directory
	•	All SQL + Python files
	•	README
	•	Instructions to run

⸻

# CSC4402 Supermarket Database System – Deployment Instructions

This document explains how to build the database, load the data, and run the Python CLI application for the LSU Market system. It works for both macOS and Windows.

---

## 1. Project Structure

```
CSC4402-Supermarket/
│
├── db/
│   ├── schema.sql
│   ├── data.sql
│   ├── queries.sql
│   └── supermarket.db   (generated after setup)
│
└── App/
    └── app.py
```

---

## 2. Requirements

- Python 3.8 or newer  
- SQLite 3

---

## 3. Installing SQLite

### macOS
Most macOS systems already have SQLite:

```bash
sqlite3 --version
```

If the command is not found:

```bash
brew install sqlite
```

### Windows
1. Download SQLite tools: https://www.sqlite.org/download.html  
2. Extract the folder (for example into `C:\sqlite`).  
3. Add that folder to PATH, or run commands from inside it.

Verify installation:

```cmd
sqlite3 --version
```

---

## 4. Build the Database

All commands below assume you are inside the **project root folder**.

### Step 1 — Move into the db folder

macOS/Linux:
```bash
cd db
```

Windows:
```cmd
cd db
```

### Step 2 — Delete any existing database (clean rebuild)

macOS:
```bash
rm supermarket.db
```

Windows (Command Prompt):
```cmd
del supermarket.db
```

Windows (PowerShell):
```powershell
Remove-Item supermarket.db
```

### Step 3 — Run the schema to create all tables

macOS/Linux:
```bash
sqlite3 supermarket.db < schema.sql
```

Windows:
```cmd
sqlite3 supermarket.db < schema.sql
```

### Step 4 — Load the initial data

macOS/Linux:
```bash
sqlite3 supermarket.db < data.sql
```

Windows:
```cmd
sqlite3 supermarket.db < data.sql
```

### Step 5 — (Optional) Verify tables exist

```bash
sqlite3 supermarket.db
```

Inside the SQLite shell, run:

```sql
.tables
```

You should see:

```
Inventory  Product  Sale  SaleItem  StoreBranch
```

Exit:

```sql
.quit
```

---

## 5. Run the CLI Application

From the project root:

### Step 1 — Enter the App directory

macOS/Linux:
```bash
cd App
```

Windows:
```cmd
cd App
```

### Step 2 — Run the app

macOS/Linux:
```bash
python3 app.py
```

Windows:
```cmd
python app.py
```

If everything is correct, you will see:

```
Connected to LSU Market database.

=== LSU Market CLI ===
1. List available products
2. Add product to cart
3. View cart
4. Checkout
5. Statistics
6. Exit
```

---

## 6. Queries File (queries.sql)

All statistics and test queries are stored in:

```
db/queries.sql
```

Format required:

```
-- name: unique_query_name
SELECT ...
FROM ...
WHERE ...;
```

The Python app loads these queries automatically and maps them to the Statistics menu.

---

## 7. Rebuilding the Entire System

If the database becomes corrupted or you need a clean start:

```
cd db
rm supermarket.db      (or del supermarket.db on Windows)
sqlite3 supermarket.db < schema.sql
sqlite3 supermarket.db < data.sql
```

Then run the application again:

```
cd ../App
python3 app.py
```

---

This is all that is required to deploy, run, and test the CSC4402 Supermarket Database System.

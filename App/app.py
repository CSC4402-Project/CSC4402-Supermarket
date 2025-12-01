import sqlite3
import os

DB_PATH = "../db/supermarket.db"
QUERIES_PATH = "../db/queries.sql"
BRANCH_ID = 1


# ========= DB HELPERS =========

def get_connection():
    return sqlite3.connect(DB_PATH)


# ========= PRODUCT / INVENTORY LOGIC =========

def list_available_products():
    """List all active products with stock > 0 for the branch."""
    conn = get_connection()
    cur = conn.cursor()

    cur.execute("""
        SELECT p.product_id,
               p.name,
               p.unit_price,
               i.quantity
        FROM Product p
        JOIN Inventory i ON p.product_id = i.product_id
        WHERE p.is_active = 1
          AND i.branch_id = ?
          AND i.quantity > 0
        ORDER BY p.name;
    """, (BRANCH_ID,))

    rows = cur.fetchall()
    conn.close()

    if not rows:
        print("\nNo products available.\n")
        return

    print("\n=== Available Products ===")
    print(f"{'ID':<4} {'Name':<30} {'Price':>7} {'Stock':>7}")
    print("-" * 55)
    for product_id, name, price, qty in rows:
        print(f"{product_id:<4} {name:<30} {price:>7.2f} {qty:>7}")
    print()


def get_product_with_stock(product_id):
    """Fetch product info + current stock for given product_id."""
    conn = get_connection()
    cur = conn.cursor()
    cur.execute("""
        SELECT p.product_id,
               p.name,
               p.unit_price,
               i.quantity
        FROM Product p
        JOIN Inventory i ON p.product_id = i.product_id
        WHERE p.product_id = ?
          AND i.branch_id = ?
          AND p.is_active = 1;
    """, (product_id, BRANCH_ID))
    row = cur.fetchone()
    conn.close()
    return row  


# ========= CART LOGIC =========

# cart structure: { product_id: {"name": str, "unit_price": float, "qty": int} }
cart = {}


def add_to_cart():
    """Add a product to the in-memory cart after checking stock."""
    list_available_products()
    try:
        product_id = int(input("Enter product ID to add to cart (0 to cancel): ").strip())
    except ValueError:
        print("Invalid input.")
        return

    if product_id == 0:
        return

    product = get_product_with_stock(product_id)
    if product is None:
        print("Product not found or inactive.")
        return

    _, name, unit_price, stock_qty = product

    try:
        qty = int(input(f"Enter quantity of '{name}' to add: ").strip())
    except ValueError:
        print("Invalid quantity.")
        return

    if qty <= 0:
        print("Quantity must be > 0.")
        return

    if qty > stock_qty:
        print(f"Not enough stock. Available: {stock_qty}")
        return

    # If already in cart, increase qty
    if product_id in cart:
        # Check again against stock
        new_total = cart[product_id]["qty"] + qty
        if new_total > stock_qty:
            print(f"Total in cart would exceed stock. Available: {stock_qty}")
            return
        cart[product_id]["qty"] = new_total
    else:
        cart[product_id] = {
            "name": name,
            "unit_price": unit_price,
            "qty": qty
        }

    print(f"Added {qty} x '{name}' to cart.\n")


def view_cart():
    """Display current cart."""
    if not cart:
        print("\nCart is empty.\n")
        return

    print("\n=== Cart ===")
    print(f"{'ID':<4} {'Name':<30} {'Qty':>5} {'Price':>7} {'Subtotal':>10}")
    print("-" * 65)
    total = 0.0
    for pid, item in cart.items():
        qty = item["qty"]
        price = item["unit_price"]
        subtotal = qty * price
        total += subtotal
        print(f"{pid:<4} {item['name']:<30} {qty:>5} {price:>7.2f} {subtotal:>10.2f}")
    print("-" * 65)
    print(f"{'Total':>52}: {total:>10.2f}\n")


# ========= CHECKOUT LOGIC =========

def checkout():
    """Create Sale + SaleItem rows and update Inventory."""
    if not cart:
        print("\nCart is empty. Nothing to checkout.\n")
        return

    # Re-check stock for all items before committing
    conn = get_connection()
    cur = conn.cursor()

    try:
        # Start transaction
        conn.execute("BEGIN;")

        # Verify stock for each item
        for pid, item in cart.items():
            cur.execute("""
                SELECT quantity
                FROM Inventory
                WHERE branch_id = ? AND product_id = ?;
            """, (BRANCH_ID, pid))
            row = cur.fetchone()
            if row is None:
                raise Exception(f"Inventory record missing for product_id={pid}")
            current_stock = row[0]
            if item["qty"] > current_stock:
                raise Exception(f"Not enough stock for product_id={pid} ({item['name']}). Available: {current_stock}")

        # Compute total amount
        total_amount = sum(item["qty"] * item["unit_price"] for item in cart.values())

        # Insert into Sale (use SQLite datetime('now') for timestamp)
        cur.execute("""
            INSERT INTO Sale (branch_id, sale_datetime, total_amount)
            VALUES (?, datetime('now'), ?);
        """, (BRANCH_ID, total_amount))

        sale_id = cur.lastrowid

        # Insert SaleItem rows & update Inventory
        for pid, item in cart.items():
            qty = item["qty"]
            price = item["unit_price"]

            # Insert sale item
            cur.execute("""
                INSERT INTO SaleItem (sale_id, product_id, quantity, unit_price, discount)
                VALUES (?, ?, ?, ?, 0);
            """, (sale_id, pid, qty, price))

            # Update inventory
            cur.execute("""
                UPDATE Inventory
                SET quantity = quantity - ?
                WHERE branch_id = ? AND product_id = ?;
            """, (qty, BRANCH_ID, pid))

        conn.commit()
        print(f"\n Checkout completed. Sale ID: {sale_id}, Total: {total_amount:.2f}\n")
        cart.clear()

    except Exception as e:
        conn.rollback()
        print(f"\n Checkout failed: {e}\n")
    finally:
        conn.close()


# ========= STATISTICS LOGIC =========

# IMPORTANT Needs tob tested after adding queries to queries.sql
# IMPORTANT Needs to be implemented with the correct names of the queries added.

def show_statistics():
    """Run predefined SQL statistics from queries.sql."""
    queries = load_queries()

    print("\n=== Statistics ===")
    print("1. Sales History")
    print("2. Top Selling Products")
    print("3. Revenue Per Day")
    print("4. Inventory Counts")
    print("5. Products Never Sold")
    print("6. Revenue by Category")
    print("7. Total Sales")
    print("0. Back")
    
    choice = input("Choose an option: ").strip()

    conn = get_connection()
    cur = conn.cursor()

    try:
        if choice == "1":
            sql = queries.get("sales_history")
            if not sql:
                print("Query not found: sales_history\n")
            else:
                cur.execute(sql)
                rows = cur.fetchall()
                print("\n=== Sales History ===")
                for row in rows:
                    print(row)
                print()

        elif choice == "2":
            sql = queries.get("top_selling_products")
            if not sql:
                print("Query not found: top_selling_products\n")
            else:
                cur.execute(sql)
                rows = cur.fetchall()
                print("\n=== Top Selling Products ===")
                for row in rows:
                    print(row)
                print()

        elif choice == "3":
            sql = queries.get("revenue_per_day")
            if not sql:
                print("Query not found: revenue_per_day\n")
            else:
                cur.execute(sql)
                rows = cur.fetchall()
                print("\n=== Revenue Per Day ===")
                for row in rows:
                    print(row)
                print()
        elif choice == "4":
            sql = queries.get("inventory_counts")
            if not sql:
                print("Query not found: inventory_counts\n")
            else:
                cur.execute(sql)
                rows = cur.fetchall()
                print("\n=== Inventory Counts ===")
                for row in rows:
                    print(row)
                print()
        elif choice == "5":
            sql = queries.get("products_never_sold")
            if not sql:
                print("Query not found: products_never_sold\n")
            else:
                cur.execute(sql)
                rows = cur.fetchall()
                print("\n=== Products Never Sold ===")
                for row in rows:
                    print(row)
                print()
        elif choice == "6":
            sql = queries.get("revenue_by_category")
            if not sql:
                print("Query not found: revenue_by_category\n")
            else:
                cur.execute(sql)
                rows = cur.fetchall()
                print("\n=== Revenue by Category ===")
                for row in rows:
                    print(row)
                print()
        elif choice == "7":
            sql = queries.get("total_sales")
            if not sql:
                print("Query not found: total_sales\n")
            else:
                cur.execute(sql)
                rows = cur.fetchall()
                print("\n=== Total Sales ===")
                for row in rows:
                    print(row)
                print()
        else:
            # 0 or anything else → just go back
            print()

    finally:
        conn.close()

def load_queries():
    """Parses queries.sql and returns a dict of {name: sql}."""
    if not os.path.exists(QUERIES_PATH):
        print("queries.sql not found.")
        return {}

    queries = {}
    current_name = None
    current_sql = []

    with open(QUERIES_PATH, "r") as f:
        for line in f:
            line_strip = line.strip()

            # Detect "name:" comment
            if line_strip.startswith("-- name:"):
                # Save previous query if exists
                if current_name and current_sql:
                    queries[current_name] = "\n".join(current_sql).strip()
                # Start new query
                current_name = line_strip.replace("-- name:", "").strip()
                current_sql = []
            else:
                # Add SQL lines
                if line_strip != "":
                    current_sql.append(line.rstrip())

        # Save last query
        if current_name and current_sql:
            queries[current_name] = "\n".join(current_sql).strip()

    return queries


# ========= MENU / MAIN LOOP =========

def show_menu():
    print("=== LSU Market CLI ===")
    print("1. List available products")
    print("2. Add product to cart")
    print("3. View cart")
    print("4. Checkout")
    print("5. Statistics")
    print("6. Exit")

def main():
    print("Connected to LSU Market database.\n")

    while True:
        show_menu()
        choice = input("Choose an option: ").strip()

        if choice == "1":
            list_available_products()
        elif choice == "2":
            add_to_cart()
        elif choice == "3":
            view_cart()
        elif choice == "4":
            checkout()
        elif choice == "5":
            show_statistics() 
        elif choice == "6":
            print("Goodbye.")
            break
        else:
            print("Invalid option. Try again.\n")


if __name__ == "__main__":
    main()
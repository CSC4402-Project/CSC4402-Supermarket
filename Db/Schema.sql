PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS SaleItem;
DROP TABLE IF EXISTS Sale;
DROP TABLE IF EXISTS Inventory;
DROP TABLE IF EXISTS Product;
DROP TABLE IF EXISTS StoreBranch;

CREATE TABLE StoreBranch (
    branch_id   INTEGER PRIMARY KEY AUTOINCREMENT,
    name        TEXT NOT NULL,
    address     TEXT,
    phone       TEXT
);

CREATE TABLE Product (
    product_id  INTEGER PRIMARY KEY AUTOINCREMENT,
    name        TEXT NOT NULL,
    barcode     TEXT UNIQUE,
    unit_price  REAL NOT NULL,
    is_active   INTEGER NOT NULL DEFAULT 1
);

ALTER TABLE Product
ADD COLUMN category TEXT NOT NULL DEFAULT 'General';

CREATE TABLE Inventory (
    branch_id   INTEGER NOT NULL,
    product_id  INTEGER NOT NULL,
    quantity    INTEGER NOT NULL DEFAULT 0,
    PRIMARY KEY (branch_id, product_id),
    FOREIGN KEY (branch_id) REFERENCES StoreBranch(branch_id),
    FOREIGN KEY (product_id) REFERENCES Product(product_id)
);

CREATE TABLE Sale (
    sale_id        INTEGER PRIMARY KEY AUTOINCREMENT,
    branch_id      INTEGER NOT NULL,
    sale_datetime  TEXT NOT NULL,  
    total_amount   REAL NOT NULL,
    FOREIGN KEY (branch_id) REFERENCES StoreBranch(branch_id)
);

CREATE TABLE SaleItem (
    sale_id      INTEGER NOT NULL,
    product_id   INTEGER NOT NULL,
    quantity     INTEGER NOT NULL,
    unit_price   REAL NOT NULL,
    discount     REAL NOT NULL DEFAULT 0,
    PRIMARY KEY (sale_id, product_id),
    FOREIGN KEY (sale_id) REFERENCES Sale(sale_id),
    FOREIGN KEY (product_id) REFERENCES Product(product_id)
);

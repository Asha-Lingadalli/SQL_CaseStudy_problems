-- ============================================
-- 🏗️ CREATE DATABASE AND USE IT
-- ============================================

-- Uncomment if your SQL engine supports database creation
-- CREATE DATABASE sales_analytics_db;
-- USE sales_analytics_db;

-- ============================================
-- 🧾 TABLE: regions
-- ============================================
CREATE TABLE regions (
    region_id VARCHAR(5) PRIMARY KEY,
    region_name VARCHAR(50),
    country VARCHAR(50)
);

INSERT INTO regions (region_id, region_name, country) VALUES
('R1', 'West India', 'India'),
('R2', 'North India', 'India'),
('R3', 'South India', 'India'),
('R4', 'South India', 'India');

-- ============================================
-- 🏬 TABLE: stores
-- ============================================
CREATE TABLE stores (
    store_id VARCHAR(5) PRIMARY KEY,
    store_name VARCHAR(100),
    region_id VARCHAR(5),
    FOREIGN KEY (region_id) REFERENCES regions(region_id)
);

INSERT INTO stores (store_id, store_name, region_id) VALUES
('S001', 'Mumbai Central', 'R1'),
('S002', 'Delhi Mall', 'R2'),
('S003', 'Bangalore Plaza', 'R3'),
('S004', 'Kochi Center', 'R4');

-- ============================================
-- 👥 TABLE: customers
-- ============================================
CREATE TABLE customers (
    customer_id VARCHAR(5) PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    gender CHAR(1),
    join_date DATE,
    city VARCHAR(50)
);

INSERT INTO customers (customer_id, first_name, last_name, gender, join_date, city) VALUES
('C001', 'Asha', 'Lingadalli', 'F', '2022-01-10', 'Mumbai'),
('C002', 'Rahul', 'Mehta', 'M', '2022-02-14', 'Delhi'),
('C003', 'Priya', 'Sharma', 'F', '2023-03-25', 'Bengaluru'),
('C004', 'Arjun', 'Nair', 'M', '2023-06-30', 'Kochi');

-- ============================================
-- 📦 TABLE: products
-- ============================================
CREATE TABLE products (
    product_id VARCHAR(5) PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2)
);

INSERT INTO products (product_id, product_name, category, price) VALUES
('P001', 'Laptop Pro 15"', 'Electronics', 90000.00),
('P002', 'Smartphone X', 'Electronics', 50000.00),
('P003', 'Coffee Maker', 'Home Appliance', 7000.00),
('P004', 'Office Chair', 'Furniture', 12000.00),
('P005', 'Running Shoes', 'Sports', 6000.00);

-- ============================================
-- 💰 TABLE: transactions
-- ============================================
CREATE TABLE transactions (
    transaction_id VARCHAR(5) PRIMARY KEY,
    transaction_date DATE,
    customer_id VARCHAR(5),
    store_id VARCHAR(5),
    product_id VARCHAR(5),
    quantity INT,
    discount DECIMAL(5,2),
    total_amount DECIMAL(12,2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (store_id) REFERENCES stores(store_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO transactions (transaction_id, transaction_date, customer_id, store_id, product_id, quantity, discount, total_amount) VALUES
('T001', '2023-07-01', 'C001', 'S001', 'P001', 1, 10, 81000.00),
('T002', '2023-07-03', 'C002', 'S002', 'P002', 2, 5, 95000.00),
('T003', '2023-07-05', 'C003', 'S003', 'P003', 3, 0, 21000.00),
('T004', '2023-07-10', 'C001', 'S001', 'P004', 1, 20, 9600.00),
('T005', '2023-07-15', 'C004', 'S004', 'P005', 2, 10, 10800.00),
('T006', '2023-08-01', 'C003', 'S003', 'P002', 1, 15, 42500.00),
('T007', '2023-08-05', 'C002', 'S002', 'P001', 1, 5, 85500.00),
('T008', '2023-08-12', 'C001', 'S001', 'P003', 2, 0, 14000.00),
('T009', '2023-08-25', 'C004', 'S004', 'P004', 1, 10, 10800.00),
('T010', '2023-09-02', 'C003', 'S003', 'P005', 2, 0, 12000.00);

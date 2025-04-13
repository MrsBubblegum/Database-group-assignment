-- Step 1: Create the global user
CREATE USER 'thato'@'%' IDENTIFIED BY 'Welcome_123';

GRANT ALL PRIVILEGES ON *.* TO 'thato'@'%' WITH GRANT OPTION;

-- Step 2: Create the database admin
CREATE USER 'amanda'@'%' IDENTIFIED BY 'Password@123!';

GRANT ALL PRIVILEGES ON bookstoredb.* TO 'amanda'@'localhost';

-- Step 3: Create an admin with privileges to two tables: country and book_language
CREATE USER 'lerato'@'%' IDENTIFIED BY 'Admin@1254!';

GRANT SELECT, INSERT, UPDATE, DELETE ON bookstoredb.country TO 'lerato'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON bookstoredb.book_language TO 'lerato'@'localhost';


-- Global Admin Role
CREATE ROLE 'global_admin_role';

-- Database Admin Role (BookStoredb only)
CREATE ROLE 'bookstore_admin_role';

-- Table-level Admin Role (for country and book_language)
CREATE ROLE 'table_editor_role';


-- Global Admin can do anything, anywhere
GRANT ALL PRIVILEGES ON *.* TO 'global_admin_role' WITH GRANT OPTION;

-- BookStore Admin has full control over BookStore database
GRANT ALL PRIVILEGES ON bookstoredb.* TO 'bookstore_admin_role' WITH GRANT OPTION;

-- Table Editor can manage specific tables
GRANT SELECT, INSERT, UPDATE, DELETE ON bookstoredb.country TO 'table_editor_role';
GRANT SELECT, INSERT, UPDATE ON bookstoredb.book_language TO 'table_editor_role';

-- Assign global admin to Thato
GRANT 'global_admin_role' TO 'thato'@'%';
SET DEFAULT ROLE 'global_admin_role' TO 'thato'@'%';

-- Assign BookStoredb admin to Amanda
GRANT 'bookstore_admin_role' TO 'amanda'@'%';
SET DEFAULT ROLE 'bookstore_admin_role' TO 'amanda'@'%';

-- Assign table-level editor to Lerato
GRANT 'table_editor_role' TO 'lerato'@'%';
SET DEFAULT ROLE 'table_editor_role' TO 'lerato'@'%';
FLUSH PRIVILEGES;

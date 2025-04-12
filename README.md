# Database-group-assignment
This hands-on project provides valuable experience in efficiently structuring databases to handle large, complex data. Team members: Mandla Jiane, Thembelani Bukali & Cherozade Bhayat

# Bookstore Database Schema

This repository contains the database schema for a MySQL bookstore management system. The schema is designed to support a comprehensive bookstore operation, including customer management, inventory tracking, order processing, and more.

## Schema Overview

The database consists of 15 tables that model the relationships between various entities in a bookstore business:

### Core Entities

1. **Country**: Stores country information
2. **Address**: Stores address details with country references
3. **Customer**: Manages customer personal information
4. **Book**: Contains book information including pricing and inventory
5. **Author**: Stores author details
6. **Publisher**: Tracks book publishers and their addresses

### Relationship Tables

7. **Customer_Address**: Manages the many-to-many relationship between customers and addresses
8. **Address_Status**: Categorizes addresses (current, old, etc.)
9. **Book_Author**: Manages the many-to-many relationship between books and authors
10. **Book_Language**: Stores language options for books

### Order Processing

11. **Cust_Order**: Tracks customer orders with shipping and pricing information
12. **Order_Line**: Contains individual line items within an order
13. **Order_Status**: Defines possible order statuses (pending, shipped, etc.)
14. **Order_History**: Maintains a history of status changes for orders
15. **Shipping_Method**: Stores available shipping methods and costs

## Entity Relationship Diagram

![Bookstore Database Entity Relationship Diagram] 
./images/bookstore_erd.png

__Note: The above ERD shows all tables and their relationships in the bookstore database system.__

## Table Descriptions

### 1. Country
Stores country information for addresses.
- country_id (PK): Unique identifier for countries
- country_name: Name of the country

### 2. Address
Stores address details.
- address_i (PK): Unique identifier for addresses
- street: Street address
- city: City name
- postal_code: Postal/zip code
- country_id (FK): Reference to the country table

### 3. Address Status
Categorizes addresses as current, old, etc.
- status_id (PK): Unique identifier for address statuses
- status_name: Name of the status (e.g., 'current', 'old')

### 4. Customer
Manages customer personal details.
- customer_id (PK): Unique identifier for customers
- first_name: Customer's first name
- last_name: Customer's last name
- email: Unique email address
- phone: Contact phone number

### 5. Customer Address
Handles the many-to-many relationship between customers and addresses.
- customer_id (PK, FK): Reference to customer
- address_id (PK, FK): Reference to address
- status_id (FK): Reference to address status

### 6. Publisher
Stores publisher information.
- publisher_id (PK): Unique identifier for publishers
- name: Publisher name
- address_id (FK): Reference to publisher's address

### 7. Book Language
Stores available book languages.
- language_id (PK): Unique identifier for languages
- language_name: Name of the language

### 8. Book
Contains book details and inventory information.
- book_id (PK): Unique identifier for books
- title: Book title
- isbn: International Standard Book Number (unique)
- publication_year: Year of publication
- publisher_id (FK): Reference to publisher
- language_id (FK): Reference to book language
- price: Book price
- stock_quantity: Available inventory

### 9. Author
Stores author information.
- author_id (PK): Unique identifier for authors
- first_name: Author's first name
- last_name: Author's last name
- bio: Author's biographical information

### 10. Book Author
Manages the many-to-many relationship between books and authors.
- book_id (PK, FK): Reference to book
- author_id (PK, FK): Reference to author

### 11. Shipping Method
Stores shipping options.
- shipping_method_id (PK): Unique identifier for shipping methods
- method_name: Name of the shipping method
- cost: Shipping cost

### 12. Order Status
Defines possible order statuses.
- status_id (PK): Unique identifier for order statuses
- status_name: Name of the status (e.g., 'pending', 'shipped')

### 13. Customer Order
Tracks customer orders.
- order_id (PK): Unique identifier for orders
- customer_id (FK): Reference to customer
- order_date: Date and time of order creation
- shipping_method_id (FK): Reference to shipping method
- customer_address: Reference to customer's address
- total_amount: Total order amount

### 14. Order Line
Contains individual line items within an order.
- order_line_id (PK): Unique identifier for order lines
- order_id (FK): Reference to the order
- book_id (FK): Reference to the ordered book
- quantity: Number of books ordered
- unit_price: Price per book at time of order

### 15. Order History
Tracks status changes for orders.
- history_id (PK): Unique identifier for history entries
- order_id (FK): Reference to the order
- status_id (FK): Reference to order status
- status_date: Date and time of status change

## Notes on Schema Design

1. **Normalization**: The schema follows third normal form (3NF) to minimize data redundancy.

2. **Audit Trail**: Order history provides a way to track changes to order status over time.

3. **Multiple Authors**: The book_author table allows multiple authors per book.

4. **Addresses**: The customer_address table tracks multiple addresses per customer with their status.

5. **Data Integrity**: Foreign key constraints ensure referential integrity across the database.

## Known Issues

- The *customer_address* reference in the *cust_order* table should be adjusted to reference the composite key of *customer_address* or be changed to directly reference an *address_id*.

## Usage Examples

### Sample Queries

#### Get all books by a specific author:
- sql
SELECT b.title, b.isbn, b.price
FROM book b
JOIN book_author ba ON b.book_id = ba.book_id
JOIN author a ON ba.author_id = a.author_id
WHERE a.last_name = 'Smith';


#### Find total sales by book:
- sql
SELECT b.title, SUM(ol.quantity) AS total_sold
FROM book b
JOIN order_line ol ON b.book_id = ol.book_id
GROUP BY b.book_id, b.title
ORDER BY total_sold DESC;

#### Get customer order history:
- sql
SELECT c.first_name, c.last_name, co.order_id, co.order_date, os.status_name
FROM customer c
JOIN cust_order co ON c.customer_id = co.customer_id
JOIN order_history oh ON co.order_id = oh.order_id
JOIN order_status os ON oh.status_id = os.status_id
WHERE c.customer_id = 1
ORDER BY oh.status_date DESC;

*******************************************************************************************************************************
__Security Practices in Team Collaboration__
During our collaboration on this database schema project, our team of three implemented several security best practices:
*Communication Channels*
Encrypted Messaging: We used WhatsApp which offers end-to-end encryption for our quick communications and file sharing.
Discord Private Channels: Created a private, invitation-only channel to ensure only team members could access our discussions.
Access Control: Limited server/channel permissions to only the three team members.

*Document Sharing*
Email Security: Used our institutional email accounts with their built-in security features.
Verified recipient email addresses before sending sensitive documents.
Avoided sending database credentials or sensitive testing data via email.

*Version Control and Data Protection*
Sanitized Data: Used sample/dummy data for testing rather than real customer information.
Consistent Backups: Each team member maintained local backups of their work.
File Integrity: Verified file integrity after transfers by comparing checksums or visual inspection.

*Password and Access Management*
Strong Database Credentials: Used complex passwords for any test database instances.
No Credential Sharing: Avoided sharing database credentials in plain text through our communication channels.
Separate Development Environments: Each team member worked in their own isolated development environment to prevent accidental changes to others' work.

*Compliance Considerations*
Schema Design: Designed the database schema with security in mind, including proper normalization and access control considerations.
SQL Injection Prevention: Wrote queries with parameterization in mind to prevent SQL injection vulnerabilities.

This approach allowed us to collaborate effectively while maintaining appropriate security standards for an academic database project.

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

*Security Measures*
To ensure secure and controlled access to the database, the following security practices were implemented:

__Role-Based Access Control (RBAC):__

Defined roles such as book_manager and history_manager with specific table-level privileges.

Assigned roles to corresponding admin users (book_admin, history_admin) to enforce the principle of least privilege.

__Table-Specific Privileges:__

Limited user access to specific tables (book and order_history) instead of granting full database access.

Granted only essential privileges (e.g., SELECT, INSERT, UPDATE, DELETE) per role.

__User Management:__

Created individual users with secure passwords.

Used the localhost host restriction to limit access to local connections (can be adjusted for remote access if needed).

Set default roles for users to streamline permission management.

__Privilege Flushing:__

Used FLUSH PRIVILEGES to ensure all changes were applied immediately.

These measures help reduce the attack surface, protect sensitive data, and maintain structured access control over the BookStoredb system.

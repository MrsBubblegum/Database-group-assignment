USE bookstoredb;
-- Insert into Country
INSERT INTO country (country_name) VALUES
('USA'), ('Canada'), ('UK'), ('South Africa'), ('Australia'), ('India'), ('Germany');

-- Insert into Address Status
INSERT INTO address_status (status_name) VALUES
('current'), ('old');

-- Insert into Address (assuming each address has a matching country_id from the above)
INSERT INTO address (street, city, postal_code, country_id) VALUES
('123 Main St', 'New York', '10001', 1),
('456 Maple Ave', 'Toronto', 'M4B 1B3', 2),
('78 Oxford Rd', 'London', 'W1D 3QX', 3),
('12 Kloof St', 'Cape Town', '8001', 4),
('99 George St', 'Sydney', '2000', 5),
('A-34, MG Road', 'Delhi', '110001', 6),
('Hauptstrasse 5', 'Berlin', '10115', 7);

-- Insert into Customer
INSERT INTO customer (first_name, last_name, email, phone) VALUES
('Alice', 'Smith', 'alice@gmail.com', '1234567890'),
('Bob', 'Johnson', 'bob@yahoo.com', '2345678901'),
('Carol', 'White', 'carol@gmail.com', '3456789012'),
('David', 'Brown', 'david@gmail.com', '4567890123'),
('Eva', 'Green', 'eva@outlook.com', '5678901234'),
('Frank', 'Lee', 'frank@outlook.com', '6789012345'),
('Grace', 'Adams', 'grace@gmail.com', '7890123456');

-- Insert into Customer Address (assuming status_id = 1 for 'current')
INSERT INTO customer_address (customer_id, address_id, status_id) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 1),
(4, 4, 1),
(5, 5, 1),
(6, 6, 1),
(7, 7, 1);

-- Insert into Publisher
INSERT INTO publisher (name, address_id) VALUES
('Penguin Books', 1),
('HarperCollins', 2),
('Oxford Press', 3),
('Naledi Publishing', 4),
('Allen & Unwin', 5),
('Penguin Random House India', 6),
('Springer Verlag', 7);

-- Insert into Book Language
INSERT INTO book_language (language_name) VALUES
('English'), ('French'), ('German'), ('Spanish'), ('Afrikaans');

-- Insert into Book
INSERT INTO book (title, isbn, publication_year, publisher_id, language_id, price, stock_quantity) VALUES
('The Great Escape', '9781234567897', 2020, 1, 1, 15.99, 50),
('Maple Leaf Stories', '9782345678901', 2021, 2, 1, 12.50, 30),
('Royal Chronicles', '9783456789012', 2022, 3, 1, 18.75, 40),
('Cape Tales', '9784567890123', 2023, 4, 5, 16.00, 25),
('Outback Wonders', '9785678901234', 2021, 5, 1, 14.25, 35),
('Delhi Diaries', '9786789012345', 2020, 6, 1, 13.99, 20),
('Berlin Science', '9787890123456', 2022, 7, 3, 22.00, 15);

-- Insert into Author
INSERT INTO author (first_name, last_name) VALUES
('Mark', 'Twain'),
('Margaret', 'Atwood'),
('J.K.', 'Rowling'),
('Zakes', 'Mda'),
('Tim', 'Winton'),
('Chetan', 'Bhagat'),
('Hermann', 'Hesse');

-- Link Books to Authors
INSERT INTO book_author (book_id, author_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7);

-- Insert into Shipping Method
INSERT INTO shipping_method (method_name, cost) VALUES
('Standard Shipping', 5.00),
('Express Shipping', 10.00),
('Overnight Shipping', 20.00);

-- Insert into Order Status
INSERT INTO order_status (status_name) VALUES
('pending'),
('shipped'),
('delivered'),
('cancelled');

-- Insert into Customer Orders
-- Assuming: 1 order per customer using different shipping methods and customer_addressIDs match customer_id
INSERT INTO cust_order (customer_id, shipping_method_id, customer_addressID, total_amount) VALUES
(1, 1, 1, 15.99),
(2, 2, 2, 25.00),
(3, 3, 3, 18.75),
(4, 1, 4, 32.00),
(5, 2, 5, 28.50),
(6, 1, 6, 13.99),
(7, 3, 7, 44.00);

-- Insert into Order Line (1 book per order)
INSERT INTO order_line (order_id, book_id, quantity, unit_price) VALUES
(1, 1, 1, 15.99),
(2, 2, 2, 12.50),
(3, 3, 1, 18.75),
(4, 4, 2, 16.00),
(5, 5, 2, 14.25),
(6, 6, 1, 13.99),
(7, 7, 2, 22.00);

-- Insert into Order History
-- Each order gets at least a 'pending' status recorded
INSERT INTO order_history (order_id, status_id) VALUES
(1, 1),
(2, 1),
(3, 2), -- already shipped
(4, 1),
(5, 3), -- delivered
(6, 4), -- cancelled
(7, 1);

-- Querries to create tables
CREATE TABLE menu(
	id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	name VARCHAR(128) NOT NULL UNIQUE,
	price NUMERIC(8, 2) NOT NULL CHECK (price >= 0)
);

CREATE TABLE students(
	id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	name VARCHAR(128) NOT NULL
);

CREATE TABLE orders(
	id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	order_date DATE NOT NULL
);

CREATE TABLE order_items(
	id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	order_id INTEGER NOT NULL REFERENCES orders(id),
	student_id INTEGER NOT NULL REFERENCES students(id),
	menu_item_id INTEGER NOT NULL REFERENCES menu(id),
	quantity INTEGER NOT NULL CHECK (quantity > 0)
);

-- Querries to insert data into tables
INSERT INTO menu (name, price) VALUES
('Pizza', 8.50),
('Burger', 7.49),
('Fries', 3.20),
('Cola', 2.00),
('Water', 0.99),
('Taco', 4.29);

INSERT INTO students (name) VALUES
('Gosho'),
('Pesho'),
('Ivan'),
('Hristo'),
('Nikolay');

INSERT INTO orders (order_date) VALUES
('2026-10-27'),
('2026-10-27'),
('2026-10-26');

INSERT INTO order_items (order_id, student_id, menu_item_id, quantity) VALUES
(1, 1, 1, 2),
(1, 1, 4, 1),
(1, 2, 2, 1),
(1, 2, 3, 2),
(1, 3, 3, 1);

INSERT INTO order_items (order_id, student_id, menu_item_id, quantity) VALUES
(2, 1, 3, 1),
(2, 2, 1, 1),
(2, 3, 2, 2),
(2, 3, 5, 2);

-- Querry to show error if trying to insert an invalid row
INSERT INTO order_items (order_id, student_id, menu_item_id, quantity) VALUES (999, 1, 1, 1);

-- Error message:
-- ERROR:  insert or update on table "order_items" violates foreign key constraint "order_items_order_id_fkey"
-- Key (order_id)=(999) is not present in table "orders". 
-- SQL state: 23503
-- Detail: Key (order_id)=(999) is not present in table "orders".
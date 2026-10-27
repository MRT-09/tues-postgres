# tues-postgres

## Assignment 2
### Table Menu:
#### id - the primary key
#### name - the menu item name, must be unique
#### price - the menu item price, does not accept negative prices

### Table Students:
#### id - the primary key
#### name - the name of the student

### Table Orders:
#### id - the primary key
#### order_date - the date of the order

### Table Order Items - junction table:
#### id - the primary key
#### order_id - the id of the order
#### student_id - the id of the student
#### menu_item_id - the id of the item
#### quantity - the item quantity

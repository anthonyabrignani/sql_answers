--Select all the records from the "Customers" table. 
SELECT * FROM customers;

--Get distinct countries from the Customers table.
SELECT country FROM customers;

--Get all the records from the table Customers where the Customer’s ID starts with “BL”.
SELECT * FROM customers WHERE customer_id='BLAUS' OR customer_id='BLONP';

--Get the first 100 records of the orders table.
SELECT * FROM orders WHERE order_id < 10348;

--Get all customers that live in the postal codes 1010, 3012, 12209, and 05023.
SELECT * FROM customers WHERE postal_code='1010' OR postal_code='3012' OR postal_code='12209' OR postal_code='05023';

--Get all orders where the ShipRegion is not equal to NULL.
SELECT * FROM orders WHERE ship_region <> 'null';

--Get all customers ordered by the country, then by the city.
SELECT * FROM customers ORDER BY country;
SELECT * FROM customers ORDER BY city;

--Add a new customer to the customers table. You can use whatever values.
INSERT INTO customers (customer_id, company_name, contact_name, contact_title, address, city, region, postal_code, country) VALUES ('ZENKO', 'Mori Productions', 'Anthony Abrignani', 'Rank One Warlord', '123 Rainbow Lane', 'Detroit', 'MI', '48225', 'USA');

--Update all ShipRegion to the value ‘EuroZone’ in the Orders table, where the ShipCountry is equal to France.  
UPDATE orders SET ship_region='EuroZone' WHERE ship_country='France';

--Delete all orders from `order_details` that have a quantity of 1. 
DELETE FROM order_details WHERE quantity=1;

--Calculate the average, max, and min of the quantity at the `order details` table.
SELECT AVG(quantity) FROM order_details;
SELECT MAX(quantity) FROM order_details;
SELECT MIN(quantity) FROM order_details;

--Calculate the average, max, and min of the quantity at the `order details` table, grouped by the orderid. 
SELECT AVG(quantity) FROM order_details GROUP BY order_id;
SELECT MAX(quantity) FROM order_details GROUP BY order_id;
SELECT MIN(quantity) FROM order_details GROUP BY order_id;

--Find the CustomerID that placed order 10290 (orders table)
SELECT customer_id FROM orders WHERE order_id=10290;

--Do an inner join, left join, right join on orders and customers tables.  (These are three separate queries, one for each type of join.)
SELECT * FROM orders INNER JOIN customers ON orders.customer_id = customers.customer_id;
SELECT * FROM orders LEFT JOIN customers ON orders.customer_id = customers.customer_id;
SELECT * FROM orders RIGHT JOIN customers ON orders.customer_id = customers.customer_id;

--Use a join to get the ship city and ship country of all the orders which are associated with an employee who is in London.
SELECT orders.ship_city, orders.ship_country FROM orders
JOIN employees ON employees.employee_id = orders.employee_id
WHERE employees.city = 'London';

--Use a join to get the ship name of all orders that include a discontinued product. (See orders, order_details, and products. 1 means discontinued.)
SELECT orders.ship_name FROM order_details
JOIN orders ON order_details.order_id = orders.order_id
JOIN products ON order_details.product_id = products.product_id
WHERE products.discontinued = 1;

--Get first names of all employees who report to no one.
SELECT first_name FROM employees WHERE reports_to IS null;

--Get first names of all employees who report to Andrew.
SELECT first_name FROM employees WHERE reports_to = 2;
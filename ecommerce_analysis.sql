--1--Top 5 Cities by Number of Orders:

SELECT city, COUNT(order_id) AS total_orders
FROM orders
GROUP BY city
ORDER BY total_orders DESC
LIMIT 5;

--2--Minimum, Maximum, and Average Total Order Prices:

SELECT MIN(order_total) AS min_order, 
       MAX(order_total) AS max_order, 
       AVG(order_total) AS avg_order
FROM orders;

--3--Top 5 Products by Total Number of Items Ordered:

SELECT product_name, SUM(quantity) AS total_items
FROM order_items
GROUP BY product_name
ORDER BY total_items DESC
LIMIT 5;

--4--Average Payment Value for Each Payment Type:

SELECT payment_type, AVG(payment_value) AS avg_payment
FROM order_payments
GROUP BY payment_type;

--5--Count of Each Payment Type:

SELECT payment_type, COUNT(payment_id) AS payment_count
FROM order_payments
GROUP BY payment_type;

--6--Most Reviewed Products:

SELECT product_name, COUNT(review_id) AS total_reviews
FROM order_reviews
JOIN order_items ON order_reviews.order_id = order_items.order_id
GROUP BY product_name
ORDER BY total_reviews DESC
LIMIT 5;

--7--Top 5 Sellers by Total Sales:

SELECT seller_name, SUM(order_total) AS total_sales
FROM orders
JOIN sellers ON orders.seller_id = sellers.seller_id
GROUP BY seller_name
ORDER BY total_sales DESC
LIMIT 5;

--8--Top 5 Dates with Highest Number of Orders Delivered by Carriers:

SELECT delivery_date, COUNT(order_id) AS total_delivered
FROM orders
WHERE delivery_status = 'Delivered'
GROUP BY delivery_date
ORDER BY total_delivered DESC
LIMIT 5;

--9--Customers with the Highest Average Order Value:

SELECT customer_name, AVG(order_total) AS avg_order_value
FROM orders
JOIN customers ON orders.customer_id = customers.customer_id
GROUP BY customer_name
ORDER BY avg_order_value DESC
LIMIT 5;

--10--Total Number of Products Sold in Each Category:

SELECT product_category, SUM(quantity) AS total_sold
FROM order_items
JOIN products ON order_items.product_id = products.product_id
GROUP BY product_category
ORDER BY total_sold DESC;

-- procedure to get quarterly sales report for a given year and a quarter
-- this returns product title, quantity and the revenue from each product
CALL `group32_v1.0`.get_sales_quantity(?, ?); -- replace ? with year and quarter respectively

-- procedure to get quarterly sales report for a given category, a year and a quarter
-- this returns product title, quantity and the revenue from each category
CALL `group32_v1.0`.get_sales_of_a_category(?, ?, ?); -- replace ? with category id, year and quarter respectively

-- procedure to get quarterly sales report for a given product id, a year and a quarter
-- this returns product title, quantity and the revenue from each product
CALL `group32_v1.0`.get_sales_of_a_product(?, ?, ?); -- replace ? with product id, year and quarter respectively

-- procedure to get number of orders placed for a given year and a quarter
-- this returns the number of orders placed
CALL `group32_v1.0`.get_orders_quantity(?, ?); -- replace ? with year and quarter respectively

-- procedure to get products with most number of sales
-- this returns product title and number of sales for each product
CALL `group32_v1.0`.get_most_sellings(?, ?, ?); -- replace ? with year, quarter and number of products respectively

-- Procedure to get the order details of a given customer, given the customer id
-- this returns date, title, quantity and unit price for each products ordered
CALL `group32_v1.0`.get_order_report(?); -- replace ? with the customer id

-- Procedure to get the most popular time for a given product
-- this returns the most popular time (year and month) for a given product with the total number of sales
CALL `group32_v1.0`.get_most_popular_time_for_product(?); -- replace ? with the product id

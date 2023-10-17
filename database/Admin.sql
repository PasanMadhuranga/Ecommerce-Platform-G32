-- procedure to get quarterly sales report for a given year and a quarter
-- this returns product title, quantity and the revenue from each product
CALL `group32_v1.0`.get_sales_quantity(?, ?); -- replace ? with year and quarter respectively

-- procedure to get number of orders placed for a given year and a quarter
-- this returns the number of orders placed
CALL `group32_v1.0`.get_orders_quantity(?, ?); -- replace ? with year and quarter respectively

-- procedure to products with most number of sales
-- this returns product title and number of sales for each product
CALL `group32_v1.0`.get_most_sellings(?, ?, ?); -- replace ? with year, quarter and number of products respectively

-- Procedure to get the order details of a given customer, given the customer id
-- this returns date, title, quantity and unit price for each products ordered
CALL `group32_v1.0`.get_order_report(?); -- replace ? with the customer id

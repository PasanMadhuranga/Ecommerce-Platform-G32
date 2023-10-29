DROP VIEW IF EXISTS product_sales;

CREATE VIEW product_sales AS
SELECT oi.Order_id, so.Cart_id, i.Product_id, oi.Item_id, oi.Unit_price, oi.Quantity, so.Date
FROM order_item oi
JOIN item i USING (item_id)
JOIN shop_order so USING (Order_id);

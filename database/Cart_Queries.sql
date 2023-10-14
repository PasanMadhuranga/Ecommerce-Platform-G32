
-- Get all the items in the cart for a given customer_id
SELECT 
	ci.Item_id, 
	ci.Quantity, 
	i.price, 
    ci.Quantity * i.price AS item_total
FROM cart_item ci
JOIN cart c USING (cart_id)
JOIN item i USING (Item_id)
WHERE Customer_id = ?; -- replace ? with the Customer_id 


-- Add item to cart query
-- Have to generate a dynamic query considering the number of items in the cart
INSERT INTO cart_item VALUES
    (?, ?), -- replace ? with the item_id and quantity respectively 
    (?, ?), -- replace ? with the item_id and qunatity respectively
    (?, ?); -- replace ? with the item_id and quantity respectively 


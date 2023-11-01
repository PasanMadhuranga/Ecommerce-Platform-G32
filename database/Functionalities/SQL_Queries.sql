-- Get all the details of a single product using given product_id
SELECT *, GetMinPrice(product_id) AS price
FROM product
WHERE product_id = ?; -- replace ? with the product_id


-- Get all the details of all the products in the database
SELECT *, GetMinPrice(product_id) AS price
FROM product;


-- Get the leaf categories of a single product using given product_id
SELECT c.name
FROM product_category pc
JOIN category c USING(category_id)
WHERE product_id = ?; -- replace ? with the product_id


-- Get the category hierarchy names for a given product_id
SELECT GetCategoryHierarchyNames(category_id) AS category_hierachy
FROM product_category
WHERE Product_id = ?; -- replace ? with the product_id 


-- Get the category hierarchy IDs for a given product_id
SELECT GetCategoryHierarchyIDs(category_id) AS category_hierachy
FROM product_category
WHERE Product_id = ?; -- replace ? with the product_id 


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

-- Adding a new product
call `group32_v1.0`.add_product
(
	'Produt Title', 
	'Sub Category1, Sub Category2, Sub Category3, Sub Category4, etc.', -- sub categories must be comma separated with a following whitespace
    'Product Description',
    113.113, -- Product weight in Kilograms
    'Product_SKU',
    'Product_image.png'
);

-- Add item to cart query
-- Have to generate a dynamic query considering the number of items in the cart
INSERT INTO cart_item VALUES
    (?, ?), -- replace ? with the item_id and quantity respectively 
    (?, ?), -- replace ? with the item_id and qunatity respectively
    (?, ?); -- replace ? with the item_id and quantity respectively 

-- query to get the minimum price of a product
SELECT GetMinPrice(?) AS min_price -- replace ? with the product_id


-- get all the products in a given category
SELECT 
	p.Product_id, 
	p.Title, 
    p.SKU, 
	p.Weight, 
    p.Description, 
    p.Image, 
    GetMinPrice(p.Product_id) AS price
FROM product_category pc
JOIN product p USING (product_id)
WHERE category_id = ?; -- replace ? with category_id


-- get relevant products when the user searches for a product
SELECT *
FROM product 
WHERE MATCH(Title, Description) AGAINST(?); -- replace ? with the search query

-- get the latest cart ID of a customer, given the customer ID
SELECT cart_id FROM cart c WHERE c.Customer_id = 3 ORDER BY Cart_id DESC LIMIT 1; -- replace ? with customer ID

-- get delivery dates for a given city
GetDeliveryDays(?); -- replace ? with the city name

--  get registered customer data, given the customer_id
SELECT First_name, Last_name, Email, Phone_number, Address_line1, Address_line2, City, Province, Zipcode
FROM customer
WHERE Customer_id = ? AND Is_registered = 1; -- replace ? with customer_id

-- get the latest cart ID of a customer, given the customer ID
SELECT cart_id FROM cart c WHERE c.Customer_id = ? ORDER BY Cart_id DESC LIMIT 1; -- replace ? with customer_id

-- get the product name, unit price and the total price, given the item ID and quantity
SELECT p.title AS title,i.price AS price, i.price * ? AS total_value FROM item i JOIN product p USING (Product_ID) WHERE i.item_ID = ?; -- replace ? with quantity and item id respectively

-- get the variants and attributes, given the item ID
SELECT t.attribute_name, t.variant_name 
FROM (SELECT a.attribute_id, a.name attribute_name, v.name variant_name FROM attribute a 
LEFT JOIN variant v USING(variant_id)) t 
RIGHT JOIN (SELECT * FROM item_configuration WHERE Item_id = ?) x 
USING(attribute_id);  -- replace ? with item id
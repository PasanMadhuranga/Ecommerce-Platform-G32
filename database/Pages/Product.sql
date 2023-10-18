-- Get all the details of a single product using given product_id
SELECT *, GetMinPrice(product_id) AS price
FROM product
WHERE product_id = ?; -- replace ? with the product_id


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

-- query to get the minimum price of a product
SELECT GetMinPrice(?) AS min_price -- replace ? with the product_id


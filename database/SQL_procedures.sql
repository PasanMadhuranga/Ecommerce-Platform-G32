-- insert a given variant name into the variant table if it does not exist
DROP PROCEDURE IF EXISTS insert_variant_if_not_exists;

DELIMITER  //

CREATE PROCEDURE insert_variant_if_not_exists 
(
	variant_name VARCHAR(50)
)
BEGIN
	IF (variant_name NOT IN (SELECT name FROM variant)) THEN
		INSERT INTO variant (name) VALUES (variant_name);
	END IF;
END //

DELIMITER  ;

-- insert a given attribute name into the attribute table if it does not exist
DROP PROCEDURE IF EXISTS insert_attribute_if_not_exists;

DELIMITER  //

CREATE PROCEDURE insert_attribute_if_not_exists
(
	attribute_name VARCHAR(50),
    variant_name VARCHAR(50)
)
BEGIN
	DECLARE variant_id INT DEFAULT 0;
    SELECT v.variant_id INTO variant_id FROM variant v WHERE name = variant_name;
    
	IF (attribute_name NOT IN (SELECT name FROM attribute a WHERE a.variant_id = variant_id)) THEN
		INSERT INTO attribute (variant_id, name) VALUES (variant_id, attribute_name);
	END IF;
END //

DELIMITER ;



DROP PROCEDURE IF EXISTS add_item;

DELIMITER  //

CREATE PROCEDURE add_item(
	SKU VARCHAR(50), -- Product SKU to get the product id
    Price DECIMAL(9,2), 
    Quantity INT,
    Image TEXT, -- image path
    No_of_variants INT,
    Variant_types VARCHAR(255), -- comma separated list of variant names
    Attributes VARCHAR(255) -- comma separated list of attribute names
)
BEGIN
	DECLARE NewItemID INT;
    DECLARE Product_id INT;
    DECLARE Curr_variant_id INT;
    DECLARE Curr_attribute_id INT;
    DECLARE Curr_variant VARCHAR(50);
    DECLARE Curr_attribute VARCHAR(50);

	START TRANSACTION;

	SELECT p.Product_id INTO Product_id FROM product p WHERE SKU = p.SKU;

    -- Add the item to the item table
    INSERT INTO item (Product_id, Price, Quantity, Image) VALUES (Product_id, Price, Quantity, Image);
    SET NewItemID = LAST_INSERT_ID();
    
    WHILE No_of_variants > 0 DO
		SET Curr_variant = TRIM(SUBSTRING_INDEX(TRIM(Variant_types), ',', 1));  -- Extract the first variant
        SET Curr_attribute = TRIM(SUBSTRING_INDEX(TRIM(Attributes), ',', 1));  -- Extract the first attribute
        CALL insert_variant_if_not_exists(Curr_variant);
        CALL insert_attribute_if_not_exists(Curr_attribute, Curr_variant);
        SELECT variant_id INTO Curr_variant_id FROM variant WHERE name = Curr_variant;
        SELECT attribute_id INTO Curr_attribute_id FROM attribute WHERE name = Curr_attribute AND variant_id = Curr_variant_id;
        INSERT INTO item_configuration VALUES (NewItemID, Curr_attribute_id);
        SET Variant_types = SUBSTRING(TRIM(Variant_types), LENGTH(SUBSTRING_INDEX(Variant_types, ',', 1)) + 2);  -- Remove the inserted Variant name and comma
        SET Attributes = SUBSTRING(TRIM(Attributes), LENGTH(SUBSTRING_INDEX(Attributes, ',', 1)) + 2);  -- Remove the inserted Attribute name and comma
		SET No_of_variants = No_of_variants - 1;
    END WHILE;

    COMMIT;
END //
DELIMITER ;


-- insert an user into the customer table
-- 1. If the user is registered, send an error message
-- 2. If the user is a new guest, insert the user into the customer table
-- 3. If the user has bought something as a guest, update the user's information
DROP PROCEDURE IF EXISTS add_user;

DELIMITER //

CREATE PROCEDURE add_user( 
    p_password VARCHAR(50),
    p_first_name VARCHAR(50), 
    p_last_name VARCHAR(50),
    p_email VARCHAR(255), 
    p_phone_num CHAR(10),
    p_address_l1 VARCHAR(50), 
    p_address_l2 VARCHAR(50), 
    p_city VARCHAR(50), 
    p_province VARCHAR(50), 
    p_zip CHAR(5))
BEGIN
    DECLARE user_status INT;
    SELECT isTheUserRegistered(p_email) INTO user_status;

    IF (user_status = 1) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'User already exists'; -- error
    ELSEIF (user_status = -1) THEN
        INSERT INTO customer (Password, First_name, Last_name, Email, Phone_number, Address_line1, Address_line2, City, Province, Zipcode, Is_registered)
        VALUES (p_password, p_first_name, p_last_name, p_email, p_phone_num, p_address_l1, p_address_l2, p_city, p_province, p_zip, 1);
    ELSE
        UPDATE customer
        SET Password = p_password, First_name = p_first_name, Last_name = p_last_name, Phone_number = p_phone_num, Address_line1 = p_address_l1, Address_line2 = p_address_l2, City = p_city, Province = p_province, Zipcode = p_zip, Is_registered = 1
        WHERE Email = p_email;
    END IF;
END //

DELIMITER ;

DROP procedure IF EXISTS `add_product`;

DELIMITER $$
USE `group32_v1.0`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_product`(
    IN product_title VARCHAR(255),
    IN category_list VARCHAR(255),
    IN product_description TEXT,
    IN product_weight DECIMAL(6,3),
    IN product_SKU VARCHAR(50),
    IN product_image TEXT
)
BEGIN
    DECLARE product_id INT;
    
    START TRANSACTION;
    
    -- Insert new product into product table
    INSERT INTO product (`Product_id`, `Title`, `Description`, `Weight`, `SKU`, `Image`)
    VALUES (DEFAULT, product_title, product_description, product_weight, product_SKU, product_image);
    
    -- Get ID of new product
    SET product_id = LAST_INSERT_ID();
    
    -- Split category_list into individual categories
    BEGIN
		DECLARE category_name VARCHAR(255);
		WHILE LENGTH(category_list) > 0 DO
			SET category_name = TRIM(SUBSTRING_INDEX(TRIM(category_list), ',', 1));
			SET category_list = SUBSTRING(TRIM(category_list), LENGTH(category_name)+2);
			
			-- Insert new category into product_category table
			INSERT INTO product_category (`Product_id`, `Category_id`)
			VALUES (product_id, (SELECT `Category_id` FROM `category` WHERE `Name` = category_name));
		END WHILE;
    END;
    COMMIT;
END$$

DELIMITER ;

-- Procedure to set start date and end date of the quarter to check, given the year and quarter
-- This procedure is called within other procedures
DROP PROCEDURE IF EXISTS `set_quarter_dates`;
DELIMITER &&
CREATE PROCEDURE `set_quarter_dates`
(
	IN `Year` INT (4),
	IN `Quarter` INT (1),
    OUT `from_date` CHAR(10),
    OUT `to_date` CHAR(10)
)
BEGIN
    CASE `Quarter`
		WHEN 1 THEN
			SET `from_date` = CONCAT(`Year`, '-01-01');
            SET `to_date` = CONCAT(`Year`, '-03-31');
		WHEN 2 THEN
			SET `from_date` = CONCAT(`Year`, '-04-01');
            SET `to_date` = CONCAT(`Year`, '-06-30');
		WHEN 3 THEN
			SET `from_date` = CONCAT(`Year`, '-07-01');
            SET `to_date` = CONCAT(`Year`, '-09-30');
		WHEN 4 THEN
			SET `from_date` = CONCAT(`Year`, '-10-01');
            SET `to_date` = CONCAT(`Year`, '-12-31');
		END CASE;
END&&
DELIMITER ;

-- procedure to get quarterly sales report for a given year and a quarter
-- this can be modified to get the total revenue of a given product by adding SUM() function
-- Query: call `group32_v1.0`.get_sales_quantity(?, ?); -- replace ? with year and quarter respectively
DROP PROCEDURE IF EXISTS `get_sales_quantity`;
DELIMITER &&
CREATE PROCEDURE `get_sales_quantity`
(
	IN `Year` INT (4),
	IN `Quarter` INT (1)
)
BEGIN
	DECLARE `from_date` CHAR(10);
	DECLARE `to_date` CHAR(10);
    
    CALL `set_quarter_dates`(`Year`, `Quarter`, `from_date`, `to_date`);

	SELECT p.Title, SUM(oi.Quantity), SUM(oi.Unit_price * oi.Quantity)
	FROM shop_order so
	JOIN order_item oi ON(so.Order_id = oi.Order_id)
	JOIN item i ON (oi.Item_id = i.Item_id)
	JOIN product p ON (i.Product_id = p.Product_id)
	WHERE so.`Date` BETWEEN `from_date` AND `to_date`
	GROUP BY p.Title;
END&&
DELIMITER ;


-- procedure to get quarterly sales report for a given category, a year and a quarter
-- this can be modified to get the total revenue of a given product by adding SUM() function
-- Query: call `group32_v1.0`.get_sales_of_a_category(?, ?, ?); -- replace ? with category id, year and quarter respectively
DROP PROCEDURE IF EXISTS `get_sales_of_a_category`;
DELIMITER &&
CREATE PROCEDURE `get_sales_of_a_category`
(
	IN `Category_id` INT (5),
	IN `Year` INT (4),
	IN `Quarter` INT (1)
)
BEGIN
	DECLARE `from_date` CHAR(10);
	DECLARE `to_date` CHAR(10);
    
    CALL `set_quarter_dates`(`Year`, `Quarter`, `from_date`, `to_date`);

	SELECT p.Title, SUM(oi.Quantity), SUM(oi.Unit_price * oi.Quantity)
	FROM shop_order so
	JOIN order_item oi ON(so.Order_id = oi.Order_id)
	JOIN item i ON (oi.Item_id = i.Item_id)
	JOIN product p ON (i.Product_id = p.Product_id)
    JOIN product_category c ON (p.product_id = c.product_id)
	WHERE 
		c.Category_id = `Category_id` AND
        so.`Date` BETWEEN `from_date` AND `to_date`
	GROUP BY p.Title;
END&&
DELIMITER ;

-- procedure to get quarterly sales report for a given product id, a year and a quarter
-- this can be modified to get the total revenue of a given product by adding SUM() function
-- Query: call `group32_v1.0`.get_sales_of_a_product(?, ?, ?); -- replace ? with product id, year and quarter respectively
DROP PROCEDURE IF EXISTS `get_sales_of_a_product`;
DELIMITER &&
CREATE PROCEDURE `get_sales_of_a_product`
(
	IN `Product_id` INT (5),
	IN `Year` INT (4),
	IN `Quarter` INT (1)
)
BEGIN
	DECLARE `from_date` CHAR(10);
	DECLARE `to_date` CHAR(10);
    
    CALL `set_quarter_dates`(`Year`, `Quarter`, `from_date`, `to_date`);

	SELECT p.Title, SUM(oi.Quantity), SUM(oi.Unit_price * oi.Quantity)
	FROM shop_order so
	JOIN order_item oi ON(so.Order_id = oi.Order_id)
	JOIN item i ON (oi.Item_id = i.Item_id)
	JOIN product p ON (i.Product_id = p.Product_id)
	WHERE 
		p.Product_id = `Product_id` AND
        so.`Date` BETWEEN `from_date` AND `to_date`
	GROUP BY p.Title;
END&&
DELIMITER ;


-- procedure to get number of orders placed for a given year and a quarter
-- Query: call `group32_v1.0`.get_orders_quantity(?, ?); -- replace ? with year and quarter respectively
DROP PROCEDURE IF EXISTS `get_orders_quantity`;
DELIMITER &&
CREATE PROCEDURE `get_orders_quantity`
(
IN `Year` INT (4),
IN `Quarter` INT (1)
)
BEGIN
	DECLARE `from_date` CHAR(10);
	DECLARE `to_date` CHAR(10);
    
    CALL `set_quarter_dates`(`Year`, `Quarter`, `from_date`, `to_date`);

	SELECT COUNT(*)
    -- INTO `Quantity`
	FROM shop_order so
	WHERE so.`Date` BETWEEN `from_date` AND `to_date`;
END&&
DELIMITER ;

-- procedure to products with most number of sales
-- Query: call `group32_v1.0`.get_most_sellings(?, ?, ?); -- replace ? with year, quarter and number of products respectively
DROP PROCEDURE IF EXISTS `get_most_sellings`;
DELIMITER &&
CREATE PROCEDURE `get_most_sellings`
(
	IN `Year` INT (4),
	IN `Quarter` INT (1),
    IN `Limit` INT
)
BEGIN
	DECLARE `from_date` CHAR(10);
	DECLARE `to_date` CHAR(10);
    
    CALL `set_quarter_dates`(`Year`, `Quarter`, `from_date`, `to_date`);
    
	SELECT p.Title, SUM(oi.Quantity)
	FROM shop_order so
	JOIN order_item oi ON(so.Order_id = oi.Order_id)
	JOIN item i ON (oi.Item_id = i.Item_id)
	JOIN product p ON (i.Product_id = p.Product_id)
	WHERE so.`Date` BETWEEN `from_date` AND `to_date`
	GROUP BY p.Title
    ORDER BY SUM(oi.Quantity) DESC
    LIMIT `Limit`;
END&&
DELIMITER ;


-- Procedure to get the order details of a given customer, given the customer id
-- Query: call `group32_v1.0`.get_order_report(?); -- replace ? with the customer id
DROP PROCEDURE IF EXISTS `get_order_report`;
DELIMITER &&
CREATE PROCEDURE `get_order_report`
(
	IN `Customer_ID` INT (4)
)
BEGIN
	SELECT DATE(so.Date), p.Title, oi.Quantity, oi.Unit_price
	FROM shop_order so
	JOIN order_item oi ON(so.Order_id = oi.Order_id)
	JOIN item i ON (oi.Item_id = i.Item_id)
	JOIN product p ON (i.Product_id = p.Product_id)
	JOIN cart c ON (so.Cart_id = c.Cart_id)
	WHERE c.Customer_id = `Customer_id`
	ORDER BY so.Date DESC;
END&&
DELIMITER ;


-- Procedure to get the most popular time for a given product
-- Query: call `group32_v1.0`.get_most_popular_time_for_product(?); -- replace ? with the product id
DROP PROCEDURE IF EXISTS `get_most_popular_time_for_product`;

DELIMITER //
CREATE PROCEDURE `get_most_popular_time_for_product`(IN given_product_id INT)
BEGIN
    SELECT 
        YEAR(o.Date) AS OrderYear,
        MONTH(o.Date) AS OrderMonth,
        SUM(oi.Quantity) AS TotalOrders
    FROM 
        item AS i
    JOIN 
        order_item AS oi ON i.Item_id = oi.Item_id
    JOIN 
        shop_order AS o ON oi.Order_id = o.Order_id
    WHERE 
        i.Product_id = given_product_id
    GROUP BY 
        YEAR(o.Date), MONTH(o.Date)
    ORDER BY 
        TotalOrders DESC
    LIMIT 1;
END //
DELIMITER ;
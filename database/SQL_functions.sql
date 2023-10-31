-- Function to get the category heirachy names of a given cateegory id
DROP FUNCTION IF EXISTS GetCategoryHierarchyNames;
DELIMITER //

CREATE FUNCTION GetCategoryHierarchyNames(p_Category_id INT) RETURNS TEXT
READS SQL DATA
BEGIN

    DECLARE v_result TEXT DEFAULT '';
    DECLARE done INT DEFAULT 0;
    DECLARE v_name VARCHAR(255);
    DECLARE cur CURSOR FOR SELECT Name FROM temp_hierarchy;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    -- Create a temporary table to store the results
    DROP TEMPORARY TABLE IF EXISTS temp_hierarchy;
    CREATE TEMPORARY TABLE temp_hierarchy(Name VARCHAR(255));

    -- Insert the category names into the temporary table
    INSERT INTO temp_hierarchy
    WITH RECURSIVE CategoryHierarchy AS (
        -- Base Case
        SELECT Category_id, Name, Parent_Category_id
        FROM category
        WHERE Category_id = p_Category_id

        UNION ALL

        -- Recursive Step
        SELECT c.Category_id, c.Name, c.Parent_Category_id
        FROM category c
        JOIN CategoryHierarchy ch ON c.Category_id = ch.Parent_Category_id
    )
    SELECT Name FROM CategoryHierarchy;

    -- Convert the temporary table rows to a single TEXT result
    -- You can adjust this section based on your preferred format
    OPEN cur;
    read_loop: LOOP
        FETCH cur INTO v_name;
        IF done THEN
            LEAVE read_loop;
        END IF;
        SET v_result = CONCAT(v_result, v_name, ',');  -- Add each name to the result with a comma separator
    END LOOP;
    CLOSE cur;

    -- Return the result
    RETURN v_result;

END //

DELIMITER ;



-- Function to get the category hierarchy IDs of a given cateegory id
DROP FUNCTION IF EXISTS GetCategoryHierarchyIDs;
DELIMITER //

CREATE FUNCTION GetCategoryHierarchyIDs(p_Category_id INT) RETURNS TEXT
READS SQL DATA
BEGIN

    DECLARE v_result TEXT DEFAULT '';
    DECLARE done INT DEFAULT 0;
    DECLARE v_name VARCHAR(255);
    DECLARE cur CURSOR FOR SELECT Name FROM temp_hierarchy;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    -- Create a temporary table to store the results
    DROP TEMPORARY TABLE IF EXISTS temp_hierarchy;
    CREATE TEMPORARY TABLE temp_hierarchy(Name VARCHAR(255));

    -- Insert the category names into the temporary table
    INSERT INTO temp_hierarchy
    WITH RECURSIVE CategoryHierarchy AS (
        -- Base Case
        SELECT Category_id, Name, Parent_Category_id
        FROM category
        WHERE Category_id = p_Category_id

        UNION ALL

        -- Recursive Step
        SELECT c.Category_id, c.Name, c.Parent_Category_id
        FROM category c
        JOIN CategoryHierarchy ch ON c.Category_id = ch.Parent_Category_id
    )
    SELECT category_id FROM CategoryHierarchy;

    -- Convert the temporary table rows to a single TEXT result
    -- You can adjust this section based on your preferred format
    OPEN cur;
    read_loop: LOOP
        FETCH cur INTO v_name;
        IF done THEN
            LEAVE read_loop;
        END IF;
        SET v_result = CONCAT(v_result, v_name, ',');  -- Add each name to the result with a comma separator
    END LOOP;
    CLOSE cur;

    -- Return the result
    RETURN v_result;

END //

DELIMITER ;


-- When the email is given this function returns
-- -1 if the user is a new guest
-- 0 if the user has bought something as a guest
-- 1 if the user is registered
DROP FUNCTION IF EXISTS isTheUserRegistered;

DELIMITER //
CREATE FUNCTION isTheUserRegistered(p_email VARCHAR(255)) RETURNS INT
READS SQL DATA
BEGIN
    DECLARE result INT;
    SELECT Is_registered INTO result
    FROM customer
    WHERE email = p_email;
    
    RETURN IFNULL(result, -1);
END //
DELIMITER ;

-- Get the minimum price of a product given the product_id
DROP FUNCTION IF EXISTS GetMinPrice;

DELIMITER //
CREATE FUNCTION GetMinPrice(p_product_id INT)
RETURNS DECIMAL(9,2)
READS SQL DATA
BEGIN
    DECLARE min_price DECIMAL(9,2);
    SELECT MIN(price) INTO min_price
    FROM item
    WHERE product_id = p_product_id;
    RETURN min_price;
END //
DELIMITER ;

-- Get the delivery days according to the city and quantity of items
-- If product has stock, delivery is to a main city (ex: Colombo), it’s 5 days
-- If product has stock, but delivery is not to a main city (ex: Negombo), it’s 7 days
-- If product has no stock add 3 days each of the above cases
DROP FUNCTION IF EXISTS CalculateDeliveryDays;

DELIMITER //
CREATE FUNCTION CalculateDeliveryDays(p_customer_id INT, p_city VARCHAR(255)) RETURNS INT
READS SQL DATA
BEGIN
    DECLARE delivery_days INT;
    DECLARE is_out_of_stock INT;
    DECLARE v_cart_id INT;
    
    SELECT cart_id INTO v_cart_id
    FROM cart
    WHERE Customer_id = p_customer_id;

    -- Check if there are any items in the cart that have no stock
    SELECT COUNT(*) INTO is_out_of_stock
    FROM cart_item ci
    JOIN item i ON ci.Item_id = i.Item_id
    WHERE ci.Cart_id = v_cart_id AND ci.Quantity > i.Quantity;

    -- If all items have stock
    IF is_out_of_stock = 0 THEN
        -- If delivery is to a main city
        IF p_city IN (SELECT City FROM cities WHERE Is_main = 1) THEN
            SET delivery_days = 5;
        -- If delivery is not to a main city
        ELSE
            SET delivery_days = 7;
        END IF;
    -- If at least one item has no stock
    ELSE
        -- If delivery is to a main city add 3 days
        IF p_city IN (SELECT City FROM cities WHERE Is_main = 1) THEN
            SET delivery_days = 8;
        -- If delivery is not to a main city
        ELSE
            SET delivery_days = 10;
        END IF;
    END IF;

    RETURN delivery_days;
END //
DELIMITER ;

DELIMITER ;

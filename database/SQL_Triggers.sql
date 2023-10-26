-- update the quantity of the item after an order is placed and delete the item from the cart table
DROP TRIGGER IF EXISTS order_item_after_insert;

DELIMITER //
CREATE TRIGGER order_item_after_insert  AFTER INSERT  
ON order_item FOR EACH ROW 
BEGIN
    DECLARE current_quantity INT;
    DECLARE new_quantity INT;
    DECLARE current_cart_id INT;
    
    SELECT Quantity INTO current_quantity FROM item WHERE Item_id = NEW.Item_id;
    -- check if the quantity is enough
    IF current_quantity < NEW.Quantity THEN
        -- if not enough, set the new quantity to 0 and raise a warning
        SELECT 0 INTO new_quantity;
        SIGNAL SQLSTATE '01000' SET MESSAGE_TEXT = 'Exceeds the Quantity'; -- warning
    ELSE
        -- if enough, set the new quantity to the current quantity minus the quantity ordered
        SELECT current_quantity - NEW.Quantity INTO new_quantity;
    END IF;
    -- update the quantity of the item
    UPDATE item i
	SET Quantity = new_quantity
	WHERE i.Item_id = NEW.Item_id;
    
    -- delete the item from the cart table
    SELECT DISTINCT(Cart_id) INTO current_cart_id
    FROM order_item oi
    JOIN `shop order` so USING (order_id)
    WHERE Order_id = NEW.Order_id;
    
    DELETE FROM cart_item WHERE Cart_id = current_cart_id AND Item_id = NEW.Item_id;
END//

DELIMITER ;   


-- when an unregistered user register as a customer, create a cart for the customer
DROP TRIGGER IF EXISTS after_customer_update;

DELIMITER //
CREATE TRIGGER after_customer_update AFTER UPDATE 
ON customer FOR EACH ROW 
BEGIN
    IF NEW.Is_registered = 1 THEN
        INSERT INTO `cart` (`Customer_id`) VALUES (NEW.Customer_id);
    END IF;
END //
DELIMITER ;


-- create a cart for a customer when the customer is registered
DROP TRIGGER IF EXISTS after_customer_insert;

DELIMITER //
CREATE TRIGGER after_customer_insert AFTER INSERT 
ON customer FOR EACH ROW 
BEGIN
    IF NEW.Is_registered = 1 THEN
        INSERT INTO `cart` (`Customer_id`) VALUES (NEW.Customer_id);
    END IF;
END //
DELIMITER ;
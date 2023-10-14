-- update the quantity of the item after an order is placed
DROP TRIGGER IF EXISTS order_item_after_insert;

DELIMITER //
CREATE TRIGGER order_item_after_insert  AFTER INSERT  
ON order_item FOR EACH ROW 
BEGIN
    DECLARE current_quantity INT;
    DECLARE new_quantity INT;
    
    SELECT Quantity INTO current_quantity FROM item WHERE Item_id = NEW.Item_id;

    IF current_quantity < NEW.Quantity THEN
        SELECT 0 INTO new_quantity;
        SIGNAL SQLSTATE '01000' SET MESSAGE_TEXT = 'Exceeds the Quantity'; -- warning
    ELSE
        SELECT current_quantity - NEW.Quantity INTO new_quantity;
    END IF;

    UPDATE item i
	SET Quantity = new_quantity
	WHERE i.Item_id = NEW.Item_id;
END//

DELIMITER ;   
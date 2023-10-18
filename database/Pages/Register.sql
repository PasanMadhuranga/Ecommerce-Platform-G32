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


-- insert a user into the customer table
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

-- register a user
CALL add_user(?, ?, ?, ?, ?, ?, ?, ?, ?, ?);  -- replace ? with Password, First_name, Last_name, Email, Phone_number, Address_line1, Address_line2, City, Province, Zipcode
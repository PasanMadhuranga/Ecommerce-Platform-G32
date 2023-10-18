-- Used to add some sample data to the database

USE `group32_v1.0`;

-- insert into admin
INSERT INTO `admin` (`Admin_username`, `Hashed_password`) VALUES 
(
	'johnfkennedy', 
	'83ba28a044bc62bdd383d18edcca34da262c9418199a0c20ac93a1aa5324372f'
);
INSERT INTO `admin` (`Admin_username`, `Hashed_password`) VALUES 
(
	'shavindamaduranga', 
	'ed2664d56bcff45a27682201c692ba490aff9fa97bd4c3539dd9129d53bd8d16'
);
INSERT INTO `admin` (`Admin_username`, `Hashed_password`) VALUES 
(
	'harithjanak', 
	'4be04f0b09a048f99b4ef70ceee1dc9f7f00932e6838d8be40d84bf75a4b1a0b'
);

-- customer
INSERT INTO `customer` (`Hashed_password`, `First_name`, `Last_name`, `Email`, `Phone_number`, `Address_line1`, `Address_line2`, `City`, `Province`, `Zipcode`, `Is_registered`) VALUES 
(
	'$2a$12$TIR.yPVwlysXVwdKlE/VBuXdDxkDPReKc3UfulSsrtFmvWM7v8mEG', 
	'Lakshitha', 
	'Perera', 
	'lakshitha.perera@gmail.com', 
	'0711234567', 
	'No.5, First Street', 
	'Kurunegala Road', 
	'Kurunegala', 
	'North Western', 
	'60000', 
	'1'
);
INSERT INTO `customer` (`Hashed_password`, `First_name`, `Last_name`, `Email`, `Phone_number`, `Address_line1`, `Address_line2`, `City`, `Province`, `Zipcode`, `Is_registered`) VALUES 
(
	'$2a$12$mNT3rQnvgwseYrh.Gw2uYuAOQwnWe0oNB.ueJBCGLT6Fe9gnZz/wC', 
	'Ravindu', 
	'Silva', 
	'ravindu.silva@gmail.com', 
	'0717654321', 
	'No.10, Second Street', 
	'Galle Road', 
	'Galle', 
	'Southern', 
	'80000', 
	'1'
);
INSERT INTO `customer` (`First_name`, `Last_name`, `Email`, `Phone_number`, `Address_line1`, `City`, `Province`, `Zipcode`, `Is_registered`) VALUES 
(
	'Dilani', 
	'Fernando', 
	'dilani.fernando@gmail.com', 
	'0716782134', 
	'No.15, Third Street', 
	'Colombo', 
	'Western', 
	'50000', 
	'0'
);
INSERT INTO `customer` (`Hashed_password`, `First_name`, `Last_name`, `Email`, `Phone_number`, `Address_line1`, `Address_line2`, `City`, `Province`, `Zipcode`, `Is_registered`) VALUES 
(
	'$2a$12$YAdFxX09xqzcJtCrgQ2JEePZ5iEOSeTENlMFJoCIqy.Xrfg5T9jau', 
	'Rusira', 
	'De Silva', 
	'rusiradesilva33@gmail.com', 
	'0719876543', 
	'No.3, Samanala Street', 
	'Anagarika Dharmapala Road', 
	'Matara', 
	'Southern', 
	'80000', 
	'1'
);
INSERT INTO `customer` (`Hashed_password`, `First_name`, `Last_name`, `Email`, `Phone_number`, `Address_line1`, `Address_line2`, `City`, `Province`, `Zipcode`, `Is_registered`) VALUES 
(
	'$2a$12$3hPxYD66X.Q4XQFoFT4DI.rukmDiPlj0JrZ2IjFihSTnG//2CioA2', 
	'Visitha', 
	'Galegoda', 
	'visitha.gale@gmail.com', 
	'0716969781', 
	'No.27, Third Lane', 
	'Mill Road', 
	'Katubedda', 
	'Western', 
	'62000', 
	'1'
);
-- card details
INSERT INTO `card_detail` (`Customer_id`, `Name_on_card`, `Card_number`, `Expiry_date`) VALUES ('1', 'Lakshitha P', '5391123412341234', '06/25');
INSERT INTO `card_detail` (`Customer_id`, `Name_on_card`, `Card_number`, `Expiry_date`) VALUES ('2', 'Silva R', '5391234523452345', '06/27');
INSERT INTO `card_detail` (`Customer_id`, `Name_on_card`, `Card_number`, `Expiry_date`) VALUES ('4', 'De Silva F B R L ', '5391567856785678', '01/27');

-- cart
INSERT INTO `cart` (`Customer_id`) VALUES ('1');
INSERT INTO `cart` (`Customer_id`) VALUES ('2');
INSERT INTO `cart` (`Customer_id`) VALUES ('3');
INSERT INTO `cart` (`Customer_id`) VALUES ('4');
INSERT INTO `cart` (`Customer_id`) VALUES ('5');

-- cart item
INSERT INTO `cart_item` (`Cart_id`, `Item_id`, `Quantity`) VALUES ('1', '1', '2');
INSERT INTO `cart_item` (`Cart_id`, `Item_id`, `Quantity`) VALUES ('1', '9', '1');
INSERT INTO `cart_item` (`Cart_id`, `Item_id`, `Quantity`) VALUES ('2', '71', '3');
INSERT INTO `cart_item` (`Cart_id`, `Item_id`, `Quantity`) VALUES ('2', '4', '1');
INSERT INTO `cart_item` (`Cart_id`, `Item_id`, `Quantity`) VALUES ('2', '6', '1');
INSERT INTO `cart_item` (`Cart_id`, `Item_id`, `Quantity`) VALUES ('3', '15', '4');
INSERT INTO `cart_item` (`Cart_id`, `Item_id`, `Quantity`) VALUES ('3', '55', '2');
INSERT INTO `cart_item` (`Cart_id`, `Item_id`, `Quantity`) VALUES ('4', '79', '1');
INSERT INTO `cart_item` (`Cart_id`, `Item_id`, `Quantity`) VALUES ('5', '43', '1');
INSERT INTO `cart_item` (`Cart_id`, `Item_id`, `Quantity`) VALUES ('5', '22', '1');
INSERT INTO `cart_item` (`Cart_id`, `Item_id`, `Quantity`) VALUES ('5', '45', '2');
INSERT INTO `cart_item` (`Cart_id`, `Item_id`, `Quantity`) VALUES ('5', '2', '1');

-- shop order
INSERT INTO `shop_order` (`Cart_id`, `Date`, `Payment_id`, `Delivery_id`, `Address_line1`, `Address_line2`, `City`, `Province`, `Zipcode`) VALUES ('1', '2023-04-05', '2', '1', 'No.5, First Street', 'Kurunegala Road', 'Kurunegala', 'North Western', '60000');
INSERT INTO `shop_order` (`Cart_id`, `Date`, `Payment_id`, `Delivery_id`, `Address_line1`, `Address_line2`, `City`, `Province`, `Zipcode`) VALUES ('2', '2023-06-21', '1', '1', 'No.10, Second Street', 'Galle Road', 'Galle', 'Southern', '80000');
INSERT INTO `shop_order` (`Cart_id`, `Date`, `Payment_id`, `Delivery_id`) VALUES ('2', '2023-07-01', '2', '2');
INSERT INTO `shop_order` (`Cart_id`, `Date`, `Payment_id`, `Delivery_id`, `Address_line1`, `Address_line2`, `City`, `Province`, `Zipcode`) VALUES ('1', '2023-07-03', '2', '1', 'No.5, First Street', 'Kurunegala Road', 'Kurunegala', 'North Western', '60000');
INSERT INTO `shop_order` (`Cart_id`, `Date`, `Payment_id`, `Delivery_id`, `Address_line1`, `Address_line2`, `City`, `Province`, `Zipcode`) VALUES ('3', '2023-07-22', '2', '1', 'No.15, Third Street', '', 'Colombo', 'Western', '50000');
INSERT INTO `shop_order` (`Cart_id`, `Date`, `Payment_id`, `Delivery_id`) VALUES ('4', '2023-08-11', '2', '2');

-- order item


-- Inserting a main category
-- [Electronics, Toys]
INSERT INTO `category` VALUES
(
    DEFAULT,
	'Electronics', -- Enter Main category name HERE
	NULL
);
INSERT INTO `category` VALUES
(
    DEFAULT,
	'Toys', -- Enter Main category name HERE
	NULL
);

-- Inserting a sub category using parent category name
-- [Smartphones, Smart Watches, Wearables, Board Games]
INSERT INTO `category` VALUES
(
    DEFAULT,
	'Smartphones', -- Enter Sub category name HERE
	(SELECT `Category_id` FROM (SELECT `Category_id` FROM `category` WHERE `Name` = 'Electronics') AS id)
);
INSERT INTO `category` VALUES
(
    DEFAULT,
	'Laptops', -- Enter Sub category name HERE
	(SELECT `Category_id` FROM (SELECT `Category_id` FROM `category` WHERE `Name` = 'Electronics') AS id)
);
INSERT INTO `category` VALUES
(
    DEFAULT,
	'Audio & Headphones', -- Enter Sub category name HERE
	(SELECT `Category_id` FROM (SELECT `Category_id` FROM `category` WHERE `Name` = 'Electronics') AS id)
);
INSERT INTO `category` VALUES
(
    DEFAULT,
	'Cameras & Photography', -- Enter Sub category name HERE
	(SELECT `Category_id` FROM (SELECT `Category_id` FROM `category` WHERE `Name` = 'Electronics') AS id)
);

INSERT INTO `category` (`Name`, `Parent_Category_id`) VALUES 
    ('Wearable Technology', '1');
INSERT INTO `category` (`Name`, `Parent_Category_id`) VALUES 
    ('Home Appliances', '1');
INSERT INTO `category` (`Name`, `Parent_Category_id`) VALUES 
    ('Computer Accessories', '1');
INSERT INTO `category` (`Name`, `Parent_Category_id`) VALUES 
    ('Action Figures', '2');
INSERT INTO `category` (`Name`, `Parent_Category_id`) VALUES 
    ('Board Games', '2');
INSERT INTO `category` (`Name`, `Parent_Category_id`) VALUES 
    ('Dolls & Accessories', '2');


-- Set up delivery types
-- [Delivery, Pickup]
INSERT INTO delivery_type VALUES
	(DEFAULT, 'Delivery'),
    (DEFAULT, 'Pickup');

-- Set up payment types
-- [Cash on Delivery, Card]
INSERT INTO payment_type VALUES
	(DEFAULT, 'Cash on Delivery'),
    (DEFAULT, 'Card');

-- Set up variants
-- [Color, Size, Storage]
INSERT INTO variant VALUES
	(DEFAULT, 'Color'),
    (DEFAULT, 'Size'),
    (DEFAULT, 'Storage');

-- Set up attributes
-- [[Black, Blue], [Small, Medium, Large], [64GB, 128GB]]
INSERT INTO attribute (variant_id, name) VALUES
	((SELECT variant_id FROM variant WHERE `Name` = 'Color'), 'Blue'),
	((SELECT variant_id FROM variant WHERE `Name` = 'Color'), 'Black');

INSERT INTO attribute (variant_id, name) VALUES
	((SELECT variant_id FROM variant WHERE `Name` = 'Size'), 'Small'),
	((SELECT variant_id FROM variant WHERE `Name` = 'Size'), 'Medium'),
	((SELECT variant_id FROM variant WHERE `Name` = 'Size'), 'Large');

INSERT INTO attribute (variant_id, name) VALUES
	((SELECT variant_id FROM variant WHERE `Name` = 'Storage'), '64GB'),
	((SELECT variant_id FROM variant WHERE `Name` = 'Storage'), '128GB');

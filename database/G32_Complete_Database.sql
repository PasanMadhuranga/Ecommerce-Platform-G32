-- _____________________________________ DDL _____________________________________

DROP SCHEMA IF EXISTS `group32_V1.0` ;

CREATE SCHEMA IF NOT EXISTS `group32_V1.0`;
USE `group32_V1.0` ;

-- Table `admin`
DROP TABLE IF EXISTS `admin` ;

CREATE TABLE IF NOT EXISTS `admin` (
  `Admin_id` INT NOT NULL AUTO_INCREMENT,
  `Admin_username` VARCHAR(50) NOT NULL,
  `Hashed_password` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`Admin_id`),
  UNIQUE (`Admin_username`),
  UNIQUE (`Hashed_password`));


-- Table `variant`
DROP TABLE IF EXISTS `variant` ;

CREATE TABLE IF NOT EXISTS `variant` (
  `variant_id` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`variant_id`),
  UNIQUE (`Name`));


-- Table `attribute`
DROP TABLE IF EXISTS `attribute` ;

CREATE TABLE IF NOT EXISTS `attribute` (
  `Attribute_id` INT NOT NULL AUTO_INCREMENT,
  `Variant_id` INT NOT NULL,
  `Name` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`Attribute_id`),
  FOREIGN KEY (`Variant_id`)
  REFERENCES `variant` (`Variant_id`)
  ON UPDATE CASCADE);


-- Table `customer`
DROP TABLE IF EXISTS `customer` ;

CREATE TABLE IF NOT EXISTS `customer` (
  `Customer_id` INT NOT NULL AUTO_INCREMENT,
  `Hashed_password` VARCHAR(255) NULL,
  `First_name` VARCHAR(50) NOT NULL,
  `Last_name` VARCHAR(50) NOT NULL,
  `Email` VARCHAR(255) NOT NULL,
  `Phone_number` CHAR(10) NOT NULL,
  `Address_line1` VARCHAR(50) NOT NULL,
  `Address_line2` VARCHAR(50) NULL DEFAULT NULL,
  `City` VARCHAR(50) NOT NULL,
  `Province` VARCHAR(50) NOT NULL,
  `Zipcode` CHAR(5) NOT NULL,
  `Is_registered` TINYINT NOT NULL,
  PRIMARY KEY (`Customer_id`),
  UNIQUE (`Email`));
 

-- Table `card_detail`
DROP TABLE IF EXISTS `card_detail` ;

CREATE TABLE IF NOT EXISTS `card_detail` (
  `Customer_id` INT NOT NULL,
  `Name_on_card` VARCHAR(50) NOT NULL,
  `Card_number` CHAR(16) NOT NULL CHECK (LENGTH(`Card_number`) = 16),
  `Expiry_date` CHAR(5) NOT NULL,
  PRIMARY KEY (`Customer_id`),
  UNIQUE (`Card_number`),
  FOREIGN KEY (`Customer_id`)
  REFERENCES `customer` (`Customer_id`)
  ON UPDATE CASCADE
  ON DELETE CASCADE);


-- Table `cart`
DROP TABLE IF EXISTS `cart` ;

CREATE TABLE IF NOT EXISTS `cart` (
  `Cart_id` INT NOT NULL AUTO_INCREMENT,
  `Customer_id` INT NOT NULL,
  PRIMARY KEY (`Cart_id`),
  FOREIGN KEY (`Customer_id`)
  REFERENCES `customer` (`Customer_id`)
  ON UPDATE CASCADE
  ON DELETE CASCADE);
 

-- Table `product`
DROP TABLE IF EXISTS `product` ;

CREATE TABLE IF NOT EXISTS `product` (
  `Product_id` INT NOT NULL AUTO_INCREMENT,
  `Title` VARCHAR(255) NOT NULL,
  `SKU` VARCHAR(50) NOT NULL,
  `Weight` DECIMAL(6,3) NOT NULL,
  `Description` TEXT NULL DEFAULT NULL,
  `Image` TEXT NOT NULL,
  PRIMARY KEY (`Product_id`),
  UNIQUE (`Title`),
  UNIQUE (`SKU`)); 


-- Table `item`
DROP TABLE IF EXISTS `item` ;

CREATE TABLE IF NOT EXISTS `item` (
  `Item_id` INT NOT NULL AUTO_INCREMENT,
  `Product_id` INT NOT NULL,
  `Price` DECIMAL(9,2) NOT NULL CHECK (`Price` >= 0),
  `Quantity` INT NOT NULL DEFAULT '0' CHECK (`Quantity` >= 0),
  `Image` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`Item_id`),
  FOREIGN KEY (`Product_id`)
  REFERENCES `product` (`Product_id`)
  ON UPDATE CASCADE);


-- Table `cart_item`
DROP TABLE IF EXISTS `cart_item` ;
 
CREATE TABLE IF NOT EXISTS `cart_item` (
  `Cart_id` INT NOT NULL,
  `Item_id` INT NOT NULL,
  `Quantity` INT NOT NULL  CHECK (`Quantity` >= 0),
  PRIMARY KEY (`Cart_id`, `Item_id`),
  FOREIGN KEY (`Cart_id`)
  REFERENCES `cart` (`Cart_id`)
  ON UPDATE CASCADE
  ON DELETE CASCADE,
  FOREIGN KEY (`Item_id`)
  REFERENCES `item` (`Item_id`)
  ON UPDATE CASCADE
  ON DELETE CASCADE);
 

-- Table `delivery_type`
DROP TABLE IF EXISTS `delivery_type` ;
 
CREATE TABLE IF NOT EXISTS `delivery_type` (
  `Delivery_id` INT NOT NULL AUTO_INCREMENT,
  `Delivery_type` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`Delivery_id`),
  UNIQUE (`Delivery_type`));
 

-- Table `category`
DROP TABLE IF EXISTS `category` ;

CREATE TABLE IF NOT EXISTS `category` (
  `Category_id` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(50) NOT NULL,
  `Parent_Category_id` INT NULL,
  PRIMARY KEY (`Category_id`),
  UNIQUE (`Name`),
  FOREIGN KEY (`Parent_Category_id`)
  REFERENCES `category` (`Category_id`)
  ON UPDATE CASCADE);


-- Table `payment_type`
DROP TABLE IF EXISTS `payment_type` ;

CREATE TABLE IF NOT EXISTS `payment_type` (
  `Payment_id` INT NOT NULL AUTO_INCREMENT,
  `Payment_type` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`Payment_id`),
  UNIQUE (`Payment_type`));


-- Table `shop_order`
DROP TABLE IF EXISTS `shop_order` ;

CREATE TABLE IF NOT EXISTS `shop_order` (
  `Order_id` INT NOT NULL AUTO_INCREMENT,
  `Cart_id` INT,
  `Date` DATETIME NOT NULL,
  `Payment_id` INT NOT NULL,
  `Delivery_id` INT NOT NULL,
  `Address_line1` VARCHAR(50),
  `Address_line2` VARCHAR(50),
  `City` VARCHAR(50),
  `Province` VARCHAR(50),
  `Zipcode` CHAR(5),
  PRIMARY KEY (`Order_id`),
  FOREIGN KEY (`Cart_id`)
  REFERENCES `cart` (`Cart_id`)
  ON UPDATE CASCADE,
  FOREIGN KEY (`Delivery_id`)
  REFERENCES `delivery_type` (`Delivery_id`)
  ON UPDATE CASCADE,
  FOREIGN KEY (`Payment_id`)
  REFERENCES `payment_type` (`Payment_id`)
  ON UPDATE CASCADE);

 
-- Table `order_item`
DROP TABLE IF EXISTS `order_item` ;
 
CREATE TABLE IF NOT EXISTS `order_item` (
  `Order_id` INT NOT NULL,
  `Item_id` INT NOT NULL,
  `Quantity` INT NOT NULL CHECK (`Quantity` >= 0),
  `Unit_price` DECIMAL(9,2) NOT NULL CHECK (`Unit_price` >= 0),
  PRIMARY KEY (`Order_id`, `Item_id`),
  FOREIGN KEY (`Order_id`)
  REFERENCES `shop_order` (`Order_id`)
  ON UPDATE CASCADE,
  FOREIGN KEY (`Item_id`)
  REFERENCES `item` (`Item_id`)
  ON UPDATE CASCADE);


-- Table `product_category`
DROP TABLE IF EXISTS `product_category` ;
 
CREATE TABLE IF NOT EXISTS `product_category` (
  `Product_id` INT NOT NULL,
  `Category_id` INT NOT NULL,
  PRIMARY KEY (`Product_id`, `Category_id`),
  FOREIGN KEY (`Product_id`)
  REFERENCES `product` (`Product_id`)
  ON UPDATE CASCADE,
  FOREIGN KEY (`Category_id`)
  REFERENCES `category` (`Category_id`)
  ON UPDATE CASCADE);
 

-- Table `item_configuration`
DROP TABLE IF EXISTS `item_configuration` ;
 
CREATE TABLE IF NOT EXISTS `item_configuration` (
  `Item_id` INT NOT NULL,
  `Attribute_id` INT NOT NULL,
  PRIMARY KEY (`Item_id`, `Attribute_id`),
  FOREIGN KEY (`Attribute_id`)
  REFERENCES `attribute` (`Attribute_id`)
  ON UPDATE CASCADE,
  FOREIGN KEY (`Item_id`)
  REFERENCES `item` (`Item_id`)
  ON UPDATE CASCADE);


-- _____________________________________ INDEXES _____________________________________

-- create an index on the date column of the shop_order table to speed up the admin related procedures
CREATE INDEX idx_date ON shop_order(Date);


-- _____________________________________ PROCEDURES FOR ITEM INSERTION _____________________________________

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


-- insert a new item record for a product in the item table
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


-- insert a new product record in the product table
DROP procedure IF EXISTS `add_product`;

DELIMITER $$

CREATE PROCEDURE `add_product`(
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


-- _____________________________________ INSERTIONS _____________________________________

-- Used to add some sample data to the database

USE `group32_v1.0`;

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

-- insert into admin
INSERT INTO `admin` (`Admin_username`, `Hashed_password`) VALUES 
(
	'johnfkennedy', 
	'$2a$12$XFXnKvHa1u9cXappKv.yreBD5.GdZs7VQmynrDkRZFYUntk5ePI1C'
);
INSERT INTO `admin` (`Admin_username`, `Hashed_password`) VALUES 
(
	'shavindamaduranga', 
	'$2a$12$jF0U7gqdM1K0AWlB/kzW3Os3DfTURMjcJT5.N8izicvDVUW0kR8Qy'
);
INSERT INTO `admin` (`Admin_username`, `Hashed_password`) VALUES 
(
	'harithjanak', 
	'$2a$12$U64JT2rkR.T/wlrB6kS7VOdqQyjLG1OetOqEQoMIMwO9U2zlzqcya'
);


-- add product
-- product_id = 1
call add_product(
	'iPhone 14', 
    'Electronics, Smartphones', 
    'iPhone 14: The iPhone 14 is the epitome of Apple\'s commitment to innovation and excellence in the world of smartphones. With its sleek design and powerful performance, it''s a true game-changer. The Super Retina XDR display delivers stunning visuals, while the A16 chip ensures lightning-fast speed and efficiency. The camera system is a marvel, capturing breathtaking photos and videos. With 5G connectivity and an array of exciting features, the iPhone 14 is the ultimate device for those who demand the best.', 
    0.22, 
    'IP14', 
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/Product%2FProduct_iPhone-14.jpg?alt=media&token=a9fbcb17-c31f-4a6f-b271-e6b471d03086&_gl=1*z0hz8w*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5NzczNzk3Mi4yLjEuMTY5NzczOTMzMy40NS4wLjA.');
-- product_id = 2
call add_product(
	'Samsung Galaxy S22', 
    'Electronics, Smartphones', 
    'Samsung Galaxy S22: The Samsung Galaxy S22 is a flagship Android smartphone that redefines mobile technology. Its stunning Dynamic AMOLED display provides vibrant colors and crisp clarity. Powered by the Exynos 990 processor, it handles tasks with ease. The camera system is a photography enthusiast\'s dream, offering versatility and stunning results. With a sleek design and an array of features, the Galaxy S25 is a symbol of Samsung\'s commitment to excellence.', 
    0.24, 
    'SGS22', 
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/Product%2FProduct_galaxy-s22.png?alt=media&token=20e363e0-4841-482a-9787-313f49fcc145&_gl=1*1yt6hjr*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5NzczNzk3Mi4yLjEuMTY5NzczOTMxOC42MC4wLjA.');
-- product_id = 3
call add_product(
	'Dell XPS 15', 
    'Electronics, Laptops', 
    'Dell XPS 15: The Dell XPS 15 is a cutting-edge laptop that combines powerful performance with premium design. It features a stunning InfinityEdge display for vivid visuals, high-performance components for seamless multitasking, and an elegant aluminum chassis. Whether you\'re a professional or creative enthusiast, the XPS 15 is the ideal computing companion, offering style and excellence in modern technology.', 
    1.81, 
    'DXPS15', 
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/Product%2FProduct_DellXPS15.jpg?alt=media&token=cf684579-a4b1-436c-ad56-3918618eada8&_gl=1*ue2uvg*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5NzczNzk3Mi4yLjEuMTY5NzczOTEyNC42MC4wLjA.');
-- product_id = 4    
call add_product(
	'Sony WH-1000XM5', 
    'Electronics, Audio & Headphones', 
    'Sony WH-1000XM5: The Sony WH-1000XM5 headphones are a triumph of audio engineering and noise-canceling technology. Immerse yourself in your favorite music with industry-leading sound quality. The noise-canceling capabilities transport you to a world of pure sound, free from distractions. Comfortable and stylish, these headphones are the ultimate choice for audiophiles and travelers.', 
    0.25, 
    'SWH5', 
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/Product%2FProduct_Sony_WH_1000XM5.png?alt=media&token=c844be0c-3377-40d6-a322-75d5039a9ca4&_gl=1*14o7sei*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5NzczNzk3Mi4yLjEuMTY5NzczOTIzNS4xNS4wLjA.');
-- product_id = 5   
call add_product(
	'Batman Action Figure', 
    'Toys, Action Figures', 
    'The Batman action figure is a collector\'s dream. With meticulous craftsmanship and intricate detailing, it captures the essence of Gotham\'s Dark Knight. Pose it in dynamic stances and let your imagination run wild with epic battles in the world of DC Comics.', 
    0.15, 
    'BAF', 
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/Product%2FProduct_Batman_Action_Figure.jpg?alt=media&token=c2d78ba4-b73b-4ee0-a16f-180c219c60a4&_gl=1*892mtm*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5NzczNzk3Mi4yLjEuMTY5NzczOTAxOS40MS4wLjA.');
-- product_id = 6
call add_product(
	'Bose QC45', 
    'Electronics, Audio & Headphones', 
    'Bose QC45: The Bose QC45 headphones redefine your audio experience. With world-class noise cancellation, you can enjoy your music with newfound clarity. The balanced sound profile ensures every note is crisp and clear. Lightweight and comfortable, these headphones are perfect for long journeys or peaceful moments of reflection.', 
    0.23, 
    'BQC45', 
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/Product%2FProduct_Bose_QC45.jpg?alt=media&token=8a33dbd4-334e-4b0a-86aa-e097977f2762&_gl=1*pbph8q*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5NzczNzk3Mi4yLjEuMTY5NzczOTA2MS42MC4wLjA.');
-- product_id = 7
call add_product(
	'Google Pixel 8 pro', 
    'Electronics, Smartphones', 
    'Google Pixel 8 Pro: 24+ hour battery charges faster than ever. Powerful performance with 12 GB RAM. Pixel helps keep you and your info safe. 7 years of security updates and new Feature Drops. The updated Pixel 8 Pro camera system makes selfies sharper, close-ups closer, and photos and videos more stunning than ever.', 
    0.18, 
    'GP8P', 
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/Product%2FProduct_Google_pixel_8_Pro.jpg?alt=media&token=648d4d98-54e1-45c7-be87-a24012f93e36&_gl=1*19h1wof*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5NzczNzk3Mi4yLjEuMTY5NzczOTE0My40MS4wLjA.');
-- product_id = 8
call add_product(
	'OnePlus 11', 
    'Electronics, Smartphones', 
    'OnePlus 11: 50 MP (wide) + 32 MP (telephoto) + 48 MP (ultrawide) while on the front, there is a 16 MP (wide) sensor. The display size is 6.7 inches LTPO2 AMOLED. The resolution of the screen is 1440 x 3216 pixels.', 
    0.20, 
    '1P11', 
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/Product%2FProduct_OnePlus_11_5G.jpg?alt=media&token=a0403d58-a54c-43f7-852c-233e503df460&_gl=1*pvyyw5*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5NzczNzk3Mi4yLjEuMTY5NzczOTIxNy4zMy4wLjA.');
-- product_id = 9
call add_product(
	'Asus ZenBook Pro', 
    'Electronics, Laptops', 
    'Asus ZenBook Pro: The Asus ZenBook Pro is a masterpiece of modern laptop design. With its stunning 4K OLED touchscreen display, it offers vivid visuals and precise touch control. Inside, the laptop is powered by high-performance processors, making it a powerhouse for creative professionals. The sleek aluminum body and compact form factor make it a stylish and portable companion. Whether you\'re a designer, video editor, or simply someone who appreciates top-tier technology, the ZenBook Pro is a testament to Asus\'s commitment to innovation.', 
    1.75, 
    'AZBP', 
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/Product%2FProduct_ASUS_Zenbook_pro_14.png?alt=media&token=f78424cd-6e54-4fe4-9f03-18119808924f&_gl=1*5ndzh9*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5NzczNzk3Mi4yLjEuMTY5NzczODY3Mi42MC4wLjA.');
-- product_id = 10
call add_product(
	'MacBook Air M2', 
    'Electronics, Laptops', 
    'MacBook Air M2: The MacBook Air M2 is Apple\'s answer to the need for a lightweight, ultra-portable laptop without compromising on performance. Powered by the M2 chip, it provides snappy responsiveness and excellent energy efficiency. The Retina display offers vibrant visuals, and the compact form factor makes it ideal for on-the-go professionals and students. With a sleek aluminum chassis, all-day battery life, and the signature MacBook keyboard and trackpad, the MacBook Air M2 is a modern classic for those who value mobility and style.', 
    1.25, 
    'MBA2', 
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/Product%2FProduct_macbook_air_M2.webp?alt=media&token=4bd313e3-02b2-4a9d-985b-64def4a4fa49&_gl=1*1b2r2tw*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5NzczNzk3Mi4yLjEuMTY5NzczOTM2Ny4xMS4wLjA.');
-- product_id = 11
call add_product(
	'Beats Studio Buds Plus', 
    'Electronics, Audio & Headphones', 
    'Beats Studio Buds Plus: The Beats Studio Buds Plus are the perfect audio companion for music lovers and active individuals. With their dynamic sound quality, these true wireless earbuds deliver immersive audio experiences. They\'re designed for comfort and durability, ensuring they stay in place during workouts and daily activities. The active noise cancellation feature lets you enjoy your music in peace, and the long battery life keeps the tunes flowing all day long. Connect seamlessly to your device and elevate your audio experience with these stylish earbuds.', 
    0.05, 
    'BSBP', 
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/Product%2FProduct_Beats_StudioBuds_plus_black.jpg?alt=media&token=1bc53026-adfc-4d32-a609-f7d21d4a7af8&_gl=1*4dz09p*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5NzczNzk3Mi4yLjEuMTY5NzczOTAzOS4yMS4wLjA.');
-- product_id = 12
call add_product(
	'Jabra Elite 85t', 
    'Electronics, Audio & Headphones', 
    'Jabra Elite 85t: The Jabra Elite 85t true wireless earbuds redefine what\'s possible in terms of audio quality and noise cancellation. These earbuds offer crystal-clear sound and advanced noise-canceling technology, allowing you to immerse yourself in your music or make clear calls, even in noisy environments. With a comfortable fit and long battery life, they are perfect for extended listening sessions or all-day productivity. Stay connected and enjoy an audio experience like never before with the Jabra Elite 85t.', 
    0.06, 
    'JE85', 
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/Product%2FProduct_Jabra_Elite_85t.jpg?alt=media&token=59a3cf8e-e465-44a2-832a-898526a49577&_gl=1*1x9wzv0*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5NzczNzk3Mi4yLjEuMTY5NzczOTE3NS45LjAuMA..');
-- product_id = 13
call add_product(
	'Ironman Action Figure', 
    'Toys, Action Figures', 
    'Ironman Action Figure: The Ironman action figure is a tribute to the genius, billionaire, playboy, philanthropist, Tony Stark. With exquisite detailing and a range of articulation points, it brings Ironman\'s armored suit to life. Whether you\'re a Marvel fan or simply appreciate fine craftsmanship, this action figure allows you to display one of Earth\'s mightiest heroes with pride.', 
    0.15, 
    'IAF', 
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/Product%2FProduct_Ironman_AF.jpg?alt=media&token=8f4b58f3-d29e-4286-aeb5-121023722b27&_gl=1*1805pdj*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5NzczNzk3Mi4yLjEuMTY5NzczOTE1Ny4yNy4wLjA.');
-- product_id = 14
call add_product(
	'Lego Star Wars Kit', 
    'Toys, Board Games', 
    'Lego Star Wars Kit: The Lego Star Wars Kit is an adventure in creativity and imagination. With a vast collection of Lego bricks and minifigures inspired by the iconic Star Wars universe, it offers endless possibilities for building your favorite spacecraft, characters, and scenes. Whether you\'re a Star Wars enthusiast or a Lego aficionado, this kit provides hours of entertainment and storytelling. Join the Rebel Alliance or embrace the dark side with this epic Lego set.', 
    0.9, 
    'LSWK', 
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/Product%2FProduct_Star_Wars_Lego_kit.jpg?alt=media&token=a644c98d-36a4-48b6-9d58-27de06b7ddab&_gl=1*difac9*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5NzczNzk3Mi4yLjEuMTY5NzczOTI1Mi42MC4wLjA.');
-- product_id = 15
call add_product(
	'Canon EOS 7D', 
    'Electronics, Cameras & Photography', 
    'Canon EOS 7D: The Canon EOS 7D is a professional DSLR camera designed for photographers who demand precision and speed. With its fast autofocus system and high-resolution sensor, it captures stunning images with exceptional clarity. Whether you\'re capturing fast-action sports or intricate landscapes, the EOS 7D excels in every scenario. Its robust build and advanced features make it a versatile tool for photographers who push the boundaries of creativity.', 
    0.8, 
    'CE7D', 
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/Product%2FProduct_Canon_EOS_7D.jpg?alt=media&token=1a920382-46ea-49a8-8884-4d4005e60b35&_gl=1*gd4214*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5NzczNzk3Mi4yLjEuMTY5NzczOTA3NS40Ni4wLjA.');
-- product_id = 16
call add_product(
	'Apple Watch Series 8', 
    'Electronics, Wearable Technology', 
    'Apple Watch Series 8: The Apple Watch Series 8 represents the pinnacle of smartwatch technology. With its elegant design and advanced health and fitness tracking features, it\'s more than just a watch—it\'s your personal wellness companion. The Series 8 offers precise tracking of your heart rate, sleep, activity, and more, helping you stay on top of your health and fitness goals. With an always-on display and seamless integration with your iPhone, it\'s the ultimate accessory for a connected and active lifestyle. Experience the future of wearables with the Apple Watch Series 8.', 
    0.07, 
    'AWS8', 
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/Product%2FProduct_Apple_Watch_Series_8.jpg?alt=media&token=e5b60a6e-dab6-4f5b-b3e2-7570775cf486&_gl=1*dn13c3*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5NzczNzk3Mi4yLjEuMTY5NzczOTAwMC42MC4wLjA.');
-- product_id = 17
call add_product(
	'Logitech G Pro Mouse', 
    'Electronics, Computer Accessories', 
    'Logitech G Pro Mouse: The Logitech G Pro Mouse is a gaming mouse that sets the standard for precision and performance. Designed with input from esports professionals, it offers lightning-fast response and customizable features. The Hero sensor provides flawless tracking, while the lightweight design ensures comfort during long gaming sessions. With programmable buttons and customizable RGB lighting, it\'s tailored to your gaming preferences. Dominate the competition with the Logitech G Pro Mouse.', 
    0.17, 
    'LGPM', 
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/Product%2FProduct_Logitech_G_Pro_Mouse.webp?alt=media&token=a2c87e0d-8463-41e8-b794-2fd8e25d2467&_gl=1*oq2ldi*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5NzczNzk3Mi4yLjEuMTY5NzczOTE5MC42MC4wLjA.');
-- product_id = 18
call add_product(
	'Corsair K70 Keyboard', 
    'Electronics, Computer Accessories', 
    'Corsair K70 Keyboard: The Corsair K70 Keyboard is a mechanical gaming keyboard that stands at the forefront of gaming peripherals. With its tactile and responsive Cherry MX switches, it provides a satisfying typing and gaming experience. The customizable RGB backlighting lets you create stunning lighting effects, and the durable aluminum frame ensures long-lasting performance. Whether you\'re a competitive gamer or a casual typist, the Corsair K70 delivers the precision and style you need.', 
    0.9, 
    'CK70', 
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/Product%2FProduct_Corsair_K70_Keyboard.jpg?alt=media&token=c497b139-e323-41d3-a20b-8030b7c66036&_gl=1*iq86od*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5NzczNzk3Mi4yLjEuMTY5NzczOTA5MS4zMC4wLjA.');
-- product_id = 19
call add_product(
	'Barbie Dreamhouse', 
    'Toys, Dolls & Accessories', 
    'Barbie Dreamhouse: The Barbie Dreamhouse is a dream come true for young and young-at-heart Barbie enthusiasts. This fully furnished, interactive playset features multiple rooms, including a kitchen, living room, bedroom, and more. It\'s equipped with interactive accessories, such as a working elevator and a swimming pool with a slide. The Dreamhouse allows for endless imaginative play and storytelling, letting kids create their own Barbie adventures in style and comfort.', 
    2.51, 
    'BDH', 
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/Product%2FProduct_barbie_dreamhouse.webp?alt=media&token=d605e299-4cf9-4721-8fa0-58dad1a17110&_gl=1*1w301jr*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5NzczNzk3Mi4yLjEuMTY5NzczOTI5OS4xMy4wLjA.');
-- product_id = 20
call add_product(
	'Transformers Optimus Prime', 
    'Toys, Action Figures', 
    'Transformers Optimus Prime: The Transformers Optimus Prime figure brings the iconic Autobot leader to life. It seamlessly transforms from a powerful robot into a formidable truck, offering hours of exciting play for Transformers fans of all ages. With intricate details and articulation, Optimus Prime is ready to roll out and defend the universe against the Decepticons. This collectible figure is a must-have for fans of the legendary Transformers franchise.', 
    0.55, 
    'TOP', 
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/Product%2FProduct_Transformers_optimus_prime.jpg?alt=media&token=6c722f54-6db5-4664-9961-f0e8862d55b6&_gl=1*93uvwu*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5NzczNzk3Mi4yLjEuMTY5NzczOTI4NC4yOC4wLjA.');
-- product_id = 21
call add_product(
	'Dell Inspiron 14', 
    'Electronics, Laptops', 
    'Dell Inspiron 14: The Dell Inspiron 14 is a versatile laptop designed to meet your everyday computing needs. With its sleek design and reliable performance, it\'s ideal for work, school, or entertainment. The crisp display offers clear visuals, and the responsive keyboard ensures comfortable typing. Powered by efficient processors, it handles tasks with ease. The Inspiron 14 is a dependable and affordable choice for those seeking a balance of performance and portability.', 
    1.55, 
    'DI14', 
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/Product%2FProduct_DELL_inspiron_14.avif?alt=media&token=dadc9cf5-08b7-4a47-913a-1fa6492aeba4&_gl=1*gewynl*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5NzczNzk3Mi4yLjEuMTY5NzczOTEwNS4xNi4wLjA.');
-- product_id = 22
call add_product(
	'Apple AirPods Pro', 
    'Electronics, Audio & Headphones', 
    'Apple AirPods Pro: The Apple AirPods Pro redefine the wireless earbud experience. With active noise cancellation, they immerse you in pure, high-fidelity sound. The customizable fit ensures comfort and stability, making them perfect for workouts, commutes, or long flights. The H1 chip enables seamless pairing with your Apple devices, and the intuitive controls allow you to adjust settings with a touch. Whether you\'re listening to music, taking calls, or enjoying podcasts, the AirPods Pro deliver an exceptional audio experience.', 
    0.08, 
    'AAP3', 
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/Product%2FProduct_Airpod_pro.jpg?alt=media&token=9cfa6fca-8f1f-416e-b3ef-0e3c4bdf960e&_gl=1*vmrzcy*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5NzczNzk3Mi4yLjEuMTY5NzczODkyNi42MC4wLjA.');
-- product_id = 23
call add_product(
	'Captain America Action Figure', 
    'Toys, Action Figures', 
    'Captain America Action Figure: The Captain America action figure pays tribute to the patriotic hero with meticulous attention to detail. It captures the iconic costume and shield of Steve Rogers with precision and authenticity. With multiple points of articulation, you can pose Captain America in dynamic stances, ready to defend justice and freedom. Whether you\'re a collector or a fan, this action figure is a symbol of heroism and integrity.', 
    0.12, 
    'CAPAF', 
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/Product%2FProduct_CA_Action_figure.jpg?alt=media&token=11a2ee1b-8d25-4c36-9549-4c2d50c52666&_gl=1*1p5qq6r*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIwOTcxNi4xMS4xLjE2OTgyMTIyMzAuNjAuMC4w');
-- product_id = 24
call add_product(
	'Thor Action Figure', 
    'Toys, Action Figures', 
    'Thor Action Figure: The Thor action figure captures the majestic power of the God of Thunder. With intricate detailing and articulation, it brings the heroic character to life. Pose Thor in dynamic stances and recreate epic battles from the Marvel Universe. Whether you\'re a collector or a fan of Norse mythology and superhero lore, this action figure is a symbol of strength and heroism.', 
    0.15, 
    'ThorAF', 
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/Product%2FProduct_Thor_Action_figure.jpg?alt=media&token=1b2de8af-24f1-406d-9951-c93dd249548b&_gl=1*js7rxh*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIwOTcxNi4xMS4xLjE2OTgyMTIyODcuMy4wLjA.');

call add_product(
	'Wolverine Action Figure', 
    'Toys, Action Figures', 
    'Wolverine Action Figure: The Wolverine action figure immortalizes the iconic X-Men character known for his regenerative abilities and adamantium claws. With meticulous craftsmanship and articulation, it showcases Wolverine\'s ferocity and agility. Pose him in combat-ready positions and let your imagination run wild with action-packed scenarios. This collectible figure is a must-have for fans of the X-Men and the mutant superhero Wolverine.', 
    0.18,
    'WolvAF', 
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/Product%2FProduct_Wolverine_Action_figure.jpg?alt=media&token=c3d90ca6-fe80-487a-8bda-bb828c6dfcbb&_gl=1*pueyk*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIwOTcxNi4xMS4xLjE2OTgyMTIzMzIuNjAuMC4w');

call add_product(
	'Deadpool Action Figure', 
    'Toys, Action Figures', 
    'Deadpool Action Figure: The Deadpool action figure captures the irreverent and iconic antihero with intricate detailing and articulation. Whether you\'re a fan of the Deadpool comics or the hit movies, this figure brings the Merc with a Mouth to life. Pose Deadpool in dynamic stances and recreate his witty and chaotic adventures. This collectible figure is a must-have for fans of Deadpool and the Marvel Universe.', 
    0.14, 
    'DAF', 
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/Product%2FProduct_Deadpool%20Action%20Figure.jpg?alt=media&token=b9236a98-9c63-410d-8790-14744c91cc4c&_gl=1*1x6xv6o*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIwOTcxNi4xMS4xLjE2OTgyMTIzNjYuMjYuMC4w');

call add_product(
	'Hulk Action Figure', 
    'Toys, Action Figures', 
    'Hulk Action Figure: The Hulk action figure captures the brute strength and iconic appearance of the Marvel superhero. With detailed sculpting and articulation, it allows you to pose the Hulk in dynamic and powerful stances. Whether you\'re a collector or a fan of the Hulk\'s incredible adventures, this action figure is a symbol of raw power and heroism. Display it proudly as a centerpiece in your collection.', 
    0.25, 
    'HulkAF', 
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/Product%2FProduct_Deadpool%20Action%20Figure.jpg?alt=media&token=b9236a98-9c63-410d-8790-14744c91cc4c&_gl=1*1x6xv6o*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIwOTcxNi4xMS4xLjE2OTgyMTIzNjYuMjYuMC4w');

call add_product(
	'Thanos Action Figure', 
    'Toys, Action Figures', 
    'Thanos Action Figure: The Thanos action figure captures the imposing and iconic Marvel supervillain with intricate detailing and articulation. Standing tall, it brings the Mad Titan to life with his signature look and the Infinity Gauntlet. Pose Thanos in formidable stances and recreate epic battles from the Marvel Universe. Whether you\'re a collector or a fan of cosmic conflicts, this action figure is a symbol of power and villainy.', 
    0.24, 
    'ThanosAF', 
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/Product%2FProduct_Thanos%20Action%20Figure.jpg?alt=media&token=e40e16ca-3bfc-4290-94d6-ad1b6526b285&_gl=1*1gtg0bf*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIwOTcxNi4xMS4xLjE2OTgyMTI0MjIuMzQuMC4w');

call add_product(
	'Monopoly Board Game', 
    'Toys, Board Games', 
    'Monopoly Board Game: Monopoly is the timeless board game of strategy, negotiation, and financial prowess. Buy, sell, and trade your way to victory as you build your real estate empire and amass wealth. With its iconic gameplay and a variety of themed editions, Monopoly offers endless hours of family fun and friendly competition. Whether you\'re aiming to bankrupt your opponents or simply enjoy quality time together, Monopoly is a classic choice for game night.', 
    0.6, 
    'MBG', 
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/Product%2FProduct_Monoplay.jpg?alt=media&token=500b0752-9da6-43a4-8a01-08a3b54dc4fa&_gl=1*1po57wl*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIwOTcxNi4xMS4xLjE2OTgyMTI0NDguOC4wLjA.');

call add_product(
	'Risk Board Game', 
    'Toys, Board Games', 
    'Risk Board Game: Risk is the classic strategy board game of global domination. With a world map and armies at your command, you must strategize and conquer territories to achieve victory. Form alliances, plan attacks, and engage in epic battles to expand your empire. Risk is a game of skill, diplomacy, and tactics that offers hours of intense gameplay and rivalry. Challenge your friends and family to a game of Risk and see who can emerge as the world\'s supreme commander.', 
    0.7, 
    'RBG', 
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/Product%2FProduct_Risk_board_game.jpg?alt=media&token=b3f56111-c1f4-4ce1-8b00-d6971894160a&_gl=1*1xgo08o*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIwOTcxNi4xMS4xLjE2OTgyMTI0NzAuNjAuMC4w');

call add_product(
	'LEGO Super Mario Starter Kit', 
    'Toys, Board Games', 
    'LEGO Super Mario Starter Kit: The LEGO Super Mario Starter Kit combines the magic of LEGO with the excitement of the Super Mario universe. With interactive LEGO Mario and buildable course pieces, you can create your own adventures and challenges. Customize your levels, collect coins, and face off against iconic enemies like Goombas and Bowser Jr. The Starter Kit offers endless possibilities for creative play and is perfect for both LEGO and Mario fans of all ages.', 
    0.75, 
    'LSMSK', 
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/Product%2FProduct_LEGO%20Super%20Mario%20Starter%20Kit.jpg?alt=media&token=1c4d66b8-acf6-4d68-ac7f-705cb2ab2815&_gl=1*30409a*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIwOTcxNi4xMS4xLjE2OTgyMTI1MDguMjIuMC4w');

call add_product(
	'Cyberpunk 2077 Board Game', 
    'Toys, Board Games', 
    'Cyberpunk 2077 Board Game: The Cyberpunk 2077 Board Game immerses players in the dystopian and tech-driven world of Night City. Inspired by the popular video game, this board game offers an immersive narrative experience with challenging choices and high-stakes missions. Explore the dark and vibrant streets of Night City, uncover secrets, and engage in intense combat encounters. With a modular game board and a variety of character choices, the Cyberpunk 2077 Board Game provides endless replayability for fans of the Cyberpunk genre.', 
    0.65, 
    'CPBG', 
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/Product%2FProduct_Cyberpunk%202077%20Board%20Game.jpg?alt=media&token=60d922f0-c6fa-4040-8232-78f8ab42b156&_gl=1*i3oiyi*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIwOTcxNi4xMS4xLjE2OTgyMTI1MjguMi4wLjA.');

call add_product(
	'Uno Card Game', 
    'Toys, Board Games', 
    'Uno Card Game: Uno is a classic card game that offers hours of fun and strategy for players of all ages. The game is easy to learn but challenging to master, making it perfect for family gatherings and social occasions. Match colors and numbers to be the first to empty your hand, but watch out for action cards that can change the game in an instant. Uno encourages competition, laughter, and friendly rivalry, making it a timeless card game that has been enjoyed by generations.', 
    0.05, 
    'UCG', 
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/Product%2FProduct_Uno%20Card%20Game.jpg?alt=media&token=6cec6c5b-57b4-48c5-97c7-20c1419ccfdd&_gl=1*1fnzrqc*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIwOTcxNi4xMS4xLjE2OTgyMTI1NDcuNjAuMC4w');

call add_product(
	'LEGO Technic Bugatti', 
    'Toys, Board Games', 
    'LEGO Technic Bugatti: The LEGO Technic Bugatti is an engineering marvel that combines the world of LEGO and automotive excellence. With intricate detailing and over 3,500 pieces, it replicates the iconic Bugatti Chiron supercar. The model features working components like a functional eight-speed gearbox and a detailed W16 engine with moving pistons. The adjustable spoiler and aerodynamic design capture the essence of the Bugatti Chiron. Whether you\'re a LEGO enthusiast or a car aficionado, building and displaying this masterpiece is a testament to craftsmanship and engineering.', 
    0.48, 
    'LTB', 
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/Product%2FProduct_LEGO%20Technic%20Bugatti.jpg?alt=media&token=03f052ef-67a3-4359-b96b-c4b3872b27d4&_gl=1*e2t3zh*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIwOTcxNi4xMS4xLjE2OTgyMTI1NzQuMzMuMC4w');

call add_product(
	'Asus ROG Zephyrus', 
    'Electronics, Laptops', 
    'Asus ROG Zephyrus: The Asus ROG Zephyrus is a high-end gaming laptop designed for serious gamers and content creators. It combines powerful performance with a sleek and portable design. Equipped with the latest processors and high-refresh-rate displays, it delivers smooth gaming experiences and outstanding graphics. The RGB-backlit keyboard adds a touch of personalization, and the robust build quality ensures durability. Whether you\'re conquering virtual worlds or tackling demanding tasks, the ROG Zephyrus is your reliable companion.', 
    1.98, 
    'ARZ', 
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/Product%2FProduct_Asus%20ROG%20Zephyrus.jpg?alt=media&token=781adc51-2c9c-4d5a-9828-bb6dde14135a&_gl=1*1mgd5ak*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIwOTcxNi4xMS4xLjE2OTgyMTI5ODguMTMuMC4w');

call add_product(
	'HP Spectre x360', 
    'Electronics, Laptops', 
    'HP Spectre x360: The HP Spectre x360 is a 2-in-1 laptop that combines elegance with versatility. With its slim and sleek design, it\'s a convertible laptop that adapts to your needs. The touchscreen display rotates 360 degrees, allowing you to use it as a laptop, tablet, or in tent mode for presentations and entertainment. Powered by high-performance processors, it handles multitasking effortlessly. The Spectre x360 also features a comfortable backlit keyboard and precise trackpad. It\'s a stylish and functional choice for those seeking flexibility in their computing experience.', 
    1.34, 
    'HPSX3', 
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/Product%2FProduct_HP%20Spectre%20x360.jpg?alt=media&token=aa017b68-e6ba-4337-b51f-935e294aab75&_gl=1*1y40vtc*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIwOTcxNi4xMS4xLjE2OTgyMTMwODkuNjAuMC4w');

call add_product(
	'Alienware M17', 
    'Electronics, Laptops', 
    'Alienware M17: The Alienware M17 is a gaming laptop designed for serious gamers who demand top-tier performance and aesthetics. With its iconic Alienware design and customizable RGB lighting, it\'s a gaming powerhouse that makes a statement. Equipped with high-refresh-rate displays and powerful graphics cards, it delivers smooth and immersive gaming experiences. The customizable keyboard and precise trackpad ensure precise control. Dominate the gaming world with the Alienware M17.', 
    2.58, 
    'AWM17', 
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/Product%2FProduct_alienware-m17.jpg?alt=media&token=47f040d1-4718-445c-8a58-e2bb21128030&_gl=1*pz87u2*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIwOTcxNi4xMS4xLjE2OTgyMTMxMTguMzEuMC4w');

call add_product(
	'Razer Blade 15', 
    'Electronics, Laptops', 
    'Razer Blade 15: The Razer Blade 15 is a gaming laptop that offers a perfect blend of power and portability. With its sleek and premium aluminum build, it\'s a stylish device that can handle demanding games and creative tasks. Equipped with high-performance processors and dedicated graphics cards, it delivers a smooth gaming experience with stunning visuals. The customizable Chroma RGB keyboard adds a touch of personalization, and the high-refresh-rate display ensures fluid gameplay. The Razer Blade 15 is the choice of gamers and professionals who demand top-tier performance without sacrificing mobility.', 
    2, 
    'RB15', 
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/Product%2FProduct_Razer%20Blade%2015.jpg?alt=media&token=a5edcefc-2319-4a84-8f9a-4c5459065033&_gl=1*1bp7c2h*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIwOTcxNi4xMS4xLjE2OTgyMTMxNDAuOS4wLjA.');

call add_product(
	'LG Gram 17', 
    'Electronics, Laptops', 
    'LG Gram 17: The LG Gram 17 is an ultra-lightweight and ultra-portable laptop that redefines mobility without compromising on performance. With a large 17-inch display and a slim profile, it\'s a remarkable feat of engineering. The powerful processors and long-lasting battery ensure productivity and entertainment on the go. The comfortable keyboard and precision touchpad enhance usability, making it ideal for work or creative endeavors. The LG Gram 17 is a testament to LG\'s commitment to innovation and portability in the world of laptops.', 
    1.35, 
    'LGG17', 
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/Product%2FProduct_LG_gram.jpg?alt=media&token=80bbca36-4e0a-4930-a566-dc8de257fe8c&_gl=1*w1c2e0*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIwOTcxNi4xMS4xLjE2OTgyMTMxNjIuNjAuMC4w');

call add_product(
	'Apple MacBook Pro 16', 
    'Electronics, Laptops', 
    'Apple MacBook Pro 16: The Apple MacBook Pro 16 is a powerhouse of creativity and productivity. With a large Retina display, powerful processors, and up to 64GB of RAM, it handles demanding tasks with ease. Whether you\'re editing 4K videos, designing graphics, or developing software, it delivers exceptional performance. The Magic Keyboard provides a comfortable typing experience, and the immersive audio system enhances your multimedia projects. With macOS, you have access to a wide range of creative apps and tools. The MacBook Pro 16 is the choice of professionals who demand top-tier performance in a portable package.', 
    1.08, 
    'AMP16', 
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/Product%2FProduct_Apple%20MacBook%20Pro%2016.jpg?alt=media&token=c0499164-4ce7-4b80-8ecc-5a243e3ebf30&_gl=1*17tuycj*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIwOTcxNi4xMS4xLjE2OTgyMTMxOTQuMjguMC4w');

call add_product(
	'Beyerdynamic DT 770 Pro', 
    'Electronics, Audio & Headphones', 
    'Beyerdynamic DT 770 Pro: The Beyerdynamic DT 770 Pro headphones are renowned for their studio-quality sound and comfort. They deliver precise audio reproduction with a wide soundstage, making them perfect for critical listening and professional audio work. The closed-back design isolates you from external noise, while plush ear cushions provide hours of comfort during extended sessions. Whether you\'re a music producer, audio engineer, or audiophile, the DT 770 Pro is a top choice for an immersive and accurate listening experience.', 
    0.27, 
    'BDT770', 
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/Product%2FProduct_Beyerdynamic_DT_770_Pro.jpg?alt=media&token=af628adb-af97-43ea-a653-b8c2e3a32adc&_gl=1*1m0csoj*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIwOTcxNi4xMS4xLjE2OTgyMTMyMTMuOS4wLjA.');

call add_product(
	'Skullcandy Crusher Evo', 
    'Electronics, Audio & Headphones', 
    'Skullcandy Crusher Evo: The Skullcandy Crusher Evo headphones are engineered for bass enthusiasts who crave powerful sound and immersive bass experiences. These over-ear headphones feature adjustable haptic bass that you can fine-tune to your preferences. With long battery life and comfortable ear cushions, they\'re perfect for extended listening sessions. Whether you\'re into music, gaming, or movies, the Crusher Evo delivers bone-rattling bass and crisp audio.', 
    0.28, 
    'SCE', 
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/Product%2FProduct_Skullcandy%20Crusher%20Evo.jpg?alt=media&token=af1aad58-55c2-4c69-b477-55b43eb9772b&_gl=1*1vt5lx7*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIwOTcxNi4xMS4xLjE2OTgyMTMyMzIuNjAuMC4w');

call add_product(
	'Audio Technica ATH-M50X', 
    'Electronics, Audio & Headphones', 
    'Audio Technica ATH-M50X: The Audio Technica ATH-M50X headphones are an industry standard for professional audio monitoring and music enthusiasts. These over-ear headphones provide exceptional sound clarity and accuracy, making them ideal for critical listening and studio work. The closed-back design isolates you from external noise, while the comfortable ear cushions allow for extended wear. With robust build quality and a foldable design, they\'re also suitable for on-the-go use. Experience audio precision like never before with the ATH-M50X.', 
    0.256, 
    'ATM50X', 
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/Product%2FProduct_Audio%20Technica%20ATH-M50X.png?alt=media&token=13132aa3-cf1b-46e6-be09-c4cde83d1687&_gl=1*ozk77q*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIwOTcxNi4xMS4xLjE2OTgyMTMyNDkuNDMuMC4w');

call add_product(
	'JBL Free X', 
    'Electronics, Audio & Headphones', 
    'JBL Free X: The JBL Free X true wireless earbuds are designed to provide an exceptional audio experience on the go. With their compact and wireless design, they offer true freedom and convenience. The JBL signature sound delivers crisp highs and deep bass for an immersive listening experience. The earbuds are sweat and water-resistant, making them perfect for workouts and outdoor activities. With intuitive touch controls and long battery life, the JBL Free X earbuds are your reliable companion for music and calls.', 
    0.048, 
    'JBFX', 
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/Product%2FProduct_JBL%20Free%20X.webp?alt=media&token=7064e5ff-551e-4884-8f64-04b66baa9e2b&_gl=1*132v06o*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIwOTcxNi4xMS4xLjE2OTgyMTMyNzEuMjEuMC4w');

call add_product(
	'Amazon Echo Dot 5th Gen', 
    'Electronics, Audio & Headphones', 
    'Amazon Echo Dot 5th Gen: The Amazon Echo Dot 5th Gen is a compact and smart speaker that brings the power of Alexa to your home. Its small size doesn\'t compromise on sound quality, delivering clear and balanced audio. Use voice commands to play music, control smart home devices, check the weather, and more. With a built-in speaker and the ability to connect to external audio systems, it\'s a versatile addition to any room. The Echo Dot 5th Gen makes your life easier and more connected with voice assistance at your fingertips.', 
    0.3, 
    'AED5', 
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/Product%2FProduct_Amazon%20Echo%20Dot%205th%20Gen.jpg?alt=media&token=9797214a-01fd-484f-be7e-4f60a8416042&_gl=1*8rzac8*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIwOTcxNi4xMS4xLjE2OTgyMTMyODkuMy4wLjA.');

call add_product(
	'JBL Quantum One', 
    'Electronics, Audio & Headphones', 
    'JBL Quantum One: The JBL Quantum One gaming headset is designed for gamers who demand immersive audio and precise communication. With JBL QuantumSURROUND technology, it delivers spatial sound that enhances your gaming experience. The customizable RGB lighting adds a touch of style, and the comfortable ear cushions ensure long-lasting comfort during intense gaming sessions. With a detachable boom microphone and advanced audio controls, it\'s perfect for team communication and streaming. The JBL Quantum One is your key to competitive gaming and audio excellence.', 
    0.32, 
    'JBQ1', 
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/Product%2FProduct_JBL%20Quantum%20One.webp?alt=media&token=735ff493-044b-4cec-8404-ef5aeae6a957&_gl=1*tftq37*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIwOTcxNi4xMS4xLjE2OTgyMTMzMDUuNjAuMC4w');

call add_product(
	'Kingston HyperX Cloud II', 
    'Electronics, Audio & Headphones', 
    'Kingston HyperX Cloud II: The Kingston HyperX Cloud II gaming headset is designed for gamers who demand both comfort and audio quality. With memory foam ear cushions and a durable aluminum frame, it provides hours of comfortable gaming sessions. The headset delivers immersive 7.1 surround sound with clear and detailed audio, enhancing your gaming experience. The detachable noise-canceling microphone ensures clear communication with teammates, and the versatile design allows you to use it with PC, gaming consoles, and mobile devices. The HyperX Cloud II is a top choice for gamers looking for a blend of comfort and audio excellence.', 
    0.32, 
    'KHXC2', 
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/Product%2FProduct_Kingston%20HyperX%20Cloud%20II.webp?alt=media&token=9f465ddf-b314-43e0-8abd-4a3a8347c379&_gl=1*1ccdbjc*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIwOTcxNi4xMS4xLjE2OTgyMTMzNzcuNjAuMC4w');

call add_product(
	'Razer DeathAdder V2', 
    'Electronics, Computer Accessories', 
    'Razer DeathAdder V2: The Razer DeathAdder V2 is a gaming mouse designed for precision and speed. It\'s equipped with Razer\'s Focus+ Optical Sensor, offering exceptional tracking accuracy and sensitivity. The ergonomic design ensures comfort during long gaming sessions, and the customizable RGB lighting allows you to personalize your setup. With programmable buttons and onboard memory, it caters to the preferences of competitive gamers who demand the best in performance and aesthetics.', 
    0.105, 
    'RDV2', 
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/Product%2FProduct_Razer_DeathAdder_V2.jpg?alt=media&token=7eef4196-0803-41da-ac2c-b151a8746447&_gl=1*1kvbbjm*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIwOTcxNi4xMS4xLjE2OTgyMTM0MDAuMzcuMC4w');

call add_product(
	'Nintendo Switch', 
    'Electronics, Computer Accessories', 
    'Nintendo Switch: The Nintendo Switch is the ultimate gaming console for Nintendo enthusiasts. With enhanced graphics and performance, it offers a premium gaming experience in both handheld and docked modes. The vibrant OLED display provides stunning visuals, and the comfortable Controller ensures precise gameplay. Whether you\'re exploring the vast world of Hyrule, racing in Mario Kart, or embarking on epic adventures in Pokémon, the Nintendo Switch enhances your gaming journey with style and power.', 
    0.3, 
    'NSP', 
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/Product%2FProduct_Nintendo%20Switch.jpg?alt=media&token=a9c1a359-e454-4de4-9318-4511c6896cba&_gl=1*m3wx1l*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIwOTcxNi4xMS4xLjE2OTgyMTM0MjEuMTYuMC4w');

call add_product(
	'Sony PS5', 
    'Electronics, Computer Accessories', 
    'Sony PS5: The Sony PS5 takes gaming to the next level with its cutting-edge technology and stunning graphics. This next-generation gaming console offers 4K gaming at high frame rates, providing immersive and lifelike experiences. With lightning-fast load times and the DualSense controller\'s haptic feedback, it offers a truly immersive gaming experience. The PS5 is the console of choice for gamers who demand top-tier performance and the latest gaming innovations.', 
    3.5, 
    'SP5', 
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/Product%2FProduct_Sony%20PS5.webp?alt=media&token=e727bab3-72f0-4b3d-bc27-322b54ec8ea7&_gl=1*pgtxwg*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIwOTcxNi4xMS4xLjE2OTgyMTM0NDQuNjAuMC4w');

call add_product(
	'Microsoft Xbox Series Xe', 
    'Electronics, Computer Accessories', 
    'Microsoft Xbox Series X: The Microsoft Xbox Series X is a gaming console that takes gaming to the next level with its powerful hardware and advanced features. With support for 4K gaming at high frame rates, it offers immersive and lifelike experiences. The lightning-fast load times ensure minimal wait times, and the Xbox Game Pass subscription provides access to a vast library of games. The sleek and compact design complements any gaming setup. Whether you\'re exploring virtual worlds, competing online, or enjoying the latest titles, the Xbox Series X delivers gaming excellence.', 
    4.5, 
    'MXSX', 
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/Product%2FProduct_Microsoft%20Xbox%20Series%20X.png?alt=media&token=6c9cdad6-35aa-4548-aadb-d3165289867e&_gl=1*hrxfs4*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIwOTcxNi4xMS4xLjE2OTgyMTM0NjcuMzcuMC4w');

call add_product(
	'Samsung QLED Gaming Monitor', 
    'Electronics, Computer Accessories', 
    'Samsung QLED Gaming Monitor: The Samsung QLED Gaming Monitor is a high-performance display engineered for gamers who demand precision and immersion. With a QLED panel, it offers stunning visuals with vibrant colors and high contrast ratios. The high refresh rate and low input lag ensure smooth and responsive gaming experiences. The monitor also supports HDR for lifelike graphics in compatible games. With customizable gaming modes and a sleek design, it\'s a centerpiece for any gaming setup, delivering competitive advantage and visual excellence.', 
    6.5, 
    'SQGM', 
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/Product%2FProduct_Samsung%20QLED%20Gaming%20Monitor.webp?alt=media&token=f0b3ae2d-14a6-41cf-a836-f38ca24ff468&_gl=1*1rh8fmh*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIwOTcxNi4xMS4xLjE2OTgyMTM1MDIuMi4wLjA.');

call add_product(
	'Samsung T8 SSD', 
    'Electronics, Computer Accessories', 
    'Samsung T8 SSD: The Samsung T8 SSD is a compact and portable storage solution that combines speed and convenience. With USB-C connectivity, it provides fast data transfer speeds and is compatible with a wide range of devices, including laptops, gaming consoles, and more. The sleek and durable metal casing is designed for on-the-go use, and the SSD offers ample storage for your files, games, and media. The Samsung T8 SSD is the perfect companion for those who need fast and reliable storage in a pocket-sized package.', 
    0.052, 
    'ST8T', 
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/Product%2FProduct_Samsung%20T8%20SSD.webp?alt=media&token=20d2b2d0-87ef-42d9-8b10-e7408266e554&_gl=1*1n8k3d4*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIwOTcxNi4xMS4xLjE2OTgyMTM1MzEuNjAuMC4w');

call add_product(
	'Sony Bravia 65 OLED TV"', 
    'Electronics, Home Appliances', 
    'Sony Bravia 65\' OLED TV: The Sony Bravia 65\' OLED TV is a masterpiece of television technology, combining stunning visuals and cutting-edge features. With OLED technology, it offers perfect black levels and vibrant colors for an unparalleled viewing experience. The 4K HDR display provides lifelike visuals with exceptional clarity and contrast. The TV also features advanced audio technology for immersive sound. With smart TV capabilities and compatibility with voice assistants, it offers seamless integration into your home entertainment system. The Sony Bravia OLED TV is a premium choice for home theater enthusiasts.', 
    18.5, 
    'SB65O', 
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/Product%2FSony%20Bravia%2065%20OLED%20TV.png?alt=media&token=868d4518-5edd-4b1f-bc1a-1fa34cf6870f&_gl=1*ola3d6*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIwOTcxNi4xMS4xLjE2OTgyMTM2NDEuNjAuMC4w');

call add_product(
	'LG 55 NanoCell TV"', 
    'Electronics, Home Appliances', 
    'LG 55\' NanoCell TV: The LG 55\' NanoCell TV is a smart television that combines advanced display technology with smart features for an exceptional viewing experience. With NanoCell technology, it offers vibrant and accurate colors, even in challenging lighting conditions. The 4K UHD resolution provides sharp and detailed visuals. The TV runs on LG\'s webOS platform, offering access to a wide range of streaming services and apps. With a sleek and modern design, it complements any living room or home theater setup. The LG NanoCell TV is a versatile and stylish choice for those seeking high-quality entertainment.', 
    16, 
    'LG55N', 
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/Product%2FProduct_LG_Nanoshell.jpg?alt=media&token=540d423a-07a6-4db6-b2c3-f2a88ad2a9c6&_gl=1*fnabxq*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIwOTcxNi4xMS4xLjE2OTgyMTM3MTEuNjAuMC4w');

call add_product(
	'Sony A7 IV', 
    'Electronics, Cameras & Photography', 
    'Sony A7 IV: The Sony A7 IV is a full-frame mirrorless camera that combines exceptional image quality with versatility. It boasts a high-resolution sensor and advanced image processing, making it ideal for photographers and videographers. With 4K video recording capabilities and a range of creative features, it\'s equally at home capturing stunning landscapes or dynamic portraits. The compact and lightweight design enhances portability without compromising on performance, making the A7 IV a versatile tool for visual storytellers.', 
    0.74, 
    'SA7IV', 
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/Product%2FProduct_Sony%20A7%20IV.png?alt=media&token=37196065-7d85-41ed-b25e-f28b6e6abacb&_gl=1*3ejtzr*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIwOTcxNi4xMS4xLjE2OTgyMTM3MzYuMzUuMC4w');

call add_product(
	'Fujifilm X-T5',
    'Electronics, Cameras & Photography',
    'Fujifilm X-T5: The Fujifilm X-T5 is a mirrorless camera that embodies the spirit of photography with its classic design and advanced technology. With its high-resolution sensor and powerful image processing, it delivers stunning image quality with rich colors and fine details. The vintage-inspired design pays homage to traditional film cameras, while the advanced autofocus system and versatile lens options cater to modern photography needs. Whether you\'re capturing landscapes, portraits, or street photography, the X-T5 is a reliable companion for passionate photographers.', 
    0.68, 
    'FXT5', 
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/Product%2FProduct_Fujifilm%20X-T5.jpg?alt=media&token=d87eec64-2627-4b25-9ac6-a8fee76a096b&_gl=1*b9t6s2*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIwOTcxNi4xMS4xLjE2OTgyMTM3NTkuMTIuMC4w');

call add_product(
	'Olympus OM-D E-M1 III', 
    'Electronics, Cameras & Photography', 
    'Olympus OM-D E-M1 III: The Olympus OM-D E-M1 III is a professional-grade mirrorless camera designed for photographers who demand outstanding image quality and versatility. It features a high-resolution sensor, powerful image stabilization, and a wide range of lenses to capture stunning photos and 4K videos. The compact and weather-sealed body is perfect for on-the-go photography, while the advanced autofocus system ensures precision and speed. Whether you\'re shooting landscapes, wildlife, or portraits, the OM-D E-M1 III empowers you to express your creativity.', 
    0.63, 
    'OOEM1', 
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/Product%2FProduct_Olympus%20OM-D%20E-M1%20III.jpg?alt=media&token=7c4e7901-cd84-48b8-96aa-d2672b9076bc&_gl=1*1ov39n*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIwOTcxNi4xMS4xLjE2OTgyMTM3OTIuNjAuMC4w');

call add_product(
	'Logitech C930e Webcam', 
    'Electronics, Cameras & Photography', 
    'Logitech C930e Webcam: The Logitech C930e Webcam is a professional-grade webcam designed for business and personal use. With Full HD 1080p video quality and Carl Zeiss optics, it delivers clear and sharp video for video conferencing and streaming. The wide 90-degree field of view captures more of the room, making it perfect for group meetings. The webcam also features dual stereo microphones with noise reduction for clear audio, and it\'s compatible with popular video conferencing software. The C930e Webcam is your key to professional and high-quality video communication.', 
    0.18, 
    'LGC930', 
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/Product%2FProduct_Logitech%20C930e%20Webcam.webp?alt=media&token=afcf92a8-864c-452c-a576-c404cd72fe99&_gl=1*1m7umbv*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIwOTcxNi4xMS4xLjE2OTgyMTM4MTMuMzkuMC4w');

call add_product(
	'DJI Phantom Drone', 
    'Electronics, Cameras & Photography', 
    'DJI Phantom Drone: The DJI Phantom Drone is a professional-grade quadcopter designed for aerial photography and videography. With advanced gimbal stabilization and a high-resolution camera, it captures stunning 4K videos and 20MP photos. The drone features intelligent flight modes for cinematic shots, obstacle avoidance for safety, and extended flight time for longer missions. With a sleek and compact design, it\'s easy to transport and set up for aerial adventures. The DJI Phantom is your tool for capturing breathtaking views and creating cinematic content from the sky.', 
    1.24, 
    'DJP5', 
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/Product%2FProduct_DJI%20Phantom%20Drone.jpg?alt=media&token=3b41ca76-e7cf-48d9-a1c6-571661c1c80c&_gl=1*1u9tqw0*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIwOTcxNi4xMS4xLjE2OTgyMTM4MzkuMTMuMC4w');

call add_product(
	'GoPro Hero 10', 
    'Electronics, Cameras & Photography', 
    'GoPro Hero 10: The GoPro Hero 10 is an action camera built to capture your adventures with stunning clarity and speed. With 5.3K video recording and 23MP photos, it delivers high-quality visuals in various shooting conditions. The HyperSmooth 4.0 stabilization ensures smooth and steady footage, even in challenging environments. The camera is rugged and waterproof, making it perfect for outdoor activities. With features like TimeWarp 4.0 and SuperPhoto, it elevates your content creation to the next level. The GoPro Hero 10 is the ultimate companion for capturing your most exciting moments.', 
    0.13, 
    'GPH10', 
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/Product%2FProduct_GoPro%20Hero%2010.webp?alt=media&token=26c9928e-55f1-4e50-9dc0-60c9f8d17500&_gl=1*s1qar6*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIwOTcxNi4xMS4xLjE2OTgyMTM4NTkuNTguMC4w');

call add_product(
	'Samsung Gear Fit 3', 
    'Electronics, Wearable Technology', 
    'Samsung Gear Fit 3: The Samsung Gear Fit 3 is a sleek and versatile fitness tracker designed to help you stay active and live a healthier lifestyle. Its vibrant AMOLED display provides clear and colorful data on your steps, heart rate, calories burned, and more. With advanced fitness tracking features and automatic workout detection, it keeps you motivated to achieve your fitness goals. The Gear Fit 3 is also water-resistant, making it suitable for swim tracking. Stay connected with smartphone notifications and enjoy long battery life, making it your ideal fitness companion.', 
    0.062, 
    'SGF3', 
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/Product%2FProduct_Galaxy_fit.webp?alt=media&token=f1adb3cb-9179-43be-af0b-150ebb83d41b&_gl=1*747owl*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIwOTcxNi4xMS4xLjE2OTgyMTM5NDMuNjAuMC4w');

call add_product(
	'TicWatch Pro 4', 
    'Electronics, Wearable Technology', 
    'TicWatch Pro 4: The TicWatch Pro 4 is a feature-packed smartwatch designed for fitness enthusiasts and tech-savvy individuals. It offers comprehensive health and fitness tracking, including heart rate monitoring, sleep analysis, and GPS tracking for outdoor activities. With a vibrant AMOLED display and long battery life, it provides clear visuals and extended use between charges. The dual-display technology combines an AMOLED screen with a low-power FSTN LCD, optimizing battery life. With Wear OS by Google, it also offers access to a wide range of apps and notifications. The TicWatch Pro 4 is your reliable companion for an active and connected lifestyle.', 
    0.068, 
    'TWP4', 
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/Product%2FProduct_TicWatch%20Pro%204.jpg?alt=media&token=a3df31a5-a93e-427e-8744-58f87b2da60f&_gl=1*f1zavm*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIwOTcxNi4xMS4xLjE2OTgyMTM5NjcuMzYuMC4w');

call add_product(
	'Xiaomi Mi 12', 
    'Electronics, Smartphones', 
    'Xiaomi Mi 12: The Xiaomi Mi 12 is a flagship smartphone that redefines mobile technology with cutting-edge features and performance. With a stunning display, high-resolution camera system, and powerful processors, it offers a premium user experience. Whether you\'re capturing breathtaking photos, multitasking with ease, or enjoying immersive multimedia, the Mi 12 delivers. With 5G connectivity and a sleek design, it\'s a symbol of Xiaomi\'s commitment to innovation and excellence in the world of smartphones.', 
    0.158, 
    'XM12', 
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/Product%2FProduct_Xiaomi-12.jpg?alt=media&token=8a0c4f11-c1c0-479e-a7dc-ad47a9f8fa3a&_gl=1*65y59h*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIwOTcxNi4xMS4xLjE2OTgyMTM5OTYuNy4wLjA.');

call add_product(
	'Apple iPad Pro 13', 
    'Electronics, Smartphones', 
    'Apple iPad Pro 13: The Apple iPad Pro 13 is a powerhouse of productivity and creativity. With its stunning Liquid Retina XDR display, it offers exceptional visual clarity and color accuracy. Powered by the M1 chip, it handles demanding tasks with ease, whether you\'re editing 4K videos, designing digital art, or multitasking on the go. The Apple Pencil and Magic Keyboard add versatility and precision to your work. The iPad Pro 13 is a versatile tool for professionals and creative individuals who require a portable and powerful computing solution.', 
    0.47, 
    'AIPP13', 
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/Product%2FProduct_ipad-pro%2013.jpg?alt=media&token=6ae305d5-b554-48f0-85a4-d86fcf8d47d8&_gl=1*157ns9p*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIwOTcxNi4xMS4xLjE2OTgyMTQwNTIuNDIuMC4w');

call add_product(
	'Samsung Galaxy Tab S9', 
    'Electronics, Smartphones', 
    'Samsung Galaxy Tab S9: The Samsung Galaxy Tab S9 is a premium Android tablet that combines productivity and entertainment in one sleek device. With its high-resolution Super AMOLED display, it offers vivid visuals for movies, gaming, and productivity tasks. The powerful processors ensure smooth performance, and the S Pen stylus provides precision and creativity. With DeX mode, it transforms into a desktop-like experience, making it perfect for work or play. The Galaxy Tab S9 is a versatile tablet for those who demand the best of both worlds.', 
    0.46, 
    'SGTS9', 
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/Product%2FProduct_s9_tab.webp?alt=media&token=1f8394f5-e377-4de5-8cf9-e10a367d90bf&_gl=1*flcefd*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIwOTcxNi4xMS4xLjE2OTgyMTQxMDguNjAuMC4w');


-- add items

-- iphone 14 blue 128
call add_item
(
	'IP14', -- SKU
    699, -- Price
    15, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2Fiphone_14_blue.jpg?alt=media&token=0b8f4675-a4eb-43a5-a0b0-3f70ef2d4096&_gl=1*5pfv95*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc0NDE1OC4zLjEuMTY5Nzc0NDIyMS42MC4wLjA.', -- Image
    2, -- No. of variants
    'Color, Storage', -- Variants comma separated
    'Blue, 128GB' -- Attribute comma separated
);
-- iphone 14 blue 256
call add_item
(
	'IP14', -- SKU
    799, -- Price
    7, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2Fiphone_14_blue.jpg?alt=media&token=0b8f4675-a4eb-43a5-a0b0-3f70ef2d4096&_gl=1*5pfv95*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc0NDE1OC4zLjEuMTY5Nzc0NDIyMS42MC4wLjA.', -- Image
    2, -- No. of variants
    'Color, Storage', -- Variants comma separated
    'Blue, 256GB' -- Attribute comma separated
);
-- iphone 14 blue 512
call add_item
(
	'IP14', -- SKU
    999, -- Price
    2, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2Fiphone_14_blue.jpg?alt=media&token=0b8f4675-a4eb-43a5-a0b0-3f70ef2d4096&_gl=1*5pfv95*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc0NDE1OC4zLjEuMTY5Nzc0NDIyMS42MC4wLjA.', -- Image
    2, -- No. of variants
    'Color, Storage', -- Variants comma separated
    'Blue, 512GB' -- Attribute comma separated
);
-- iphone 14 purple 128
call add_item
(
	'IP14', -- SKU
    699, -- Price
    15, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2Fiphone_14_purple.jpg?alt=media&token=a62ed64b-7631-4615-810b-ed681d717704&_gl=1*1mqnpjn*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc0NDE1OC4zLjEuMTY5Nzc0NDMzNS42MC4wLjA.', -- Image
    2, -- No. of variants
    'Color, Storage', -- Variants comma separated
    'Purple, 128GB' -- Attribute comma separated
);
-- iphone 14 purple 256
call add_item
(
	'IP14', -- SKU
    799, -- Price
    7, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2Fiphone_14_purple.jpg?alt=media&token=a62ed64b-7631-4615-810b-ed681d717704&_gl=1*1mqnpjn*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc0NDE1OC4zLjEuMTY5Nzc0NDMzNS42MC4wLjA.', -- Image
    2, -- No. of variants
    'Color, Storage', -- Variants comma separated
    'Purple, 256GB' -- Attribute comma separated
);
-- iphone 14 midnight 256
call add_item
(
	'IP14', -- SKU
    799, -- Price
    10, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2Fiphone_14_midnight.jpg?alt=media&token=b38b23e4-be87-44db-b578-095d3f6ca0cb&_gl=1*kjpg7z*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc0NDE1OC4zLjEuMTY5Nzc0NDQxNC42MC4wLjA.', -- Image
    2, -- No. of variants
    'Color, Storage', -- Variants comma separated
    'Midnight, 256GB' -- Attribute comma separated
);
-- iphone 14 red 128
call add_item
(
	'IP14', -- SKU
    849, -- Price
    7, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2Fiphone_14_product_red.jpg?alt=media&token=ab01af96-2f72-4549-8532-af072758f039&_gl=1*xpu2k1*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc0NDE1OC4zLjEuMTY5Nzc0NDQ1Ni4xOC4wLjA.', -- Image
    2, -- No. of variants
    'Color, Storage', -- Variants comma separated
    'Red, 256GB' -- Attribute comma separated
);
-- iphone 14 red 256
call add_item
(
	'IP14', -- SKU
    949, -- Price
    12, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2Fiphone_14_product_red.jpg?alt=media&token=ab01af96-2f72-4549-8532-af072758f039&_gl=1*xpu2k1*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc0NDE1OC4zLjEuMTY5Nzc0NDQ1Ni4xOC4wLjA.', -- Image
    2, -- No. of variants
    'Color, Storage', -- Variants comma separated
    'Red, 256GB' -- Attribute comma separated
);


-- Samsung Galaxy S22 white 128
call add_item
(
	'SGS22', -- SKU
    799, -- Price
    2, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2Fgalaxy_s22_White.png?alt=media&token=a9bb263f-8df8-4fff-997e-04687ef4b23c&_gl=1*12nhxac*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc0NDE1OC4zLjEuMTY5Nzc0NDUwOC42MC4wLjA.', -- Image
    2, -- No. of variants
    'Color, Storage', -- Variants comma separated
    'White, 128GB' -- Attribute comma separated
);
-- Samsung Galaxy S22 white 256
call add_item
(
	'SGS22', -- SKU
    899, -- Price
    8, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2Fgalaxy_s22_White.png?alt=media&token=a9bb263f-8df8-4fff-997e-04687ef4b23c&_gl=1*12nhxac*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc0NDE1OC4zLjEuMTY5Nzc0NDUwOC42MC4wLjA.', -- Image
    2, -- No. of variants
    'Color, Storage', -- Variants comma separated
    'White, 256GB' -- Attribute comma separated
);
-- Samsung Galaxy S22 black 128
call add_item
(
	'SGS22', -- SKU
    799, -- Price
    15, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2Fgalaxy_s22_Black.png?alt=media&token=1fc56c58-fd12-447c-b08f-f55a86713191&_gl=1*k4zg1p*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc0NDE1OC4zLjEuMTY5Nzc0NDU1NS4xMy4wLjA.', -- Image
    2, -- No. of variants
    'Color, Storage', -- Variants comma separated
    'Black, 256GB' -- Attribute comma separated
);
-- Samsung Galaxy S22 black 256
call add_item
(
	'SGS22', -- SKU
    899, -- Price
    10, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2Fgalaxy_s22_Black.png?alt=media&token=1fc56c58-fd12-447c-b08f-f55a86713191&_gl=1*k4zg1p*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc0NDE1OC4zLjEuMTY5Nzc0NDU1NS4xMy4wLjA.', -- Image
    2, -- No. of variants
    'Color, Storage', -- Variants comma separated
    'Black, 256GB' -- Attribute comma separated
);
-- Samsung Galaxy S22 purple 256
call add_item
(
	'SGS22', -- SKU
    899, -- Price
    1, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2Fgalaxy_s22_purple.png?alt=media&token=12ccfc78-b7b1-4b47-aa01-5ff0e2019dc2&_gl=1*lz13ru*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc0NDE1OC4zLjEuMTY5Nzc0NDYwMy42MC4wLjA.', -- Image
    2, -- No. of variants
    'Color, Storage', -- Variants comma separated
    'Purple, 256GB' -- Attribute comma separated
);


-- Dell XPS 15 variant 1
call add_item
(
	'DXPS15', -- SKU
    1199, -- Price
    6, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FDell_XPS_15.jpg?alt=media&token=da709b1e-759c-41ed-8a64-56c78d56a8f1&_gl=1*1asdapk*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc0NDE1OC4zLjEuMTY5Nzc0NDY4My42MC4wLjA.', -- Image
    6, -- No. of variants
    'Processor, Operating System, GPU, RAM, Storage, Display', -- Variants comma separated
    '13th Gen Intel Core i7, Windows 11 Home, Intel Arc A370M Graphics-4GB, DDR5-16GB, 512GB, FHD+' -- Attribute comma separated
);
-- Dell XPS 15 variant 2
call add_item
(
	'DXPS15', -- SKU
    1249, -- Price
    2, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FDell_XPS_15.jpg?alt=media&token=da709b1e-759c-41ed-8a64-56c78d56a8f1&_gl=1*1asdapk*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc0NDE1OC4zLjEuMTY5Nzc0NDY4My42MC4wLjA.', -- Image
    6, -- No. of variants
    'Processor, Operating System, GPU, RAM, Storage, Display', -- Variants comma separated
    '13th Gen Intel Core i7, Windows 11 Pro, Intel Arc A370M Graphics-4GB, DDR5-16GB, 512GB, FHD+' -- Attribute comma separated
);
-- Dell XPS 15 variant 3
call add_item
(
	'DXPS15', -- SKU
    1649, -- Price
    14, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FDell_XPS_15.jpg?alt=media&token=da709b1e-759c-41ed-8a64-56c78d56a8f1&_gl=1*1asdapk*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc0NDE1OC4zLjEuMTY5Nzc0NDY4My42MC4wLjA.', -- Image
    6, -- No. of variants
    'Processor, Operating System, GPU, RAM, Storage, Display', -- Variants comma separated
    '13th Gen Intel Core i7, Windows 11 Pro, NVIDIA GeForce RTX 4050-6GB, DDR5-16GB, 1TB, FHD+' -- Attribute comma separated
);
-- Dell XPS 15 variant 4
call add_item
(
	'DXPS15', -- SKU
    1849, -- Price
    7, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FDell_XPS_15.jpg?alt=media&token=da709b1e-759c-41ed-8a64-56c78d56a8f1&_gl=1*1asdapk*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc0NDE1OC4zLjEuMTY5Nzc0NDY4My42MC4wLjA.', -- Image
    6, -- No. of variants
    'Processor, Operating System, GPU, RAM, Storage, Display', -- Variants comma separated
    '13th Gen Intel Core i9, Windows 11 Home, NVIDIA GeForce RTX 4060-8GB, DDR5-16GB, 1TB, FHD+' -- Attribute comma separated
);
-- Dell XPS 15 variant 5
call add_item
(
	'DXPS15', -- SKU
    2349, -- Price
    7, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FDell_XPS_15.jpg?alt=media&token=da709b1e-759c-41ed-8a64-56c78d56a8f1&_gl=1*1asdapk*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc0NDE1OC4zLjEuMTY5Nzc0NDY4My42MC4wLjA.', -- Image
    6, -- No. of variants
    'Processor, Operating System, GPU, RAM, Storage, Display', -- Variants comma separated
    '13th Gen Intel Core i9, Windows 11 Pro, NVIDIA GeForce RTX 4060-8GB, DDR5-32GB, 1TB, 3.5K OLED' -- Attribute comma separated
);
-- Dell XPS 15 variant 6
call add_item
(
	'DXPS15', -- SKU
    2499, -- Price
    6, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FDell_XPS_15.jpg?alt=media&token=da709b1e-759c-41ed-8a64-56c78d56a8f1&_gl=1*1asdapk*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc0NDE1OC4zLjEuMTY5Nzc0NDY4My42MC4wLjA.', -- Image
    6, -- No. of variants
    'Processor, Operating System, GPU, RAM, Storage, Display', -- Variants comma separated
    '13th Gen Intel Core i9, Windows 11 Pro, NVIDIA GeForce RTX 4060-8GB, DDR5-32GB, 2TB, 3.5K OLED' -- Attribute comma separated
);
-- Dell XPS 15 variant 7
call add_item
(
	'DXPS15', -- SKU
    2849, -- Price
    3, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FDell_XPS_15.jpg?alt=media&token=da709b1e-759c-41ed-8a64-56c78d56a8f1&_gl=1*1asdapk*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc0NDE1OC4zLjEuMTY5Nzc0NDY4My42MC4wLjA.', -- Image
    6, -- No. of variants
    'Processor, Operating System, GPU, RAM, Storage, Display', -- Variants comma separated
    '13th Gen Intel Core i9, Windows 11 Pro, NVIDIA GeForce RTX 4070-8GB, DDR5-32GB, 4TB, 3.5K OLED' -- Attribute comma separated
);
-- Dell XPS 15 variant 8
call add_item
(
	'DXPS15', -- SKU
    3749, -- Price
    1, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FDell_XPS_15.jpg?alt=media&token=da709b1e-759c-41ed-8a64-56c78d56a8f1&_gl=1*1asdapk*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc0NDE1OC4zLjEuMTY5Nzc0NDY4My42MC4wLjA.', -- Image
    6, -- No. of variants
    'Processor, Operating System, GPU, RAM, Storage, Display', -- Variants comma separated
    '13th Gen Intel Core i9, Windows 11 Pro, NVIDIA GeForce RTX 4070-8GB, DDR5-64GB, 8TB, 3.5K OLED' -- Attribute comma separated
);


-- Sony WH-1000XM5 Black
call add_item
(
	'SWH5', -- SKU
    399, -- Price
    11, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FSony_WH-1000XM5_Black.png?alt=media&token=24b66bea-64f9-4851-bb47-7e858d1e25f3&_gl=1*1im6sex*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc0NDE1OC4zLjEuMTY5Nzc0NDg1NC42MC4wLjA.', -- Image
    1, -- No. of variants
    'Color', -- Variants comma separated
    'Black' -- Attribute comma separated
);
-- Sony WH-1000XM5 Blue
call add_item
(
	'SWH5', -- SKU
    399, -- Price
    10, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FSony_WH-1000XM5_Blue.png?alt=media&token=cb07f3f2-9415-4074-913e-4e38a11d955c&_gl=1*juhdvw*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc0NDE1OC4zLjEuMTY5Nzc0NDgxOS4zNS4wLjA.', -- Image
    1, -- No. of variants
    'Color', -- Variants comma separated
    'Blue' -- Attribute comma separated
);
-- Sony WH-1000XM5 white
call add_item
(
	'SWH5', -- SKU
    399, -- Price
    15, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FSony_WH-1000XM5_White.png?alt=media&token=336bdea7-e535-45ad-8d43-91215f9397ca&_gl=1*xuca32*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc0NDE1OC4zLjEuMTY5Nzc0NDc5NC42MC4wLjA.', -- Image
    1, -- No. of variants
    'Color', -- Variants comma separated
    'White' -- Attribute comma separated
);


-- Batman Action Figure small
call add_item
(
	'BAF', -- SKU
    84, -- Price
    7, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FBatman_AF_small.jpg?alt=media&token=d33c83bf-cab3-4cb4-b69e-48c283ff8fa0&_gl=1*es2qtv*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc0NDE1OC4zLjEuMTY5Nzc0NDg4MC4zNC4wLjA.', -- Image
    1, -- No. of variants
    'Size', -- Variants comma separated
    'Small' -- Attribute comma separated
);
-- Batman Action Figure medium
call add_item
(
	'BAF', -- SKU
    99, -- Price
    2, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FBatman_AF_M_L.jpg?alt=media&token=e7db0146-490e-4199-9383-8d9274b0259d&_gl=1*dlh865*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc0NDE1OC4zLjEuMTY5Nzc0NDkwMC4xNC4wLjA.', -- Image
    1, -- No. of variants
    'Size', -- Variants comma separated
    'Medium' -- Attribute comma separated
);
-- Batman Action Figure small
call add_item
(
	'BAF', -- SKU
    109, -- Price
    6, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FBatman_AF_M_L.jpg?alt=media&token=e7db0146-490e-4199-9383-8d9274b0259d&_gl=1*dlh865*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc0NDE1OC4zLjEuMTY5Nzc0NDkwMC4xNC4wLjA.', -- Image
    1, -- No. of variants
    'Size', -- Variants comma separated
    'Large' -- Attribute comma separated
);


-- Bose QC45 Black
call add_item
(
	'BQC45', -- SKU
    329, -- Price
    8, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FBose_QC45_black.jpg?alt=media&token=f5740ee2-5905-4a21-ba69-b3a13209379f&_gl=1*m3uqfm*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc0NDE1OC4zLjEuMTY5Nzc0NDk1OC40MC4wLjA.', -- Image
    1, -- No. of variants
    'Color', -- Variants comma separated
    'Black' -- Attribute comma separated
);
-- Bose QC45 White
call add_item
(
	'BQC45', -- SKU
    329, -- Price
    2, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FBose_QC45_White.jpg?alt=media&token=84751aca-786e-4275-905f-096f9cdd5f83&_gl=1*gejduk*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc0NDE1OC4zLjEuMTY5Nzc0NDkzOC42MC4wLjA.', -- Image
    1, -- No. of variants
    'Color', -- Variants comma separated
    'White' -- Attribute comma separated
);


-- Google Pixel 8 pro Blue 128
call add_item
(
	'GP8P', -- SKU
    999, -- Price
    13, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FGoogle_pixel_8_Pro_blue.jpg?alt=media&token=b157244a-fd6c-46c9-b9d8-e121e02eb53f&_gl=1*1wx7rlg*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc0NDE1OC4zLjEuMTY5Nzc0NDk4My4xNS4wLjA.', -- Image
    2, -- No. of variants
    'Color, Storage', -- Variants comma separated
    'Bay, 128GB' -- Attribute comma separated
);
-- Google Pixel 8 pro Blue 256
call add_item
(
	'GP8P', -- SKU
    1059, -- Price
    1, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FGoogle_pixel_8_Pro_blue.jpg?alt=media&token=b157244a-fd6c-46c9-b9d8-e121e02eb53f&_gl=1*1wx7rlg*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc0NDE1OC4zLjEuMTY5Nzc0NDk4My4xNS4wLjA.', -- Image
    2, -- No. of variants
    'Color, Storage', -- Variants comma separated
    'Bay, 256GB' -- Attribute comma separated
);
-- Google Pixel 8 pro Blue 512
call add_item
(
	'GP8P', -- SKU
    1179, -- Price
    9, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FGoogle_pixel_8_Pro_blue.jpg?alt=media&token=b157244a-fd6c-46c9-b9d8-e121e02eb53f&_gl=1*1wx7rlg*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc0NDE1OC4zLjEuMTY5Nzc0NDk4My4xNS4wLjA.', -- Image
    2, -- No. of variants
    'Color, Storage', -- Variants comma separated
    'Bay, 512GB' -- Attribute comma separated
);
-- Google Pixel 8 pro Black 128
call add_item
(
	'GP8P', -- SKU
    999, -- Price
    8, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FGoogle_pixel_8_Pro_black.jpg?alt=media&token=0a9b39f0-2edc-4f7e-9d44-8c3f729dffdd&_gl=1*1812tpi*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc0NDE1OC4zLjEuMTY5Nzc0NTA0MC42MC4wLjA.', -- Image
    2, -- No. of variants
    'Color, Storage', -- Variants comma separated
    'Obsidian, 128GB' -- Attribute comma separated
);
-- Google Pixel 8 pro Black 256
call add_item
(
	'GP8P', -- SKU
    1059, -- Price
    113, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FGoogle_pixel_8_Pro_black.jpg?alt=media&token=0a9b39f0-2edc-4f7e-9d44-8c3f729dffdd&_gl=1*1812tpi*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc0NDE1OC4zLjEuMTY5Nzc0NTA0MC42MC4wLjA.', -- Image
    2, -- No. of variants
    'Color, Storage', -- Variants comma separated
    'Obsidian, 256GB' -- Attribute comma separated
);
-- Google Pixel 8 pro Black 512
call add_item
(
	'GP8P', -- SKU
    1179, -- Price
    7, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FGoogle_pixel_8_Pro_black.jpg?alt=media&token=0a9b39f0-2edc-4f7e-9d44-8c3f729dffdd&_gl=1*1812tpi*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc0NDE1OC4zLjEuMTY5Nzc0NTA0MC42MC4wLjA.', -- Image
    2, -- No. of variants
    'Color, Storage', -- Variants comma separated
    'Obsidian, 512GB' -- Attribute comma separated
);
-- Google Pixel 8 pro Black 1TB
call add_item
(
	'GP8P', -- SKU
    1399, -- Price
    2, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FGoogle_pixel_8_Pro_black.jpg?alt=media&token=0a9b39f0-2edc-4f7e-9d44-8c3f729dffdd&_gl=1*1812tpi*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc0NDE1OC4zLjEuMTY5Nzc0NTA0MC42MC4wLjA.', -- Image
    2, -- No. of variants
    'Color, Storage', -- Variants comma separated
    'Obsidian, 1TB' -- Attribute comma separated
);
-- Google Pixel 8 pro Porcelain 128
call add_item
(
	'GP8P', -- SKU
    999, -- Price
    1, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FGoogle_pixel_8_Pro_Porcelain.jpg?alt=media&token=772b8418-83e4-4cb9-9a10-508ca76f76d7&_gl=1*1r3drgb*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc0NDE1OC4zLjEuMTY5Nzc0NTA5My43LjAuMA..', -- Image
    2, -- No. of variants
    'Color, Storage', -- Variants comma separated
    'Porcelain, 128GB' -- Attribute comma separated
);
-- Google Pixel 8 pro Porcelain 512
call add_item
(
	'GP8P', -- SKU
    1179, -- Price
    6, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FGoogle_pixel_8_Pro_Porcelain.jpg?alt=media&token=772b8418-83e4-4cb9-9a10-508ca76f76d7&_gl=1*1r3drgb*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc0NDE1OC4zLjEuMTY5Nzc0NTA5My43LjAuMA..', -- Image
    2, -- No. of variants
    'Color, Storage', -- Variants comma separated
    'Porcelain, 512GB' -- Attribute comma separated
);


-- OnePlus 11 128GB 8GB green
call add_item
(
	'1P11', -- SKU
    699, -- Price
    11, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FOnePlus_11_5G_Green.jpg?alt=media&token=f0d4be93-0698-48ae-9ef1-1d71708b12c5&_gl=1*1tgw6it*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc0NDE1OC4zLjEuMTY5Nzc0NTE4MC42MC4wLjA.', -- Image
    3, -- No. of variants
    'Color, Storage, RAM', -- Variants comma separated
    'Green, 128GB, 8GB' -- Attribute comma separated
);
-- OnePlus 11 256GB 12GB green
call add_item
(
	'1P11', -- SKU
    759, -- Price
    5, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FOnePlus_11_5G_Green.jpg?alt=media&token=f0d4be93-0698-48ae-9ef1-1d71708b12c5&_gl=1*1tgw6it*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc0NDE1OC4zLjEuMTY5Nzc0NTE4MC42MC4wLjA.', -- Image
    3, -- No. of variants
    'Color, Storage, RAM', -- Variants comma separated
    'Green, 256GB, 12GB' -- Attribute comma separated
);
-- OnePlus 11 128GB 8GB black
call add_item
(
	'1P11', -- SKU
    649, -- Price
    15, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FOnePlus_11_5G_Black.jpg?alt=media&token=59b026e0-cde6-46f6-8e63-6a589907960f&_gl=1*oh7o79*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc0NDE1OC4zLjEuMTY5Nzc0NTIzNS41LjAuMA..', -- Image
    3, -- No. of variants
    'Color, Storage, RAM', -- Variants comma separated
    'Black, 256GB, 16GB' -- Attribute comma separated
);


-- Asus ZenBook Pro
call add_item
(
	'AZBP', -- SKU
    1819, -- Price
    2, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FOnePlus_11_5G_Black.jpg?alt=media&token=59b026e0-cde6-46f6-8e63-6a589907960f&_gl=1*oh7o79*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc0NDE1OC4zLjEuMTY5Nzc0NTIzNS41LjAuMA..', -- Image
    1, -- No. of variants
    'Display Type', -- Variants comma separated
    'Single' -- Attribute comma separated
);
-- Asus ZenBook Pro DUO
call add_item
(
	'AZBP', -- SKU
    2099, -- Price
    3, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FOnePlus_11_5G_Black.jpg?alt=media&token=59b026e0-cde6-46f6-8e63-6a589907960f&_gl=1*oh7o79*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc0NDE1OC4zLjEuMTY5Nzc0NTIzNS41LjAuMA..', -- Image
    1, -- No. of variants
    'Display Type', -- Variants comma separated
    'Duo' -- Attribute comma separated
);


-- MacBook Air M2 Starlight 256GB
call add_item
(
	'MBA2', -- SKU
    1199, -- Price
    13, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2Fmacbook_air_M2_Starlight.webp?alt=media&token=60cfb376-f6e3-43af-b104-da91a995077b&_gl=1*ueafcc*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc3MzkwNC40LjAuMTY5Nzc3MzkwNC42MC4wLjA.', -- Image
    2, -- No. of variants
    'Color, Storage', -- Variants comma separated
    'Starlight, 256GB' -- Attribute comma separated
);
-- MacBook Air M2 Starlight 512GB
call add_item
(
	'MBA2', -- SKU
    1599, -- Price
    7, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2Fmacbook_air_M2_Starlight.webp?alt=media&token=60cfb376-f6e3-43af-b104-da91a995077b&_gl=1*ueafcc*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc3MzkwNC40LjAuMTY5Nzc3MzkwNC42MC4wLjA.', -- Image
    2, -- No. of variants
    'Color, Storage', -- Variants comma separated
    'Starlight, 512GB' -- Attribute comma separated
);
-- MacBook Air M2 Midnight 256GB
call add_item
(
	'MBA2', -- SKU
    1199, -- Price
    4, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2Fmacbook_air_M2_midnight.webp?alt=media&token=77d262ce-e593-4f79-9f3b-c7c0e6616f86&_gl=1*sl3s2d*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc3MzkwNC40LjEuMTY5Nzc3Mzk1My4xMS4wLjA.', -- Image
    2, -- No. of variants
    'Color, Storage', -- Variants comma separated
    'Midnight, 256GB' -- Attribute comma separated
);
-- MacBook Air M2 Midnight 512GB
call add_item
(
	'MBA2', -- SKU
    1599, -- Price
    14, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2Fmacbook_air_M2_midnight.webp?alt=media&token=77d262ce-e593-4f79-9f3b-c7c0e6616f86&_gl=1*sl3s2d*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc3MzkwNC40LjEuMTY5Nzc3Mzk1My4xMS4wLjA.', -- Image
    2, -- No. of variants
    'Color, Storage', -- Variants comma separated
    'Midnight, 512GB' -- Attribute comma separated
);
-- MacBook Air M2 Silver 256GB
call add_item
(
	'MBA2', -- SKU
    1199, -- Price
    2, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2Fmacbook_air_M2_Silver.webp?alt=media&token=b5a154cb-07bc-49d6-95f6-ffbb49b880f0&_gl=1*sd4fod*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc3MzkwNC40LjEuMTY5Nzc3NDAxMS42MC4wLjA.', -- Image
    2, -- No. of variants
    'Color, Storage', -- Variants comma separated
    'Silver, 256GB' -- Attribute comma separated
);
-- MacBook Air M2 Silver 512GB
call add_item
(
	'MBA2', -- SKU
    1599, -- Price
    14, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2Fmacbook_air_M2_Silver.webp?alt=media&token=b5a154cb-07bc-49d6-95f6-ffbb49b880f0&_gl=1*sd4fod*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc3MzkwNC40LjEuMTY5Nzc3NDAxMS42MC4wLjA.', -- Image
    2, -- No. of variants
    'Color, Storage', -- Variants comma separated
    'Silver, 512GB' -- Attribute comma separated
);
-- MacBook Air M2 Space Grey 256GB
call add_item
(
	'MBA2', -- SKU
    1199, -- Price
    10, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2Fmacbook_air_M2_Spacegrey.webp?alt=media&token=01c55a2f-156c-4d7b-897e-579c072c28fb&_gl=1*tzyor6*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc3MzkwNC40LjEuMTY5Nzc3NDA4Mi42MC4wLjA.', -- Image
    2, -- No. of variants
    'Color, Storage', -- Variants comma separated
    'Space Grey, 256GB' -- Attribute comma separated
);
-- MacBook Air M2 Space Grey 512GB
call add_item
(
	'MBA2', -- SKU
    1599, -- Price
    5, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2Fmacbook_air_M2_Spacegrey.webp?alt=media&token=01c55a2f-156c-4d7b-897e-579c072c28fb&_gl=1*tzyor6*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc3MzkwNC40LjEuMTY5Nzc3NDA4Mi42MC4wLjA.', -- Image
    2, -- No. of variants
    'Color, Storage', -- Variants comma separated
    'Space Grey, 512GB' -- Attribute comma separated
);


-- Beats Studio Buds Plus Black
call add_item
(
	'BSBP', -- SKU
    169, -- Price
    2, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FBeats_StudioBuds_plus_black.jpg?alt=media&token=f1b952b9-994e-46c4-9a94-11daede06dd0&_gl=1*1qk1ejl*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc3MzkwNC40LjEuMTY5Nzc3NDExMy4yOS4wLjA.', -- Image
    1, -- No. of variants
    'Color', -- Variants comma separated
    'Black' -- Attribute comma separated
);
-- Beats Studio Buds Plus Cosmic Silver
call add_item
(
	'BSBP', -- SKU
    169, -- Price
    8, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FBeats_StudioBuds_plus_cosmic_silver.jpg?alt=media&token=d16cf8e1-5a31-45ce-8cbc-e040529e3668&_gl=1*1m1l30l*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc3MzkwNC40LjEuMTY5Nzc3NDE0Mi42MC4wLjA.', -- Image
    1, -- No. of variants
    'Color', -- Variants comma separated
    'Cosmic Silver' -- Attribute comma separated
);
-- Beats Studio Buds Plus Ivory
call add_item
(
	'BSBP', -- SKU
    169, -- Price
    7, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FBeats_StudioBuds_plus_ivory.jpg?alt=media&token=6c33b6de-eac0-4034-acc7-f3670138c054&_gl=1*edrvhi*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc3MzkwNC40LjEuMTY5Nzc3NDE2Mi40MC4wLjA.', -- Image
    1, -- No. of variants
    'Color', -- Variants comma separated
    'Ivory' -- Attribute comma separated
);
-- Beats Studio Buds Plus Pink
call add_item
(
	'BSBP', -- SKU
    169, -- Price
    11, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FBeats_StudioBuds_plus_ivory.jpg?alt=media&token=6c33b6de-eac0-4034-acc7-f3670138c054&_gl=1*edrvhi*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc3MzkwNC40LjEuMTY5Nzc3NDE2Mi40MC4wLjA.', -- Image
    1, -- No. of variants
    'Color', -- Variants comma separated
    'Pink' -- Attribute comma separated
);
-- Beats Studio Buds Plus Transparent
call add_item
(
	'BSBP', -- SKU
    169, -- Price
    11, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FBeats_StudioBuds_plus_transparent.jpg?alt=media&token=9a342c5b-21d5-4b3e-bb43-8678fcd1cfd9&_gl=1*1d9f9ki*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc3MzkwNC40LjEuMTY5Nzc3NDIwOS42MC4wLjA.', -- Image
    1, -- No. of variants
    'Color', -- Variants comma separated
    'Transparent' -- Attribute comma separated
);


-- Jabra Elite 85t Black
call add_item
(
	'JE85', -- SKU
    164, -- Price
    4, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FJabra_Elite_85t.jpg?alt=media&token=6f4861c6-7acd-499c-b378-8eb3e19fb91c&_gl=1*hh7q18*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc3MzkwNC40LjEuMTY5Nzc3NDIzOC4zMS4wLjA.', -- Image
    1, -- No. of variants
    'Color', -- Variants comma separated
    'Black' -- Attribute comma separated
);


-- Ironman Action Figure mark 2
call add_item
(
	'IAF', -- SKU
    41.88, -- Price
    5, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FIronman_AF_Mark2.jpg?alt=media&token=4919a783-25bc-483f-a0ae-7cb31499e154&_gl=1*169rss7*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc3MzkwNC40LjEuMTY5Nzc3NDI2Ni4zLjAuMA..', -- Image
    1, -- No. of variants
    'Suit Version', -- Variants comma separated
    'Mark 2' -- Attribute comma separated
);
-- Ironman Action Figure mark 3
call add_item
(
	'IAF', -- SKU
    41.88, -- Price
    5, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FIronman_AF_Mark3.jpg?alt=media&token=6f7f14b8-624e-4bee-8289-4a1adf0d8fc1&_gl=1*1txdxqp*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc3MzkwNC40LjEuMTY5Nzc3NDMwNi42MC4wLjA.', -- Image
    1, -- No. of variants
    'Suit Version', -- Variants comma separated
    'Mark 3' -- Attribute comma separated
);
-- Ironman Action Figure mark 4
call add_item
(
	'IAF', -- SKU
    43.95, -- Price
    5, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FIronman_AF_Mark4.jpg?alt=media&token=7a611ce9-a38f-4752-98be-6276894fbe9e&_gl=1*11iyvlc*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc3MzkwNC40LjEuMTY5Nzc3NDM1Ny45LjAuMA..', -- Image
    1, -- No. of variants
    'Suit Version', -- Variants comma separated
    'Mark 4' -- Attribute comma separated
);
-- Ironman Action Figure mark 42
call add_item
(
	'IAF', -- SKU
    41.88, -- Price
    3, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FIronman_AF_Mark42.jpg?alt=media&token=6b353920-3ad9-4170-b030-73ac5a566e52&_gl=1*16t7yfh*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc3MzkwNC40LjEuMTY5Nzc3NDM4MC42MC4wLjA.', -- Image
    1, -- No. of variants
    'Suit Version', -- Variants comma separated
    'Mark 42' -- Attribute comma separated
);
-- Ironman Action Figure mark 5
call add_item
(
	'IAF', -- SKU
    41.88, -- Price
    6, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FIronman_AF_Mark5.jpg?alt=media&token=c22567d5-2846-48dd-8d49-767bd8f97ab7&_gl=1*145swo5*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc3MzkwNC40LjEuMTY5Nzc3NDQxMi4yOC4wLjA.', -- Image
    1, -- No. of variants
    'Suit Version', -- Variants comma separated
    'Mark 5' -- Attribute comma separated
);
-- Ironman Action Figure mark 50
call add_item
(
	'IAF', -- SKU
    66.83, -- Price
    1, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FIronman_AF_Mark50.jpg?alt=media&token=924654a1-1131-47f5-bfa1-d834119b169b&_gl=1*13nmsi6*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc3MzkwNC40LjEuMTY5Nzc3NDQzMy43LjAuMA..', -- Image
    1, -- No. of variants
    'Suit Version', -- Variants comma separated
    'Mark 50' -- Attribute comma separated
);
-- Ironman Action Figure mark 6
call add_item
(
	'IAF', -- SKU
    41.88, -- Price
    6, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FIronman_AF_Mark6.jpg?alt=media&token=b3c09573-c1ba-4b1f-9f3d-7e3b29ce3d6c&_gl=1*16ed7gh*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc3MzkwNC40LjEuMTY5Nzc3NDQ5OC42MC4wLjA.', -- Image
    1, -- No. of variants
    'Suit Version', -- Variants comma separated
    'Mark 6' -- Attribute comma separated
);
-- Ironman Action Figure mark 7
call add_item
(
	'IAF', -- SKU
    41.88, -- Price
    6, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FIronman_AF_Mark7.jpg?alt=media&token=56e0124f-1eb3-4a86-8362-ffb2215335ae&_gl=1*xzf7p3*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc3MzkwNC40LjEuMTY5Nzc3NDUyNC4zNC4wLjA.', -- Image
    1, -- No. of variants
    'Suit Version', -- Variants comma separated
    'Mark 7' -- Attribute comma separated
);


-- Lego Star Wars Kit style 13134
call add_item
(
	'LSWK', -- SKU
    299, -- Price
    7, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FStar_Wars_Lego_kit_Style_13134.jpg?alt=media&token=301d9e7d-86b1-4526-ac92-316d00589b9e&_gl=1*wwxt7v*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc3MzkwNC40LjEuMTY5Nzc3NDU2My42MC4wLjA.', -- Image
    1, -- No. of variants
    'Style', -- Variants comma separated
    '13134' -- Attribute comma separated
);
-- Lego Star Wars Kit style 13135
call add_item
(
	'LSWK', -- SKU
    399, -- Price
    15, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FStar_Wars_Lego_kit_Style_13135.jpg?alt=media&token=a92e98cc-0bd1-45fd-a8bd-1f7e14332d82&_gl=1*131ym7r*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc3MzkwNC40LjEuMTY5Nzc3NDU4Ni4zNy4wLjA.', -- Image
    1, -- No. of variants
    'Style', -- Variants comma separated
    '13135' -- Attribute comma separated
);
-- Lego Star Wars Kit style 21005
call add_item
(
	'LSWK', -- SKU
    279, -- Price
    4, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FStar_Wars_Lego_kit_Style_21005.jpg?alt=media&token=e1fd46fc-b69e-438a-a368-a33310b4bb32&_gl=1*4see0e*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc3MzkwNC40LjEuMTY5Nzc3NDYxNy42LjAuMA..', -- Image
    1, -- No. of variants
    'Style', -- Variants comma separated
    '21005' -- Attribute comma separated
);
-- Lego Star Wars Kit style 21023
call add_item
(
	'LSWK', -- SKU
    169, -- Price
    12, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FStar_Wars_Lego_kit_Style_21023.jpg?alt=media&token=7a165a97-3fb6-4154-96f6-3529f6caef2a&_gl=1*1at7i6l*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc3MzkwNC40LjEuMTY5Nzc3NDY1MC42MC4wLjA.', -- Image
    1, -- No. of variants
    'Style', -- Variants comma separated
    '21023' -- Attribute comma separated
);
-- Lego Star Wars Kit style 21036
call add_item
(
	'LSWK', -- SKU
    169, -- Price
    6, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FStar_Wars_Lego_kit_Style_21036.jpg?alt=media&token=4c56db63-f945-4abc-9f91-560f2ce605ab&_gl=1*hm5jdk*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc3MzkwNC40LjEuMTY5Nzc3NDY3NC4zNi4wLjA.', -- Image
    1, -- No. of variants
    'Style', -- Variants comma separated
    '21036' -- Attribute comma separated
);


-- Canon EOS 7D no lens 
call add_item
(
	'CE7D', -- SKU
    199.99, -- Price
    14, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FCanon_EOS_7D_Without_lens.jpg?alt=media&token=7f0fab13-61ee-4ccd-972d-942b923ea6b6&_gl=1*l5mi04*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc3MzkwNC40LjEuMTY5Nzc3NDcwNi40LjAuMA..', -- Image
    1, -- No. of variants
    'Lens', -- Variants comma separated
    'No Lens' -- Attribute comma separated
);
-- Canon EOS 7D With 18-135mm Lens
call add_item
(
	'CE7D', -- SKU
    549, -- Price
    4, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FCanon_EOS_7D_With_18-135mm_lens.jpg?alt=media&token=04528484-6e2c-40c0-98a7-b0b048f948c3&_gl=1*1ucxquo*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc3MzkwNC40LjEuMTY5Nzc3NDczMC42MC4wLjA.', -- Image
    1, -- No. of variants
    'Lens', -- Variants comma separated
    '18-135mm Lens' -- Attribute comma separated
);
-- Canon EOS 7D With 28-135mm Lens
call add_item
(
	'CE7D', -- SKU
    658, -- Price
    12, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FCanon_EOS_7D_With_28-135mm_lens.jpg?alt=media&token=d5402345-6d4a-4add-8939-59e42dbc8b93&_gl=1*ri30kh*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc3MzkwNC40LjEuMTY5Nzc3NDc0OS40MS4wLjA.', -- Image
    1, -- No. of variants
    'Lens', -- Variants comma separated
    '28-135mm Lens' -- Attribute comma separated
);


-- Apple Watch Series 8 
call add_item
(
	'AWS8', -- SKU
    839, -- Price
    3, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FApple_Watch_Series_8_Red.jpg?alt=media&token=cb3f5b57-ade7-4141-9429-69be0c204a0c&_gl=1*uegogf*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc3MzkwNC40LjEuMTY5Nzc3NDc4OC4yLjAuMA..', -- Image
    3, -- No. of variants
    'Color, Storage, RAM', -- Variants comma separated
    'Red, 32GB, 1GB' -- Attribute comma separated
);


-- Logitech G Pro Mouse Shroud
call add_item
(
	'LGPM', -- SKU
    129.99, -- Price
    7, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FLogitech_G_Pro_Mouse_shroud.webp?alt=media&token=46d2588f-3d38-449c-b924-d218a225da7a&_gl=1*1uoi7x2*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc3MzkwNC40LjEuMTY5Nzc3NDgxMy42MC4wLjA.', -- Image
    1, -- No. of variants
    'Color', -- Variants comma separated
    'Shroud' -- Attribute comma separated
);
-- Logitech G Pro Mouse Black
call add_item
(
	'LGPM', -- SKU
    129.99, -- Price
    11, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FLogitech_G_Pro_Mouse_Black.webp?alt=media&token=38f3cbd9-bd6c-4729-a76b-7ce71110cea0&_gl=1*10b6jd*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc3MzkwNC40LjEuMTY5Nzc3NDgzNy4zNi4wLjA.', -- Image
    1, -- No. of variants
    'Color', -- Variants comma separated
    'Black' -- Attribute comma separated
);


-- Corsair K70 Keyboard wired
call add_item
(
	'LGPM', -- SKU
    129.99, -- Price
    8, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FCorsair_K70_Keyboard_wired.jpg?alt=media&token=2b753c98-a3ac-42d4-9e94-e2f538030e25&_gl=1*1jv2x0h*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc3MzkwNC40LjEuMTY5Nzc3NDg3Ny42MC4wLjA.', -- Image
    1, -- No. of variants
    'Connection Type', -- Variants comma separated
    'Wired' -- Attribute comma separated
);
-- Corsair K70 Keyboard wireless
call add_item
(
	'LGPM', -- SKU
    159.99, -- Price
    9, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FCorsair_K70_Keyboard_wireless.jpg?alt=media&token=d2248571-27c0-4e87-97dc-1fc9ed6ab5c3&_gl=1*jrxtdm*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc3MzkwNC40LjEuMTY5Nzc3NDg5Ny40MC4wLjA.', -- Image
    1, -- No. of variants
    'Connection Type', -- Variants comma separated
    'Wireless' -- Attribute comma separated
);


-- Barbie Dreamhouse
call add_item
(
	'BDH', -- SKU
    179, -- Price
    6, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FBarbie_dreamhouse.webp?alt=media&token=ea5fc302-39e8-4542-8230-22e8e333b4f1&_gl=1*1o8umfe*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc3MzkwNC40LjEuMTY5Nzc3NDkyMS4xNi4wLjA.', -- Image
    1, -- No. of variants
    'Material', -- Variants comma separated
    'Plastic' -- Attribute comma separated
);


-- Transformers Optimus Prime
call add_item
(
	'TOP', -- SKU
    34, -- Price
    8, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FTransformers_optimus_prime.jpg?alt=media&token=04068a33-2a8e-4f96-afe3-a202699c8c7e&_gl=1*1ur48ao*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc3MzkwNC40LjEuMTY5Nzc3NDk0NC42MC4wLjA.', -- Image
    1, -- No. of variants
    'Material', -- Variants comma separated
    'Plastic' -- Attribute comma separated
);


-- Dell Inspiron 14 Intel variant 1
call add_item
(
	'DI14', -- SKU
    649.99, -- Price
    7, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FDELL_inspiron_14.jpg?alt=media&token=9e28f82b-2495-438f-ade1-b6b3b15420e2&_gl=1*brd8kl*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc3NjgwMy41LjEuMTY5Nzc3NzIxNC4zNS4wLjA.', -- Image
    6, -- No. of variants
    'Base configuration, Processor, Operating System, GPU, RAM, Storage', -- Variants comma separated
    'Intel, 13th Gen Intel Core i3, Windows 11 Home, Intel UHD Graphics, DDR5-8GB, 256GB' -- Attribute comma separated
);
-- Dell Inspiron 14 Intel variant 
call add_item
(
	'DI14', -- SKU
    729.99, -- Price
    3, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FDELL_inspiron_14.jpg?alt=media&token=9e28f82b-2495-438f-ade1-b6b3b15420e2&_gl=1*brd8kl*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc3NjgwMy41LjEuMTY5Nzc3NzIxNC4zNS4wLjA.', -- Image
    6, -- No. of variants
    'Base configuration, Processor, Operating System, GPU, RAM, Storage', -- Variants comma separated
    'Intel, 13th Gen Intel Core i5, Windows 11 Home, Intel Iris Xe Graphics, DDR5-8GB, 512GB' -- Attribute comma separated
);
-- Dell Inspiron 14 Intel variant 
call add_item
(
	'DI14', -- SKU
    789.99, -- Price
    9, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FDELL_inspiron_14.jpg?alt=media&token=9e28f82b-2495-438f-ade1-b6b3b15420e2&_gl=1*brd8kl*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc3NjgwMy41LjEuMTY5Nzc3NzIxNC4zNS4wLjA.', -- Image
    6, -- No. of variants
    'Base configuration, Processor, Operating System, GPU, RAM, Storage', -- Variants comma separated
    'Intel, 13th Gen Intel Core i5, Windows 11 Pro, Intel Iris Xe Graphics, DDR5-8GB, 512GB' -- Attribute comma separated
);
-- Dell Inspiron 14 Intel variant 
call add_item
(
	'DI14', -- SKU
    34, -- Price
    6, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FDELL_inspiron_14.jpg?alt=media&token=9e28f82b-2495-438f-ade1-b6b3b15420e2&_gl=1*brd8kl*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc3NjgwMy41LjEuMTY5Nzc3NzIxNC4zNS4wLjA.', -- Image
    6, -- No. of variants
    'Base configuration, Processor, Operating System, GPU, RAM, Storage', -- Variants comma separated
    'Intel, 13th Gen Intel Core i7, Windows 11 Pro, Intel Iris Xe Graphics, DDR5-16GB, 1TB' -- Attribute comma separated
);
-- Dell Inspiron 14 AMD variant 
call add_item
(
	'DI14', -- SKU
    699.99, -- Price
    11, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FDell-inspiron-14-AMD.jpg?alt=media&token=69d0d2e9-47ac-47db-9384-55a52892990e&_gl=1*nx44iy*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc3NjgwMy41LjEuMTY5Nzc3NzI2MC42MC4wLjA.', -- Image
    6, -- No. of variants
    'Base configuration, Processor, Operating System, GPU, RAM, Storage', -- Variants comma separated
    'AMD, 7th Gen AMD Ryzen 5, Windows 11 Home, AMD Radeon Graphics, DDR5-8GB, 512GB' -- Attribute comma separated
);
-- Dell Inspiron 14 AMD variant 
call add_item
(
	'DI14', -- SKU
    759.99, -- Price
    12, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FDell-inspiron-14-AMD.jpg?alt=media&token=69d0d2e9-47ac-47db-9384-55a52892990e&_gl=1*nx44iy*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc3NjgwMy41LjEuMTY5Nzc3NzI2MC42MC4wLjA.', -- Image
    6, -- No. of variants
    'Base configuration, Processor, Operating System, GPU, RAM, Storage', -- Variants comma separated
    'AMD, 7th Gen AMD Ryzen 5, Windows 11 Pro, AMD Radeon Graphics, DDR5-8GB, 512GB' -- Attribute comma separated
);
-- Dell Inspiron 14 AMD variant 
call add_item
(
	'DI14', -- SKU
    899.99, -- Price
    7, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FDell-inspiron-14-AMD.jpg?alt=media&token=69d0d2e9-47ac-47db-9384-55a52892990e&_gl=1*nx44iy*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc3NjgwMy41LjEuMTY5Nzc3NzI2MC42MC4wLjA.', -- Image
    6, -- No. of variants
    'Base configuration, Processor, Operating System, GPU, RAM, Storage', -- Variants comma separated
    'AMD, 7th Gen AMD Ryzen 7, Windows 11 Home, AMD Radeon Graphics, DDR5-16GB, 1TB' -- Attribute comma separated
);
-- Dell Inspiron 14 AMD variant 
call add_item
(
	'DI14', -- SKU
    959.99, -- Price
    3, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FDell-inspiron-14-AMD.jpg?alt=media&token=69d0d2e9-47ac-47db-9384-55a52892990e&_gl=1*nx44iy*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc3NjgwMy41LjEuMTY5Nzc3NzI2MC42MC4wLjA.', -- Image
    6, -- No. of variants
    'Base configuration, Processor, Operating System, GPU, RAM, Storage', -- Variants comma separated
    'AMD, 7th Gen AMD Ryzen 7, Windows 11 Pro, AMD Radeon Graphics, DDR5-16GB, 1TB' -- Attribute comma separated
);


-- Apple AirPods Pro
call add_item
(
	'AAP3', -- SKU
    249, -- Price
    14, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FAirpod_pro.jpg?alt=media&token=8f9063f4-6cce-4a0f-81ab-2ef09d4e74ca&_gl=1*xcggev*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc3NjgwMy41LjEuMTY5Nzc3NzUxMC42MC4wLjA.', -- Image
    1, -- No. of variants
    'Generation', -- Variants comma separated
    '2nd genaration' -- Attribute comma separated
);


call add_item
(
	'CAPAF', -- SKU
    69.99, -- Price
    4, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FCA_Action_figure.jpg?alt=media&token=ab98d7b8-3da1-42a1-89af-95ea98f7351e&_gl=1*5z9b01*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIxNjg5Ny4xMi4wLjE2OTgyMTY4OTcuNjAuMC4w', -- Image
    1, -- No. of variants
    'Suit Version', -- Variants comma separated
    'Classic' -- Attribute comma separated
);
call add_item
(
	'CAPAF', -- SKU
    79.99, -- Price
    14, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FCA_Action_figure_infinity_war.jpg?alt=media&token=39cda76e-5817-49aa-aeac-b0a93dc283fc&_gl=1*1x2n6hu*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIxNjg5Ny4xMi4xLjE2OTgyMTY5MjEuMzYuMC4w', -- Image
    1, -- No. of variants
    'Suit Version', -- Variants comma separated
    'Infinity War Edition' -- Attribute comma separated
);
call add_item
(
	'CAPAF', -- SKU
    89.99, -- Price
    3, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FCA_Action_figure_endgame.jpg?alt=media&token=cbe9359e-2861-4066-8743-609273e04133&_gl=1*6rsa69*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIxNjg5Ny4xMi4xLjE2OTgyMTY5NjYuNjAuMC4w', -- Image
    1, -- No. of variants
    'Suit Version', -- Variants comma separated
    'EndGame Edition' -- Attribute comma separated
);


call add_item
(
	'MBG', -- SKU
    34.39, -- Price
    4, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FMonopoly_Classic.jpg?alt=media&token=cfe6ad2b-01f3-4a14-a313-4e93f86d777c&_gl=1*mj2ywf*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIxNjg5Ny4xMi4xLjE2OTgyMTY5OTkuMjcuMC4w', -- Image
    1, -- No. of variants
    'Edition', -- Variants comma separated
    'Classic Edition' -- Attribute comma separated
);
call add_item
(
	'MBG', -- SKU
    44.39, -- Price
    1, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FMonopoly_Token_Vote_Edition.jpg?alt=media&token=74d817d6-e7ff-4487-bfc6-9f4eb50cc5b1&_gl=1*1ofemsv*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIxNjg5Ny4xMi4xLjE2OTgyMTcwMjguNjAuMC4w', -- Image
    1, -- No. of variants
    'Edition', -- Variants comma separated
    'Token Vote Edition' -- Attribute comma separated
);
call add_item
(
	'MBG', -- SKU
    44.39, -- Price
    5, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FMonopoly_Ultimate_Banking_Edition.jpg?alt=media&token=0a7c50e6-4ec3-4074-8f6f-0c8eca71084d&_gl=1*as9qhi*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIxNjg5Ny4xMi4xLjE2OTgyMTcwNTUuMzMuMC4w', -- Image
    1, -- No. of variants
    'Edition', -- Variants comma separated
    'Ultimate Banking Edition' -- Attribute comma separated
);
call add_item
(
	'MBG', -- SKU
    54.39, -- Price
    13, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FMonopoly_Cheaters_Edition.jpg?alt=media&token=3a298c34-854a-4e79-a28a-5ccb4e49507a&_gl=1*o3t8b5*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIxNjg5Ny4xMi4xLjE2OTgyMTcxNzQuNjAuMC4w', -- Image
    1, -- No. of variants
    'Edition', -- Variants comma separated
    'Cheaters Edition' -- Attribute comma separated
);


call add_item
(
	'ARZ', -- SKU
    3999.99, -- Price
    3, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FAsus%20ROG%20Zephyrus_Duo.jpg?alt=media&token=68c1f6d7-3360-4dee-9514-b481e12ea9db&_gl=1*8a885u*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIxNjg5Ny4xMi4xLjE2OTgyMTcyNTkuNjAuMC4w', -- Image
    7, -- No. of variants
    'Model, Processor, GPU, Display Type, Display, Operating System, RAM, Storage', -- Variants comma separated
    'GX650RX-XS97, 6th Gen AMD Ryzen 9, NVIDIA GeForce RTX 3080Ti-16GB, Duo, ROG Nebula HDR Display, Windows 11 Pro, DDR5-16GB, 1TB' -- Attribute comma separated
);
call add_item
(
	'ARZ', -- SKU
    3999.99, -- Price
    15, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FAsus%20ROG%20Zephyrus_Duo.jpg?alt=media&token=68c1f6d7-3360-4dee-9514-b481e12ea9db&_gl=1*8a885u*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIxNjg5Ny4xMi4xLjE2OTgyMTcyNTkuNjAuMC4w', -- Image
    7, -- No. of variants
    'Model, Processor, GPU, Display Type, Display, Operating System, RAM, Storage', -- Variants comma separated
    'GX650RX-XS97, 6th Gen AMD Ryzen 9, NVIDIA GeForce RTX 3080Ti-16GB, Duo, ROG Nebula HDR Display, Windows 11 Pro, DDR5-32GB, 2TB' -- Attribute comma separated
);
call add_item
(
	'ARZ', -- SKU
    3699.99, -- Price
    7, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FAsus%20ROG%20Zephyrus_Duo.jpg?alt=media&token=68c1f6d7-3360-4dee-9514-b481e12ea9db&_gl=1*8a885u*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIxNjg5Ny4xMi4xLjE2OTgyMTcyNTkuNjAuMC4w', -- Image
    7, -- No. of variants
    'Model, Processor, GPU, Display Type, Display, Operating System, RAM, Storage', -- Variants comma separated
    'GX650RW-XS96, 6th Gen AMD Ryzen 9, NVIDIA GeForce RTX 3080Ti-8GB, Duo, ROG Nebula HDR Display, Windows 11 Pro, DDR5-32GB, 1TB' -- Attribute comma separated
);
call add_item
(
	'ARZ', -- SKU
    3099.99, -- Price
    12, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FAsus%20ROG%20Zephyrus_Duo.jpg?alt=media&token=68c1f6d7-3360-4dee-9514-b481e12ea9db&_gl=1*8a885u*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIxNjg5Ny4xMi4xLjE2OTgyMTcyNTkuNjAuMC4w', -- Image
    7, -- No. of variants
    'Model, Processor, GPU, Display Type, Display, Operating System, RAM, Storage', -- Variants comma separated
    'GX650RM-ES74, 6th Gen AMD Ryzen 7, NVIDIA GeForce RTX 3060-6GB, Duo, FHD+, Windows 11 Home, DDR5-16GB, 1TB' -- Attribute comma separated
);
call add_item
(
	'ARZ', -- SKU
    3199.99, -- Price
    3, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FAsus%20ROG%20Zephyrus_Duo.jpg?alt=media&token=68c1f6d7-3360-4dee-9514-b481e12ea9db&_gl=1*8a885u*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIxNjg5Ny4xMi4xLjE2OTgyMTcyNTkuNjAuMC4w', -- Image
    7, -- No. of variants
    'Model, Processor, GPU, Display Type, Display, Operating System, RAM, Storage', -- Variants comma separated
    'GX650RM-LS027W, 6th Gen AMD Ryzen 9, NVIDIA GeForce RTX 3060-6GB, Duo, FHD+, Windows 11 Home, DDR5-16GB, 1TB' -- Attribute comma separated
);
call add_item
(
	'ARZ', -- SKU
    2499.99, -- Price
    15, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FAsus%20ROG%20Zephyrus_G14.jpg?alt=media&token=8b25fb22-b429-4b88-9771-f0dcc7cc6a1b&_gl=1*y7ygvb*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIxNjg5Ny4xMi4xLjE2OTgyMTczMTQuNS4wLjA.', -- Image
    7, -- No. of variants
    'Model, Processor, GPU, Display Type, Display, Operating System, RAM, Storage', -- Variants comma separated
    'GA402XZ-CS94, 7th Gen AMD Ryzen 9, NVIDIA GeForce RTX 4080-12GB, Single, ROG Nebula Display, Windows 11 Home, DDR5-16GB, 1TB' -- Attribute comma separated
);
call add_item
(
	'ARZ', -- SKU
    3299.99, -- Price
    8, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FAsus%20ROG%20Zephyrus_G14.jpg?alt=media&token=8b25fb22-b429-4b88-9771-f0dcc7cc6a1b&_gl=1*y7ygvb*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIxNjg5Ny4xMi4xLjE2OTgyMTczMTQuNS4wLjA.', -- Image
    7, -- No. of variants
    'Model, Processor, GPU, Display Type, Display, Operating System, RAM, Storage', -- Variants comma separated
    'GA402XY-XS96, 7th Gen AMD Ryzen 9, NVIDIA GeForce RTX 4090-16GB, Single, ROG Nebula HDR Display, Windows 11 Pro, DDR5-32GB, 1TB' -- Attribute comma separated
);
call add_item
(
	'ARZ', -- SKU
    2299.99, -- Price
    14, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FAsus%20ROG%20Zephyrus_G14.jpg?alt=media&token=8b25fb22-b429-4b88-9771-f0dcc7cc6a1b&_gl=1*y7ygvb*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIxNjg5Ny4xMi4xLjE2OTgyMTczMTQuNS4wLjA.', -- Image
    7, -- No. of variants
    'Model, Processor, GPU, Display Type, Display, Operating System, RAM, Storage', -- Variants comma separated
    'GA402NU-G14.R74050, 7th Gen AMD Ryzen 7, NVIDIA GeForce RTX 4050-6GB, Single, ROG Nebula Display, Windows 11 Home, DDR5-16GB, 512GB' -- Attribute comma separated
);
call add_item
(
	'ARZ', -- SKU
    2499.99, -- Price
    2, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FAsus%20ROG%20Zephyrus_G14.jpg?alt=media&token=8b25fb22-b429-4b88-9771-f0dcc7cc6a1b&_gl=1*y7ygvb*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIxNjg5Ny4xMi4xLjE2OTgyMTczMTQuNS4wLjA.', -- Image
    7, -- No. of variants
    'Model, Processor, GPU, Display Type, Display, Operating System, RAM, Storage', -- Variants comma separated
    'GX650RM-LS027W, 7th Gen AMD Ryzen 9, NVIDIA GeForce RTX 4070-8GB, Single, ROG Nebula Display, Windows 11 Home, DDR5-16GB, 1TB' -- Attribute comma separated
);


call add_item
(
	'BDT770', -- SKU
    205, -- Price
    12, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FBeyerdynamic_DT_770_Pro_Black.jpg?alt=media&token=a38d9ff9-8408-42ee-ba3f-929bf9469200&_gl=1*1k8tjzm*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIxNjg5Ny4xMi4xLjE2OTgyMTczNzUuNjAuMC4w', -- Image
    2, -- No. of variants
    'Color, Sound', -- Variants comma separated
    'Black, 80 Ohm' -- Attribute comma separated
);
call add_item
(
	'BDT770', -- SKU
    259, -- Price
    14, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FBeyerdynamic_DT_770_Pro_Black.jpg?alt=media&token=a38d9ff9-8408-42ee-ba3f-929bf9469200&_gl=1*1k8tjzm*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIxNjg5Ny4xMi4xLjE2OTgyMTczNzUuNjAuMC4w', -- Image
    2, -- No. of variants
    'Color, Sound', -- Variants comma separated
    'Black, 250 Ohm' -- Attribute comma separated
);
call add_item
(
	'BDT770', -- SKU
    205, -- Price
    5, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FBeyerdynamic_DT_770_Pro_Gray.jpg?alt=media&token=cc05855d-6299-4e64-96f9-834c6963c975&_gl=1*eytlb*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIxNjg5Ny4xMi4xLjE2OTgyMTc0MTkuMTYuMC4w', -- Image
    2, -- No. of variants
    'Color, Sound', -- Variants comma separated
    'Gray, 80 Ohm' -- Attribute comma separated
);
call add_item
(
	'BDT770', -- SKU
    259, -- Price
    2, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FBeyerdynamic_DT_770_Pro_Gray.jpg?alt=media&token=cc05855d-6299-4e64-96f9-834c6963c975&_gl=1*eytlb*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIxNjg5Ny4xMi4xLjE2OTgyMTc0MTkuMTYuMC4w', -- Image
    2, -- No. of variants
    'Color, Sound', -- Variants comma separated
    'Gray, 250 Ohm' -- Attribute comma separated
);


call add_item
(
	'ThorAF', -- SKU
    67, -- Price
    4, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FThor_Action_figure_Classic.jpg?alt=media&token=3506ea68-f663-4ae3-a6a7-91842a5eae21&_gl=1*1hwy3n2*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIxNjg5Ny4xMi4xLjE2OTgyMTc0OTEuNjAuMC4w', -- Image
    1, -- No. of variants
    'Suit Version', -- Variants comma separated
    'Classic Edition' -- Attribute comma separated
);
call add_item
(
	'ThorAF', -- SKU
    69, -- Price
    14, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FThor_Action_figure_Ragnarok.jpg?alt=media&token=14008843-59cc-4196-8ce8-4fcd4be41427&_gl=1*hhffgv*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIxNjg5Ny4xMi4xLjE2OTgyMTc1MTcuMzQuMC4w', -- Image
    1, -- No. of variants
    'Suit Version', -- Variants comma separated
    'Ragnarok Edition' -- Attribute comma separated
);
call add_item
(
	'ThorAF', -- SKU
    73, -- Price
    1, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FThor_Action_figure_EndGame.jpg?alt=media&token=476a90de-7be0-4fd2-b83c-8dbc42eaafcd&_gl=1*2nocqt*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIxNjg5Ny4xMi4xLjE2OTgyMTc1MzguMTMuMC4w', -- Image
    1, -- No. of variants
    'Suit Version', -- Variants comma separated
    'EndGame Edition' -- Attribute comma separated
);
call add_item
(
	'ThorAF', -- SKU
    77, -- Price
    14, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FThor_Action_figure_Love%26Thunder.jpg?alt=media&token=5588ce0d-e17f-40db-b000-db8ddbf92102&_gl=1*86sic3*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIxNjg5Ny4xMi4xLjE2OTgyMTc1NTkuNjAuMC4w', -- Image
    1, -- No. of variants
    'Suit Version', -- Variants comma separated
    'Love & Thunder Edition' -- Attribute comma separated
);


call add_item
(
	'WolvAF', -- SKU
    33, -- Price
    13, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FWolverine_Action_figure.jpg?alt=media&token=1f48615b-bf5a-4a02-b05e-cfad883cbec4&_gl=1*1ok9des*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIxNjg5Ny4xMi4xLjE2OTgyMTc1ODYuMzMuMC4w', -- Image
    1, -- No. of variants
    'Suit Version', -- Variants comma separated
    'Classic Edition' -- Attribute comma separated
);


call add_item
(
	'RDV2', -- SKU
    69.99, -- Price
    7, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FRazer%20DeathAdder%20V2%20Black.jpg?alt=media&token=37e5c8e0-73d3-458a-a807-1f0f98659828&_gl=1*1mrmv1f*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIxNjg5Ny4xMi4xLjE2OTgyMTc2MjguNjAuMC4w', -- Image
    1, -- No. of variants
    'Design', -- Variants comma separated
    'Black/Classic' -- Attribute comma separated
);
call add_item
(
	'RDV2', -- SKU
    99.99, -- Price
    7, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FRazer%20DeathAdder%20V2%20Halo.jpg?alt=media&token=84e5de55-c52b-453d-b618-91895734943b&_gl=1*19oqkew*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIxNjg5Ny4xMi4xLjE2OTgyMTc2NTAuMzguMC4w', -- Image
    1, -- No. of variants
    'Design', -- Variants comma separated
    'Halo Infinity' -- Attribute comma separated
);
call add_item
(
	'RDV2', -- SKU
    79.99, -- Price
    7, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FRazer%20DeathAdder%20V2%20Special.jpg?alt=media&token=8c80a7bb-9a5c-434c-aba6-494c1302377b&_gl=1*1uisxqg*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIxNjg5Ny4xMi4xLjE2OTgyMTc2NzAuMTguMC4w', -- Image
    1, -- No. of variants
    'Design', -- Variants comma separated
    'Special Edition' -- Attribute comma separated
);


call add_item
(
	'SA7IV', -- SKU
    2499.99, -- Price
    7, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FSony%20A7%20IV%20without%20lens.png?alt=media&token=8448c418-34a8-4881-b970-381a691f8f03&_gl=1*3hoi27*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIxNjg5Ny4xMi4xLjE2OTgyMTc3MjYuNDEuMC4w', -- Image
    1, -- No. of variants
    'Lens', -- Variants comma separated
    'No Lens' -- Attribute comma separated
);
call add_item
(
	'SA7IV', -- SKU
    2699.99, -- Price
    7, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FSony%20A7%20IV%20with%20lens.png?alt=media&token=57acd1fb-268d-4fe4-943d-4ad75ff70c2f&_gl=1*19fkb6g*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIxNjg5Ny4xMi4xLjE2OTgyMTc3MDcuNjAuMC4w', -- Image
    1, -- No. of variants
    'Lens', -- Variants comma separated
    '28-70mm Lens' -- Attribute comma separated
);


call add_item
(
	'SGF3', -- SKU
    179.99, -- Price
    7, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FGalaxy-Fit-Black.webp?alt=media&token=ff940e21-a71a-4136-b374-ce12f7c39c8d&_gl=1*kus8x3*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIxNjg5Ny4xMi4xLjE2OTgyMTc4OTEuNjAuMC4w', -- Image
    1, -- No. of variants
    'Color', -- Variants comma separated
    'Black' -- Attribute comma separated
);


call add_item
(
	'HPSX3', -- SKU
    1399.99, -- Price
    7, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FHP%20Spectre%20x360%20silver.jpg?alt=media&token=06e3d2ce-192a-414d-a435-8b24be9f2926&_gl=1*1927c83*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIxNjg5Ny4xMi4xLjE2OTgyMTgwMzEuNjAuMC4w', -- Image
    7, -- No. of variants
    'Color, Operating System, Processor, GPU, RAM, Display, Storage', -- Variants comma separated
    'Natural Silver, Windows 11 Home, 13th Gen Intel Core i5, Intel Iris Xe Graphics, DDR5-16GB, IPS, 512GB' -- Attribute comma separated
);
call add_item
(
	'HPSX3', -- SKU
    1419.99, -- Price
    7, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FHP%20Spectre%20x360%20blue.jpg?alt=media&token=627e01cf-43a9-4a75-a6e5-cbfe9c93e080&_gl=1*1omfn6q*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIxNjg5Ny4xMi4xLjE2OTgyMTgwNjUuMjYuMC4w', -- Image
    7, -- No. of variants
    'Color, Operating System, Processor, GPU, RAM, Display, Storage', -- Variants comma separated
    'Nocturne Blue, Windows 11 Home, 13th Gen Intel Core i5, Intel Iris Xe Graphics, DDR5-16GB, IPS, 512GB' -- Attribute comma separated
);
call add_item
(
	'HPSX3', -- SKU
    1419.99, -- Price
    7, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FHP%20Spectre%20x360%20Black.jpg?alt=media&token=23385823-4001-4fc5-b121-405ca181b723&_gl=1*uunn51*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIxNjg5Ny4xMi4xLjE2OTgyMTgxMDMuNjAuMC4w', -- Image
    7, -- No. of variants
    'Color, Operating System, Processor, GPU, RAM, Display, Storage', -- Variants comma separated
    'Nightfall Black, Windows 11 Home, 13th Gen Intel Core i5, Intel Iris Xe Graphics, DDR5-16GB, IPS, 512GB' -- Attribute comma separated
);
call add_item
(
	'HPSX3', -- SKU
    1740.99, -- Price
    7, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FHP%20Spectre%20x360%20silver.jpg?alt=media&token=06e3d2ce-192a-414d-a435-8b24be9f2926&_gl=1*1927c83*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIxNjg5Ny4xMi4xLjE2OTgyMTgwMzEuNjAuMC4w', -- Image
    7, -- No. of variants
    'Color, Operating System, Processor, GPU, RAM, Display, Storage', -- Variants comma separated
    'Natural Silver, Windows 11 Pro, 13th Gen Intel Core i7, Intel Iris Xe Graphics, DDR5-32GB, IPS, 1TB' -- Attribute comma separated
);
call add_item
(
	'HPSX3', -- SKU
    1760.99, -- Price
    7, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FHP%20Spectre%20x360%20blue.jpg?alt=media&token=627e01cf-43a9-4a75-a6e5-cbfe9c93e080&_gl=1*1omfn6q*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIxNjg5Ny4xMi4xLjE2OTgyMTgwNjUuMjYuMC4w', -- Image
    7, -- No. of variants
    'Color, Operating System, Processor, GPU, RAM, Display, Storage', -- Variants comma separated
    'Nocturne Blue, Windows 11 Pro, 13th Gen Intel Core i7, Intel Iris Xe Graphics, DDR5-32GB, IPS, 1TB' -- Attribute comma separated
);
call add_item
(
	'HPSX3', -- SKU
    1760.99, -- Price
    7, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FHP%20Spectre%20x360%20Black.jpg?alt=media&token=23385823-4001-4fc5-b121-405ca181b723&_gl=1*uunn51*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIxNjg5Ny4xMi4xLjE2OTgyMTgxMDMuNjAuMC4w', -- Image
    7, -- No. of variants
    'Color, Operating System, Processor, GPU, RAM, Display, Storage', -- Variants comma separated
    'Nightfall Black, Windows 11 Pro, 13th Gen Intel Core i7, Intel Iris Xe Graphics, DDR5-32GB, IPS, 1TB' -- Attribute comma separated
);
call add_item
(
	'HPSX3', -- SKU
    1399.99, -- Price
    7, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FHP%20Spectre%20x360%20silver.jpg?alt=media&token=06e3d2ce-192a-414d-a435-8b24be9f2926&_gl=1*1927c83*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIxNjg5Ny4xMi4xLjE2OTgyMTgwMzEuNjAuMC4w', -- Image
    7, -- No. of variants
    'Color, Operating System, Processor, GPU, RAM, Display, Storage', -- Variants comma separated
    'Natural Silver, Windows 11 Pro, 13th Gen Intel Core i7, Intel Iris Xe Graphics, DDR5-32GB, OLED, 2TB' -- Attribute comma separated
);
call add_item
(
	'HPSX3', -- SKU
    1399.99, -- Price
    7, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FHP%20Spectre%20x360%20blue.jpg?alt=media&token=627e01cf-43a9-4a75-a6e5-cbfe9c93e080&_gl=1*1omfn6q*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIxNjg5Ny4xMi4xLjE2OTgyMTgwNjUuMjYuMC4w', -- Image
    7, -- No. of variants
    'Color, Operating System, Processor, GPU, RAM, Display, Storage', -- Variants comma separated
    'Nocturne Blue, Windows 11 Pro, 13th Gen Intel Core i7, Intel Iris Xe Graphics, DDR5-32GB, OLED, 2TB' -- Attribute comma separated
);
call add_item
(
	'HPSX3', -- SKU
    1399.99, -- Price
    7, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FHP%20Spectre%20x360%20Black.jpg?alt=media&token=23385823-4001-4fc5-b121-405ca181b723&_gl=1*uunn51*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIxNjg5Ny4xMi4xLjE2OTgyMTgxMDMuNjAuMC4w', -- Image
    7, -- No. of variants
    'Color, Operating System, Processor, GPU, RAM, Display, Storage', -- Variants comma separated
    'Nightfall Black, Windows 11 Pro, 13th Gen Intel Core i7, Intel Iris Xe Graphics, DDR5-32GB, OLED, 2TB' -- Attribute comma separated
);


call add_item
(
	'AWM17', -- SKU
    1198.99, -- Price
    6, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2Falienware-m17.jpg?alt=media&token=472808e6-9513-47b4-b3c7-b9a002a4184d&_gl=1*yjnfk9*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIxNjg5Ny4xMi4xLjE2OTgyMTgyOTUuNjAuMC4w', -- Image
    6, -- No. of variants
    'Processor, Operating System, GPU, RAM, Storage, Display', -- Variants comma separated
    '6th Gen AMD Ryzen 7, Windows 11 Home, NVIDIA GeForce RTX 3070Ti-8GB, DDR5-16GB, 512GB, QHD' -- Attribute comma separated
);
call add_item
(
	'AWM17', -- SKU
    1264.99, -- Price
    6, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2Falienware-m17.jpg?alt=media&token=472808e6-9513-47b4-b3c7-b9a002a4184d&_gl=1*yjnfk9*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIxNjg5Ny4xMi4xLjE2OTgyMTgyOTUuNjAuMC4w', -- Image
    6, -- No. of variants
    'Processor, Operating System, GPU, RAM, Storage, Display', -- Variants comma separated
    '6th Gen AMD Ryzen 7, Windows 11 Pro, NVIDIA GeForce RTX 3070Ti-8GB, DDR5-16GB, 512GB, QHD' -- Attribute comma separated
);
call add_item
(
	'AWM17', -- SKU
    1324.99, -- Price
    6, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2Falienware-m17.jpg?alt=media&token=472808e6-9513-47b4-b3c7-b9a002a4184d&_gl=1*yjnfk9*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIxNjg5Ny4xMi4xLjE2OTgyMTgyOTUuNjAuMC4w', -- Image
    6, -- No. of variants
    'Processor, Operating System, GPU, RAM, Storage, Display', -- Variants comma separated
    '6th Gen AMD Ryzen 7, Windows 11 Pro, NVIDIA GeForce RTX 3070Ti-8GB, DDR5-16GB, 1TB, QHD' -- Attribute comma separated
);
call add_item
(
	'AWM17', -- SKU
    1444.99, -- Price
    6, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2Falienware-m17.jpg?alt=media&token=472808e6-9513-47b4-b3c7-b9a002a4184d&_gl=1*yjnfk9*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIxNjg5Ny4xMi4xLjE2OTgyMTgyOTUuNjAuMC4w', -- Image
    6, -- No. of variants
    'Processor, Operating System, GPU, RAM, Storage, Display', -- Variants comma separated
    '6th Gen AMD Ryzen 7, Windows 11 Pro, NVIDIA GeForce RTX 3070Ti-8GB, DDR5-32GB, 1TB, QHD' -- Attribute comma separated
);
call add_item
(
	'AWM17', -- SKU
    1594.99, -- Price
    6, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2Falienware-m17.jpg?alt=media&token=472808e6-9513-47b4-b3c7-b9a002a4184d&_gl=1*yjnfk9*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIxNjg5Ny4xMi4xLjE2OTgyMTgyOTUuNjAuMC4w', -- Image
    6, -- No. of variants
    'Processor, Operating System, GPU, RAM, Storage, Display', -- Variants comma separated
    '6th Gen AMD Ryzen 7, Windows 11 Pro, NVIDIA GeForce RTX 3070Ti-8GB, DDR5-32GB, 2TB, QHD' -- Attribute comma separated
);
call add_item
(
	'AWM17', -- SKU
    1674.99, -- Price
    6, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2Falienware-m17.jpg?alt=media&token=472808e6-9513-47b4-b3c7-b9a002a4184d&_gl=1*yjnfk9*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIxNjg5Ny4xMi4xLjE2OTgyMTgyOTUuNjAuMC4w', -- Image
    6, -- No. of variants
    'Processor, Operating System, GPU, RAM, Storage, Display', -- Variants comma separated
    '6th Gen AMD Ryzen 7, Windows 11 Pro, NVIDIA GeForce RTX 3070Ti-8GB, DDR5-32GB, 1TB, UHD' -- Attribute comma separated
);
call add_item
(
	'AWM17', -- SKU
    1824.99, -- Price
    6, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2Falienware-m17.jpg?alt=media&token=472808e6-9513-47b4-b3c7-b9a002a4184d&_gl=1*yjnfk9*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIxNjg5Ny4xMi4xLjE2OTgyMTgyOTUuNjAuMC4w', -- Image
    6, -- No. of variants
    'Processor, Operating System, GPU, RAM, Storage, Display', -- Variants comma separated
    '6th Gen AMD Ryzen 7, Windows 11 Pro, NVIDIA GeForce RTX 3070Ti-8GB, DDR5-32GB, 2TB, UHD' -- Attribute comma separated
);
call add_item
(
	'AWM17', -- SKU
    2054.99, -- Price
    6, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2Falienware-m17.jpg?alt=media&token=472808e6-9513-47b4-b3c7-b9a002a4184d&_gl=1*yjnfk9*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIxNjg5Ny4xMi4xLjE2OTgyMTgyOTUuNjAuMC4w', -- Image
    6, -- No. of variants
    'Processor, Operating System, GPU, RAM, Storage, Display', -- Variants comma separated
    '6th Gen AMD Ryzen 7, Windows 11 Pro, NVIDIA GeForce RTX 3070Ti-8GB, DDR5-64GB, 2TB, UHD' -- Attribute comma separated
);
call add_item
(
	'AWM17', -- SKU
    2404.99, -- Price
    6, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2Falienware-m17.jpg?alt=media&token=472808e6-9513-47b4-b3c7-b9a002a4184d&_gl=1*yjnfk9*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIxNjg5Ny4xMi4xLjE2OTgyMTgyOTUuNjAuMC4w', -- Image
    6, -- No. of variants
    'Processor, Operating System, GPU, RAM, Storage, Display', -- Variants comma separated
    '6th Gen AMD Ryzen 7, Windows 11 Pro, NVIDIA GeForce RTX 3070Ti-8GB, DDR5-64GB, 4TB, UHD' -- Attribute comma separated
);


call add_item
(
	'SCE', -- SKU
    189.99, -- Price
    6, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FSkullcandy%20Crusher%20Evo_black.jpg?alt=media&token=1157b046-2d54-4b32-9fe3-d18f0d73a265&_gl=1*gud9yt*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIxNjg5Ny4xMi4xLjE2OTgyMTg0MzIuNjAuMC4w', -- Image
    1, -- No. of variants
    'Color', -- Variants comma separated
    'Black' -- Attribute comma separated
);
call add_item
(
	'SCE', -- SKU
    189.99, -- Price
    6, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FSkullcandy%20Crusher%20Evo_Gray.jpg?alt=media&token=b2f6736f-4fcc-4b7e-bfc4-819f5be2ecfe&_gl=1*15ybc9s*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIxNjg5Ny4xMi4xLjE2OTgyMTg0NjAuMzIuMC4w', -- Image
    1, -- No. of variants
    'Color', -- Variants comma separated
    'Gray' -- Attribute comma separated
);


call add_item
(
	'RBG', -- SKU
    33.92, -- Price
    2, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FRisk_board_game_classic.jpg?alt=media&token=b991957a-58a9-4a7a-a028-a267a7c44ce3&_gl=1*jdvj49*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIxNjg5Ny4xMi4xLjE2OTgyMTg0ODcuNS4wLjA.', -- Image
    1, -- No. of variants
    'Edition', -- Variants comma separated
    'Classic Edition' -- Attribute comma separated
);
call add_item
(
	'RBG', -- SKU
    44.99, -- Price
    6, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FRisk_board_game_60th_edition.jpg?alt=media&token=cc7d5475-2379-485c-bf28-ef2e8c8b029d&_gl=1*s6anfr*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIxNjg5Ny4xMi4xLjE2OTgyMTg1MTQuNjAuMC4w', -- Image
    1, -- No. of variants
    'Edition', -- Variants comma separated
    '60th Anniversary Edition' -- Attribute comma separated
);
call add_item
(
	'RBG', -- SKU
    28.57, -- Price
    15, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FRisk_board_game_Dragons.jpg?alt=media&token=4c4758c8-3dcf-4d2c-a902-4ad71fd94ecb&_gl=1*1ot7cfk*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIxNjg5Ny4xMi4xLjE2OTgyMTg1MzEuNDMuMC4w', -- Image
    1, -- No. of variants
    'Edition', -- Variants comma separated
    'Risk with Dragons' -- Attribute comma separated
);


call add_item
(
	'LSMSK', -- SKU
    199.50, -- Price
    12, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FLEGO%20Super%20Mario%20Starter%20Kit.jpg?alt=media&token=58d5a5cf-9516-42da-88d2-12d72293a10c&_gl=1*d2o2ll*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIxNjg5Ny4xMi4xLjE2OTgyMTg1NTkuMTUuMC4w', -- Image
    1, -- No. of variants
    'Style', -- Variants comma separated
    '71360' -- Attribute comma separated
);


call add_item
(
	'XM12', -- SKU
    467, -- Price
    6, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FXiomi_12_Black.jpg?alt=media&token=e8ad1a94-3c1e-42f2-ab44-4858ac373079&_gl=1*1yxu7tn*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIxNjg5Ny4xMi4xLjE2OTgyMTg2NTkuNjAuMC4w', -- Image
    3, -- No. of variants
    'Color, RAM, Storage', -- Variants comma separated
    'Black, 8GB, 128GB' -- Attribute comma separated
);
call add_item
(
	'XM12', -- SKU
    467, -- Price
    13, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FXiaomi-Mi-12-Blue.jpg?alt=media&token=79baee98-07c8-4e62-ac88-38fa2db26c3c&_gl=1*65etsg*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIxNjg5Ny4xMi4xLjE2OTgyMTg4MDAuNjAuMC4w', -- Image
    3, -- No. of variants
    'Color, RAM, Storage', -- Variants comma separated
    'Blue, 8GB, 256GB' -- Attribute comma separated
);
call add_item
(
	'XM12', -- SKU
    467, -- Price
    4, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FXiaomi12Purple.webp?alt=media&token=d50732fe-2043-4dc5-b02e-da725b5f1327&_gl=1*1ygivym*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIxNjg5Ny4xMi4xLjE2OTgyMTg3MjguNjAuMC4w', -- Image
    3, -- No. of variants
    'Color, RAM, Storage', -- Variants comma separated
    'Purple, 8GB, 256GB' -- Attribute comma separated
);
call add_item
(
	'XM12', -- SKU
    467, -- Price
    3, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FXiomi_12_Black.jpg?alt=media&token=e8ad1a94-3c1e-42f2-ab44-4858ac373079&_gl=1*1yxu7tn*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIxNjg5Ny4xMi4xLjE2OTgyMTg2NTkuNjAuMC4w', -- Image
    3, -- No. of variants
    'Color, RAM, Storage', -- Variants comma separated
    'Black, 8GB, 256GB' -- Attribute comma separated
);
call add_item
(
	'XM12', -- SKU
    467, -- Price
    6, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FXiaomi-Mi-12-Blue.jpg?alt=media&token=79baee98-07c8-4e62-ac88-38fa2db26c3c&_gl=1*65etsg*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIxNjg5Ny4xMi4xLjE2OTgyMTg4MDAuNjAuMC4w', -- Image
    3, -- No. of variants
    'Color, RAM, Storage', -- Variants comma separated
    'Blue, 12GB, 256GB' -- Attribute comma separated
);
call add_item
(
	'XM12', -- SKU
    467, -- Price
    2, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FXiaomi12Purple.webp?alt=media&token=d50732fe-2043-4dc5-b02e-da725b5f1327&_gl=1*1ygivym*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIxNjg5Ny4xMi4xLjE2OTgyMTg3MjguNjAuMC4w', -- Image
    3, -- No. of variants
    'Color, RAM, Storage', -- Variants comma separated
    'Purple, 12GB, 256GB' -- Attribute comma separated
);


call add_item
(
	'RB15', -- SKU
    1999.99, -- Price
    7, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FRazer%20Blade%2015.jpg?alt=media&token=1a0093ba-5c63-4a3c-89b4-d0cabc2eae50&_gl=1*1xoy6ir*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIyMTc3My4xMy4xLjE2OTgyMjM1NzIuNjAuMC4w', -- Image
    6, -- No. of variants
    'Processor, Operating System, GPU, RAM, Storage, Display', -- Variants comma separated
    '12th Gen Intel Core i7, Windows 11 Home, NVIDIA GeForce RTX 3070Ti-8GB, DDR5-16GB, 1TB, QHD' -- Attribute comma separated
);
call add_item
(
	'RB15', -- SKU
    2599.99, -- Price
    2, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FRazer%20Blade%2015.jpg?alt=media&token=1a0093ba-5c63-4a3c-89b4-d0cabc2eae50&_gl=1*1xoy6ir*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIyMTc3My4xMy4xLjE2OTgyMjM1NzIuNjAuMC4w', -- Image
    6, -- No. of variants
    'Processor, Operating System, GPU, RAM, Storage, Display', -- Variants comma separated
    '12th Gen Intel Core i7, Windows 11 Home, NVIDIA GeForce RTX 3080Ti-16GB, DDR5-32GB, 1TB, FHD' -- Attribute comma separated
);
call add_item
(
	'RB15', -- SKU
    2299.99, -- Price
    14, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FRazer%20Blade%2015.jpg?alt=media&token=1a0093ba-5c63-4a3c-89b4-d0cabc2eae50&_gl=1*1xoy6ir*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIyMTc3My4xMy4xLjE2OTgyMjM1NzIuNjAuMC4w', -- Image
    6, -- No. of variants
    'Processor, Operating System, GPU, RAM, Storage, Display', -- Variants comma separated
    '12th Gen Intel Core i9, Windows 11 Home, NVIDIA GeForce RTX 3070Ti-8GB, DDR5-16GB, 1TB, QHD' -- Attribute comma separated
);
call add_item
(
	'RB15', -- SKU
    2499.99, -- Price
    7, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FRazer%20Blade%2015.jpg?alt=media&token=1a0093ba-5c63-4a3c-89b4-d0cabc2eae50&_gl=1*1xoy6ir*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIyMTc3My4xMy4xLjE2OTgyMjM1NzIuNjAuMC4w', -- Image
    6, -- No. of variants
    'Processor, Operating System, GPU, RAM, Storage, Display', -- Variants comma separated
    '13th Gen Intel Core i7, Windows 11 Home, NVIDIA GeForce RTX 3060-8GB, DDR5-16GB, 1TB, QHD' -- Attribute comma separated
);
call add_item
(
	'RB15', -- SKU
    2799.99, -- Price
    9, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FRazer%20Blade%2015.jpg?alt=media&token=1a0093ba-5c63-4a3c-89b4-d0cabc2eae50&_gl=1*1xoy6ir*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIyMTc3My4xMy4xLjE2OTgyMjM1NzIuNjAuMC4w', -- Image
    6, -- No. of variants
    'Processor, Operating System, GPU, RAM, Storage, Display', -- Variants comma separated
    '13th Gen Intel Core i7, Windows 11 Home, NVIDIA GeForce RTX 3070-8GB, DDR5-16GB, 1TB, QHD' -- Attribute comma separated
);


call add_item
(
	'ATM50X', -- SKU
    189, -- Price
    4, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FAudio%20Technica%20ATH-M50X_Black.png?alt=media&token=f34b7263-2ae6-4fb3-891f-a2aefc079bd7&_gl=1*15m3h3z*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIyMTc3My4xMy4xLjE2OTgyMjM2NTIuNTEuMC4w', -- Image
    1, -- No. of variants
    'Color', -- Variants comma separated
    'Black' -- Attribute comma separated
);
call add_item
(
	'ATM50X', -- SKU
    189, -- Price
    13, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FAudio%20Technica%20ATH-M50X_White.png?alt=media&token=4c43475b-cbc8-435c-949e-b21fdca34f49&_gl=1*trwia6*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIyMTc3My4xMy4xLjE2OTgyMjM2NzcuMjYuMC4w', -- Image
    1, -- No. of variants
    'Color', -- Variants comma separated
    'White' -- Attribute comma separated
);
call add_item
(
	'ATM50X', -- SKU
    189, -- Price
    6, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FAudio%20Technica%20ATH-M50X_deep_sea.png?alt=media&token=c6f06b6c-6e86-44a2-b7bc-7c4836257c55&_gl=1*bbwh7v*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIyMTc3My4xMy4xLjE2OTgyMjM3MTAuNTYuMC4w', -- Image
    1, -- No. of variants
    'Color', -- Variants comma separated
    'Deep Sea' -- Attribute comma separated
);
call add_item
(
	'ATM50X', -- SKU
    189, -- Price
    3, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FAudio%20Technica%20ATH-M50X_Ice_blue.png?alt=media&token=d746a0ce-4f78-43ea-b9e3-fbd3fd689b34&_gl=1*14tauvt*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIyMTc3My4xMy4xLjE2OTgyMjM3MzEuMzUuMC4w', -- Image
    1, -- No. of variants
    'Color', -- Variants comma separated
    'Ice Blue' -- Attribute comma separated
);


call add_item
(
	'JBFX', -- SKU
    129, -- Price
    9, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FJBL%20Free%20X.webp?alt=media&token=3f5e09ec-6a90-4d9c-a56d-3389ab2c6307&_gl=1*xgzj01*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIyMTc3My4xMy4xLjE2OTgyMjM3NTcuOS4wLjA.', -- Image
    1, -- No. of variants
    'Color', -- Variants comma separated
    'Black' -- Attribute comma separated
);


call add_item
(
	'DAF', -- SKU
    58, -- Price
    4, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FDeadpool%20Action%20Figure_red.jpg?alt=media&token=f1478fdc-93aa-4011-a44a-331fe52d2803&_gl=1*pg9rkb*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIyMTc3My4xMy4xLjE2OTgyMjM3ODguNjAuMC4w', -- Image
    1, -- No. of variants
    'Color', -- Variants comma separated
    'Red' -- Attribute comma separated
);
call add_item
(
	'DAF', -- SKU
    72, -- Price
    6, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FDeadpool%20Action%20Figure_white.jpg?alt=media&token=461ada71-3ed9-4922-b265-dfcb51b966d1&_gl=1*p3f5e7*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIyMTc3My4xMy4xLjE2OTgyMjM4MDYuNDIuMC4w', -- Image
    1, -- No. of variants
    'Color', -- Variants comma separated
    'White' -- Attribute comma separated
);


call add_item
(
	'CPBG', -- SKU
    110, -- Price
    5, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FCyberpunk%202077%20Board%20Game.jpg?alt=media&token=2f350a67-22e8-4787-9561-5659f54d7460&_gl=1*i7u9cb*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIyMTc3My4xMy4xLjE2OTgyMjM4MjkuMTkuMC4w', -- Image
    1, -- No. of variants
    'Edition', -- Variants comma separated
    'Exclusive Edition' -- Attribute comma separated
);


call add_item
(
	'NSP', -- SKU
    259, -- Price
    2, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FNintendo%20Switch%20Red%2BBlue.jpg?alt=media&token=7ce2635d-90f1-43a3-b851-bfd5cd78102a&_gl=1*13vzc2p*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIyMTc3My4xMy4xLjE2OTgyMjM4NzUuNDcuMC4w', -- Image
    2, -- No. of variants
    'Model, Color', -- Variants comma separated
    'Classic, NeonRed + NeonBlue' -- Attribute comma separated
);
call add_item
(
	'NSP', -- SKU
    259, -- Price
    10, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FNintendo%20Switch%20Gray.jpg?alt=media&token=15576192-ef81-423c-9729-cf038d2a69c0&_gl=1*upifv6*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIyMTc3My4xMy4xLjE2OTgyMjM5MDMuMTkuMC4w', -- Image
    2, -- No. of variants
    'Model, Color', -- Variants comma separated
    'Classic, Gray + Gray' -- Attribute comma separated
);
call add_item
(
	'NSP', -- SKU
    199, -- Price
    6, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FNintendo%20Switch%20Lite-Blue.jpg?alt=media&token=e8441487-ac78-4e00-a7d6-20e741918e0f&_gl=1*1j71qz5*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIyMTc3My4xMy4xLjE2OTgyMjM5MjMuNjAuMC4w', -- Image
    2, -- No. of variants
    'Model, Color', -- Variants comma separated
    'Lite, Blue' -- Attribute comma separated
);
call add_item
(
	'NSP', -- SKU
    199, -- Price
    10, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FNintendo%20Switch%20Lite-Gray.jpg?alt=media&token=fdc5574f-4208-4f23-8dff-05a740bd8016&_gl=1*1kzc34h*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIyMTc3My4xMy4xLjE2OTgyMjM5NDkuMzQuMC4w', -- Image
    2, -- No. of variants
    'Model, Color', -- Variants comma separated
    'Lite, Gray' -- Attribute comma separated
);
call add_item
(
	'NSP', -- SKU
    199, -- Price
    15, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FNintendo%20Switch%20Lite-Yellow.jpg?alt=media&token=5d6a0d07-88e9-4284-909e-9ce53b70bb0b&_gl=1*11lwo33*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIyMTc3My4xMy4xLjE2OTgyMjQwMzAuNjAuMC4w', -- Image
    2, -- No. of variants
    'Model, Color', -- Variants comma separated
    'Lite, Yellow' -- Attribute comma separated
);
call add_item
(
	'NSP', -- SKU
    199, -- Price
    4, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FNintendo%20Switch%20Lite-Light%20Blue.jpg?alt=media&token=de80a481-4a6e-4bad-88ad-47c7f5cb7f24&_gl=1*1ayednu*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIyMTc3My4xMy4xLjE2OTgyMjQwNzQuMTYuMC4w', -- Image
    2, -- No. of variants
    'Model, Color', -- Variants comma separated
    'Lite, Turqouise' -- Attribute comma separated
);
call add_item
(
	'NSP', -- SKU
    199, -- Price
    9, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FNintendo%20Switch%20Lite-Coral.jpg?alt=media&token=08f26f0d-d2ef-4b76-bb21-2d4e0c70e5b3&_gl=1*x1ums1*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIyMTc3My4xMy4xLjE2OTgyMjQwOTcuNjAuMC4w', -- Image
    2, -- No. of variants
    'Model, Color', -- Variants comma separated
    'Lite, Coral' -- Attribute comma separated
);
call add_item
(
	'NSP', -- SKU
    319, -- Price
    14, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FNintendo%20Switch%20OLED%20red%2Bblue.jpg?alt=media&token=caca7eb2-8d0e-4f11-bb3d-acc794357bd8&_gl=1*1pzlf75*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIyMTc3My4xMy4xLjE2OTgyMjQxNzQuNjAuMC4w', -- Image
    2, -- No. of variants
    'Model, Color', -- Variants comma separated
    'OLED, NeonRed + NeonBlue' -- Attribute comma separated
);
call add_item
(
	'NSP', -- SKU
    319, -- Price
    2, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FNintendo%20Switch%20OLED%20white.jpg?alt=media&token=dba12aff-0234-422d-ad3c-f39e1ab524e9&_gl=1*w1ct7i*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIyMTc3My4xMy4xLjE2OTgyMjQxNDguOS4wLjA.', -- Image
    2, -- No. of variants
    'Model, Color', -- Variants comma separated
    'OLED, White' -- Attribute comma separated
);


call add_item
(
	'SP5', -- SKU
    499, -- Price
    3, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FSony%20PS5.webp?alt=media&token=e41abc33-2cad-422e-9a5d-b12107e4a3be&_gl=1*kvlh9o*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIyMTc3My4xMy4xLjE2OTgyMjQyMTQuMjAuMC4w', -- Image
    1, -- No. of variants
    'Bundle', -- Variants comma separated
    'Only Console' -- Attribute comma separated
);
call add_item
(
	'SP5', -- SKU
    539, -- Price
    15, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FSony%20PS5_MWII.webp?alt=media&token=ee569357-794e-4a44-aa15-2cef3a46d13b&_gl=1*uo5egf*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIyMTc3My4xMy4xLjE2OTgyMjQyMzkuNjAuMC4w', -- Image
    1, -- No. of variants
    'Bundle', -- Variants comma separated
    'Call of Duty Modern Warfare II Bundle' -- Attribute comma separated
);
call add_item
(
	'SP5', -- SKU
    559, -- Price
    1, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FSony%20PS5_SpiderMan2.webp?alt=media&token=f823b173-3933-4db8-a0ff-50b44f9d1eeb&_gl=1*6ybd67*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIyMTc3My4xMy4xLjE2OTgyMjQyODQuMTUuMC4w', -- Image
    1, -- No. of variants
    'Bundle', -- Variants comma separated
    'Marvel\'s Spider-Man 2 Bundle' -- Attribute comma separated
);
call add_item
(
	'SP5', -- SKU
    599, -- Price
    6, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FSony%20PS5_SpiderMan2_Special.webp?alt=media&token=88991c85-ddbe-4bfd-9126-b6a45fe52181&_gl=1*179xx6h*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIyMTc3My4xMy4xLjE2OTgyMjQzMDMuNjAuMC4w', -- Image
    1, -- No. of variants
    'Bundle', -- Variants comma separated
    'Marvel\'s Spider-Man 2 Limited Edition Bundle' -- Attribute comma separated
);


call add_item
(
	'AIPP13', -- SKU
    799, -- Price
    10, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FApple%20iPad%20Pro%2013-space-gray.jpg?alt=media&token=a87b035e-0f10-40e3-a48a-3c763b870939&_gl=1*95xpbo*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIyMTc3My4xMy4xLjE2OTgyMjQ0MDkuNjAuMC4w', -- Image
    4, -- No. of variants
    'Display Size, Color, Storage, Connectivity', -- Variants comma separated
    '11 inch, Space Gray, 128GB, Wi-Fi' -- Attribute comma separated
);
call add_item
(
	'AIPP13', -- SKU
    1099, -- Price
    11, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FApple%20iPad%20Pro%2013-space-gray.jpg?alt=media&token=a87b035e-0f10-40e3-a48a-3c763b870939&_gl=1*95xpbo*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIyMTc3My4xMy4xLjE2OTgyMjQ0MDkuNjAuMC4w', -- Image
    4, -- No. of variants
    'Display Size, Color, Storage, Connectivity', -- Variants comma separated
    '12.9 inch, Space Gray, 128GB, Wi-Fi' -- Attribute comma separated
);
call add_item
(
	'AIPP13', -- SKU
    799, -- Price
    10, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FApple%20iPad%20Pro%2013-silver.jpg?alt=media&token=e2b26206-d5a5-4a35-b6f2-16551f65b66e&_gl=1*1nlz6ps*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIyMTc3My4xMy4xLjE2OTgyMjQ0ODQuNjAuMC4w', -- Image
    4, -- No. of variants
    'Display Size, Color, Storage, Connectivity', -- Variants comma separated
    '11 inch, Silver, 128GB, Wi-Fi' -- Attribute comma separated
);
call add_item
(
	'AIPP13', -- SKU
    899, -- Price
    7, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FApple%20iPad%20Pro%2013-silver.jpg?alt=media&token=e2b26206-d5a5-4a35-b6f2-16551f65b66e&_gl=1*1nlz6ps*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIyMTc3My4xMy4xLjE2OTgyMjQ0ODQuNjAuMC4w', -- Image
    4, -- No. of variants
    'Display Size, Color, Storage, Connectivity', -- Variants comma separated
    '11 inch, Silver, 256GB, Wi-Fi' -- Attribute comma separated
);
call add_item
(
	'AIPP13', -- SKU
    1099, -- Price
    15, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FApple%20iPad%20Pro%2013-silver.jpg?alt=media&token=e2b26206-d5a5-4a35-b6f2-16551f65b66e&_gl=1*1nlz6ps*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIyMTc3My4xMy4xLjE2OTgyMjQ0ODQuNjAuMC4w', -- Image
    4, -- No. of variants
    'Display Size, Color, Storage, Connectivity', -- Variants comma separated
    '11 inch, Silver, 256GB, Wi-Fi + Cellular' -- Attribute comma separated
);
call add_item
(
	'AIPP13', -- SKU
    1399, -- Price
    3, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FApple%20iPad%20Pro%2013-silver.jpg?alt=media&token=e2b26206-d5a5-4a35-b6f2-16551f65b66e&_gl=1*1nlz6ps*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIyMTc3My4xMy4xLjE2OTgyMjQ0ODQuNjAuMC4w', -- Image
    4, -- No. of variants
    'Display Size, Color, Storage, Connectivity', -- Variants comma separated
    '12.9 inch, Silver, 256GB, Wi-Fi + Cellular' -- Attribute comma separated
);
call add_item
(
	'AIPP13', -- SKU
    1599, -- Price
    10, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FApple%20iPad%20Pro%2013-space-gray.jpg?alt=media&token=a87b035e-0f10-40e3-a48a-3c763b870939&_gl=1*95xpbo*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIyMTc3My4xMy4xLjE2OTgyMjQ0MDkuNjAuMC4w', -- Image
    4, -- No. of variants
    'Display Size, Color, Storage, Connectivity', -- Variants comma separated
    '12.9 inch, Space Gray, 512GB, Wi-Fi + Cellular' -- Attribute comma separated
);
call add_item
(
	'AIPP13', -- SKU
    1999, -- Price
    3, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FApple%20iPad%20Pro%2013-silver.jpg?alt=media&token=e2b26206-d5a5-4a35-b6f2-16551f65b66e&_gl=1*1nlz6ps*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIyMTc3My4xMy4xLjE2OTgyMjQ0ODQuNjAuMC4w', -- Image
    4, -- No. of variants
    'Display Size, Color, Storage, Connectivity', -- Variants comma separated
    '12.9 inch, Silver, 1TB, Wi-Fi + Cellular' -- Attribute comma separated
);
call add_item
(
	'AIPP13', -- SKU
    2399, -- Price
    2, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FApple%20iPad%20Pro%2013-space-gray.jpg?alt=media&token=a87b035e-0f10-40e3-a48a-3c763b870939&_gl=1*95xpbo*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIyMTc3My4xMy4xLjE2OTgyMjQ0MDkuNjAuMC4w', -- Image
    4, -- No. of variants
    'Display Size, Color, Storage, Connectivity', -- Variants comma separated
    '12.9 inch, Space Gray, 2TB, Wi-Fi + Cellular' -- Attribute comma separated
);


call add_item
(
	'SGTS9', -- SKU
    799, -- Price
    1, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FSamsung%20Galaxy%20Tab%20S9_Black.webp?alt=media&token=117a8cc7-3c76-47e2-9952-c96f6dbdab23&_gl=1*hekofe*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIyMTc3My4xMy4xLjE2OTgyMjQ1MzYuOC4wLjA.', -- Image
    3, -- No. of variants
    'Color, Storage, RAM', -- Variants comma separated
    'Graphite, 128GB, 8GB' -- Attribute comma separated
);
call add_item
(
	'SGTS9', -- SKU
    919, -- Price
    9, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FSamsung%20Galaxy%20Tab%20S9_Black.webp?alt=media&token=117a8cc7-3c76-47e2-9952-c96f6dbdab23&_gl=1*hekofe*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIyMTc3My4xMy4xLjE2OTgyMjQ1MzYuOC4wLjA.', -- Image
    3, -- No. of variants
    'Color, Storage, RAM', -- Variants comma separated
    'Graphite, 256GB, 12GB' -- Attribute comma separated
);
call add_item
(
	'SGTS9', -- SKU
    799, -- Price
    2, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FSamsung%20Galaxy%20Tab%20S9_Beige.webp?alt=media&token=c03fa174-f788-4b9e-abb1-d8f97d3f1d64&_gl=1*1mqbprh*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIyMTc3My4xMy4xLjE2OTgyMjQ2NTkuNjAuMC4w', -- Image
    3, -- No. of variants
    'Color, Storage, RAM', -- Variants comma separated
    'Beige, 128GB, 8GB' -- Attribute comma separated
);
call add_item
(
	'SGTS9', -- SKU
    919, -- Price
    6, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FSamsung%20Galaxy%20Tab%20S9_Beige.webp?alt=media&token=c03fa174-f788-4b9e-abb1-d8f97d3f1d64&_gl=1*1mqbprh*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIyMTc3My4xMy4xLjE2OTgyMjQ2NTkuNjAuMC4w', -- Image
    3, -- No. of variants
    'Color, Storage, RAM', -- Variants comma separated
    'Beige, 256GB, 12GB' -- Attribute comma separated
);


call add_item
(
	'FXT5', -- SKU
    1699, -- Price
    11, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2Ffujifilm_x_t5_black.jpg?alt=media&token=fe60f668-4a45-4b35-8c03-5f1f943b1d81&_gl=1*132cs3t*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIyMTc3My4xMy4xLjE2OTgyMjQ3ODQuNjAuMC4w', -- Image
    3, -- No. of variants
    'Color, Lens, Configuration', -- Variants comma separated
    'Black, No Lens, Base' -- Attribute comma separated
);
call add_item
(
	'FXT5', -- SKU
    2099, -- Price
    6, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2Ffujifilm_x_t5_black_18_55.jpg?alt=media&token=45e49794-684a-4880-b66f-440464273046&_gl=1*1793n37*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIyMTc3My4xMy4xLjE2OTgyMjQ4MTYuMjguMC4w', -- Image
    3, -- No. of variants
    'Color, Lens, Configuration', -- Variants comma separated
    'Black, 18-55mm Lens, Base' -- Attribute comma separated
);
call add_item
(
	'FXT5', -- SKU
    2199, -- Price
    1, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2Ffujifilm_x_t5_black_16_80.jpg?alt=media&token=6a75e174-7a25-41a9-8099-89f8f7f35800&_gl=1*17mvkzt*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIyMTc3My4xMy4xLjE2OTgyMjQ4NTMuNjAuMC4w', -- Image
    3, -- No. of variants
    'Color, Lens, Configuration', -- Variants comma separated
    'Black, 16-80mm Lens, Base' -- Attribute comma separated
);
call add_item
(
	'FXT5', -- SKU
    2199, -- Price
    1, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2Ffujifilm_fujifilm_x_t5_Black_Full%20kit.jpg?alt=media&token=3de894f1-9467-4ef3-ba5a-64df2aec19d1&_gl=1*tx9f3g*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIyMTc3My4xMy4xLjE2OTgyMjQ5MTAuMy4wLjA.', -- Image
    3, -- No. of variants
    'Color, Lens, Configuration', -- Variants comma separated
    'Black, No Lens, With Accessories Kit' -- Attribute comma separated
);
call add_item
(
	'FXT5', -- SKU
    1699, -- Price
    14, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2Ffujifilm_x_t5_silver.jpg?alt=media&token=ed2d9043-082a-419b-8bb3-4450f583d925&_gl=1*1qd1ybq*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIyMTc3My4xMy4xLjE2OTgyMjQ5NDAuNjAuMC4w', -- Image
    3, -- No. of variants
    'Color, Lens, Configuration', -- Variants comma separated
    'Silver, No Lens, Base' -- Attribute comma separated
);
call add_item
(
	'FXT5', -- SKU
    1699, -- Price
    2, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2Ffujifilm_x_t5_Silver_18_55.jpg?alt=media&token=b41a98a7-58bd-4bd2-b823-7487f68a59a6&_gl=1*1g1f1zp*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIyMTc3My4xMy4xLjE2OTgyMjQ5NzEuMjkuMC4w', -- Image
    3, -- No. of variants
    'Color, Lens, Configuration', -- Variants comma separated
    'Silver, 18-55mm Lens, Base' -- Attribute comma separated
);
call add_item
(
	'FXT5', -- SKU
    1699, -- Price
    9, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2Ffujifilm_x_t5_Silver_16_80.jpg?alt=media&token=b9c6cf9d-8b48-4f3c-a5e9-269dd98380a5&_gl=1*1qpjgkg*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIyMTc3My4xMy4xLjE2OTgyMjQ5OTMuNy4wLjA.', -- Image
    3, -- No. of variants
    'Color, Lens, Configuration', -- Variants comma separated
    'Silver, 16-80mm Lens, Base' -- Attribute comma separated
);
call add_item
(
	'FXT5', -- SKU
    2199, -- Price
    14, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2Ffujifilm_fujifilm_x_t5_Silver_Full%20kit.jpg?alt=media&token=574e6174-bf48-43f7-b2e8-875216804c1d&_gl=1*ekowc*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIyMTc3My4xMy4xLjE2OTgyMjUwMjIuNjAuMC4w', -- Image
    3, -- No. of variants
    'Color, Lens, Configuration', -- Variants comma separated
    'Silver, No Lens, With Accessories Kit' -- Attribute comma separated
);


call add_item
(
	'OOEM1', -- SKU
    1299, -- Price
    2, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FOlympus%20OM-D%20E-M1%20III.jpg?alt=media&token=7c45e47f-9e0d-4c57-a1f4-fe59b6c24875&_gl=1*1u5qw0d*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIyMTc3My4xMy4xLjE2OTgyMjUxMjIuNjAuMC4w', -- Image
    1, -- No. of variants
    'Lens', -- Variants comma separated
    'No Lens' -- Attribute comma separated
);
call add_item
(
	'OOEM1', -- SKU
    1898, -- Price
    8, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FOlympus%20OM-D%20E-M1%20III_12_45.jpg?alt=media&token=722261ad-ff32-4f1f-9229-39c22c3b6d29&_gl=1*12l0s0i*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIyMTc3My4xMy4xLjE2OTgyMjUxNTEuMzEuMC4w', -- Image
    1, -- No. of variants
    'Lens', -- Variants comma separated
    '12-45mm Lens' -- Attribute comma separated
);
call add_item
(
	'OOEM1', -- SKU
    2098, -- Price
    3, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FOlympus%20OM-D%20E-M1%20III_40_150.jpg?alt=media&token=696dfbe9-30d7-4797-90e2-fdf4d8c9df70&_gl=1*1gkt6qx*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIyMTc3My4xMy4xLjE2OTgyMjUxNjguMTQuMC4w', -- Image
    1, -- No. of variants
    'Lens', -- Variants comma separated
    '40-150mm Lens' -- Attribute comma separated
);
call add_item
(
	'OOEM1', -- SKU
    6898, -- Price
    12, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FOlympus%20OM-D%20E-M1%20III_collection.jpg?alt=media&token=c2e24837-bf8c-4aa2-8188-7fdc652ef831&_gl=1*13oq4cf*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIyMTc3My4xMy4xLjE2OTgyMjUxODUuNjAuMC4w', -- Image
    1, -- No. of variants
    'Lens', -- Variants comma separated
    '7-14mm Lens + 40-150mm Lens + 300mm Lens' -- Attribute comma separated
);


call add_item
(
	'AED5', -- SKU
    49.99, -- Price
    13, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FAmazon%20Echo%20Dot%205th%20Gen_Black.jpg?alt=media&token=99290fd5-572f-4351-884b-cc0e8e347c78&_gl=1*onfb6h*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIyMTc3My4xMy4xLjE2OTgyMjUyNDkuNjAuMC4w', -- Image
    2, -- No. of variants
    'Color, Configuration', -- Variants comma separated
    'Black, Base' -- Attribute comma separated
);
call add_item
(
	'AED5', -- SKU
    49.99, -- Price
    5, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FAmazon%20Echo%20Dot%205th%20Gen_Blue.jpg?alt=media&token=86bef7e1-ca78-417d-8f53-e6260bb50f53&_gl=1*5h92rt*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIyMTc3My4xMy4xLjE2OTgyMjUyNjkuNDAuMC4w', -- Image
    2, -- No. of variants
    'Color, Configuration', -- Variants comma separated
    'Blue, Base' -- Attribute comma separated
);
call add_item
(
	'AED5', -- SKU
    49.99, -- Price
    11, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FAmazon%20Echo%20Dot%205th%20Gen_White.jpg?alt=media&token=31602640-ed4c-4544-9140-e1fc93c4c626&_gl=1*1q7ryd0*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIyMTc3My4xMy4xLjE2OTgyMjUyODMuMjYuMC4w', -- Image
    2, -- No. of variants
    'Color, Configuration', -- Variants comma separated
    'White, Base' -- Attribute comma separated
);
call add_item
(
	'AED5', -- SKU
    42.35, -- Price
    10, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FAmazon%20Echo%20Dot%205th%20Gen%20white%20with%20clock.jpg?alt=media&token=44b16a16-9db1-487b-898b-688186f6e362&_gl=1*zcuax7*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIyMTc3My4xMy4xLjE2OTgyMjUyOTkuMTAuMC4w', -- Image
    2, -- No. of variants
    'Color, Configuration', -- Variants comma separated
    'White, With Clock' -- Attribute comma separated
);
call add_item
(
	'AED5', -- SKU
    42.35, -- Price
    2, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FAmazon%20Echo%20Dot%205th%20Gen%20light%20blue%20with%20clock.jpg?alt=media&token=b842775d-6f58-4ed4-821c-93856e8a3da2&_gl=1*vlq15e*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIyMTc3My4xMy4xLjE2OTgyMjUzMTkuNTguMC4w', -- Image
    2, -- No. of variants
    'Color, Configuration', -- Variants comma separated
    'Light Blue, With Clock' -- Attribute comma separated
);


call add_item
(
	'HulkAF', -- SKU
    39.99, -- Price
    2, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FHulk%20Action%20Figure%20Ragnarok.jpg?alt=media&token=122ee1ec-2d37-4203-b484-51aaa1f884e4&_gl=1*1ody7om*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIyMTc3My4xMy4xLjE2OTgyMjU0NTEuNDMuMC4w', -- Image
    1, -- No. of variants
    'Suit Version', -- Variants comma separated
    'Ragnarok Edition' -- Attribute comma separated
);
call add_item
(
	'HulkAF', -- SKU
    29.99, -- Price
    13, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FHulk%20Action%20Figure%20Classic.jpg?alt=media&token=41698205-ef06-4753-bfcf-667b8557d941&_gl=1*1ge2w6n*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIyMTc3My4xMy4xLjE2OTgyMjU0MzQuNjAuMC4w', -- Image
    1, -- No. of variants
    'Suit Version', -- Variants comma separated
    'Classic Edition' -- Attribute comma separated
);


call add_item
(
	'MXSX', -- SKU
    499.99, -- Price
    13, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FMicrosoft%20Xbox%20Series%20X.png?alt=media&token=856473c3-451e-417d-bbd2-810767aae869&_gl=1*3z22ze*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIyMTc3My4xMy4xLjE2OTgyMjU1MDguNjAuMC4w', -- Image
    1, -- No. of variants
    'Bundle', -- Variants comma separated
    'Only Console' -- Attribute comma separated
);
call add_item
(
	'MXSX', -- SKU
    559.99, -- Price
    3, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FMicrosoft%20Xbox%20Series%20X_diablo.png?alt=media&token=9f133a0b-c796-4eb0-94c2-3a1bc0d400fc&_gl=1*14pfx4z*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIyMTc3My4xMy4xLjE2OTgyMjU1NDEuMjcuMC4w', -- Image
    1, -- No. of variants
    'Bundle', -- Variants comma separated
    'Diablo IV Bundle' -- Attribute comma separated
);
call add_item
(
	'MXSX', -- SKU
    559.99, -- Price
    6, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FMicrosoft%20Xbox%20Series%20X.png?alt=media&token=856473c3-451e-417d-bbd2-810767aae869&_gl=1*3z22ze*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIyMTc3My4xMy4xLjE2OTgyMjU1MDguNjAuMC4w', -- Image
    1, -- No. of variants
    'Bundle', -- Variants comma separated
    'Forza Horizon 5 Bundle' -- Attribute comma separated
);
call add_item
(
	'MXSX', -- SKU
    449.99, -- Price
    3, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FMicrosoft%20Xbox%20Series%20X.png?alt=media&token=856473c3-451e-417d-bbd2-810767aae869&_gl=1*3z22ze*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIyMTc3My4xMy4xLjE2OTgyMjU1MDguNjAuMC4w', -- Image
    1, -- No. of variants
    'Bundle', -- Variants comma separated
    'Refurbished' -- Attribute comma separated
);


call add_item
(
	'TWP4', -- SKU
    299.99, -- Price
    15, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FTicWatch%20Pro%204.jpg?alt=media&token=379c2463-8d51-46de-8861-f047f08bc78a&_gl=1*6u8pmc*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIyMTc3My4xMy4xLjE2OTgyMjU2MjAuNjAuMC4w', -- Image
    1, -- No. of variants
    'RAM', -- Variants comma separated
    '1GB' -- Attribute comma separated
);
call add_item
(
	'TWP4', -- SKU
    189.99, -- Price
    13, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FTicWatch%20Pro%204.jpg?alt=media&token=379c2463-8d51-46de-8861-f047f08bc78a&_gl=1*6u8pmc*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIyMTc3My4xMy4xLjE2OTgyMjU2MjAuNjAuMC4w', -- Image
    1, -- No. of variants
    'RAM', -- Variants comma separated
    '512MB' -- Attribute comma separated
);


call add_item
(
	'LGG17', -- SKU
    1349.99, -- Price
    8, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FLG_gram%2017_Dark%20Silver.jpg?alt=media&token=d6450967-4b34-4e52-98fd-9be8bd714f31&_gl=1*1kl71fy*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIyMTc3My4xMy4xLjE2OTgyMjU2NTMuMjcuMC4w', -- Image
    1, -- No. of variants
    'Color', -- Variants comma separated
    'Dark Silver' -- Attribute comma separated
);


call add_item
(
	'JBQ1', -- SKU
    214.95, -- Price
    2, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FJBL_QUANTUM%20ONE.webp?alt=media&token=55555dc7-f926-40ed-aa31-1a7402a32dd5&_gl=1*omath9*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIyMTc3My4xMy4xLjE2OTgyMjU2NzUuNS4wLjA.', -- Image
    1, -- No. of variants
    'Color', -- Variants comma separated
    'Gray' -- Attribute comma separated
);


call add_item
(
	'SQGM', -- SKU
    1399.99, -- Price
    9, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FSamsung%20QLED%20Gaming%20Monitor%20OLED.webp?alt=media&token=ec8b7979-3ca8-4c61-bbbc-8650bcb0125d&_gl=1*1cxz2re*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIyMTc3My4xMy4xLjE2OTgyMjU3MzIuNjAuMC4w', -- Image
    2, -- No. of variants
    'Model, Display Size', -- Variants comma separated
    'OLED, 49 inch' -- Attribute comma separated
);
call add_item
(
	'SQGM', -- SKU
    2499.99, -- Price
    14, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FSamsung%20QLED%20Gaming%20Monitor_Neo.webp?alt=media&token=cd8e010d-035d-4cb0-8673-aba3b1a2894a&_gl=1*3ob4jm*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIyMTc3My4xMy4xLjE2OTgyMjU3NTEuNDEuMC4w', -- Image
    2, -- No. of variants
    'Model, Display Size', -- Variants comma separated
    'NEO, 57 inch' -- Attribute comma separated
);


call add_item
(
	'ST8T', -- SKU
    89.99, -- Price
    1, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FSamsung%20T8%20SSD_Black.webp?alt=media&token=17c38c24-fc0a-4461-b81a-25edd06b804e&_gl=1*1ftyycr*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIyMTc3My4xMy4xLjE2OTgyMjU3ODYuNi4wLjA.', -- Image
    2, -- No. of variants
    'Color, Storage', -- Variants comma separated
    'Black, 1TB' -- Attribute comma separated
);
call add_item
(
	'ST8T', -- SKU
    129.99, -- Price
    8, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FSamsung%20T8%20SSD_Black.webp?alt=media&token=17c38c24-fc0a-4461-b81a-25edd06b804e&_gl=1*1ftyycr*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIyMTc3My4xMy4xLjE2OTgyMjU3ODYuNi4wLjA.', -- Image
    2, -- No. of variants
    'Color, Storage', -- Variants comma separated
    'Black, 2TB' -- Attribute comma separated
);
call add_item
(
	'ST8T', -- SKU
    229.99, -- Price
    10, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FSamsung%20T8%20SSD_Black.webp?alt=media&token=17c38c24-fc0a-4461-b81a-25edd06b804e&_gl=1*1ftyycr*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIyMTc3My4xMy4xLjE2OTgyMjU3ODYuNi4wLjA.', -- Image
    2, -- No. of variants
    'Color, Storage', -- Variants comma separated
    'Black, 4TB' -- Attribute comma separated
);
call add_item
(
	'ST8T', -- SKU
    89.99, -- Price
    11, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FSamsung%20T8%20SSD_Blue.webp?alt=media&token=fdde4781-6bea-42ed-b0d9-e8b08e1f11f3&_gl=1*8anmv1*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIyMTc3My4xMy4xLjE2OTgyMjU4MjEuNjAuMC4w', -- Image
    2, -- No. of variants
    'Color, Storage', -- Variants comma separated
    'Blue, 1TB' -- Attribute comma separated
);
call add_item
(
	'ST8T', -- SKU
    129.99, -- Price
    3, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FSamsung%20T8%20SSD_Blue.webp?alt=media&token=fdde4781-6bea-42ed-b0d9-e8b08e1f11f3&_gl=1*8anmv1*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIyMTc3My4xMy4xLjE2OTgyMjU4MjEuNjAuMC4w', -- Image
    2, -- No. of variants
    'Color, Storage', -- Variants comma separated
    'Blue, 2TB' -- Attribute comma separated
);
call add_item
(
	'ST8T', -- SKU
    89.99, -- Price
    15, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FSamsung%20T8%20SSD_Beige.webp?alt=media&token=b027a870-1193-41c0-bb80-2bdf920208fe&_gl=1*1palfiw*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIyMTc3My4xMy4xLjE2OTgyMjU4NTYuMjUuMC4w', -- Image
    2, -- No. of variants
    'Color, Storage', -- Variants comma separated
    'Beige, 1TB' -- Attribute comma separated
);
call add_item
(
	'ST8T', -- SKU
    129.99, -- Price
    3, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FSamsung%20T8%20SSD_Beige.webp?alt=media&token=b027a870-1193-41c0-bb80-2bdf920208fe&_gl=1*1palfiw*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIyMTc3My4xMy4xLjE2OTgyMjU4NTYuMjUuMC4w', -- Image
    2, -- No. of variants
    'Color, Storage', -- Variants comma separated
    'Beige, 2TB' -- Attribute comma separated
);


call add_item
(
	'KHXC2', -- SKU
    78.70, -- Price
    4, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FKingston%20HyperX%20Cloud%20II_red%2Bblack.webp?alt=media&token=5522072a-be61-45be-9d93-f9e4fbd34a57&_gl=1*d6l11p*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIyMTc3My4xMy4xLjE2OTgyMjU4OTUuNjAuMC4w', -- Image
    2, -- No. of variants
    'Color, Connection Type', -- Variants comma separated
    'Black + Red, Wired' -- Attribute comma separated
);
call add_item
(
	'KHXC2', -- SKU
    99.99, -- Price
    3, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FKingston%20HyperX%20Cloud%20II_red%2Bblack.webp?alt=media&token=5522072a-be61-45be-9d93-f9e4fbd34a57&_gl=1*d6l11p*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIyMTc3My4xMy4xLjE2OTgyMjU4OTUuNjAuMC4w', -- Image
    2, -- No. of variants
    'Color, Connection Type', -- Variants comma separated
    'Black + Red, Wireless' -- Attribute comma separated
);
call add_item
(
	'KHXC2', -- SKU
    79.99, -- Price
    7, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FKingston%20HyperX%20Cloud%20II_black.webp?alt=media&token=c41fb4e5-77a2-4ce0-896e-5f526750b402&_gl=1*1kufhhy*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIyMTc3My4xMy4xLjE2OTgyMjU5MjguMjcuMC4w', -- Image
    2, -- No. of variants
    'Color, Connection Type', -- Variants comma separated
    'Black + Gunmetal, Wired' -- Attribute comma separated
);


call add_item
(
	'LGC930', -- SKU
    129.99, -- Price
    15, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FLogitech%20C930e%20Webcam.webp?alt=media&token=f0008495-adba-4a44-b15c-3325a9e01db8&_gl=1*toujl2*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIyMTc3My4xMy4xLjE2OTgyMjYwMTAuNjAuMC4w', -- Image
    1, -- No. of variants
    'Color', -- Variants comma separated
    'Black' -- Attribute comma separated
);


call add_item
(
	'ThanosAF', -- SKU
    82.95, -- Price
    5, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FThanos%20Action%20Figure_infinity%20war.jpg?alt=media&token=ae7b0beb-bbfa-4bf4-bc26-90c6b937bf55&_gl=1*1u9zvsr*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIyMTc3My4xMy4xLjE2OTgyMjYwNDUuMjUuMC4w', -- Image
    1, -- No. of variants
    'Suit Version', -- Variants comma separated
    'Infinity War Edition' -- Attribute comma separated
);
call add_item
(
	'ThanosAF', -- SKU
    94.99, -- Price
    4, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FThanos%20Action%20Figure_endgame.jpg?alt=media&token=9a0a39e3-ebf2-4fc4-88f3-00c609ee9854&_gl=1*5t9n9k*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIyMTc3My4xMy4xLjE2OTgyMjYwNjEuOS4wLjA.', -- Image
    1, -- No. of variants
    'Suit Version', -- Variants comma separated
    'EndGame Edition' -- Attribute comma separated
);


call add_item
(
	'UCG', -- SKU
    11.95, -- Price
    10, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FUno%20Card%20Game.jpg?alt=media&token=b3c8a9b5-d45a-402c-a2df-97641ea4fd6b&_gl=1*zbruei*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIyMTc3My4xMy4xLjE2OTgyMjYwODguNjAuMC4w', -- Image
    1, -- No. of variants
    'Edition', -- Variants comma separated
    'Classic Edition' -- Attribute comma separated
);
call add_item
(
	'UCG', -- SKU
    11.95, -- Price
    12, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FUno%20Card%20Game%20flip.jpg?alt=media&token=f87a0fb5-dd13-4ae6-96b1-39a1e13c6a71&_gl=1*1fkq019*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIyMTc3My4xMy4xLjE2OTgyMjYxMDcuNDEuMC4w', -- Image
    1, -- No. of variants
    'Edition', -- Variants comma separated
    'Flip Edition' -- Attribute comma separated
);


call add_item
(
	'SB65O', -- SKU
    1399.99, -- Price
    8, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FSony%20Bravia%2065%20OLED%20TV.png?alt=media&token=5f43fb63-569f-4be7-b3dc-7cee23c9152c&_gl=1*ruw4m4*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIyMTc3My4xMy4xLjE2OTgyMjYxODMuNjAuMC4w', -- Image
    1, -- No. of variants
    'Display Size', -- Variants comma separated
    '55 inch' -- Attribute comma separated
);
call add_item
(
	'SB65O', -- SKU
    1999.99, -- Price
    13, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FSony%20Bravia%2065%20OLED%20TV.png?alt=media&token=5f43fb63-569f-4be7-b3dc-7cee23c9152c&_gl=1*ruw4m4*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIyMTc3My4xMy4xLjE2OTgyMjYxODMuNjAuMC4w', -- Image
    1, -- No. of variants
    'Display Size', -- Variants comma separated
    '65 inch' -- Attribute comma separated
);
call add_item
(
	'SB65O', -- SKU
    2999.99, -- Price
    11, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FSony%20Bravia%2065%20OLED%20TV.png?alt=media&token=5f43fb63-569f-4be7-b3dc-7cee23c9152c&_gl=1*ruw4m4*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIyMTc3My4xMy4xLjE2OTgyMjYxODMuNjAuMC4w', -- Image
    1, -- No. of variants
    'Display Size', -- Variants comma separated
    '77 inch' -- Attribute comma separated
);


call add_item
(
	'LG55N', -- SKU
    1599.99, -- Price
    14, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FLG_Nanocell%2085.jpg?alt=media&token=27efc6d7-4f4c-459e-ac21-84c75cb74e3f&_gl=1*1x5nm95*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIyMTc3My4xMy4xLjE2OTgyMjYyMjQuMTkuMC4w', -- Image
    1, -- No. of variants
    'Display Size', -- Variants comma separated
    '85 inch' -- Attribute comma separated
);
call add_item
(
	'LG55N', -- SKU
    1099.99, -- Price
    7, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FLG_Nanocell%2055.jpg?alt=media&token=7b8b2e5c-8188-4730-b39f-99567c2adaea&_gl=1*1eucfwy*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIyMTc3My4xMy4xLjE2OTgyMjYyNDMuNjAuMC4w', -- Image
    1, -- No. of variants
    'Display Size', -- Variants comma separated
    '55 inch' -- Attribute comma separated
);


call add_item
(
	'LTB', -- SKU
    349.99, -- Price
    13, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FLEGO%20Technic%20Bugatti.jpg?alt=media&token=77e62d75-d061-42ac-a38d-f792c7647fc9&_gl=1*coj91m*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIyMTc3My4xMy4xLjE2OTgyMjYyNzAuMzMuMC4w', -- Image
    1, -- No. of variants
    'Material', -- Variants comma separated
    'Plastic' -- Attribute comma separated
);


call add_item
(
	'DJP5', -- SKU
    1299.99, -- Price
    6, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FDJI%20Phantom%20Drone%203%20SE.jpg?alt=media&token=cdc53eb4-808e-4da4-9a4d-9d35a556d56e&_gl=1*1b9acpm*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIyMTc3My4xMy4xLjE2OTgyMjYyOTUuOC4wLjA.', -- Image
    1, -- No. of variants
    'Model', -- Variants comma separated
    'Phantom 3 SE' -- Attribute comma separated
);
call add_item
(
	'DJP5', -- SKU
    1399.99, -- Price
    4, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FDJI%20Phantom%20Drone%204%20Advanced%20Plus.jpg?alt=media&token=070d2e33-c744-47ff-89f3-23bc04e488b9&_gl=1*yckk07*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIyMTc3My4xMy4xLjE2OTgyMjYzMjAuNjAuMC4w', -- Image
    1, -- No. of variants
    'Model', -- Variants comma separated
    'Phantom 4 Advanced Plus' -- Attribute comma separated
);
call add_item
(
	'DJP5', -- SKU
    1499.99, -- Price
    6, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FDJI%20Phantom%20Drone%204%20PRO.jpg?alt=media&token=5ed6f80a-99c5-47ee-941d-5d7f63dc6c61&_gl=1*1rg9y9j*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIyMTc3My4xMy4xLjE2OTgyMjYzMzguNDIuMC4w', -- Image
    1, -- No. of variants
    'Model', -- Variants comma separated
    'Phantom 4 PRO' -- Attribute comma separated
);
call add_item
(
	'DJP5', -- SKU
    1549.99, -- Price
    9, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FDJI%20Phantom%20Drone%204%20PRO%20Plus.jpg?alt=media&token=0281bf99-eb0e-425a-a316-10040b740849&_gl=1*1ikigns*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIyMTc3My4xMy4xLjE2OTgyMjYzNTcuMjMuMC4w', -- Image
    1, -- No. of variants
    'Model', -- Variants comma separated
    'Phantom 4 PRO Plus' -- Attribute comma separated
);
call add_item
(
	'DJP5', -- SKU
    1999.99, -- Price
    11, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FDJI%20Phantom%20Drone%204%20PRO%2B.jpg?alt=media&token=81dfc261-d4ac-4c27-8027-e9a305002668&_gl=1*ozu2gi*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIyMTc3My4xMy4xLjE2OTgyMjYzNzQuNi4wLjA.', -- Image
    1, -- No. of variants
    'Model', -- Variants comma separated
    'Phantom 4 PRO+' -- Attribute comma separated
);


call add_item
(
	'GPH10', -- SKU
    249.99, -- Price
    14, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FGoPro%20Hero%2010.webp?alt=media&token=13abdacc-c6da-4b08-94f9-541d9ae6cb82&_gl=1*14g75gq*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIyMTc3My4xMy4xLjE2OTgyMjY0MjEuNjAuMC4w', -- Image
    1, -- No. of variants
    'Color', -- Variants comma separated
    'Black' -- Attribute comma separated
);


call add_item
(
	'AMP16', -- SKU
    2499.99, -- Price
    1, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FApple%20MacBook%20Pro%2016_spacegray.jpg?alt=media&token=bd27f98a-828b-40a0-8400-8a9da666770e&_gl=1*k7hwdm*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIyMTc3My4xMy4xLjE2OTgyMjY0NTkuMjIuMC4w', -- Image
    1, -- No. of variants
    'Color, RAM, Storage', -- Variants comma separated
    'Space Gray, 16GB, 512GB' -- Attribute comma separated
);
call add_item
(
	'AMP16', -- SKU
    2699.99, -- Price
    6, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FApple%20MacBook%20Pro%2016_spacegray.jpg?alt=media&token=bd27f98a-828b-40a0-8400-8a9da666770e&_gl=1*k7hwdm*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIyMTc3My4xMy4xLjE2OTgyMjY0NTkuMjIuMC4w', -- Image
    1, -- No. of variants
    'Color, RAM, Storage', -- Variants comma separated
    'Space Gray, 16GB, 1TB' -- Attribute comma separated
);
call add_item
(
	'AMP16', -- SKU
    3499.99, -- Price
    14, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FApple%20MacBook%20Pro%2016_spacegray.jpg?alt=media&token=bd27f98a-828b-40a0-8400-8a9da666770e&_gl=1*k7hwdm*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIyMTc3My4xMy4xLjE2OTgyMjY0NTkuMjIuMC4w', -- Image
    1, -- No. of variants
    'Color, RAM, Storage', -- Variants comma separated
    'Space Gray, 32GB, 1TB' -- Attribute comma separated
);
call add_item
(
	'AMP16', -- SKU
    2499.99, -- Price
    9, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FApple%20MacBook%20Pro%2016-silver.jpg?alt=media&token=6bcfc0b0-7460-4c83-a158-5f7071f3660b&_gl=1*qsc5ip*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIyMTc3My4xMy4xLjE2OTgyMjY0ODQuNjAuMC4w', -- Image
    1, -- No. of variants
    'Color, RAM, Storage', -- Variants comma separated
    'Silver, 16GB, 512GB' -- Attribute comma separated
);
call add_item
(
	'AMP16', -- SKU
    2699.99, -- Price
    11, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FApple%20MacBook%20Pro%2016-silver.jpg?alt=media&token=6bcfc0b0-7460-4c83-a158-5f7071f3660b&_gl=1*qsc5ip*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIyMTc3My4xMy4xLjE2OTgyMjY0ODQuNjAuMC4w', -- Image
    1, -- No. of variants
    'Color, RAM, Storage', -- Variants comma separated
    'Silver, 16GB, 1TB' -- Attribute comma separated
);
call add_item
(
	'AMP16', -- SKU
    3499.99, -- Price
    4, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FApple%20MacBook%20Pro%2016-silver.jpg?alt=media&token=6bcfc0b0-7460-4c83-a158-5f7071f3660b&_gl=1*qsc5ip*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODIyMTc3My4xMy4xLjE2OTgyMjY0ODQuNjAuMC4w', -- Image
    1, -- No. of variants
    'Color, RAM, Storage', -- Variants comma separated
    'Silver, 32GB, 1TB' -- Attribute comma separated
);


-- customer
-- customer 1
INSERT INTO `customer` (`Hashed_password`, `First_name`, `Last_name`, `Email`, `Phone_number`, `Address_line1`, `Address_line2`, `City`, `Province`, `Zipcode`, `Is_registered`) VALUES 
(
	'$2a$12$SZu9QokwMpuin9YwlT46Z.vSfjYGFiYvtjf2dvPpYOm5sW09osxk6', -- password: Lakshitha123
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
-- customer 2
INSERT INTO `customer` (`Hashed_password`, `First_name`, `Last_name`, `Email`, `Phone_number`, `Address_line1`, `Address_line2`, `City`, `Province`, `Zipcode`, `Is_registered`) VALUES 
(
	'$2a$12$5kiPfTBOnvS83wFcjALGaOlTYA/Rc11TT/iEd2Ju2z3mzWVYm4WNm', -- password: Abcd1234
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
-- customer 3
INSERT INTO `customer` (`Hashed_password`, `First_name`, `Last_name`, `Email`, `Phone_number`, `Address_line1`, `City`, `Province`, `Zipcode`, `Is_registered`) VALUES 
(
	'$2a$12$80efCEWWFKs6j3GrQiFUJOo.vRukoPq6RRxsmV76RRNm59OIcL4r.', -- password: NissanCar90
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
-- customer 4
INSERT INTO `customer` (`Hashed_password`, `First_name`, `Last_name`, `Email`, `Phone_number`, `Address_line1`, `Address_line2`, `City`, `Province`, `Zipcode`, `Is_registered`) VALUES 
(
	'$2a$12$ZYQ3ummi2UM5EB0h48oweuJCAOM9pPPpgvALzOBNprj13E9klpnUK', -- password: AntMan
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
-- customer 5
INSERT INTO `customer` (`Hashed_password`, `First_name`, `Last_name`, `Email`, `Phone_number`, `Address_line1`, `Address_line2`, `City`, `Province`, `Zipcode`, `Is_registered`) VALUES 
(
	'$2a$12$gfC2zAnF/sW7TROaCAdWQ.zYN/yBECwvg2KJT6oUJIaqNu.IlEM9q', -- password: sjkvsfi8HncUBEN()@_#
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
-- customer 6
INSERT INTO `customer` (`Hashed_password`, `First_name`, `Last_name`, `Email`, `Phone_number`, `Address_line1`, `Address_line2`, `City`, `Province`, `Zipcode`, `Is_registered`) VALUES 
(
	'$2a$12$JymSFggFyAGKTL9AQrGkWeXTkUNAwWFZfbQxLUPAw1LZwVc2ISYTW', -- password: hhiidwdwdada
	'Amara', 
	'Wijesinghe', 
	'amara.wijesinghe@gmail.com', 
	'0712567832', 
	'No.8, Fifth Lane', 
	'Peradeniya Road', 
	'Kandy', 
	'Central', 
	'20000', 
	'1'
);
-- customer 7
INSERT INTO `customer` (`Hashed_password`, `First_name`, `Last_name`, `Email`, `Phone_number`, `Address_line1`, `Address_line2`, `City`, `Province`, `Zipcode`, `Is_registered`) VALUES 
(
	'$2a$12$HAkxqrU1TQm7G9HkfUJNueV9fkh0zK3xltoTw4k5vqK/5kIOjQPma', -- password: GrandFinale
	'Pasan', 
	'Bandara', 
	'pasan.bandara@gmail.com', 
	'0717890456', 
	'No.6, Sixth Lane', 
	'Main Street', 
	'Badulla', 
	'Uva', 
	'70000', 
	'0'
);
-- customer 8
INSERT INTO `customer` (`Hashed_password`, `First_name`, `Last_name`, `Email`, `Phone_number`, `Address_line1`, `Address_line2`, `City`, `Province`, `Zipcode`, `Is_registered`) VALUES 
(
	'$2a$12$Ic2IsQD./rJw4VxszP12GuB0zHHFtyejQ0Vgk71R1sVl60ZgjT7Gm', -- password: tired#boy
	'Ruwan', 
	'Liyanage', 
	'ruwan.liyanage@gmail.com', 
	'0715478923', 
	'No.11, Elm Street', 
	'Nuwara Eliya Road', 
	'Nuwara Eliya', 
	'Central', 
	'22200', 
	'1'
);
-- customer 9
INSERT INTO `customer` (`Hashed_password`, `First_name`, `Last_name`, `Email`, `Phone_number`, `Address_line1`, `Address_line2`, `City`, `Province`, `Zipcode`, `Is_registered`) VALUES 
(
	'$2a$12$A8pKjkv2xbBL2YsKjBrKke8d8TnsP/.b2peJRUKJ3rOnAcdH1ERya', 
	'Thilini', 
	'Kumarasinghe', 
	'thilini.kumara@gmail.com', 
	'0716532489', 
	'No.23, Park Road', 
	'Colombo Road', 
	'Rathnapura', 
	'Sabaragamuwa', 
	'70500', 
	'0'
);
-- customer 10
INSERT INTO `customer` (`Hashed_password`, `First_name`, `Last_name`, `Email`, `Phone_number`, `Address_line1`, `City`, `Province`, `Zipcode`, `Is_registered`) VALUES 
(
	'$2a$12$HKoOaOYkEPYbr.qxYCi4m.9mg9q6C6MG1oSEkl.x1VlIilsqEOz7u', -- LionKing
	'Kushani', 
	'Peris', 
	'kushani.peris@gmail.com', 
	'0718925634', 
	'No.13, Green Avenue', 
	'Jaffna', 
	'Northern', 
	'40000', 
	'1'
);
-- customer 11
INSERT INTO `customer` (`Hashed_password`, `First_name`, `Last_name`, `Email`, `Phone_number`, `Address_line1`, `Address_line2`, `City`, `Province`, `Zipcode`, `Is_registered`) VALUES 
(
	'$2a$12$HFxlfXseXef/FMylc.5nUurNWvywjk8.xFVqQDbB4tTst5zgqy.B.', 
	'Nimal', 
	'Rathnayake', 
	'nimal.rathna@gmail.com', 
	'0716352487', 
	'No.25, First Cross Street', 
	'Dambulla Road', 
	'Dambulla', 
	'Central', 
	'21100', 
	'1'
);
-- customer 12
INSERT INTO `customer` (`Hashed_password`, `First_name`, `Last_name`, `Email`, `Phone_number`, `Address_line1`, `Address_line2`, `City`, `Province`, `Zipcode`, `Is_registered`) VALUES 
(
	'$2a$12$5nHX8xgPPgF6KpgVLzWqZeZHq6bA2v5yP.Vv.KndwLb6kNeh2Dypa', 
	'Roshan', 
	'Dias', 
	'roshan.dias@gmail.com', 
	'0719586742', 
	'No.9, Lake Road', 
	'Main Street', 
	'Anuradhapura', 
	'North Central', 
	'50010', 
	'0'
);
-- customer 13
INSERT INTO `customer` (`Hashed_password`, `First_name`, `Last_name`, `Email`, `Phone_number`, `Address_line1`, `Address_line2`, `City`, `Province`, `Zipcode`, `Is_registered`) VALUES 
(
	'$2a$12$8TKLz2OZ5TP0p18Y9P8o8u/qSHLfyjddKE/vVHjYMSzlFGp.VVvqK', 
	'Janani', 
	'Gunasekara', 
	'janani.guna@gmail.com', 
	'0712358674', 
	'No.15, Maple Street', 
	'Ella Road', 
	'Ella', 
	'Uva', 
	'90100', 
	'1'
);
-- customer 14
INSERT INTO `customer` (`Hashed_password`, `First_name`, `Last_name`, `Email`, `Phone_number`, `Address_line1`, `Address_line2`, `City`, `Province`, `Zipcode`, `Is_registered`) VALUES 
(
	'$2a$12$6xz8jPsQefiLWu5NWtUfOuzg66vX3iFQd2Kv3kT/F2e4oY9H0/TI6', 
	'Samadhi', 
	'Wickramasinghe', 
	'samadhi.wick@gmail.com', 
	'0716589321', 
	'No.20, High Street', 
	'Bandarawela Road', 
	'Bandarawela', 
	'Uva', 
	'90150', 
	'0'
);
-- customer 15
INSERT INTO `customer` (`Hashed_password`, `First_name`, `Last_name`, `Email`, `Phone_number`, `Address_line1`, `Address_line2`, `City`, `Province`, `Zipcode`, `Is_registered`) VALUES 
(
	'$2a$12$yGwpTVu/YuOLZOL5SflTfeFs5.ZRUb/9DYJz8dUKu7QZBcSjKyOLC', 
	'Dulaj', 
	'Fernando', 
	'dulaj.fernando@gmail.com', 
	'0719563428', 
	'No.4, River Drive', 
	'Panadura Road', 
	'Panadura', 
	'Western', 
	'12500', 
	'1'
);
-- customer 16
INSERT INTO `customer` (`Hashed_password`, `First_name`, `Last_name`, `Email`, `Phone_number`, `Address_line1`, `Address_line2`, `City`, `Province`, `Zipcode`, `Is_registered`) VALUES 
(
	'$2a$12$abcdefgHIJK1mnO2PQ3RSTuvwxYZ', 
	'Chamara', 
	'Silva', 
	'chamara.silva@gmail.com', 
	'0712345678', 
	'No.1, Sixth Lane', 
	'Galle Road', 
	'Galle', 
	'Southern', 
	'80000', 
	'1'
);
-- customer 17
INSERT INTO `customer` (`Hashed_password`, `First_name`, `Last_name`, `Email`, `Phone_number`, `Address_line1`, `Address_line2`, `City`, `Province`, `Zipcode`, `Is_registered`) VALUES 
(
	'$2a$12$hijklmNOPOQrst23UVWX4YZab56', 
	'Nimal', 
	'Perera', 
	'nimal.perera@gmail.com', 
	'0712345123', 
	'No.2, Sixth Lane', 
	'Kandy Road', 
	'Kandy', 
	'Central', 
	'20010', 
	'0'
);
-- customer 18
INSERT INTO `customer` (`Hashed_password`, `First_name`, `Last_name`, `Email`, `Phone_number`, `Address_line1`, `Address_line2`, `City`, `Province`, `Zipcode`, `Is_registered`) VALUES 
(
	'$2a$12$defghiJK78LMNopqrs90TUVWxy1', 
	'Anusha', 
	'Fernando', 
	'anusha.fernando@gmail.com', 
	'0712345124', 
	'No.3, Seventh Street', 
	'Matara Road', 
	'Matara', 
	'Southern', 
	'81000', 
	'1'
);
-- customer 19
INSERT INTO `customer` (`Hashed_password`, `First_name`, `Last_name`, `Email`, `Phone_number`, `Address_line1`, `Address_line2`, `City`, `Province`, `Zipcode`, `Is_registered`) VALUES 
(
	'$2a$12$abCDefGHijKL12MNOpQR34stUV5', 
	'Lakshan', 
	'Jayaweera', 
	'lakshan.jaya@gmail.com', 
	'0712345127', 
	'No.20, Tenth Avenue', 
	'Colombo Road', 
	'Colombo', 
	'Western', 
	'40000', 
	'1'
);
-- customer 20
INSERT INTO `customer` (`Hashed_password`, `First_name`, `Last_name`, `Email`, `Phone_number`, `Address_line1`, `Address_line2`, `City`, `Province`, `Zipcode`, `Is_registered`) VALUES 
(
	'$2a$12$wXyZ7890ABCDEfghij12kl34mn', 
	'Shashika', 
	'Mendis', 
	'shashika.mendis@gmail.com', 
	'0712345128', 
	'No.21, Lake Drive', 
	'Galle Road', 
	'Galle', 
	'Southern', 
	'41000', 
	'0'
);
-- customer 21
INSERT INTO `customer` (`Hashed_password`, `First_name`, `Last_name`, `Email`, `Phone_number`, `Address_line1`, `Address_line2`, `City`, `Province`, `Zipcode`, `Is_registered`) VALUES 
(
	'$2a$12$opQRST56uvWXYzab7890cd12EF3', 
	'Chamara', 
	'Karunaratne', 
	'chamara.karuna@gmail.com', 
	'0712345129', 
	'No.22, Beach Street', 
	'Kalutara Road', 
	'Kalutara', 
	'Western', 
	'42000', 
	'1'
);
-- customer 22
INSERT INTO `customer` (`Hashed_password`, `First_name`, `Last_name`, `Email`, `Phone_number`, `Address_line1`, `Address_line2`, `City`, `Province`, `Zipcode`, `Is_registered`) VALUES 
(
	'$2a$12$lmNO56pqrs7890TUVWXYZab12c3', 
	'Malinda', 
	'Silva', 
	'malinda.silva@gmail.com', 
	'0712345131', 
	'No.33, Hill Top', 
	'Kegalle Road', 
	'Kegalle', 
	'Sabaragamuwa', 
	'44000', 
	'1'
);
-- customer 23
INSERT INTO `customer` (`Hashed_password`, `First_name`, `Last_name`, `Email`, `Phone_number`, `Address_line1`, `Address_line2`, `City`, `Province`, `Zipcode`, `Is_registered`) VALUES 
(
	'$2a$12$uvwxyz234A5BCDEF6GHIJ7KL8MN', 
	'Saman', 
	'Kumara', 
	'saman.kumara@gmail.com', 
	'0712345125', 
	'No.18, Eight Lane', 
	'Badulla Road', 
	'Badulla', 
	'Uva', 
	'82000', 
	'1'
);
-- customer 24
INSERT INTO `customer` (`Hashed_password`, `First_name`, `Last_name`, `Email`, `Phone_number`, `Address_line1`, `Address_line2`, `City`, `Province`, `Zipcode`, `Is_registered`) VALUES 
(
	'$2a$12$opqrstUVWXYZab89cdef01ghijl2', 
	'Chathura', 
	'Rathnayake', 
	'chathura.rathna@gmail.com', 
	'0712345126', 
	'No.19, Ninth Avenue', 
	'Trangalle Road', 
	'Trangalle', 
	'Southern', 
	'83000', 
	'1'
);


-- card details
INSERT INTO `card_detail` (`Customer_id`, `Name_on_card`, `Card_number`, `Expiry_date`) VALUES ('1', 'Lakshitha P', '5391123412341234', '06/25');
INSERT INTO `card_detail` (`Customer_id`, `Name_on_card`, `Card_number`, `Expiry_date`) VALUES ('2', 'Silva R', '5391234523452345', '06/27');
INSERT INTO `card_detail` (`Customer_id`, `Name_on_card`, `Card_number`, `Expiry_date`) VALUES ('4', 'De Silva F B R L ', '5391567856785678', '01/27');
INSERT INTO `card_detail` (`Customer_id`, `Name_on_card`, `Card_number`, `Expiry_date`) VALUES ('5', 'Visitha Galegoda', '5391777888999001', '11/31');
INSERT INTO `card_detail` (`Customer_id`, `Name_on_card`, `Card_number`, `Expiry_date`) VALUES ('6', 'Amara Wijesinghe', '5391666777888999', '03/30');
INSERT INTO `card_detail` (`Customer_id`, `Name_on_card`, `Card_number`, `Expiry_date`) VALUES ('10', 'Kushani P', '5391444555666777', '10/29');
INSERT INTO `card_detail` (`Customer_id`, `Name_on_card`, `Card_number`, `Expiry_date`) VALUES ('11', 'Nimal Rathnayake', '5391333444555666', '05/28');
INSERT INTO `card_detail` (`Customer_id`, `Name_on_card`, `Card_number`, `Expiry_date`) VALUES ('15', 'Dulaj Fernando', '5391111222333444', '06/26');
INSERT INTO `card_detail` (`Customer_id`, `Name_on_card`, `Card_number`, `Expiry_date`) VALUES ('16', 'Chamara S', '5391999999888877', '08/28');
INSERT INTO `card_detail` (`Customer_id`, `Name_on_card`, `Card_number`, `Expiry_date`) VALUES ('18', 'Anusha Fernando', '5391888888777766', '12/29');
INSERT INTO `card_detail` (`Customer_id`, `Name_on_card`, `Card_number`, `Expiry_date`) VALUES ('19', 'Lakshan D W', '5391777777666655', '02/27');
INSERT INTO `card_detail` (`Customer_id`, `Name_on_card`, `Card_number`, `Expiry_date`) VALUES ('21', 'Chamara Karunaratne', '5391666666555544', '04/30');
INSERT INTO `card_detail` (`Customer_id`, `Name_on_card`, `Card_number`, `Expiry_date`) VALUES ('22', 'Malinda Silva', '5391444422333221', '10/28');
INSERT INTO `card_detail` (`Customer_id`, `Name_on_card`, `Card_number`, `Expiry_date`) VALUES ('23', 'Saman J K', '5391333311222111', '09/29');
INSERT INTO `card_detail` (`Customer_id`, `Name_on_card`, `Card_number`, `Expiry_date`) VALUES ('24', 'ChathuraT R', '5391555555444433', '05/26');


-- cart
INSERT INTO `cart` (`Customer_id`) VALUES ('1');
INSERT INTO `cart` (`Customer_id`) VALUES ('2');
INSERT INTO `cart` (`Customer_id`) VALUES ('4');
INSERT INTO `cart` (`Customer_id`) VALUES ('5');
INSERT INTO `cart` (`Customer_id`) VALUES ('6');
INSERT INTO `cart` (`Customer_id`) VALUES ('8');
INSERT INTO `cart` (`Customer_id`) VALUES ('10');
INSERT INTO `cart` (`Customer_id`) VALUES ('11');
INSERT INTO `cart` (`Customer_id`) VALUES ('13');
INSERT INTO `cart` (`Customer_id`) VALUES ('15');
INSERT INTO `cart` (`Customer_id`) VALUES ('16');
INSERT INTO `cart` (`Customer_id`) VALUES ('18');
INSERT INTO `cart` (`Customer_id`) VALUES ('19');
INSERT INTO `cart` (`Customer_id`) VALUES ('21');
INSERT INTO `cart` (`Customer_id`) VALUES ('22');
INSERT INTO `cart` (`Customer_id`) VALUES ('23');
INSERT INTO `cart` (`Customer_id`) VALUES ('24');


-- cart item
INSERT INTO `cart_item` (`Cart_id`, `Item_id`, `Quantity`) VALUES ('1', '1', '2');
INSERT INTO `cart_item` (`Cart_id`, `Item_id`, `Quantity`) VALUES ('1', '9', '1');
INSERT INTO `cart_item` (`Cart_id`, `Item_id`, `Quantity`) VALUES ('1', '3', '4');
INSERT INTO `cart_item` (`Cart_id`, `Item_id`, `Quantity`) VALUES ('1', '7', '5');
INSERT INTO `cart_item` (`Cart_id`, `Item_id`, `Quantity`) VALUES ('1', '53', '7');
INSERT INTO `cart_item` (`Cart_id`, `Item_id`, `Quantity`) VALUES ('1', '233', '5');
INSERT INTO `cart_item` (`Cart_id`, `Item_id`, `Quantity`) VALUES ('2', '28', '3');
INSERT INTO `cart_item` (`Cart_id`, `Item_id`, `Quantity`) VALUES ('2', '4', '1');
INSERT INTO `cart_item` (`Cart_id`, `Item_id`, `Quantity`) VALUES ('2', '6', '1');
INSERT INTO `cart_item` (`Cart_id`, `Item_id`, `Quantity`) VALUES ('2', '33', '3');
INSERT INTO `cart_item` (`Cart_id`, `Item_id`, `Quantity`) VALUES ('2', '49', '2');
INSERT INTO `cart_item` (`Cart_id`, `Item_id`, `Quantity`) VALUES ('2', '8', '9');
INSERT INTO `cart_item` (`Cart_id`, `Item_id`, `Quantity`) VALUES ('2', '147', '3');
INSERT INTO `cart_item` (`Cart_id`, `Item_id`, `Quantity`) VALUES ('2', '149', '3');
INSERT INTO `cart_item` (`Cart_id`, `Item_id`, `Quantity`) VALUES ('2', '17', '7');
INSERT INTO `cart_item` (`Cart_id`, `Item_id`, `Quantity`) VALUES ('3', '14', '1');
INSERT INTO `cart_item` (`Cart_id`, `Item_id`, `Quantity`) VALUES ('3', '42', '6');
INSERT INTO `cart_item` (`Cart_id`, `Item_id`, `Quantity`) VALUES ('3', '5', '8');
INSERT INTO `cart_item` (`Cart_id`, `Item_id`, `Quantity`) VALUES ('3', '70', '3');
INSERT INTO `cart_item` (`Cart_id`, `Item_id`, `Quantity`) VALUES ('4', '143', '4');
INSERT INTO `cart_item` (`Cart_id`, `Item_id`, `Quantity`) VALUES ('4', '77', '3');
INSERT INTO `cart_item` (`Cart_id`, `Item_id`, `Quantity`) VALUES ('5', '17', '1');
INSERT INTO `cart_item` (`Cart_id`, `Item_id`, `Quantity`) VALUES ('5', '98', '2');
INSERT INTO `cart_item` (`Cart_id`, `Item_id`, `Quantity`) VALUES ('5', '159', '6');
INSERT INTO `cart_item` (`Cart_id`, `Item_id`, `Quantity`) VALUES ('5', '22', '1');
INSERT INTO `cart_item` (`Cart_id`, `Item_id`, `Quantity`) VALUES ('5', '25', '2');
INSERT INTO `cart_item` (`Cart_id`, `Item_id`, `Quantity`) VALUES ('5', '2', '1');
INSERT INTO `cart_item` (`Cart_id`, `Item_id`, `Quantity`) VALUES ('5', '38', '7');
INSERT INTO `cart_item` (`Cart_id`, `Item_id`, `Quantity`) VALUES ('8', '46', '2');
INSERT INTO `cart_item` (`Cart_id`, `Item_id`, `Quantity`) VALUES ('8', '8', '9');
INSERT INTO `cart_item` (`Cart_id`, `Item_id`, `Quantity`) VALUES ('10', '24', '4');
INSERT INTO `cart_item` (`Cart_id`, `Item_id`, `Quantity`) VALUES ('10', '41', '3');
INSERT INTO `cart_item` (`Cart_id`, `Item_id`, `Quantity`) VALUES ('10', '19', '7');
INSERT INTO `cart_item` (`Cart_id`, `Item_id`, `Quantity`) VALUES ('6', '40', '5');
INSERT INTO `cart_item` (`Cart_id`, `Item_id`, `Quantity`) VALUES ('6', '21', '1');
INSERT INTO `cart_item` (`Cart_id`, `Item_id`, `Quantity`) VALUES ('7', '31', '6');
INSERT INTO `cart_item` (`Cart_id`, `Item_id`, `Quantity`) VALUES ('7', '29', '2');
INSERT INTO `cart_item` (`Cart_id`, `Item_id`, `Quantity`) VALUES ('7', '34', '9');
INSERT INTO `cart_item` (`Cart_id`, `Item_id`, `Quantity`) VALUES ('8', '111', '7');
INSERT INTO `cart_item` (`Cart_id`, `Item_id`, `Quantity`) VALUES ('8', '64', '5');
INSERT INTO `cart_item` (`Cart_id`, `Item_id`, `Quantity`) VALUES ('8', '33', '2');
INSERT INTO `cart_item` (`Cart_id`, `Item_id`, `Quantity`) VALUES ('9', '44', '3');
INSERT INTO `cart_item` (`Cart_id`, `Item_id`, `Quantity`) VALUES ('9', '18', '10');
INSERT INTO `cart_item` (`Cart_id`, `Item_id`, `Quantity`) VALUES ('10', '62', '3');
INSERT INTO `cart_item` (`Cart_id`, `Item_id`, `Quantity`) VALUES ('10', '149', '5');
INSERT INTO `cart_item` (`Cart_id`, `Item_id`, `Quantity`) VALUES ('11', '23', '4');
INSERT INTO `cart_item` (`Cart_id`, `Item_id`, `Quantity`) VALUES ('11', '96', '6');
INSERT INTO `cart_item` (`Cart_id`, `Item_id`, `Quantity`) VALUES ('11', '223', '4');
INSERT INTO `cart_item` (`Cart_id`, `Item_id`, `Quantity`) VALUES ('13', '115', '8');
INSERT INTO `cart_item` (`Cart_id`, `Item_id`, `Quantity`) VALUES ('13', '178', '7');
INSERT INTO `cart_item` (`Cart_id`, `Item_id`, `Quantity`) VALUES ('13', '195', '1');
INSERT INTO `cart_item` (`Cart_id`, `Item_id`, `Quantity`) VALUES ('13', '72', '6');
INSERT INTO `cart_item` (`Cart_id`, `Item_id`, `Quantity`) VALUES ('13', '95', '1');
INSERT INTO `cart_item` (`Cart_id`, `Item_id`, `Quantity`) VALUES ('14', '128', '7');
INSERT INTO `cart_item` (`Cart_id`, `Item_id`, `Quantity`) VALUES ('15', '241', '2');
INSERT INTO `cart_item` (`Cart_id`, `Item_id`, `Quantity`) VALUES ('15', '134', '9');
INSERT INTO `cart_item` (`Cart_id`, `Item_id`, `Quantity`) VALUES ('15', '47', '9');
INSERT INTO `cart_item` (`Cart_id`, `Item_id`, `Quantity`) VALUES ('16', '45', '5');
INSERT INTO `cart_item` (`Cart_id`, `Item_id`, `Quantity`) VALUES ('16', '201', '3');
INSERT INTO `cart_item` (`Cart_id`, `Item_id`, `Quantity`) VALUES ('17', '87', '2');
INSERT INTO `cart_item` (`Cart_id`, `Item_id`, `Quantity`) VALUES ('17', '64', '4');
INSERT INTO `cart_item` (`Cart_id`, `Item_id`, `Quantity`) VALUES ('17', '150', '3');
INSERT INTO `cart_item` (`Cart_id`, `Item_id`, `Quantity`) VALUES ('17', '92', '1');
INSERT INTO `cart_item` (`Cart_id`, `Item_id`, `Quantity`) VALUES ('17', '29', '6');
INSERT INTO `cart_item` (`Cart_id`, `Item_id`, `Quantity`) VALUES ('17', '212', '8');



-- shop order
INSERT INTO `shop_order` (`Cart_id`, `Date`, `Payment_id`, `Delivery_id`, `Address_line1`, `Address_line2`, `City`, `Province`, `Zipcode`) VALUES ('1', '2023-04-05', '2', '1', 'No.5, First Street', 'Kurunegala Road', 'Kurunegala', 'North Western', '60000');
INSERT INTO `shop_order` (`Cart_id`, `Date`, `Payment_id`, `Delivery_id`, `Address_line1`, `Address_line2`, `City`, `Province`, `Zipcode`) VALUES ('2', '2023-06-21', '1', '1', 'No.10, Second Street', 'Galle Road', 'Galle', 'Southern', '80000');
INSERT INTO `shop_order` (`Cart_id`, `Date`, `Payment_id`, `Delivery_id`) VALUES ('2', '2023-07-01', '2', '2');
INSERT INTO `shop_order` (`Cart_id`, `Date`, `Payment_id`, `Delivery_id`, `Address_line1`, `Address_line2`, `City`, `Province`, `Zipcode`) VALUES ('1', '2023-07-03', '2', '1', 'No.5, First Street', 'Kurunegala Road', 'Kurunegala', 'North Western', '60000');
INSERT INTO `shop_order` (`Cart_id`, `Date`, `Payment_id`, `Delivery_id`, `Address_line1`, `Address_line2`, `City`, `Province`, `Zipcode`) VALUES ('3', '2023-07-22', '2', '1', 'No.15, Third Street', '', 'Colombo', 'Western', '50000');
INSERT INTO `shop_order` (`Cart_id`, `Date`, `Payment_id`, `Delivery_id`) VALUES ('4', '2023-09-11', '2', '2');
INSERT INTO `shop_order` (`Cart_id`, `Date`, `Payment_id`, `Delivery_id`) VALUES ('8', '2023-02-05', '2', '2');
INSERT INTO `shop_order` (`Cart_id`, `Date`, `Payment_id`, `Delivery_id`, `Address_line1`, `Address_line2`, `City`, `Province`, `Zipcode`) VALUES ('5', '2023-06-04', '2', '1', 'No.4, River Drive', 'Panadura Road', 'Panadura', 'Western', '12500');
INSERT INTO `shop_order` (`Cart_id`, `Date`, `Payment_id`, `Delivery_id`, `Address_line1`, `Address_line2`, `City`, `Province`, `Zipcode`) VALUES ('3', '2023-03-05', '2', '1', 'No.15, Maple Street', 'Ella Road', 'Ella', 'Uva', '90100');
INSERT INTO `shop_order` (`Cart_id`, `Date`, `Payment_id`, `Delivery_id`) VALUES ('8', '2023-07-11', '2', '2');
INSERT INTO `shop_order` (`Cart_id`, `Date`, `Payment_id`, `Delivery_id`, `Address_line1`, `Address_line2`, `City`, `Province`, `Zipcode`) VALUES ('8', '2023-02-06', '2', '1', 'No.11, Elm Street', 'Nuwara Eliya Road', 'Nuwara Eliya', 'Central', '22200');
INSERT INTO `shop_order` (`Cart_id`, `Date`, `Payment_id`, `Delivery_id`, `Address_line1`, `Address_line2`, `City`, `Province`, `Zipcode`) VALUES ('6', '2023-05-07', '2', '1', 'No.8, Fifth Lane', 'Peradeniya Road', 'Kandy', 'Central', '20000');
INSERT INTO `shop_order` (`Cart_id`, `Date`, `Payment_id`, `Delivery_id`) VALUES ('10', '2023-05-06', '1', '2');
INSERT INTO `shop_order` (`Cart_id`, `Date`, `Payment_id`, `Delivery_id`, `Address_line1`, `Address_line2`, `City`, `Province`, `Zipcode`) VALUES ('5', '2023-03-08', '2', '1', 'No.4, River Drive', 'Panadura Road', 'Panadura', 'Western', '12500');
INSERT INTO `shop_order` (`Cart_id`, `Date`, `Payment_id`, `Delivery_id`) VALUES ('5', '2023-04-09', '2', '2');
INSERT INTO `shop_order` (`Cart_id`, `Date`, `Payment_id`, `Delivery_id`, `Address_line1`, `Address_line2`, `City`, `Province`, `Zipcode`) VALUES ('3', '2023-05-09', '2', '1', 'No.15, Maple Street', 'Ella Road', 'Ella', 'Uva', '90100');
INSERT INTO `shop_order` (`Cart_id`, `Date`, `Payment_id`, `Delivery_id`, `Address_line1`, `Address_line2`, `City`, `Province`, `Zipcode`) VALUES ('8', '2023-08-10', '2', '1', 'No.11, Elm Street', 'Nuwara Eliya Road', 'Nuwara Eliya', 'Central', '22200');
INSERT INTO `shop_order` (`Cart_id`, `Date`, `Payment_id`, `Delivery_id`) VALUES ('9', '2023-07-10', '1', '2');
INSERT INTO `shop_order` (`Cart_id`, `Date`, `Payment_id`, `Delivery_id`, `Address_line1`, `Address_line2`, `City`, `Province`, `Zipcode`) VALUES ('6', '2023-09-11', '2', '1', 'No.8, Fifth Lane', 'Peradeniya Road', 'Kandy', 'Central', '20000');
INSERT INTO `shop_order` (`Cart_id`, `Date`, `Payment_id`, `Delivery_id`) VALUES ('5', '2023-06-04', '1', '2');
INSERT INTO `shop_order` (`Cart_id`, `Date`, `Payment_id`, `Delivery_id`, `Address_line1`, `Address_line2`, `City`, `Province`, `Zipcode`) VALUES ('8', '2023-05-14', '2', '1', 'No.11, Elm Street', 'Nuwara Eliya Road', 'Nuwara Eliya', 'Central', '22200');
INSERT INTO `shop_order` (`Cart_id`, `Date`, `Payment_id`, `Delivery_id`) VALUES ('1', '2023-03-02', '1', '2');
INSERT INTO `shop_order` (`Cart_id`, `Date`, `Payment_id`, `Delivery_id`, `Address_line1`, `Address_line2`, `City`, `Province`, `Zipcode`) VALUES ('6', '2023-05-15', '2', '1', 'No.8, Fifth Lane', 'Peradeniya Road', 'Kandy', 'Central', '20000');
INSERT INTO `shop_order` (`Cart_id`, `Date`, `Payment_id`, `Delivery_id`) VALUES ('4', '2023-02-03', '2', '2');


-- order item
INSERT INTO `order_item` (`Order_id`, `Item_id`, `Quantity`, `Unit_price`) VALUES ('1', '45', '2', '699.00');
INSERT INTO `order_item` (`Order_id`, `Item_id`, `Quantity`, `Unit_price`) VALUES ('1', '98', '1', '799.00');
INSERT INTO `order_item` (`Order_id`, `Item_id`, `Quantity`, `Unit_price`) VALUES ('1', '1', '2', '699.00');
INSERT INTO `order_item` (`Order_id`, `Item_id`, `Quantity`, `Unit_price`) VALUES ('1', '2', '1', '799.00');
INSERT INTO `order_item` (`Order_id`, `Item_id`, `Quantity`, `Unit_price`) VALUES ('2', '33', '3', '49.95');
INSERT INTO `order_item` (`Order_id`, `Item_id`, `Quantity`, `Unit_price`) VALUES ('2', '21', '3', '43.95');
INSERT INTO `order_item` (`Order_id`, `Item_id`, `Quantity`, `Unit_price`) VALUES ('3', '21', '1', '3749.00');
INSERT INTO `order_item` (`Order_id`, `Item_id`, `Quantity`, `Unit_price`) VALUES ('3', '5', '3', '169.00');
INSERT INTO `order_item` (`Order_id`, `Item_id`, `Quantity`, `Unit_price`) VALUES ('3', '16', '1', '169.00');
INSERT INTO `order_item` (`Order_id`, `Item_id`, `Quantity`, `Unit_price`) VALUES ('3', '71', '1', '2549.00');
INSERT INTO `order_item` (`Order_id`, `Item_id`, `Quantity`, `Unit_price`) VALUES ('3', '12', '2', '149.00');
INSERT INTO `order_item` (`Order_id`, `Item_id`, `Quantity`, `Unit_price`) VALUES ('4', '21', '2', '169.00');
INSERT INTO `order_item` (`Order_id`, `Item_id`, `Quantity`, `Unit_price`) VALUES ('4', '19', '2', '159.00');
INSERT INTO `order_item` (`Order_id`, `Item_id`, `Quantity`, `Unit_price`) VALUES ('5', '18', '2', '2149.00');
INSERT INTO `order_item` (`Order_id`, `Item_id`, `Quantity`, `Unit_price`) VALUES ('5', '200', '2', '1149.00');
INSERT INTO `order_item` (`Order_id`, `Item_id`, `Quantity`, `Unit_price`) VALUES ('5', '44', '1', '89.00');
INSERT INTO `order_item` (`Order_id`, `Item_id`, `Quantity`, `Unit_price`) VALUES ('6', '12', '3', '899.00');
INSERT INTO `order_item` (`Order_id`, `Item_id`, `Quantity`, `Unit_price`) VALUES ('6', '19', '1', '2499.00');
INSERT INTO `order_item` (`Order_id`, `Item_id`, `Quantity`, `Unit_price`) VALUES ('6', '7', '3', '899.00');
INSERT INTO `order_item` (`Order_id`, `Item_id`, `Quantity`, `Unit_price`) VALUES ('6', '112', '1', '2399.00');
INSERT INTO `order_item` (`Order_id`, `Item_id`, `Quantity`, `Unit_price`) VALUES ('7', '52', '2', '499.00');
INSERT INTO `order_item` (`Order_id`, `Item_id`, `Quantity`, `Unit_price`) VALUES ('7', '91', '1', '999.00');
INSERT INTO `order_item` (`Order_id`, `Item_id`, `Quantity`, `Unit_price`) VALUES ('8', '63', '3', '69.95');
INSERT INTO `order_item` (`Order_id`, `Item_id`, `Quantity`, `Unit_price`) VALUES ('9', '56', '1', '2799.00');
INSERT INTO `order_item` (`Order_id`, `Item_id`, `Quantity`, `Unit_price`) VALUES ('9', '24', '2', '199.00');
INSERT INTO `order_item` (`Order_id`, `Item_id`, `Quantity`, `Unit_price`) VALUES ('10', '115', '4', '79.00');
INSERT INTO `order_item` (`Order_id`, `Item_id`, `Quantity`, `Unit_price`) VALUES ('10', '30', '4', '109.00');
INSERT INTO `order_item` (`Order_id`, `Item_id`, `Quantity`, `Unit_price`) VALUES ('11', '15', '2', '949.00');
INSERT INTO `order_item` (`Order_id`, `Item_id`, `Quantity`, `Unit_price`) VALUES ('11', '36', '1', '169.00');
INSERT INTO `order_item` (`Order_id`, `Item_id`, `Quantity`, `Unit_price`) VALUES ('12', '2', '3', '899.00');
INSERT INTO `order_item` (`Order_id`, `Item_id`, `Quantity`, `Unit_price`) VALUES ('12', '90', '1', '2599.00');
INSERT INTO `order_item` (`Order_id`, `Item_id`, `Quantity`, `Unit_price`) VALUES ('13', '85', '1', '169.00');
INSERT INTO `order_item` (`Order_id`, `Item_id`, `Quantity`, `Unit_price`) VALUES ('13', '37', '3', '59.00');
INSERT INTO `order_item` (`Order_id`, `Item_id`, `Quantity`, `Unit_price`) VALUES ('13', '23', '2', '699.00');
INSERT INTO `order_item` (`Order_id`, `Item_id`, `Quantity`, `Unit_price`) VALUES ('14', '18', '1', '399.00');
INSERT INTO `order_item` (`Order_id`, `Item_id`, `Quantity`, `Unit_price`) VALUES ('14', '212', '2', '89.00');
INSERT INTO `order_item` (`Order_id`, `Item_id`, `Quantity`, `Unit_price`) VALUES ('15', '100', '3', '69.95');
INSERT INTO `order_item` (`Order_id`, `Item_id`, `Quantity`, `Unit_price`) VALUES ('16', '77', '1', '2149.00');
INSERT INTO `order_item` (`Order_id`, `Item_id`, `Quantity`, `Unit_price`) VALUES ('16', '11', '2', '249.00');
INSERT INTO `order_item` (`Order_id`, `Item_id`, `Quantity`, `Unit_price`) VALUES ('17', '205', '2', '559.00');
INSERT INTO `order_item` (`Order_id`, `Item_id`, `Quantity`, `Unit_price`) VALUES ('18', '55', '2', '1149.00');
INSERT INTO `order_item` (`Order_id`, `Item_id`, `Quantity`, `Unit_price`) VALUES ('18', '48', '1', '79.00');
INSERT INTO `order_item` (`Order_id`, `Item_id`, `Quantity`, `Unit_price`) VALUES ('19', '6', '3', '899.00');
INSERT INTO `order_item` (`Order_id`, `Item_id`, `Quantity`, `Unit_price`) VALUES ('19', '115', '1', '2399.00');
INSERT INTO `order_item` (`Order_id`, `Item_id`, `Quantity`, `Unit_price`) VALUES ('20', '78', '1', '269.00');
INSERT INTO `order_item` (`Order_id`, `Item_id`, `Quantity`, `Unit_price`) VALUES ('20', '32', '3', '89.00');
INSERT INTO `order_item` (`Order_id`, `Item_id`, `Quantity`, `Unit_price`) VALUES ('20', '210', '2', '699.00');
INSERT INTO `order_item` (`Order_id`, `Item_id`, `Quantity`, `Unit_price`) VALUES ('20', '101', '1', '299.00');
INSERT INTO `order_item` (`Order_id`, `Item_id`, `Quantity`, `Unit_price`) VALUES ('21', '30', '1', '369.00');
INSERT INTO `order_item` (`Order_id`, `Item_id`, `Quantity`, `Unit_price`) VALUES ('21', '219', '2', '109.00');
INSERT INTO `order_item` (`Order_id`, `Item_id`, `Quantity`, `Unit_price`) VALUES ('22', '135', '3', '99.95');
INSERT INTO `order_item` (`Order_id`, `Item_id`, `Quantity`, `Unit_price`) VALUES ('23', '160', '1', '2749.00');
INSERT INTO `order_item` (`Order_id`, `Item_id`, `Quantity`, `Unit_price`) VALUES ('23', '29', '2', '199.00');
INSERT INTO `order_item` (`Order_id`, `Item_id`, `Quantity`, `Unit_price`) VALUES ('24', '240', '2', '359.00');
INSERT INTO `order_item` (`Order_id`, `Item_id`, `Quantity`, `Unit_price`) VALUES ('24', '42', '1', '169.00');
INSERT INTO `order_item` (`Order_id`, `Item_id`, `Quantity`, `Unit_price`) VALUES ('24', '15', '3', '79.00');
INSERT INTO `order_item` (`Order_id`, `Item_id`, `Quantity`, `Unit_price`) VALUES ('24', '239', '2', '699.00');


-- _____________________________________ VIEWS _____________________________________

DROP VIEW IF EXISTS product_sales;

CREATE VIEW product_sales AS
SELECT oi.Order_id, so.Cart_id, i.Product_id, oi.Item_id, oi.Unit_price, oi.Quantity, so.Date
FROM order_item oi
JOIN item i USING (item_id)
JOIN shop_order so USING (Order_id);


-- _____________________________________ OTHER PROCEDURES _____________________________________

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
-- Query: call get_sales_quantity(?, ?); -- replace ? with year and quarter respectively
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

	SELECT p.Title, SUM(ps.Quantity) AS Sales, SUM(ps.Unit_price * ps.Quantity) AS Total_income
	FROM product_sales ps
	JOIN product p USING (Product_id)
	WHERE ps.`Date` BETWEEN `from_date` AND `to_date`
	GROUP BY p.Title;
END&&
DELIMITER ;


-- procedure to get quarterly sales report for a given category, a year and a quarter
-- this can be modified to get the total revenue of a given product by adding SUM() function
-- Query: call get_sales_of_a_category(?, ?, ?); -- replace ? with category id, year and quarter respectively
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

	SELECT p.Title, SUM(ps.Quantity) AS Sales, SUM(ps.Unit_price * ps.Quantity) AS Total_income
	FROM product_sales ps
	JOIN product p USING (Product_id)
    JOIN product_category c USING (product_id)
	WHERE 
		c.Category_id = `Category_id` AND
        ps.`Date` BETWEEN `from_date` AND `to_date`
	GROUP BY p.Title;
END&&
DELIMITER ;


-- procedure to get quarterly sales report for a given product id, a year and a quarter
-- this can be modified to get the total revenue of a given product by adding SUM() function
-- Query: call get_sales_of_a_product(?, ?, ?); -- replace ? with product id, year and quarter respectively
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

	SELECT p.Title, SUM(ps.Quantity) AS Sales, SUM(ps.Unit_price * ps.Quantity) AS Total_income
	FROM product_sales ps
	JOIN product p USING (Product_id)
	WHERE 
		p.Product_id = `Product_id` AND
        ps.`Date` BETWEEN `from_date` AND `to_date`
	GROUP BY p.Title;
END&&
DELIMITER ;


-- procedure to get number of orders placed for a given year and a quarter
-- Query: call get_orders_quantity(?, ?); -- replace ? with year and quarter respectively
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

	SELECT COUNT(*) AS orders_count
    -- INTO `Quantity`
	FROM shop_order so
	WHERE so.`Date` BETWEEN `from_date` AND `to_date`;
END&&
DELIMITER ;


-- procedure to products with most number of sales
-- Query: call get_most_sellings(?, ?, ?); -- replace ? with year, quarter and number of products respectively
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
    
	SELECT p.Title, SUM(ps.Quantity) AS Total_sales
	FROM product_sales ps
	JOIN product p USING (Product_id)
	WHERE ps.Date BETWEEN `from_date` AND `to_date`
	GROUP BY p.Title
    ORDER BY Total_sales DESC
    LIMIT `Limit`;
END&&
DELIMITER ;


-- Procedure to get the order details of a given customer, given the customer id
-- Query: call get_order_report(?); -- replace ? with the customer id
DROP PROCEDURE IF EXISTS `get_order_report`;
DELIMITER &&
CREATE PROCEDURE `get_order_report`
(
	IN `Customer_ID` INT (4)
)
BEGIN
	SELECT DATE(ps.Date) AS Date, p.Title, ps.Quantity, ps.Unit_price
	FROM product_sales ps
	JOIN product p USING(Product_id)
	JOIN cart c USING (Cart_id)
	WHERE c.Customer_id = `Customer_id`
	ORDER BY ps.Date DESC;
END&&
DELIMITER ;

-- Procedure to get the most popular time for a given product
-- Query: call get_most_popular_time_for_product(?); -- replace ? with the product id
DROP PROCEDURE IF EXISTS `get_most_popular_time_for_product`;

DELIMITER //

CREATE PROCEDURE `get_most_popular_time_for_product`(IN given_product_id INT)
BEGIN
    SELECT 
        YEAR(Date) AS OrderYear,
        MONTH(Date) AS OrderMonth,
        SUM(Quantity) AS Total_orders
    FROM product_sales
    WHERE Product_id = given_product_id
    GROUP BY YEAR(Date), MONTH(Date)
    ORDER BY Total_orders DESC
    LIMIT 1;
END //
DELIMITER ;


-- _____________________________________ FUNCTIONS _____________________________________

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


-- Get the additional delivery days according to the quantity of items
DROP FUNCTION IF EXISTS CalculateItemDeliveryDays;

DELIMITER //
CREATE FUNCTION CalculateItemDeliveryDays(p_item_id INT, p_quantity INT) RETURNS INT
READS SQL DATA
BEGIN
    DECLARE additional_delivery_days INT;
    DECLARE is_out_of_stock INT;
    DECLARE item_quantity INT;
    
    -- Get the quantity in stock for the given item
    SELECT Quantity INTO item_quantity
    FROM item
    WHERE Item_id = p_item_id;

    -- Check if the given quantity exceeds the quantity in stock
    IF p_quantity > item_quantity THEN
        -- If the given quantity exceeds the quantity in stock, additional 3 days are added
        SET additional_delivery_days = 3;
    ELSE
        -- else no additional days are added
        SET additional_delivery_days = 0;
    END IF;

    RETURN additional_delivery_days;
END //
DELIMITER ;


-- _____________________________________ TRIGGERS _____________________________________

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


-- _____________________________________ ADDITIONAL UPDATES _____________________________________

ALTER TABLE category 
ADD COLUMN Category_image TEXT NULL AFTER Name;

UPDATE category SET Category_image = 'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/Product_category%2FDolls%20%26%20Accessories.webp?alt=media&token=fc7d5432-4d7e-4116-852f-aa91c32d4100&_gl=1*1kp1yr0*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODY4NjU3OC4yNC4xLjE2OTg2ODk3MTcuNi4wLjA.' WHERE (Category_id = '12');
UPDATE category SET Category_image = 'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/Product_category%2FBoard%20Games.webp?alt=media&token=2a4e4103-3d5c-44bf-8927-7d71aaeaccaf&_gl=1*3r6p5r*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODY4NjU3OC4yNC4xLjE2OTg2ODk2MjIuMjIuMC4w' WHERE (Category_id = '11');
UPDATE category SET Category_image = 'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/Product_category%2FAction%20Figures.webp?alt=media&token=55aac4df-c1ed-44cb-9b48-27bacf8211bb&_gl=1*10rnuse*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODY4NjU3OC4yNC4xLjE2OTg2ODk1NTMuMy4wLjA.' WHERE (Category_id = '10');
UPDATE category SET Category_image = 'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/Product_category%2FComputer%20Accessories.webp?alt=media&token=5a105540-5535-4eef-8a1d-abc2c7a739db&_gl=1*1yidmmc*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODY4NjU3OC4yNC4xLjE2OTg2ODk2OTMuMzAuMC4w' WHERE (Category_id = '9');
UPDATE category SET Category_image = 'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/Product_category%2FHome%20Appliances.webp?alt=media&token=737e9340-d8c7-4219-b8ef-5ad294900bb8&_gl=1*18cne6a*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODY4NjU3OC4yNC4xLjE2OTg2ODk3MzIuNjAuMC4w' WHERE (Category_id = '8');
UPDATE category SET Category_image = 'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/Product_category%2FWearable%20Technology.webp?alt=media&token=8dfb9da9-3883-458f-87f9-3065fba30262&_gl=1*p78wjl*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODY4NjU3OC4yNC4xLjE2OTg2ODk3OTguNjAuMC4w' WHERE (Category_id = '7');
UPDATE category SET Category_image = 'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/Product_category%2FAudio%20%26%20Headphones.webp?alt=media&token=38a891e7-34ee-48cd-88c9-d63606326b72&_gl=1*me8ebc*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODY4NjU3OC4yNC4xLjE2OTg2ODk1OTIuNTIuMC4w' WHERE (Category_id = '5');
UPDATE category SET Category_image = 'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/Product_category%2FCameras%20%26%20Photography.webp?alt=media&token=4d35a515-a1c8-40e3-9cef-028a15b924c5&_gl=1*1wivnh8*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODY4NjU3OC4yNC4xLjE2OTg2ODk2NjMuNjAuMC4w' WHERE (Category_id = '6');
UPDATE category SET Category_image = 'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/Product_category%2FLaptops.webp?alt=media&token=4de76686-589b-465e-b43b-94e0bbbe08ce&_gl=1*1ixa5dj*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODY4NjU3OC4yNC4xLjE2OTg2ODk3NDYuNDYuMC4w' WHERE (Category_id = '4');
UPDATE category SET Category_image = 'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/Product_category%2FSmartphones.webp?alt=media&token=9bc8fcb2-57fe-4813-99b2-84b3c4dae71d&_gl=1*102ge83*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODY4NjU3OC4yNC4xLjE2OTg2ODk3NjQuMjguMC4w' WHERE (Category_id = '3');
UPDATE category SET Category_image = 'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/Product_category%2Felectronics.webp?alt=media&token=f9337cbe-e4c6-4106-b837-e807db690c27&_gl=1*1cnjt5j*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODY4NjU3OC4yNC4xLjE2OTg2ODk4MjAuMzguMC4w' WHERE (Category_id = '1');
UPDATE category SET Category_image = 'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/Product_category%2FToys.webp?alt=media&token=b6db8c21-5961-480c-9681-4da9fdb6707a&_gl=1*42s31i*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODY4NjU3OC4yNC4xLjE2OTg2ODk3NzkuMTMuMC4w' WHERE (Category_id = '2');
-- _____________________________________ ADDITIONAL TABLES _____________________________________

  -- Table `cities`
DROP TABLE IF EXISTS `cities` ;
 
CREATE TABLE IF NOT EXISTS `cities` (
  `City` VARCHAR(50) NOT NULL,
  `Province` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`City`),
  `Is_main` TINYINT NOT NULL);
  

INSERT INTO `cities` (`City`, `Province`, `Is_main`) VALUES
('Colombo', 'Western', 1),
('Jaffna', 'Northern', 1),
('Kandy', 'Central', 1),
('Galle', 'Southern', 1),
('Anuradhapura', 'North Central', 1),
('Mannar', 'Northern', 0),
('Chavakachcheri', 'Northern', 0),
('Vavuniya', 'Northern', 0),
('Sri Jayewardenepura Kotte', 'Western', 1),
('Dehiwela-Mount Lavinia', 'Western', 1),
('Nuwara Eliya', 'Central', 0),
('Polonnaruwa', 'North Central', 0),
('Point Pedro', 'Northern', 0),
('Valvettithurai', 'Northern', 0),
('Kurunegala', 'North Western', 1),
('Ratnapura', 'Sabaragamuwa', 1),
('Badulla', 'Uva', 1),
('Bandarawela', 'Uva', 0),
('Happutalle', 'Uva', 0),
('Trincomalee', 'Eastern', 1),
('Kinniya', 'Eastern', 0),
('Batticaloa', 'Eastern', 1),
('Eravur', 'Eastern', 0),
('Kattankudy', 'Eastern', 0),
('Ampara', 'Eastern', 1),
('Kalmunai', 'Eastern', 0),
('Akkaraipattu', 'Eastern', 0),
('Embilipitiya', 'Sabaragamuwa', 0),
('Kegalle', 'Sabaragamuwa', 1),
('Balangoda', 'Sabaragamuwa', 0),
('Matale', 'Central', 1),
('Dambulla', 'Central', 0),
('Kalutata', 'Kalutara', 0),
('Matara', 'Southern', 1),
('Hambantota', 'Southern', 1),
('Chilaw', 'North Western', 1),
('Kuliyapitiya', 'North Western', 0),
('Gampaha', 'Western', 1),
('Negombo', 'Western', 0),
('Homagama', 'Western', 0);
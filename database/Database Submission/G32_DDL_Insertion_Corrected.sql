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
  UNIQUE (`Name`),
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
  ON UPDATE CASCADE);


-- Table `cart`
DROP TABLE IF EXISTS `cart` ;

CREATE TABLE IF NOT EXISTS `cart` (
  `Cart_id` INT NOT NULL AUTO_INCREMENT,
  `Customer_id` INT NOT NULL,
  PRIMARY KEY (`Cart_id`),
  FOREIGN KEY (`Customer_id`)
  REFERENCES `customer` (`Customer_id`)
  ON UPDATE CASCADE);
 

-- Table `product`
DROP TABLE IF EXISTS `product` ;

CREATE TABLE IF NOT EXISTS `product` (
  `Product_id` INT NOT NULL AUTO_INCREMENT,
  `Title` VARCHAR(255) NOT NULL,
  `SKU` VARCHAR(50) NOT NULL,
  `Weight` DECIMAL(6,3) NOT NULL,
  `Description` TEXT NULL DEFAULT NULL,
  `Image` VARCHAR(255) NOT NULL,
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
  `Image` VARCHAR(255) NULL DEFAULT NULL,
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
  ON UPDATE CASCADE,
  FOREIGN KEY (`Item_id`)
  REFERENCES `item` (`Item_id`)
  ON UPDATE CASCADE);
 

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
  `Cart_id` INT NOT NULL,
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

-- ____________________________________ PROCEDURES ___________________________________________________

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


DROP procedure IF EXISTS `add_product`;

DELIMITER $$
USE `group32_v1.0`$$
CREATE PROCEDURE `add_product`(
    IN product_title VARCHAR(255),
    IN category_list VARCHAR(255),
    IN product_description TEXT,
    IN product_weight DECIMAL(6,3),
    IN product_SKU VARCHAR(50),
    IN product_image VARCHAR(255)
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
            IF (SELECT `Parent_Category_id` FROM `Category` WHERE `Name` = category_name) IS NOT NULL THEN
				INSERT INTO product_category (`Product_id`, `Category_id`)
				VALUES (product_id, (SELECT `Category_id` FROM `category` WHERE `Name` = category_name));
			END IF;
		END WHILE;
    END;
    COMMIT;
END$$

DELIMITER ;

DROP PROCEDURE IF EXISTS add_item;

DELIMITER  //

CREATE PROCEDURE add_item(
	SKU VARCHAR(50), -- Product SKU to get the product id
    Price DECIMAL(9,2), 
    Quantity INT,
    Image VARCHAR(255), -- image path
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




-- _____________________________________ Insertion _____________________________________

USE `group32_v1.0`;


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


-- add product
-- product_id = 1
call add_product(
	'iPhone 14', 
    'Electronics, Smartphones', 
    'iPhone 14: The iPhone 14 is the epitome of Apple\'s commitment to innovation and excellence in the world of smartphones. With its sleek design and powerful performance, it''s a true game-changer. The Super Retina XDR display delivers stunning visuals, while the A16 chip ensures lightning-fast speed and efficiency. The camera system is a marvel, capturing breathtaking photos and videos. With 5G connectivity and an array of exciting features, the iPhone 14 is the ultimate device for those who demand the best.', 
    0.22, 
    'IP14', 
    'https://drive.google.com/file/d/1JvgLUWiq-0dHII3lRW44S6Q4Aug0qnuE/view?usp=sharing');

-- product_id = 2
call add_product(
	'Samsung Galaxy S22', 
    'Electronics, Smartphones', 
    'Samsung Galaxy S22: The Samsung Galaxy S22 is a flagship Android smartphone that redefines mobile technology. Its stunning Dynamic AMOLED display provides vibrant colors and crisp clarity. Powered by the Exynos 990 processor, it handles tasks with ease. The camera system is a photography enthusiast\'s dream, offering versatility and stunning results. With a sleek design and an array of features, the Galaxy S25 is a symbol of Samsung\'s commitment to excellence.', 
    0.24, 
    'SGS22', 
    'https://drive.google.com/file/d/1nRxreqjfaBKqC4yW2GhJcP3QfR7DBJNg/view?usp=sharing');

-- product_id = 3
call add_product(
	'Dell XPS 15', 
    'Electronics, Laptops', 
    'Dell XPS 15: The Dell XPS 15 is a cutting-edge laptop that combines powerful performance with premium design. It features a stunning InfinityEdge display for vivid visuals, high-performance components for seamless multitasking, and an elegant aluminum chassis. Whether you\'re a professional or creative enthusiast, the XPS 15 is the ideal computing companion, offering style and excellence in modern technology.', 
    1.81, 
    'DXPS15', 
    'https://drive.google.com/file/d/1XQ597X9Ur0K-UClDLR78i5jXuT8ngzQf/view?usp=sharing');

-- product_id = 4    
call add_product(
	'Sony WH-1000XM5', 
    'Electronics, Audio & Headphones', 
    'Sony WH-1000XM5: The Sony WH-1000XM5 headphones are a triumph of audio engineering and noise-canceling technology. Immerse yourself in your favorite music with industry-leading sound quality. The noise-canceling capabilities transport you to a world of pure sound, free from distractions. Comfortable and stylish, these headphones are the ultimate choice for audiophiles and travelers.', 
    0.25, 
    'SWH5', 
    'https://drive.google.com/file/d/1NhIAxxqvgixIfHJfC2hIaK03_0F97BzR/view?usp=sharing');

-- product_id = 5   
call add_product(
	'Batman Action Figure', 
    'Toys, Action Figures', 
    'The Batman action figure is a collector\'s dream. With meticulous craftsmanship and intricate detailing, it captures the essence of Gotham\'s Dark Knight. Pose it in dynamic stances and let your imagination run wild with epic battles in the world of DC Comics.', 
    0.15, 
    'BAF', 
    'https://drive.google.com/file/d/1waw9Mt7n3jCKSbPARFX3u0eNIhy_Vi-p/view?usp=sharing');

-- product_id = 6
call add_product(
	'Bose QC45', 
    'Electronics, Audio & Headphones', 
    'Bose QC45: The Bose QC45 headphones redefine your audio experience. With world-class noise cancellation, you can enjoy your music with newfound clarity. The balanced sound profile ensures every note is crisp and clear. Lightweight and comfortable, these headphones are perfect for long journeys or peaceful moments of reflection.', 
    0.23, 
    'BQC45', 
    'https://drive.google.com/file/d/1I8_Y-GB2BDFS5I7l5Z4zCl9Rj9zf0cHE/view?usp=sharing');

-- product_id = 7
call add_product(
	'Google Pixel 8 pro', 
    'Electronics, Smartphones', 
    'Google Pixel 8 Pro: 24+ hour battery charges faster than ever. Powerful performance with 12 GB RAM. Pixel helps keep you and your info safe. 7 years of security updates and new Feature Drops. The updated Pixel 8 Pro camera system makes selfies sharper, close-ups closer, and photos and videos more stunning than ever.', 
    0.18, 
    'GP8P', 
    'https://drive.google.com/file/d/1q7QPcBpwEnlXYzzN9CJmmQy963XXg_u4/view?usp=sharing');

-- product_id = 8
call add_product(
	'OnePlus 11', 
    'Electronics, Smartphones', 
    'OnePlus 11: 50 MP (wide) + 32 MP (telephoto) + 48 MP (ultrawide) while on the front, there is a 16 MP (wide) sensor. The display size is 6.7 inches LTPO2 AMOLED. The resolution of the screen is 1440 x 3216 pixels.', 
    0.20, 
    '1P11', 
    'https://drive.google.com/file/d/1cUS-l9J8tb4KFdrDtyS1LEr8QTT3RpvJ/view?usp=sharing');

-- product_id = 9
call add_product(
	'Asus ZenBook Pro', 
    'Electronics, Laptops', 
    'Asus ZenBook Pro: The Asus ZenBook Pro is a masterpiece of modern laptop design. With its stunning 4K OLED touchscreen display, it offers vivid visuals and precise touch control. Inside, the laptop is powered by high-performance processors, making it a powerhouse for creative professionals. The sleek aluminum body and compact form factor make it a stylish and portable companion. Whether you\'re a designer, video editor, or simply someone who appreciates top-tier technology, the ZenBook Pro is a testament to Asus\'s commitment to innovation.', 
    1.75, 
    'AZBP', 
    'https://drive.google.com/file/d/1Dw2q9ZkL0k0o8aitG5eZ0WMlDixw2sAW/view?usp=sharing');

-- product_id = 10
call add_product(
	'MacBook Air M2', 
    'Electronics, Laptops', 
    'MacBook Air M2: The MacBook Air M2 is Apple\'s answer to the need for a lightweight, ultra-portable laptop without compromising on performance. Powered by the M2 chip, it provides snappy responsiveness and excellent energy efficiency. The Retina display offers vibrant visuals, and the compact form factor makes it ideal for on-the-go professionals and students. With a sleek aluminum chassis, all-day battery life, and the signature MacBook keyboard and trackpad, the MacBook Air M2 is a modern classic for those who value mobility and style.', 
    1.25, 
    'MBA2', 
    'https://drive.google.com/file/d/1Oi8NKX7JkyKD5eNt0yjhwyvlrgzNVMjw/view?usp=sharing');

-- product_id = 11
call add_product(
	'Beats Studio Buds Plus', 
    'Electronics, Audio & Headphones', 
    'Beats Studio Buds Plus: The Beats Studio Buds Plus are the perfect audio companion for music lovers and active individuals. With their dynamic sound quality, these true wireless earbuds deliver immersive audio experiences. They\'re designed for comfort and durability, ensuring they stay in place during workouts and daily activities. The active noise cancellation feature lets you enjoy your music in peace, and the long battery life keeps the tunes flowing all day long. Connect seamlessly to your device and elevate your audio experience with these stylish earbuds.', 
    0.05, 
    'BSBP', 
    'https://drive.google.com/file/d/1BK9sXKBWyUg3c3RgKjsxueHi4G2B7jWV/view?usp=sharing');

-- product_id = 12
call add_product(
	'Jabra Elite 85t', 
    'Electronics, Audio & Headphones', 
    'Jabra Elite 85t: The Jabra Elite 85t true wireless earbuds redefine what\'s possible in terms of audio quality and noise cancellation. These earbuds offer crystal-clear sound and advanced noise-canceling technology, allowing you to immerse yourself in your music or make clear calls, even in noisy environments. With a comfortable fit and long battery life, they are perfect for extended listening sessions or all-day productivity. Stay connected and enjoy an audio experience like never before with the Jabra Elite 85t.', 
    0.06, 
    'JE85', 
    'https://drive.google.com/file/d/1PRND2SeP1DTBlOIu9-29jwB3zCtym-p4/view?usp=sharing');

-- product_id = 13
call add_product(
	'Ironman Action Figure', 
    'Toys, Action Figures', 
    'Ironman Action Figure: The Ironman action figure is a tribute to the genius, billionaire, playboy, philanthropist, Tony Stark. With exquisite detailing and a range of articulation points, it brings Ironman\'s armored suit to life. Whether you\'re a Marvel fan or simply appreciate fine craftsmanship, this action figure allows you to display one of Earth\'s mightiest heroes with pride.', 
    0.15, 
    'IAF', 
    'https://drive.google.com/file/d/1y9vJDVoOncF89tCZNAgNkFWX2HzVTGH_/view?usp=sharing');

-- product_id = 14
call add_product(
	'Lego Star Wars Kit', 
    'Toys, Board Games', 
    'Lego Star Wars Kit: The Lego Star Wars Kit is an adventure in creativity and imagination. With a vast collection of Lego bricks and minifigures inspired by the iconic Star Wars universe, it offers endless possibilities for building your favorite spacecraft, characters, and scenes. Whether you\'re a Star Wars enthusiast or a Lego aficionado, this kit provides hours of entertainment and storytelling. Join the Rebel Alliance or embrace the dark side with this epic Lego set.', 
    0.9, 
    'LSWK', 
    'https://drive.google.com/file/d/1JS_aazbIBVPtReUJMWCBiIcTStSwtAeM/view?usp=sharing');

-- product_id = 15
call add_product(
	'Canon EOS 7D', 
    'Electronics, Cameras & Photography', 
    'Canon EOS 7D: The Canon EOS 7D is a professional DSLR camera designed for photographers who demand precision and speed. With its fast autofocus system and high-resolution sensor, it captures stunning images with exceptional clarity. Whether you\'re capturing fast-action sports or intricate landscapes, the EOS 7D excels in every scenario. Its robust build and advanced features make it a versatile tool for photographers who push the boundaries of creativity.', 
    0.8, 
    'CE7D', 
    'https://drive.google.com/file/d/1Sl4CSaoJc-rTPjR5-ayy7YSsrAzg1LQ1/view?usp=sharing');

-- product_id = 16
call add_product(
	'Apple Watch Series 8', 
    'Electronics, Wearable Technology', 
    'Apple Watch Series 8: The Apple Watch Series 8 represents the pinnacle of smartwatch technology. With its elegant design and advanced health and fitness tracking features, it\'s more than just a watch—it\'s your personal wellness companion. The Series 8 offers precise tracking of your heart rate, sleep, activity, and more, helping you stay on top of your health and fitness goals. With an always-on display and seamless integration with your iPhone, it\'s the ultimate accessory for a connected and active lifestyle. Experience the future of wearables with the Apple Watch Series 8.', 
    0.07, 
    'AWS8', 
    'https://drive.google.com/file/d/1e7eMwnu59yojB9n4uO2cWI8gk3nTqImv/view?usp=sharing');

-- product_id = 17
call add_product(
	'Logitech G Pro Mouse', 
    'Electronics, Computer Accessories', 
    'Logitech G Pro Mouse: The Logitech G Pro Mouse is a gaming mouse that sets the standard for precision and performance. Designed with input from esports professionals, it offers lightning-fast response and customizable features. The Hero sensor provides flawless tracking, while the lightweight design ensures comfort during long gaming sessions. With programmable buttons and customizable RGB lighting, it\'s tailored to your gaming preferences. Dominate the competition with the Logitech G Pro Mouse.', 
    0.17, 
    'LGPM', 
    'https://drive.google.com/file/d/1e7eMwnu59yojB9n4uO2cWI8gk3nTqImv/view?usp=sharing');

-- product_id = 18
call add_product(
	'Corsair K70 Keyboard', 
    'Electronics, Computer Accessories', 
    'Corsair K70 Keyboard: The Corsair K70 Keyboard is a mechanical gaming keyboard that stands at the forefront of gaming peripherals. With its tactile and responsive Cherry MX switches, it provides a satisfying typing and gaming experience. The customizable RGB backlighting lets you create stunning lighting effects, and the durable aluminum frame ensures long-lasting performance. Whether you\'re a competitive gamer or a casual typist, the Corsair K70 delivers the precision and style you need.', 
    0.9, 
    'CK70', 
    'https://drive.google.com/file/d/1dxfraytmfbvzF3V4nqyfUlGUvkJWCzfp/view?usp=sharing');

-- product_id = 19
call add_product(
	'Barbie Dreamhouse', 
    'Toys, Dolls & Accessories', 
    'Barbie Dreamhouse: The Barbie Dreamhouse is a dream come true for young and young-at-heart Barbie enthusiasts. This fully furnished, interactive playset features multiple rooms, including a kitchen, living room, bedroom, and more. It\'s equipped with interactive accessories, such as a working elevator and a swimming pool with a slide. The Dreamhouse allows for endless imaginative play and storytelling, letting kids create their own Barbie adventures in style and comfort.', 
    2.51, 
    'BDH', 
    'https://drive.google.com/file/d/1V694CCZJ17djg1TyBnGuXu24Ed8mhccz/view?usp=sharing');

-- product_id = 20
call add_product(
	'Transformers Optimus Prime', 
    'Toys, Action Figures', 
    'Transformers Optimus Prime: The Transformers Optimus Prime figure brings the iconic Autobot leader to life. It seamlessly transforms from a powerful robot into a formidable truck, offering hours of exciting play for Transformers fans of all ages. With intricate details and articulation, Optimus Prime is ready to roll out and defend the universe against the Decepticons. This collectible figure is a must-have for fans of the legendary Transformers franchise.', 
    0.55, 
    'TOP', 
    'https://drive.google.com/file/d/1-vs1eWSl92fEdZnza4DbOh-_hZwh7-FM/view?usp=sharing');

-- product_id = 21
call add_product(
	'Dell Inspiron 14', 
    'Electronics, Laptops', 
    'Dell Inspiron 14: The Dell Inspiron 14 is a versatile laptop designed to meet your everyday computing needs. With its sleek design and reliable performance, it\'s ideal for work, school, or entertainment. The crisp display offers clear visuals, and the responsive keyboard ensures comfortable typing. Powered by efficient processors, it handles tasks with ease. The Inspiron 14 is a dependable and affordable choice for those seeking a balance of performance and portability.', 
    1.55, 
    'DI14', 
    'https://drive.google.com/file/d/1_VSf8P1t6BrQZ60fGzBXb_I24i-OSDBp/view?usp=sharing');

-- product_id = 22
call add_product(
	'Apple AirPods Pro', 
    'Electronics, Audio & Headphones', 
    'Apple AirPods Pro: The Apple AirPods Pro redefine the wireless earbud experience. With active noise cancellation, they immerse you in pure, high-fidelity sound. The customizable fit ensures comfort and stability, making them perfect for workouts, commutes, or long flights. The H1 chip enables seamless pairing with your Apple devices, and the intuitive controls allow you to adjust settings with a touch. Whether you\'re listening to music, taking calls, or enjoying podcasts, the AirPods Pro deliver an exceptional audio experience.', 
    0.08, 
    'AAP3', 
    'https://drive.google.com/file/d/17PlnAfqa1vRMuMIbUZzhHGLiDEYgprTZ/view?usp=sharing');
    
-- ---------------------------------------------------------------------

-- add items

-- iphone 14 blue 128
call add_item
(
	'IP14', -- SKU
    699, -- Price
    4, -- Quantity
    'https://drive.google.com/file/d/1s-Bss3cELewiLy5gBL11UmmlhmpQjM2m/view?usp=sharing', -- Image
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
    'https://drive.google.com/file/d/1s-Bss3cELewiLy5gBL11UmmlhmpQjM2m/view?usp=sharing', -- Image
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
    'https://drive.google.com/file/d/1s-Bss3cELewiLy5gBL11UmmlhmpQjM2m/view?usp=sharing', -- Image
    2, -- No. of variants
    'Color, Storage', -- Variants comma separated
    'Blue, 512GB' -- Attribute comma separated
);

-- iphone 14 purple 128
call add_item
(
	'IP14', -- SKU
    699, -- Price
    4, -- Quantity
    'https://drive.google.com/file/d/1A0jVvnDJxNaKBFlw6ALDN7wpun_GEVIs/view?usp=sharing', -- Image
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
    'https://drive.google.com/file/d/1A0jVvnDJxNaKBFlw6ALDN7wpun_GEVIs/view?usp=sharing', -- Image
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
    'https://drive.google.com/file/d/1hEavQtDZKdcEvS1vNqTM4dbjtQ1me3-L/view?usp=sharing', -- Image
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
    'https://drive.google.com/file/d/1Bl_3p1Bilk9FKhClrrNX1tH2rT0NwJyS/view?usp=sharing', -- Image
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
    'https://drive.google.com/file/d/1Bl_3p1Bilk9FKhClrrNX1tH2rT0NwJyS/view?usp=sharing', -- Image
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
    'https://drive.google.com/file/d/1D8AKqgazSQ5fZMfIiBCn01UynkdfWv5-/view?usp=sharing', -- Image
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
    'https://drive.google.com/file/d/1D8AKqgazSQ5fZMfIiBCn01UynkdfWv5-/view?usp=sharing', -- Image
    2, -- No. of variants
    'Color, Storage', -- Variants comma separated
    'White, 256GB' -- Attribute comma separated
);

-- Samsung Galaxy S22 black 128
call add_item
(
	'SGS22', -- SKU
    799, -- Price
    4, -- Quantity
    'https://drive.google.com/file/d/1D8AKqgazSQ5fZMfIiBCn01UynkdfWv5-/view?usp=sharing', -- Image
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
    'https://drive.google.com/file/d/1D8AKqgazSQ5fZMfIiBCn01UynkdfWv5-/view?usp=sharing', -- Image
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
    'https://drive.google.com/file/d/1L4Ygd14nvJDc148TPLG3AVYlSCHkRT1e/view?usp=sharing', -- Image
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
    'https://drive.google.com/file/d/11Dgqae1vsMExPUQeKx_h__GWdrWmuDsZ/view?usp=sharing', -- Image
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
    'https://drive.google.com/file/d/11Dgqae1vsMExPUQeKx_h__GWdrWmuDsZ/view?usp=sharing', -- Image
    6, -- No. of variants
    'Processor, Operating System, GPU, RAM, Storage, Display', -- Variants comma separated
    '13th Gen Intel Core i7, Windows 11 Pro, Intel Arc A370M Graphics-4GB, DDR5-16GB, 512GB, FHD+' -- Attribute comma separated
);

-- Dell XPS 15 variant 3
call add_item
(
	'DXPS15', -- SKU
    1649, -- Price
    4, -- Quantity
    'https://drive.google.com/file/d/11Dgqae1vsMExPUQeKx_h__GWdrWmuDsZ/view?usp=sharing', -- Image
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
    'https://drive.google.com/file/d/11Dgqae1vsMExPUQeKx_h__GWdrWmuDsZ/view?usp=sharing', -- Image
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
    'https://drive.google.com/file/d/11Dgqae1vsMExPUQeKx_h__GWdrWmuDsZ/view?usp=sharing', -- Image
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
    'https://drive.google.com/file/d/11Dgqae1vsMExPUQeKx_h__GWdrWmuDsZ/view?usp=sharing', -- Image
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
    'https://drive.google.com/file/d/11Dgqae1vsMExPUQeKx_h__GWdrWmuDsZ/view?usp=sharing', -- Image
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
    'https://drive.google.com/file/d/11Dgqae1vsMExPUQeKx_h__GWdrWmuDsZ/view?usp=sharing', -- Image
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
    'https://drive.google.com/file/d/15a4U3DQVUTKoLCAR_MVhereOV-4Q3GR3/view?usp=sharing', -- Image
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
    'https://drive.google.com/file/d/1GzBs9-a0uclM1J75XTzB6-st9tvxakKO/view?usp=sharing', -- Image
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
    'https://drive.google.com/file/d/1lgTSKmDQm9vQCDD3hXXsgKZRQ4SaEeOq/view?usp=sharing', -- Image
    1, -- No. of variants
    'Color', -- Variants comma separated
    'White' -- Attribute comma separated
);

-- Batman Action Figure small
call add_item
(
	'BAF', -- SKU
    84, -- Price
    4, -- Quantity
    'https://drive.google.com/file/d/1Wv56-fXkEpGmiG0hFghGEaIQFCoA9Yat/view?usp=sharing', -- Image
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
    'https://drive.google.com/file/d/1EQRnohJgE2qW5Tk3HEOBSIdu-PQnyfUd/view?usp=sharing', -- Image
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
    'https://drive.google.com/file/d/1EQRnohJgE2qW5Tk3HEOBSIdu-PQnyfUd/view?usp=sharing', -- Image
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
    'https://drive.google.com/file/d/1-fYZtfIjppA7i4bQubxscb9lepW8YVI3/view?usp=sharing', -- Image
    1, -- No. of variants
    'Color', -- Variants comma separated
    'Black' -- Attribute comma separated
);

-- Bose QC45 White
call add_item
(
	'BQC45', -- SKU
    329, -- Price
    4, -- Quantity
    'https://drive.google.com/file/d/1YfoblBwglXh3SaEPLikPQCTiD6kYUxKL/view?usp=sharing', -- Image
    1, -- No. of variants
    'Color', -- Variants comma separated
    'White' -- Attribute comma separated
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
INSERT INTO `cart_item` (`Cart_id`, `Item_id`, `Quantity`) VALUES ('2', '28', '3');
INSERT INTO `cart_item` (`Cart_id`, `Item_id`, `Quantity`) VALUES ('2', '4', '1');
INSERT INTO `cart_item` (`Cart_id`, `Item_id`, `Quantity`) VALUES ('2', '6', '1');
INSERT INTO `cart_item` (`Cart_id`, `Item_id`, `Quantity`) VALUES ('3', '15', '4');
INSERT INTO `cart_item` (`Cart_id`, `Item_id`, `Quantity`) VALUES ('3', '23', '2');
INSERT INTO `cart_item` (`Cart_id`, `Item_id`, `Quantity`) VALUES ('4', '14', '1');
INSERT INTO `cart_item` (`Cart_id`, `Item_id`, `Quantity`) VALUES ('5', '17', '1');
INSERT INTO `cart_item` (`Cart_id`, `Item_id`, `Quantity`) VALUES ('5', '22', '1');
INSERT INTO `cart_item` (`Cart_id`, `Item_id`, `Quantity`) VALUES ('5', '25', '2');
INSERT INTO `cart_item` (`Cart_id`, `Item_id`, `Quantity`) VALUES ('5', '2', '1');

-- shop order
INSERT INTO `shop_order` (`Cart_id`, `Date`, `Payment_id`, `Delivery_id`, `Address_line1`, `Address_line2`, `City`, `Province`, `Zipcode`) VALUES ('1', '2023-04-05', '2', '1', 'No.5, First Street', 'Kurunegala Road', 'Kurunegala', 'North Western', '60000');
INSERT INTO `shop_order` (`Cart_id`, `Date`, `Payment_id`, `Delivery_id`, `Address_line1`, `Address_line2`, `City`, `Province`, `Zipcode`) VALUES ('2', '2023-06-21', '1', '1', 'No.10, Second Street', 'Galle Road', 'Galle', 'Southern', '80000');
INSERT INTO `shop_order` (`Cart_id`, `Date`, `Payment_id`, `Delivery_id`) VALUES ('2', '2023-07-01', '2', '2');
INSERT INTO `shop_order` (`Cart_id`, `Date`, `Payment_id`, `Delivery_id`, `Address_line1`, `Address_line2`, `City`, `Province`, `Zipcode`) VALUES ('1', '2023-07-03', '2', '1', 'No.5, First Street', 'Kurunegala Road', 'Kurunegala', 'North Western', '60000');
INSERT INTO `shop_order` (`Cart_id`, `Date`, `Payment_id`, `Delivery_id`, `Address_line1`, `Address_line2`, `City`, `Province`, `Zipcode`) VALUES ('3', '2023-07-22', '2', '1', 'No.15, Third Street', '', 'Colombo', 'Western', '50000');
INSERT INTO `shop_order` (`Cart_id`, `Date`, `Payment_id`, `Delivery_id`) VALUES ('4', '2023-08-11', '2', '2');

-- order item
INSERT INTO `order_item` (`Order_id`, `Item_id`, `Quantity`, `Unit_price`) VALUES ('1', '1', '2', '699.00');
INSERT INTO `order_item` (`Order_id`, `Item_id`, `Quantity`, `Unit_price`) VALUES ('1', '2', '1', '799.00');
INSERT INTO `order_item` (`Order_id`, `Item_id`, `Quantity`, `Unit_price`) VALUES ('2', '21', '3', '43.95');
INSERT INTO `order_item` (`Order_id`, `Item_id`, `Quantity`, `Unit_price`) VALUES ('3', '21', '1', '3749.00');
INSERT INTO `order_item` (`Order_id`, `Item_id`, `Quantity`, `Unit_price`) VALUES ('3', '5', '3', '169.00');
INSERT INTO `order_item` (`Order_id`, `Item_id`, `Quantity`, `Unit_price`) VALUES ('3', '16', '1', '169.00');
INSERT INTO `order_item` (`Order_id`, `Item_id`, `Quantity`, `Unit_price`) VALUES ('4', '21', '2', '169.00');
INSERT INTO `order_item` (`Order_id`, `Item_id`, `Quantity`, `Unit_price`) VALUES ('5', '18', '2', '2149.00');
INSERT INTO `order_item` (`Order_id`, `Item_id`, `Quantity`, `Unit_price`) VALUES ('6', '12', '3', '899.00');
INSERT INTO `order_item` (`Order_id`, `Item_id`, `Quantity`, `Unit_price`) VALUES ('6', '19', '1', '2499.00');


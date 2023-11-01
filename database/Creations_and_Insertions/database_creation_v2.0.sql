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

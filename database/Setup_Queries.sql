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
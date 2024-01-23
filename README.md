<h1 align = "center"> Single Vendor E-Commerce Platform - C </h1>

![alt text](https://github.com/irudachirath/E-commerce_platform_doc/blob/main/cover_page.png?raw=true)

In this Project We implement a database design for a single vendor e-commerce platform for the company "C", a local chain retailer in Texas. We develop a simple UI to demonstrate All functionalities of database. Following features are implemented in this project:

### Customer Functionalities

- Shopping: The platform provide Customers to browse all the products and add products to the cart if they wish to purchase.
- Order management: The platform allows Customers to place orders, manage their payments and also manage delivery method.
- Analytics: The platform provides users a full detailed report of their order history.

### Admin Functionalities

- Analytics: The platform provides a variety of reports to help administrators to track the performance of their e-commerce business like sales report.

<br>

# Quick Links

[Single Vendor E-Commerce Platform - C](#single-vendor-e-commerce-platform---c)

  - [Installation Guide](#Installation-Guide)
    - [Implementation Details](#implementation-details)
    - [Getting Started](#getting-started)
    - [Requirments](#requirments)
    - [Developer Guide](#Developer-Guide)

  - [User Guide](#User-Guide-And-How-To-Instructions)
    - [Getting Started](#Getting-Started)
    - [Browsing Products](#Browsing-and-Shopping)
    - [Making a Purchase](#Making-a-Purchase)
    - [Managing Your Account](#Managing-Your-Account)

  - [Analytics](#Analytics)

[Insight Into The Database](#Insight-Into-The-Database)

- [Database Design](#Database-Design)
  
- [Functions](#Functions)
  
- [Stored Procedures](#Stored-Procedures)
  
- [Transactions](#Transactions)
  
- [Triggers](#Triggers)
  
- [Views](#Views)
  
- [Indexes](#Indexes)
  
- [Security](#Security)
  
- [Team Members & Contributions](#Team-Members-&-Contributions)

<br>

# Installation Guide

## Implementation Details

- This project is using a SQL database to manage data.
- This Project uses API to interact with the UI and the database.
- Front End is developed using React
- API is developed using NodeJS (Express)
- According to the project's specifications, an Object-Relational Mapping (ORM) is not used at any point. Instead, the project exclusively utilizes standard SQL queries for all database interactions.
- Developed using NodeJS v18.17.1

## Getting started

- Required Softwares
  - MySQL Workbench 8
  - NodeJS v18.17.1 or higher (version updates are not recommended)
  - Prefered Code editor that can run JavaScript

To get started with the platform, follow these steps :

1.  Clone this repository.
    https://github.com/PasanMadhuranga/Ecommerce-Platform-G32

2. Utilize a MySQL client, such as the MySQL Workbench (recommended) or the MySQL command line client. Navigate to the "database" directory, and execute the `G32_Complete_Database.sql` script. This action will initialize your database, incorporating all requisite stored procedures, functions, views, triggers, and indexes. Additionally, it will populate the database with preliminary sample data.

3.  Open a new Terminal from the cloned directory and cd in to the server directory.

    ```plaintext
    cd server
    ```

    Install the dependencies using following command. (Activate the Virutal Environment if you are using one. It's recommended to use one.)

    ```plaintext
    npm i
    ```

    Start the server using following command

    ```plaintext
    npm start
    ```

4.  create .env file inside the server directory including following environmental variables.(You are supposed to update variable values according to your sql environment. You can simply copy the text below, modify it and save at the specified path as a .env file. Also you can fill the .env.example according to your data and remove the .example part).

    - JWT_SECRET and JWT_REFRESH_SECRET should be strong and uncommon for security reasons. (Recommend random strings which has about 64 characters)

    ```dotenv
    DB_PASSWORD=<MySQL Password here>
    DB_PORT=<MySQL Port here>
    JWT_SECRET=<Create a powerful JWT secret key for access token>
    JWT_REFRESH_SECRET=<Create a powerful JWT secret key for refresh token>
    ```

5.  Go back to the previous directory and go to the client directory.

    ```plaintext
    cd ..\client
    ```

    Then install the dependencies using following command.

    ```plaintext
    npm i
    ```

    Start the React app using following command.

    ```plaintext
    npm start
    ```

6.  Now website will automatically open with your web browser.

## Requirements

Our project depends on several important Dependencies that provide various functionalities and services to help us develop our application. By utilizing these packages, we can take advantage of their various functionalities and services to make our application more efficiently and effectively. Rather than that there are some Dev-Dependencies used in this project to enhance the developer experience. All the Dependencies used in our project are listed below.

### Front End Dependencies

#### Dependencies
- emotion/react : ^11.11.1,
- emotion/styled : ^11.11.0,
- mui/icons-material : ^5.14.15,
- mui/material : ^5.14.15,
- testing-library/jest-dom : ^5.17.0,
- testing-library/react : ^13.4.0,
- testing-library/user-event : ^13.5.0,
- axios : ^1.5.1,
- js-cookie : ^3.0.5,
- react : ^18.2.0,
- react-dom : ^18.2.0,
- react-router-dom : ^6.16.0,
- react-scripts : 5.0.1,
- react-slick : ^0.29.0,
- slick-carousel : ^1.8.1,
- web-vitals : ^2.1.4

#### Dev-Dependecies
- babel/plugin-proposal-private-property-in-object : ^7.21.11

### Back End Dependencies

#### Dependencies
- bcrypt : ^5.1.1,
- body-parser : ^1.20.2,
- cors : ^2.8.5,
- dotenv : ^16.3.1,
- express : ^4.18.2,
- express-async-errors : ^3.1.1,
- express-session : ^1.17.3,
- jsonwebtoken : ^9.0.2,
- mysql2 : ^3.6.1,
- uuid : ^9.0.1

#### Dev-Dependecies
- nodemon : ^3.0.1

## Developer Guide

### Entity-Relationship (ER) Diagram

![alt text](https://github.com/irudachirath/E-commerce_platform_doc/blob/main/ER_Diagram_v2.0.png?raw=true)

# User Guide

Welcome to our e-commerce platform, where your shopping experience is our top priority. This guide is designed to provide a seamless introduction and ensure you make the most of the platform's features.

## Getting Started

To embark on your shopping journey, you'll first need to navigate to our homepage.Here, you will find a navigation bar with some buttons such as "HOME", "SHOP", "CATEGORIES", "CART", "SIGN UP" and "LOGIN". Additionally, you'll find a variety of product categories are displayed, such as consumer electronics and toys and all sub-categories. Clicking on any of these categories will take the user to a page showcasing all the products available in that category.

![alt text](https://github.com/irudachirath/E-commerce_platform_doc/blob/main/home.png?raw=true)

## Browsing Products

Our platform provides an intuitive shopping experience. Whether you have a particular product in mind or just wish to browse, the search bar is your starting point. Simply type in keywords or specific product names to refine your search. For those who prefer a more exploratory approach, our homepage showcases main categories and all the sub-categories. Clicking on any category will give you a more in-depth view of all the products in the selected category.

Venturing further, clicking on an individual product will navigate you to its dedicated page. Here, not only are you presented with a detailed description explaining the product's features and benefits, but you'll also find an array of available variants. Each variant is uniquely represented, allowing for an informed choice. Once a decision is made, you can effortlessly add your chosen variant to the cart, setting the stage for purchase.

## Making a Purchase

Once you've settled on a product, specify the desired quantity and click on the "Add to Cart" button. When you're ready to finalize your purchase, head to the cart icon located on the top right of the screen to proceed to Checkout option. Here, you'll provide necessary shipping and payment details. After ensuring all details are accurate, simply confirm your order.

## Managing Your Account

Your personal dashboard is accessible by logging into your account using the "Login" button or by registering as a registered user using the "Sign Up" on the navigation panel on the top of the screen. This space is designed to give you control over various aspects of your account. From account creating to viewing your order history. You can log out from your account anytime using the "Log Out" button located in the same space.

# Analytics

For those with administrative privileges, an "Admin" button is available in the navigation bar post-login. This feature grants access to several critical reports and analytics:

- Quarterly Sales Report: Review the sales data for any given year, broken down quarterly.
- Top-selling Products: Discover which products garnered the most sales during a specified period.
- Most Ordered Product Category: Identify the product categories that are leading in order volume.
- Product Interest Analysis: Given any product, determine the time frames when it attracted the most attention or interest.
- Customer - Order Report: Gain insights into individual customer order patterns and preferences.

<br>
<br>

<h1 align = "center"> Insight Into The Database </h1>

Our Project Database serves as the backbone of our operations, providing structured storage and efficient management of our data. This document delves into the intricate design of the database, detailing its various components including functions, procedures, transactions, triggers, views, and indexes. In addition, we emphasize the security measures we have incorporated to protect our valuable data. Lastly, a nod to the individual contributions of each team member shines a light on the collaborative effort behind this robust infrastructure.

# Database Design

### Consistency and Avoiding Redundancy:

1. **Unique Constraints**: 
    - Ensures unique data for specific columns, thereby preventing redundancy. For instance, `Admin_username` in the `admin` table and `Email` in the `customer` table have been made UNIQUE to prevent duplicate entries.

2. **Primary Keys**: 
    - Each table has a primary key, ensuring a unique identifier for each row, which in turn maintains consistency.

3. **Foreign Key Constraints**: 
    - Establishes a link between data in two tables, ensuring consistency across tables. 
    E.g: the `Variant_id` in the `attribute` table is a Foreign Key referring to the `variant` table. 

4. **CASCADE Options**: 
    - In the event of an update or delete operation, the CASCADE option ensures that changes are consistently reflected across related tables. This prevents orphan records and maintains database integrity.

### Normalizations and Improvements:

1. **First Normal Form (1NF)**:
    - Each table has a primary key, and there are no repeating groups or arrays. All attributes have atomic values.

2. **Second Normal Form (2NF)**:
    - Tables like `cart_item` and `order_item` have composite primary keys (`Cart_id` with `Item_id`, `Order_id` with `Item_id`). This decomposition ensures that every non-prime attribute is fully functionally dependent on the primary key.

3. **Third Normal Form (3NF)**:
    - Transitive dependencies are removed. For instance, the `category` table has a `Parent_Category_id` that points back to the same table, creating a hierarchical structure. Thus, by using a self-referencing foreign key, we ensure that the table is in 3NF by eliminating possible transitive dependencies.

4. **Modularity of Tables**:
    - The database is designed such that entities like customers, orders, items, carts, and attributes are in separate tables. This modular design makes the database scalable and easy to manage.

5. **Integrity Checks**:
    - Constraints like `CHECK (LENGTH(Card_number) = 16)` for card number length and `CHECK (Price >= 0)` for item price ensure data integrity by enforcing business rules.

6. **Hierarchical Data**:
    - The `category` table uses a self-referencing foreign key (`Parent_Category_id`) to establish a category hierarchy, allowing for nested categories in the e-commerce platform.

7. **Storing Images Using Firebase**:

    - When dealing with images especially in databases for e-commerce platforms where large volumes of images might be stored, it's often a best practice to avoid saving the images directly within the relational database. Because relational database storage can be more expensive compared to specialized storage solutions designed for multimedia content. Therefore we use Firebase to store images and store only the link to the image in the database. 

<br>

# Functions

### **Function Name**: `isTheUserRegistered`

**Purpose**: This function checks the registration status of a user based on their email.

**Description**:
- The function accepts an email address (`p_email`) as its parameter.
- It queries the `customer` table to fetch the value of the `Is_registered` column for the provided email address.
- Based on the value of `Is_registered`, the function returns:
  - `-1` if there's no record found for the email, indicating the user is a new guest.
  - `0` if the user has previously made a purchase as a guest.
  - `1` if the user is a registered customer.

**Example:**
```sql
-- Check if the user with the email "john.doe@example.com" is registered
SELECT isTheUserRegistered('john.doe@example.com') AS is_registered;
```

**Output:**

```
is_registered
-------------
1
```


### **Function Name**: `GetMinPrice`

**Purpose**: This function retrieves the minimum price of a specific product based on its product ID.

**Description**:
- The function takes a `product_id` (`p_product_id`) as its parameter.
- It then queries the `item` table to find the minimum (lowest) price for all items associated with the given product ID.
- The function returns the minimum price as a decimal value with a precision of 9 digits and a scale of 2 (allowing for currency-style values).
  

**Example:**

```sql
-- Get the minimum price of the product with the ID 1
SELECT GetMinPrice(1) AS min_price;
```

**Output:**

```
min_price
---------
100.00
```

### **Function Name**: `CalculateDeliveryDays`

**Purpose**: This function calculates the estimated number of delivery days for a customer based on the customer's city and the stock availability of items in their cart.

**Description**:
- The function accepts two parameters:
  - `p_customer_id` (`INT`): The ID of the customer.
  - `p_city` (`VARCHAR(255)`): The city to which the delivery is being made.
  
- The function queries the `cart` table to identify the cart associated with the given customer ID.
- It then checks the `cart_item` and `item` tables to determine if there are any items in the cart that are out of stock.
- Based on the stock availability and delivery city, the function calculates the delivery days as per the following conditions:
  1. If all items are in stock and the delivery is to a main city (e.g., Colombo), the estimated delivery time is 5 days.
  2. If all items are in stock but the delivery is to a non-main city (e.g., Negombo), the estimated delivery time is 7 days.
  3. If any item is out of stock, an additional 3 days are added to the delivery estimates from the previous two points.
  
- The main cities considered in this function are: 'Anuradhapura', 'Colombo', 'Jaffna', 'Kandy', 'Galle', and 'Sri Jayewardenepura Kotte'.
- The function returns the estimated delivery days as an integer value.

**Example:**

```sql
-- Calculate the delivery days for a customer with ID 2 delivering to Colombo
SELECT CalculateDeliveryDays(2, 'Colombo') AS delivery_days;
```

**Output:**

```
delivery_days
-------------
5
```

Note: The above output suggests that the customer with ID 2, delivering to Colombo, will receive their items in 5 days, given that all items are in stock. If any item were out of stock, this would be increased to 8 days.



### **Function Name**: `CalculateItemDeliveryDays`

**Purpose**: This function calculates the additional delivery days for guest users based on the item quantity they intend to purchase, and compares it to its stock availability.

**Description**:
- The function is particularly designed for guest users. While registered users have their cart details stored in the database, guest users have their cart details stored in cookies. Hence, for guest users, the system needs a way to manually check item availability and potential delivery delays.
- The function accepts two parameters: the `item_id` (`p_item_id`) and the quantity of the item being ordered (`p_quantity`).
- Initially, it retrieves the quantity available in stock for the given item from the `item` table.
- The function then checks if the ordered quantity exceeds the available quantity in stock.
- If the ordered quantity surpasses the stock, an additional 3 delivery days are added. Otherwise, no extra days are added.
- The function returns the number of additional delivery days as an integer.

**Example**:

```sql
-- Get the additional delivery days for a guest order of 10 units of the item with ID 5
SELECT CalculateItemDeliveryDays(5, 10) AS additional_days;
```

**Output**:

```
additional_days
---------------
3
```

**Note**: The above output implies that if a guest user orders 10 units of the item with ID 5 and if the ordered quantity exceeds the available stock, an additional 3 days will be added to the delivery estimate.

<br>

# Stored Procedures
## Procedures for product management

A set of procedures that can be used to manage products, variants, and attributes.

### Purpose of each procedure:

* `insert_variant_if_not_exists`: Inserts a given variant name into the variant table if it does not exist.
* `insert_attribute_if_not_exists`: Inserts a given attribute name into the attribute table if it does not exist for the given variant.
* `add_item`: Adds a new item to the item table, with the given product ID, price, quantity, image, variant types, and attribute names.
* `add_product`: Adds a new product to the product table, with the given title, category list, description, weight, SKU, and image.

### Example queries:

```sql
-- Insert a new variant named "Size" into the variant table if it does not exist
CALL insert_variant_if_not_exists('Size');

-- Insert a new attribute named "Color" into the attribute table for the "Size" variant, if it does not exist
CALL insert_attribute_if_not_exists('Color', 'Size');

-- Add a new item to the item table
CALL add_item(1, 100.00, 10, 'product.jpg', 2, 'Size,Color', 'Red,Blue');

-- Add a new product to the product table
CALL add_product('T-Shirt', 'Clothing,Tops', 'A comfortable and stylish t-shirt.', 0.5, 'T-Shirt-1', 't-shirt.jpg');
```

## Procedures for generating admin reports

A set of procedures that can be used to generate admin reports for a given year, quarter, product category, product, or customer.

### Purpose of each procedure:

* `set_quarter_dates`: Sets the start and end dates of a quarter, given the year and quarter.
* `get_sales_of_a_category`: Gets the sales quantity for all products in a given product category, for a given year and quarter.
* `get_sales_of_a_product`: Gets the sales quantity for a given product, for a given year and quarter.
* `get_sales_quantity`: Gets the sales quantity for all products, or for a given product category or product, for a given year and quarter.
* `get_orders_quantity`: Gets the number of orders placed for a given year and quarter.
* `get_most_sellings`: Gets the top selling products for a given year, quarter, and number of products.
* `get_order_report`: Gets the order details for a given customer, given the customer ID.
* `get_most_popular_time_for_product`: Gets the most popular time of year for a given product.

### Example queries:

```sql
-- Get the sales quantity for all products in the category 1 for the year 2023 and quarter 1
CALL get_sales_of_a_category(1, 2023, 1);

-- Get the sales quantity for the product with ID 1 for the year 2023 and quarter 1
CALL get_sales_of_a_product(1, 2023, 1);

-- Get the sales quantity for all products for the year 2023 and quarter 1
CALL get_sales_quantity(2023, 1);

-- Get the number of orders placed in the year 2023 and quarter 1
CALL get_orders_quantity(2023, 1);

-- Get the top 10 selling products for the year 2023 and quarter 1
CALL get_most_sellings(2023, 1, 10);

-- Get the order details for the customer with ID 1
CALL get_order_report(1);

-- Get the most popular time of year for the product with ID 1
CALL get_most_popular_time_for_product(1);
```

<br>

# Transactions

* `add_product`:

    - **Transaction Usage**: This procedure starts a transaction at the beginning and commits it at the end. The goal here is to ensure that the insertion of a new product and its association with categories are treated as a single atomic operation.

* `add_item`:

    - **Transaction Usage**: This procedure also starts a transaction at the beginning and commits it at the end. The idea is to ensure that all operations related to adding an item, such as fetching the Product_id, inserting the item, adding variants and attributes, and linking the item to its configurations, are treated as one atomic operation.

<br>

# Triggers

* `order_item_after_insert`: Updates the quantity of the item after an order is placed and deletes the item from the cart table.
* `after_customer_update`: Creates a cart for the customer when an unregistered user registers as a customer.
* `after_customer_insert`: Creates a cart for a customer when the customer is registered.

<br>

# Views

### **View Name**: `product_sales`

**Description**:
The `product_sales` view consolidates and represents sales information related to various products that have been ordered.

**Usage**:
The view is particularly useful for generating sales-related reports and analytics. As seen in the admin related procedures, it allows users to obtain sales data filtered by various parameters such as product, category, time frame, and more. The consolidation of this data into a view makes it easier to write and understand the SQL used for these analytics, as the underlying complexities of the data relationships are abstracted away.

**Sample Use Case**:

![alt text](https://github.com/irudachirath/E-commerce_platform_doc/blob/main/views_sample.png?raw=true)

<br>

# Indexes

### **Index Name**: `idx_date`

The `idx_date` index on the `shop_order` table's `Date` column improves query performance by allowing the database to quickly locate and access rows based on date values, rather than scanning the entire table.

### Before creating the index:

![alt text](https://github.com/irudachirath/E-commerce_platform_doc/blob/main/before_index.png?raw=true)

### After creating the index:

![alt text](https://github.com/irudachirath/E-commerce_platform_doc/blob/main/after_index.png?raw=true)


| Parameter          | Before Indexing   | After Indexing    | Reason for Difference                                    |
|--------------------|-------------------|-------------------|----------------------------------------------------------|
| **Index Type**     | ALL (Full Scan)   | Range             | The new index allows the DB to perform a range scan, which is more efficient than a full table scan for date-based queries. |
| **Rows Scanned**   | 24                | 6                 | With the new index, the DB can directly access the relevant rows without scanning the entire table. |
| **Key Used**       | NULL              | idx_date          | Before, no specific index was used for the date-based query. After indexing, the `idx_date` index is leveraged to optimize the query. |

### **Index Name**: `idx_Title_Description`

The `idx_Title_Description` index is a full-text index specifically designed for the `Title` and `Description` columns of the `product` table.

When users interact with an e-commerce platform, one of the primary actions they undertake is searching for products. The `idx_Title_Description` index serves this very purpose. By indexing the `Title` and `Description` columns, the system can adeptly match user queries against product titles and descriptions without having to scan each row individually.

**Example:**

Suppose a user wants to find products related to "organic tea". Using the full-text index, the query would look something like this:
```sql
SELECT *
FROM product 
WHERE MATCH(Title, Description) AGAINST('organic tea');
```
With the `idx_Title_Description` index, this query would promptly return all products with titles or descriptions that mention "organic tea" or are contextually relevant to it.

<br>

# Security

1. **Password Encryption**:
   - **Salt Rounds**: For additional security, our encryption process incorporates salting, a method where random data is combined with the password. We've set the salt rounds to `10`, but this can be adjusted as per requirements to determine the complexity of the hashing operation.

   - **Hashing Process**: When a user sets or updates their password, it's transformed from plain-text into a cryptographic hash. We utilize the bcrypt algorithm, one of the most trusted methods in the industry. This ensures that the actual password is never stored directly in our database.

    ![alt text](https://github.com/irudachirath/E-commerce_platform_doc/blob/main/hash_password.png?raw=true)

2. **Password Verification**:
   - When a user logs in, their given password is compared with the stored hash in our database.
   - The bcrypt's `compare` function is used for this verification. It checks if the hashed version of the given password matches the stored hash without ever converting the hash back to plain-text. This ensures a secure and efficient login process.

   ![alt text](https://github.com/irudachirath/E-commerce_platform_doc/blob/main/compare_password.png?raw=true)


3. **SQL Injection Prevention using Prepared Statements**

    SQL Injection is one of the most prevalent and dangerous web application vulnerabilities. It allows attackers to insert malicious SQL code into queries, which can then be executed by the database.

    In our e-commerce platform, we're proactive in guarding against SQL Injection attacks by utilizing prepared statements in our SQL queries. Here's how prepared statements offer enhanced security:

    i. **Parameterized Queries**:
    - In our SQL queries, we use placeholders (`?`) instead of directly inserting values into the SQL string. This ensures that the database always treats the inputs as data rather than executable code.
    
    ii. **Separation of SQL Logic and Data**:
    - With prepared statements, SQL logic is defined first and kept separate from the data. When data is later bound to the placeholders, the database knows to treat it only as data and not part of the SQL logic. This makes it virtually impossible for an attacker to inject malicious SQL.

    For instance, consider the following SQL statements from our platform:

    ![alt text](https://github.com/irudachirath/E-commerce_platform_doc/blob/main/prepared_statements.png?raw=true)

    In both cases, any input provided by the user (or an attacker) will be treated strictly as data, eliminating the risk of SQL code execution.

    By consistently using prepared statements throughout our platform, we ensure that our database interactions remain secure, and our users' data is protected from potential injection threats.

<br>

# Team Members & Contributions:

### **Harith Maduranga: 210404F**
- Designed the database
- Drafted SQL queries
- Created API and developed the framework for the following pages:
  - Admin
  - Cart
  - Checkout
  - Home
  - Product
  - Shop
  - Register

### **Pasan Madhuranga: 210577K**
- Designed the database
- Implemented MySQL functions
- Authored database indexes
- Authored database triggers
- Drafted SQL queries
- Created documentation

### **Iruda Chirath: 210086E**
- Designed the database
- Authored database transactions
- Authored the `insert_variant_if_not_exists` procedure
- Authored the `insert_attribute_if_not_exists` procedure
- Authored the `add_item` procedure
- Inserted sample data
- Managed Authorization and Authentication
- Created API and developed the framework for login and admin pages

### **Savinda Yapa: 210734P**
- Designed the database
- Authored procedures for generating admin reports
- Authored the `add_product` procedure
- Authored database views
- Drafted SQL queries

### **Janak Senevirathne: 210598B**
- Designed the database
- Defined styles for web pages
- Inserted sample data
- Created documentation
- Created API and developed the framework for the product page

-- create an index on the date column of the shop_order table to speed up the admin related procedures
CREATE INDEX idx_date ON shop_order(Date);

-- create a full text index on the title and description columns of the product table to speed up the search
CREATE FULLTEXT INDEX idx_Title_Description ON product(Title, Description);
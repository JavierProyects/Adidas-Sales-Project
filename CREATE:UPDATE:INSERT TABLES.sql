-- Since my Original Dataset has only one table I couldn't perform relation between tables. So I decided to create new tables, and add a unique identifier in each table.
-- I had to create an index in order to establishing a foreign key relationship.
-- Creation of tables:
CREATE TABLE Retailer (
    Retailer_Sales_ID INT AUTO_INCREMENT PRIMARY KEY,
    Retailer VARCHAR(255),
    Retailer_ID INT,
    Region VARCHAR(255),
    State VARCHAR(255),
    City VARCHAR(255)
);
CREATE INDEX idx_retailer_id ON Retailer (Retailer_ID);

CREATE TABLE Product (
    Product_ID INT AUTO_INCREMENT PRIMARY KEY,
    Product VARCHAR(255)
); 
CREATE INDEX idx_Product_Product ON Product(Product);

ALTER TABLE `Adidas Sales`
ADD CONSTRAINT fk_Product
FOREIGN KEY (Product)
REFERENCES Product(Product);

CREATE TABLE Invoice (
    Invoice_ID INT AUTO_INCREMENT PRIMARY KEY,
    Retailer_ID INT,
    Invoice_Date DATE,
    Total_Sales DECIMAL(10, 2),
    Operating_Profit DECIMAL(10, 2),
    Operating_Margin DECIMAL(5, 2),
    Sales_Method VARCHAR(255),
    FOREIGN KEY (Retailer_ID) REFERENCES Retailer(Retailer_ID)
);

-- Inserting values on the tables:

INSERT INTO Retailer (Retailer, Retailer_ID, Region, State, City)
SELECT Retailer,`Retailer ID`, Region, State, City FROM `Adidas Sales`;

INSERT INTO Product (Product)
SELECT Product
FROM `Adidas Sales`;

INSERT INTO Invoice (Retailer_ID, Invoice_Date, Total_Sales, Operating_Profit, Operating_Margin, Sales_Method)
SELECT `Retailer ID`,`Invoice Date`,
`Total Sales`, `Operating Profit`,
       CAST(REPLACE(`Operating Margin`, '%', '') AS DECIMAL(5, 2)),
       `Sales Method`
FROM `Adidas Sales`;

-- UPDATES:

-- Altering the Adidas Sales table to add a Sales_ID column:
ALTER TABLE `Adidas Sales`
ADD COLUMN Sales_ID INT AUTO_INCREMENT PRIMARY KEY FIRST;

-- Addign a foreing Key to stablish a relation between Adidas Sales, and product table:
ALTER TABLE `Adidas Sales`
ADD CONSTRAINT fk_Product
FOREIGN KEY (Product)
REFERENCES Product(Product);

-- Change of format for the Date Column (ADIDAS SALES TABLE):
UPDATE `Adidas Sales`
SET `Invoice Date` = DATE_FORMAT(STR_TO_DATE(`Invoice Date`, '%m/%d/%y'), '%Y-%m-%d');

-- Change of format for the Total Sales, Operating Profit and Price per Unit Columns (ADIDAS SALES TABLE):
UPDATE `Adidas Sales`
SET `Total Sales` = REPLACE(REPLACE(`Total Sales`, '$', ''), ',', '');
UPDATE `Adidas Sales`
SET `Operating Profit` = REPLACE(REPLACE(`Operating Profit`, '$', ''), ',', '');
UPDATE `Adidas Sales`
SET `Price per Unit` = REPLACE(REPLACE(`Price per Unit`, '$', ''), ',', '');
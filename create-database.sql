CREATE DATABASE FoodTruck;

USE FoodTruck;
--foodtruck_id, name, cuisime_type,city

Create table foodtrucks (
	foodtruck_id INT PRIMARY KEY,
	name NVARCHAR(100) NOT NULL,
	cuisin_type NVARCHAR(100),
	city NVARCHAR(100) NOT NULL);

CREATE TABLE locations(
	location_id INT PRIMARY KEY,
	foodtruck_id INT NOT NULL,
	location_date DATE NOT NULL,
	zone NVARCHAR(100) NOT NULL,
	CONSTRAINT FK_locations_foodtrucks FOREIGN KEY (foodtruck_id)
		REFERENCES foodtrucks(foodtruck_id)
);

CREATE TABLE products (
	product_id INT PRIMARY KEY,
	foodtruck_id INT NOT NULL,
	name NVARCHAR(100) not null,
	price DECIMAL(10,2) NOT NULL CHECK(PRICE >=0),
	stock INT NOT NULL DEFAULT 0 CHECK (STOCK >=0),
	CONSTRAINT FK_products_foodtrucks FOREIGN KEY (foodtruck_id)
		REFERENCES foodtrucks(foodtruck_id));

CREATE TABLE orders (
	order_id INT PRIMARY KEY,
	foodtruck_id INT NOT NULL,
	order_date DATE NOT NULL,
	status NVARCHAR(100) NOT NULL,
	total DECIMAL(10,2) NOT NULL CHECK (total >= 0),
	CONSTRAINT FK_products_foodtrucks FOREIGN KEY (foodtruck_id)
		REFERENCES foodtrucks(foodtruck_id));

CREATE TABLE orders (
	order_id INT PRIMARY KEY,
	foodtruck_id INT NOT NULL,
	order_date DATE NOT NULL,
	status NVARCHAR(100) NOT NULL,
	total DECIMAL(10,2) NOT NULL CHECK (total >= 0),
	CONSTRAINT FK_products_foodtrucks FOREIGN KEY (foodtruck_id)
		REFERENCES foodtrucks(foodtruck_id));
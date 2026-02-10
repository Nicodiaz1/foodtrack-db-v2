use FoodTruck;

DROP TABLE IF EXISTS order_items;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS locations;
DROP TABLE IF EXISTS foodtrucks;

CREATE TABLE foodtrucks (
    foodtruck_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    cuisine_type VARCHAR(50),
    city VARCHAR(100)
);

CREATE TABLE locations (
    location_id INT PRIMARY KEY,
    foodtruck_id INT NOT NULL,
    location_date DATE NOT NULL,
    zone NVARCHAR(100) NOT NULL,
    CONSTRAINT FK_locations_foodtrucks FOREIGN KEY (foodtruck_id)
        REFERENCES foodtrucks(foodtruck_id)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    foodtruck_id INT NOT NULL,
    order_date DATE NOT NULL,
    status NVARCHAR(50),
    total DECIMAL(10, 2),
    CONSTRAINT FK_orders_foodtrucks FOREIGN KEY (foodtruck_id)
        REFERENCES foodtrucks(foodtruck_id)
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    foodtruck_id INT NOT NULL,
    name NVARCHAR(100) NOT NULL,
    price DECIMAL(10,2) NOT NULL CHECK(price >= 0),
    stock INT NOT NULL DEFAULT 0 CHECK(stock >= 0),
    CONSTRAINT FK_products_foodtrucks FOREIGN KEY (foodtruck_id)
        REFERENCES foodtrucks(foodtruck_id)
);

CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    CONSTRAINT FK_order_items_orders FOREIGN KEY (order_id)
        REFERENCES orders(order_id),
    CONSTRAINT FK_order_items_products FOREIGN KEY (product_id)
        REFERENCES products(product_id)
);


INSERT INTO foodtrucks (foodtruck_id, name, cuisine_type, city)
VALUES
(1, 'Taco Loco', 'Mexicana', 'Ciudad de México'),
(2, 'Burger Bros', 'Americana', 'Buenos Aires');

-- Insertar datos en locations
INSERT INTO locations (location_id, foodtruck_id, location_date, zone) VALUES
(1, 1, '2023-09-01', 'Centro'),
(2, 2, '2023-09-01', 'Parque');

-- Insertar datos en orders
INSERT INTO orders (order_id, foodtruck_id, order_date, status, total) VALUES
(1001, 1, '2023-09-01', 'entregado', 90),
(1002, 2, '2023-09-01', 'pendiente', 100);

-- Insertar datos en products
INSERT INTO products (product_id, foodtruck_id, name, price, stock) VALUES
(101, 1, 'Taco al pastor', 50, 100),
(102, 1, 'Quesadilla', 40, 80),
(103, 2, 'Cheeseburger', 70, 120),
(104, 2, 'Papas fritas', 30, 150);

-- Insertar datos en order_items
INSERT INTO order_items (order_item_id, order_id, product_id, quantity) VALUES
(1, 1001, 101, 1),
(2, 1002, 103, 1),
(3, 1002, 104, 1);

SELECT * FROM foodtrucks;
SELECT * FROM locations;
SELECT * FROM orders;
SELECT * FROM products;
SELECT * FROM order_items;


		
		



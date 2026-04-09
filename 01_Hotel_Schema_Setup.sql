CREATE TABLE items (
    item_id INT PRIMARY KEY,
    item_name VARCHAR(50),
    rate DECIMAL(10, 2)
);

CREATE TABLE bookings (
    booking_id INT,
    date DATE,
    item_id INT,
    quantity INT,
    FOREIGN KEY (item_id) REFERENCES items(item_id)
);

INSERT INTO items (item_id, item_name, rate) VALUES 
(1, 'Deluxe Room', 1500.00), 
(2, 'Standard Room', 800.00),
(3, 'Suite', 2500.00);

INSERT INTO bookings (booking_id, date, item_id, quantity) VALUES 
(101, '2021-11-05', 1, 2), 
(102, '2021-11-10', 2, 1), 
(103, '2021-12-01', 3, 1), 
(104, '2021-11-20', 1, 1);
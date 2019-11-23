SELECT * FROM invoice 
JOIN invoice_line il ON il.invoice_id = invoice.invoice_id
WHERE il.unit_price > 0.99;

SELECT invoice.invoice_date, customer.first_name, customer.last_name, invoice.total 
FROM invoice 
JOIN customer ON invoice.customer_id = customer.customer_id

SELECT customer.first_name, customer.last_name, employee.first_name, employee.last_name
FROM customer 
JOIN employee ON customer.support_rep_id = employee.employee_id;

SELECT al.title, ar.name
FROM album al
JOIN artist ar ON al.artist_id = ar.artist_id

SELECT pt.track_id
FROM playlist_track pt
JOIN playlist p ON p.playlist_id = pt.playlist_id
WHERE p.name = 'Music';

SELECT t.name FROM track t
JOIN playlist_track pt ON pt.track_id = t.track_id
WHERE pt.playlist_id = 5;

SELECT t.name, p.name FROM track t
JOIN playlist_track pt ON t.track_id = pt.track_id
JOIN playlist p ON pt.playlist_id = p.playlist_id;

SELECT t.name, a.title FROM track t
JOIN album a ON t.album_id = a.album_id
JOIN genre g ON g.genre_id = t.genre_id
WHERE g.name = 'Alternative & Punk';

SELECT * FROM invoice 
WHERE invoice_id IN (SELECT invoice_id FROM invoice_line
WHERE unit_price > 0.99);

SELECT * FROM playlist_track
WHERE playlist_id IN (SELECT playlist_id FROM playlist
WHERE name = 'Music');

SELECT name FROM track 
WHERE track_id IN (SELECT track_id FROM playlist_track
WHERE playlist_id = 5);

SELECT * FROM track 
WHERE genre_id IN (SELECT genre_id FROM genre
WHERE name = 'Comedy');

SELECT * FROM track 
WHERE album_id IN (SELECT album_id FROM album
WHERE title = 'Fireball');

SELECT * FROM track 
WHERE album_id IN (SELECT album_id FROM album
WHERE artist_id IN (SELECT artist_id FROM artist 
WHERE name = 'Queen')
);

UPDATE customer
SET fax = null
WHERE fax IS NOT NULL;

UPDATE customer
SET company = 'Self'
WHERE company IS NULL;

UPDATE customer
SET last_name = 'Thompson'
WHERE first_name = 'Julia' AND last_name = 'Barnett';

UPDATE customer
SET support_rep_id = 4
WHERE email = 'luisrojas@yahoo.cl';

UPDATE track
SET composer = 'The darkness around us'
WHERE genre_id = (SELECT genre_id FROM genre WHERE name = 'Metal')
AND composer IS NULL;

SELECT COUNT(*), g.name FROM track t
JOIN genre g ON t.genre_id = g.genre_id
GROUP BY g.name;

SELECT COUNT(*), g.name FROM track t
JOIN genre g ON g.genre_id = t.genre_id
WHERE g.name = 'Pop' OR g.name = 'Rock'
GROUP BY g.name;

SELECT ar.name, COUNT(*) FROM album al
JOIN artist ar ON ar.artist_id = al.artist_id
GROUP BY ar.name;

SELECT DISTINCT composer FROM track

SELECT DISTINCT billing_postal_code FROM invoice

SELECT DISTINCT company FROM customer

DELETE FROM practice_delete
WHERE type = 'bronze';

DELETE FROM practice_delete
WHERE type = 'silver';

DELETE FROM practice_delete
WHERE value = 150;

CREATE TABLE users (id SERIAL PRIMARY KEY, name VARCHAR(50), email TEXT)

INSERT INTO users (name, email) VALUES ('Cam', 'camcraw30@gmail.com'),
('Cory', 'coryxkenshin@gmail.com'),
('Frank', 'frankwest@gmail.com')

CREATE TABLE products (id SERIAL PRIMARY KEY, name VARCHAR(50), price INTEGER)

INSERT INTO products (name, price)
VALUES ('Video Game', 59.99),
('Movie', 19.96),
('Bed Sheets', 12.73)

CREATE TABLE orders (id SERIAL PRIMARY KEY, product_name VARCHAR(50))

INSERT INTO orders (product_name)
VALUES ('Video Game'),
('Movie'),
('Bed Sheets');

SELECT * FROM products AS p
JOIN orders AS o ON p.product_id = o.product_id
WHERE o.product_id = 1;

SELECT * FROM orders AS o
JOIN products AS p ON p.product_id = o.product_id;

SELECT SUM(p.price) FROM orders AS o
JOIN products AS p ON p.product_id = o.product_id
WHERE o.order_id = 2;

ALTER TABLE users
ADD order_id INT;

ALTER TABLE users
ADD FOREIGN KEY (order_id) REFERENCES orders(order_id);

UPDATE users 
SET order_id = 1
WHERE name ='Bobby';

UPDATE users 
SET order_id = 2
WHERE name ='Robby';

UPDATE users 
SET order_id = 3
WHERE name ='Billy';

SELECT * FROM orders AS o
JOIN users AS u ON o.order_id = u.order_id
WHERE u.user_id = 1;

SELECT SUM(o.order_id) FROM orders AS o
JOIN users AS u ON o.order_id = u.order_id;
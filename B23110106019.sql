-- Create DB
CREATE DATABASE library_db;

-- Create the "books" table
CREATE TABLE books (
    book_id SERIAL PRIMARY KEY,
    title VARCHAR(255),
    author VARCHAR(255),
    year_published INT,
    isAvailable BOOLEAN,
    price NUMERIC(10,2),
    publication VARCHAR(255)
);

-- Insert sample data
INSERT INTO books (title, author, year_published, isAvailable, price, publication) VALUES
('Echoes of the Forgotten', 'Lena Carter', 1999, TRUE, 499.00, 'ABC'),
('Steel and Shadows', 'Victor Hale', 1949, TRUE, 300.00, 'XYZ'),
('Journey Beyond Stars', 'Diana Brooks', 2020, TRUE, 750.00, 'XYZ'),
('Mist Over the Moor', 'Marcus Gray', 2019, FALSE, 550.00, 'XYZ'),
('Shattered Reflections', 'Eva Dalton', 2018, TRUE, 600.00, 'Penguin'),
('Winning the Little Battles', 'Nathan Reid', 2018, TRUE, 599.00, 'Random House'),
('Back to the Hearth', 'Isabel Monroe', 2018, TRUE, 720.00, 'ABC'),
('Electrify the Mind', 'Colin Frost', 2011, TRUE, 680.00, 'Harper'),
('Digital Daydreams', 'Sophie Lang', 2016, FALSE, 640.00, 'Harper'),
('Call of the Path', 'Felix Romero', 1988, TRUE, 400.00, 'XYZ'),
('Wings of the Horizon', 'Noah Sinclair', 2003, TRUE, 510.00, 'XYZ'),
('The Willow’s Cry', 'Grace Holloway', 1960, FALSE, 450.00, 'ABC'),
('Ashes and Letters', 'Julian Marks', 2005, TRUE, 580.00, 'XYZ'),
('Storm of Dust', 'Miles Carrington', 1965, TRUE, 350.00, 'SciFi'),
('Worlds Collide in Silence', 'Amelia Drake', 2020, TRUE, 520.00, 'XYZ');

SELECT * FROM books WHERE year_published > 2000;

SELECT * FROM books WHERE price < 599.00 ORDER BY price DESC;

SELECT * FROM books ORDER BY price DESC LIMIT 3;

SELECT * FROM books ORDER BY year_published DESC OFFSET 2 LIMIT 2;

SELECT * FROM books WHERE publication = 'XYZ' ORDER BY title;

-- Order
-- Find all subjects sorted by subject
SELECT * FROM subjects ORDER BY subject;
-- Find all subjects sorted by location
SELECT * FROM subjects ORDER BY location;
-- Where
-- Find the book "Little Women"
SELECT title FROM books WHERE title = 'Little Women'; or SELECT * FROM books WHERE title = 'Little Women';
-- Find all books containing the word "Python"
SELECT * FROM books WHERE title LIKE '%Python%';

-- Find all subjects with the location "Main St" sort them by subject
SELECT * FROM subjects WHERE location LIKE '%Main St%' ORDER BY subject;

-- Joins
-- Find all books about Computers and list ONLY the book titles
SELECT books.title FROM books JOIN subjects ON subjects.id = books.subject_id WHERE subjects.subject = 'Computers';

-- Find all books and display a result table with ONLY the following columns
-- Book title
-- Author's first name
-- Author's last name
-- Book subject
SELECT title, authors.first_name, authors.last_name, subjects.subject
FROM books
JOIN authors ON authors.id = books.author_id
JOIN subjects ON subjects.id = books.subject_id;

-- Find all books that are listed in the stock table
-- Sort them by retail price (most expensive first)
-- Display ONLY: title and price

SELECT books.title, stock.retail
FROM stock
JOIN editions ON editions.isbn = stock.ISBN
JOIN books ON books.id = editions.book_id
ORDER BY stock.retail DESC;


SELECT books.title, stock.retail FROM books JOIN editions ON editions.book_id = books.id JOIN stock ON stock.isbn = editions.isbn ORDER BY stock.retail DESC;

-- Find the book "Dune" and display ONLY the following columns
-- Book title
-- ISBN number
-- Publisher name
-- Retail price
SELECT books.title, editions.isbn, publishers.name, stock.retail FROM books
JOIN editions ON editions.book_id = books.id
JOIN stock ON stock.isbn = editions.isbn
JOIN publishers ON publishers.id = editions.publisher_id
WHERE books.title = 'Dune';

-- Find all shipments sorted by ship date display a result table with ONLY the following columns:
-- Customer first name
-- Customer last name
-- ship date
-- book title
SELECT customers.first_name, customers.last_name, shipments.ship_date, books.title FROM books
JOIN editions ON editions.book_id = books.id
JOIN shipments ON shipments.isbn = editions.isbn
JOIN customers ON customers.id = shipments.customer_id
ORDER BY ship_date;

-- Grouping and Counting
-- Get the COUNT of all books
SELECT COUNT(title) FROM books;
-- Get the COUNT of all Locations
SELECT COUNT(location) FROM subject;
-- Get the COUNT of each unique location in the subjects table. Display the count and the location name. (hint: requires GROUP BY).

SELECT COUNT(location), location FROM subjects
GROUP BY location;

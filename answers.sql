-- Order
-- Find all subjects sorted by subject
SELECT * FROM subjects ORDER BY subject;
-- Find all subjects sorted by location
SELECT * FROM subjects ORDER BY location;

-- Where
-- Find the book "Little Women"
SELECT * FROM books WHERE title = 'Little Women';
-- Find all books containing the word "Python"
SELECT * FROM books WHERE title LIKE '%Python%';
-- Find all subjects with the location "Main St" sort them by subject
SELECT * FROM subjects WHERE location = 'Main St' ORDER BY subject;

-- Joins
-- Find all books about Computers and list ONLY the book titles
SELECT title FROM books INNER JOIN subjects ON books.subject_id = subjects.id WHERE  subjects.subject = 'Computers';

-- Find all books and display a result table with ONLY the following columns
-- Book title
-- Author's first name
-- Author's last name
-- Book subject
SELECT books.title, authors.first_name, authors.last_name, subjects.subject FROM books  INNER JOIN authors ON books.author_id = authors.id INNER JOIN subjects ON books.subject_id = subjects.id;

-- Find all books that are listed in the stock table
-- Sort them by retail price (most expensive first)
-- Display ONLY: title and price
SELECT books.title, stock.retail FROM editions INNER JOIN books ON editions.book_id = books.id INNER JOIN stock ON editions.isbn = stock.isbn ORDER BY stock.retail DESC;

-- Find the book "Dune" and display ONLY the following columns
-- Book title
-- ISBN number
-- Publisher name
-- Retail price
SELECT books.title, editions.isbn, publishers.name, stock.retail FROM editions INNER JOIN books ON editions.book_id = books.id INNER JOIN publishers ON editions.publisher_id = publishers.id INNER JOIN stock ON editions.isbn = stock.isbn WHERE books.title = 'Dune';

-- Find all shipments sorted by ship date display a result table with ONLY the following columns:
-- Customer first name
-- Customer last name
-- ship date
-- book title
SELECT customers.first_name, customers.last_name, shipments.ship_date, books.title FROM shipments INNER JOIN customers ON shipments.customer_id = customers.id  INNER JOIN editions ON shipments.isbn = editions.isbn INNER JOIN books ON editions.book_id = books.id ORDER BY ship_date;

-- Grouping and Counting
-- Get the COUNT of all books
SELECT COUNT(*) FROM books;

-- Get the COUNT of all Locations
SELECT COUNT(location) FROM subjects;
-- Get the COUNT of each unique location in the subjects table.
--Display the count and the location name. (hint: requires GROUP BY).
SELECT location, COUNT(location) FROM subjects GROUP BY location;
-- List all books.
--Display the book_id, title, and a count of how many editions each book has.
--(hint: requires GROUP BY and JOIN)
SELECT books.id, books.title, COUNT(editions.edition)  FROM books INNER JOIN editions ON books.id = editions.book_id GROUP BY books.id;

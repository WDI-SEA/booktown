-- ORDER:
-- 1. Find all subjects sorted by subject.
	 SELECT Subject FROM Subjects;


-- 2. Find all subjecs sorted by location.
SELECT Subject, Location FROM Subjects ORDER BY Location;

--WHERE:
--1. Find the book "Little Women"
SELECT * FROM books WHERE title = 'Little Women';

--2. Find all books containing the word "Python"
SELECT * FROM books WHERE title LIKE '%Python';

--3. Find all subjects with the location "Main St" sort them by subject
SELECT * FROM subjects WHERE location Like '%Main St';


--JOINS

-- Find all books about Computers and list ONLY the book titles
SELECT books.title FROM books, subjects WHERE books.subject_id = subjects.id AND subject = 'Computers';


-- Find all books and display a result table with ONLY the following columns
-- Book title
-- Author's first name
-- Author's last name
-- Book subject
SELECT books.title, authors.first_name, authors.last_name, subjects.subject FROM books, authors, subjects;


-- Find all books that are listed in the stock table
-- Sort them by retail price (most expensive first)

-- Display ONLY: title and price
SELECT books.title, stock.retail FROM stock, editions, books WHERE stock.isbn = editions.isbn AND books.id = editions.book_id ORDER BY retail DESC;

-- Find the book "Dune" and display ONLY the following columns
-- Book title
-- ISBN number
-- Publisher name
-- Retail price

SELECT books.title, editions.isbn, publishers.name, stock.retail FROM books, stock, editions, publishers WHERE stock.isbn = editions.isbn AND books.id = editions.book_id AND books.title = 'Dune';


-- Find all shipments sorted by ship date display a result table with ONLY the following columns:
-- Customer first name
-- Customer last name
-- ship date
-- book title

SELECT customers.first_name, customers.last_name, shipments.ship_date, books.title FROM customers, shipments, books, editions WHERE books.id = editions.book_id AND editions.isbn = shipments.isbn AND shipments.customer_id = customers.id ORDER BY shipments.ship_date;

-- Grouping and Counting

-- Get the COUNT of all books
SELECT COUNT(*) FROM books;

-- Get the COUNT of all Locations
SELECT COUNT(subjects.location) FROM subjects;

-- Get the COUNT of each unique location in the subjects table. Display the count and the location name. (hint: requires GROUP BY).
SELECT location, COUNT (location) FROM subjects GROUP BY location

-- List all books. Display the book_id, title, and a count of how many editions each book has. (hint: requires GROUP BY and JOIN)
SELECT books.id, books.title, COUNT(editions.book_id) FROM books, editions WHERE books.id = editions.book_id GROUP BY books.id;

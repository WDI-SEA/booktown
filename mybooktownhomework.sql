-- ORDER
-- 1. Find all subjects sorted by subject
SELECT * FROM subjects ORDER BY subjects ASC;
-- 2. Find all subjects sorted by location
SELECT * FROM subjects ORDER BY location ASC;

-- WHERE
-- 1. Find the book "Little Women"
SELECT * FROM books WHERE title = 'Little Women';
-- 2. Find all books containing the word "Python"
SELECT * FROM books WHERE title LIKE '%Python%';
-- 3. Find all subjects with the location "Main St" sort them by subject
SELECT * FROM subjects WHERE location = 'Main St' ORDER BY subjects ASC;

-- JOINS
-- Find all books about Computers list ONLY book title
SELECT * FROM books b JOIN subjects s ON b.subject_id = s.id WHERE subject = 'Computers';
-- Find all books and display ONLY
-- Book title
-- Author's first name
-- Author's last name
-- Book subject
SELECT title, first_name, last_name, subject FROM books b JOIN authors a ON b.author_id = a.id JOIN subjects s ON s.id = b.subject_id;
-- Find all books that are listed in the stock table
-- Sort them by retail price (most expensive first)
-- Display ONLY: title and price
SELECT title, retail FROM stock s JOIN editions e ON s.isbn = e.isbn JOIN books b ON e.book_id = b.id ORDER BY retail DESC;
-- Find the book "Dune" and display ONLY
-- Book title
-- ISBN number
-- Publisher name
-- Retail price
SELECT title, e.isbn, name, retail FROM stock s JOIN editions e ON s.isbn = e.isbn JOIN books b ON e.book_id = b.id JOIN publishers p ON p.id = e.publisher_id WHERE title = 'Dune';
-- Find all shipments sorted by ship date display ONLY:
-- Customer first name
-- Customer last name
-- ship date
-- book title
SELECT first_name, last_name, ship_date, title FROM customers c JOIN shipments s ON c.id = s.customer_id JOIN editions e ON s.isbn = e.isbn JOIN books b ON e.book_id = b.id ORDER BY ship_date ASC;

-- Grouping and Counting
-- Get the COUNT of all books
SELECT COUNT(*) FROM books;
-- Get the COUNT of all Locations
SELECT COUNT(location) FROM subjects;
-- Get the COUNT of each unique location in the subjects table. Display the count and the location name. (hint: requires GROUP BY).
SELECT location, COUNT(DISTINCT location) FROM subjects GROUP BY location;
-- List all books. Display the book_id, title, and a count of how many editions each book has. (hint: requires GROUP BY and JOIN)
SELECT book_id, title, COUNT(edition) FROM books b JOIN editions e ON b.id = e.book_id GROUP BY title, book_id;
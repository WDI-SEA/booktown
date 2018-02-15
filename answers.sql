-- Order
--
-- Find all subjects sorted by subject
--booktown=# SELECT * FROM subjects ORDER BY subject;
--
-- Find all subjects sorted by location
--booktown=# SELECT * FROM subjects ORDER BY location;
--
-- Where
--
-- Find the book "Little Women"
--booktown=# SELECT * FROM books WHERE title = 'Little Women';
--
-- Find all books containing the word "Python"
--booktown=# SELECT * FROM books WHERE title LIKE '%Python%';
--
-- Find all subjects with the location "Main St" sort them by subject
--booktown=# SELECT * FROM subjects WHERE location = 'Main St' ORDER BY subject;
--
-- Joins
--
-- Find all books about Computers and list ONLY the book titles
--SELECT title FROM books JOIN subjects ON books.subject_id = subjects.id WHERE books.subject_id = 4;
--
-- Find all books and display a result table with ONLY the following columns:
-- Book title
-- Author's first name
-- Author's last name
-- Book subject
--SELECT b.title, a.first_name, a.last_name, s.subject
FROM books b
INNER JOIN authors a ON b.author_id = a.id
INNER JOIN subjects s ON b.subject_id = s.id;
--
-- Find all books that are listed in the stock table:
-- Sort them by retail price (most expensive first)
-- Display ONLY: title and price
--SELECT b.title, s.retail
FROM editions e
INNER JOIN stock s ON e.isbn = s.isbn
INNER JOIN books b ON e.book_id = b.id
ORDER BY retail DESC;
--
-- Find the book "Dune" and display ONLY the following columns:
-- Book title
-- ISBN number
-- Publisher name
-- Retail price
--SELECT b.title, e.isbn, p.name, s.retail
FROM books b
INNER JOIN editions e ON b.id = e.book_id
INNER JOIN publishers p ON e.publisher_id = p.id
INNER JOIN stock s ON e.isbn = s.isbn
WHERE b.title = 'Dune'
ORDER BY retail DESC;
--
-- Find all shipments sorted by ship date display a result table with ONLY the following columns:
-- Customer first name
-- Customer last name
-- ship date
-- book title
--SELECT c.first_name, c.last_name, s.ship_date, b.title
FROM shipments s
INNER JOIN customers c ON s.customer_id = c.id
INNER JOIN editions e ON s.isbn = e.isbn
INNER JOIN books b ON e.book_id = b.id
ORDER BY ship_date DESC;
--
-- Grouping and Counting
--
-- Get the COUNT of all books
SELECT COUNT (*) FROM books;
--
-- Get the COUNT of all Locations
SELECT COUNT (location) FROM subjects;
--
-- Get the COUNT of each unique location in the subjects table. Display the count and the location name. (hint: requires GROUP BY).
SELECT location, COUNT (location) FROM subjects
GROUP BY location;
--
-- List all books. Display the book_id, title, and a count of how many editions each book has. (hint: requires GROUP BY and JOIN)
SELECT b.id, b.title, COUNT(e.edition)
FROM books b
INNER JOIN editions e ON b.id = e.book_id
GROUP BY e.edition, b.id;

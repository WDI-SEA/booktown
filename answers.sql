Answers

-- Order
-- Find all subjects sorted by subject
SELECT * FROM subjects ORDER BY subjects;
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
SELECT title FROM books JOIN subjects ON subjects.id = books.subject_id
WHERE subjects.subject = 'Computers';
-- Find all books and display a result table with ONLY the following columns
-- Book title
-- Author's first name
-- Author's last name
-- Book subject
SELECT b.title, a.first_name, a.last_name, s.subject
FROM books b
JOIN subjects s ON s.id = b.subject_id
JOIN authors a ON a.id = b.author_id;
-- Find all books that are listed in the stock table
-- Sort them by retail price (most expensive first)
-- Display ONLY: title and price
SELECT b.title, s.retail FROM stock s JOIN editions e ON s.isbn = e.isbn
JOIN books b ON e.book_id = b.id ORDER BY s.retail DESC;
-- Find the book "Dune" and display ONLY the following columns
-- Book title
-- ISBN number
-- Publisher name
-- Retail price
SELECT b.title AS Book_Title, e.isbn AS ISBN_Number,
p.name AS Publisher_Name, s.retail AS Retail_Price FROM books b
JOIN editions e ON b.id = e.book_id
JOIN stock s ON e.isbn = s.isbn
JOIN publishers p ON e.publisher_id = p.id
WHERE b.title = 'Dune';
-- Find all shipments sorted by ship date display a result table with ONLY the following columns:
-- Customer first name
-- Customer last name
-- ship date
-- book title
SELECT c.first_name AS customer_first_name,
c.last_name AS customer_last_name,
s.ship_date AS ship_date,
b.title AS title
FROM shipments s
JOIN customers c ON c.id = s.customer_id
JOIN editions e ON e.isbn = s.isbn
JOIN books b ON b.id = e.book_id
ORDER BY s.ship_date;

-- Grouping and Counting
-- Get the COUNT of all books
SELECT COUNT(*) FROM books;
-- Get the COUNT of all Locations
SELECT COUNT(DISTINCT location) FROM subjects;
-- Get the COUNT of each unique location in the subjects table. Display the count and the location name. (hint: requires GROUP BY).
SELECT DISTINCT location, COUNT(location) from subjects
GROUP BY location;
-- List all books. Display the book_id, title, and a count of how many editions each book has. (hint: requires GROUP BY and JOIN)
SELECT b.id AS book_id, b.title, COUNT(e.book_id) AS number_of_editions
FROM books b
JOIN editions e ON b.id = e.book_id
GROUP BY b.id;

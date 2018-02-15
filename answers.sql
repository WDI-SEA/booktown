-- Find all subjects sorted by subject
SELECT subject FROM subjects
ORDER BY subject;

-- Find all subjects sorted by location
SELECT subject FROM subjects
ORDER BY location;

WHERE
-- Find the book "Little Women"
SELECT * FROM books
WHERE title = 'Little Women';

-- Find all books containing the word "Python"

SELECT * FROM books
WHERE title LIKE 'Python%';

-- Find all subjects with the location "Main St" sort them by subject
SELECT subject FROM subjects
WHERE location = 'Main St'
ORDER BY subject;

-- Find all books about Computers and list ONLY the book titles

SELECT books.title
FROM books
JOIN subjects ON subjects.id = books.subject_id
WHERE subjects.subject = 'Computers';

-- Find all books and display a result table with ONLY the following columns
-- Book title
-- Author's first name
-- Author's last name
-- Book subject

SELECT b.title, a.first_name, a.last_name, s.subject
FROM books b
JOIN authors a ON a.id = b.author_id
JOIN subjects s ON s.id = b.subject_id;

-- Find all books that are listed in the stock table
-- Sort them by retail price (most expensive first)
-- Display ONLY: title and price

SELECT books.title, stock.retail
FROM stock
JOIN editions ON editions.isbn = stock.isbn
JOIN books ON books.id = editions.book_id
ORDER BY stock.retail DESC;

-- Find the book "Dune" and display ONLY the following columns
-- Book title
-- ISBN number
-- Publisher name
-- Retail price

SELECT books.title, editions.isbn, publishers.name, stock.retail
FROM stock
JOIN editions ON editions.isbn = stock.isbn
JOIN books ON books.id = editions.book_id
JOIN publishers ON publishers.id = editions.publisher_id
WHERE book.title = 'DUNE';


-- Find all shipments sorted by ship date display a result table with ONLY the following columns:
-- Customer first name
-- Customer last name
-- ship date
-- book title

SELECT c.first_name, c.last_name, s.ship_date, b.title
FROM shipments s
JOIN customers c ON c.id = s.customer_id
JOIN editions e ON e.isbn = s.isbn
JOIN books b ON b.id = e.book_id
ORDER BY s.ship_date;


-- Get the COUNT of all books
SELECT COUNT(*) FROM books;


-- Get the COUNT of all Locations
SELECT COUNT(DISTINCT location) FROM subjects;

-- Get the COUNT of each unique location in the subjects table. Display the count and the location name. (hint: requires GROUP BY).
SELECT location, COUNT(location)
FROM subjects
GROUP BY location;


-- List all books. Display the book_id, title, and a count of how many editions each book has. (hint: requires GROUP BY and JOIN)

SELECT b.id, b.title, COUNT(DISTINCT e.edition) AS Editions_Available
FROM editions e
JOIN books b ON b.id = e.book_id
GROUP BY b.id;

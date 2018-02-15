-- ### Order
--
-- * Find all subjects sorted by subject
SELECT * FROM subjects ORDER BY subjects;
-- * Find all subjects sorted by location
SELECT * FROM subjects ORDER BY location;
--
--
-- ### Where
--
-- * Find the book "Little Women"
SELECT title FROM books WHERE title='Little Women';
SELECT * FROM books WHERE title='Little Women';
-- * Find all books containing the word "Python"
SELECT * FROM books WHERE title LIKE '%Python%';
-- * Find all subjects with the location "Main St" sort them by subject
SELECT * FROM subjects WHERE location='Main St' ORDER BY subjects;
--
--
-- ### Joins
--
-- * Find all books about Computers and list ONLY the book titles
SELECT title
FROM books
INNER JOIN subjects
ON books.subject_id = subjects.id
WHERE subject='Computers';
-- * Find all books and display a result table with ONLY the following columns
-- 	* Book title
-- 	* Author's first name
-- 	* Author's last name
-- 	* Book subject
SELECT b.title, s.subject, a.first_name, a.last_name
FROM books b
INNER JOIN subjects s
ON b.subject_id = s.id
INNER JOIN authors a
ON b.author_id=a.id;
-- * Find all books that are listed in the stock table
-- 	* Sort them by retail price (most expensive first)
-- 	* Display ONLY: title and price
SELECT b.title, s.retail
FROM ((books b
INNER JOIN editions e
ON b.id=e.book_id)
INNER JOIN stock s
ON e.isbn=s.isbn);
-- * Find the book "Dune" and display ONLY the following columns
-- 	* Book title
-- 	* ISBN number
-- 	* Publisher name
-- 	* Retail price
SELECT b.title, e.isbn, p.name, s.retail
FROM (((books b
INNER JOIN editions e
ON b.id=e.book_id)
INNER JOIN stock s
ON e.isbn=s.isbn)
INNER JOIN publishers p
ON e.publisher_id=p.id)
WHERE b.title='Dune';
-- * Find all shipments sorted by ship date display a
-- result table with ONLY the following columns:
-- 	* Customer first name
-- 	* Customer last name
-- 	* ship date
-- 	* book title
SELECT c.first_name AS "Customer First Name",
c.last_name AS "Customer Last Name",
s.ship_date AS "Ship Date",
b.title AS "Book Title"
FROM shipments s
INNER JOIN customers c ON s.customer_id=c.id
INNER JOIN editions e ON s.isbn=e.isbn
INNER JOIN books b ON b.id=e.book_id;
--
--
-- ### Grouping and Counting
--
-- * Get the COUNT of all books
SELECT COUNT(*) FROM books;
-- * Get the COUNT of all Locations
SELECT COUNT(location) FROM subjects;
-- * Get the COUNT of each unique location in the subjects table.
-- Display the count and the location name. (hint: requires GROUP BY).
SELECT COUNT(location), location
FROM subjects
GROUP BY location;
-- * List all books. Display the book_id, title, and a count of how many
-- editions each book has. (hint: requires GROUP BY and JOIN)
SELECT count(e.edition) AS "Edition Count", b.id AS "Book ID", b.title AS "Title"
FROM books b
INNER JOIN editions e ON b.id=e.book_id GROUP BY b.id;

-- ## Queries

-- Complete the following exercises to practice using SQL.

-- ### Order
-- * Find all subjects sorted by subject
ELECT subject FROM subjects;

-- * Find all subjects sorted by location
SELECT location FROM subjects;
-- ### Where
-- * Find the book "Little Women"
SELECT title FROM books WHERE title = 'Little Women';
-- * Find all books containing the word "Python"
SELECT title FROM books WHERE title LIKE '%Python%';
-- * Find all subjects with the location "Main St" sort them by subject
SELECT * FROM subjects WHERE location = 'Main St';

-- ### Joins

-- * Find all books about Computers and list ONLY the book titles
SELECT titles FROM books WHERE subjects.id = 4;
SELECT books, title FROM books, subject WHERE books.subject_id = 'Computers';

-- * Find all books and display a result table with ONLY the following columns
-- 	* Book title
-- 	* Author's first name
-- 	* Author's last name
-- 	* Book subject

SELECT books.title, authors.first_name, authors.last_name, subjects.subject FROM books, authors, subjects;



-- * Find all books that are listed in the stock table
-- 	* Sort them by retail price (most expensive first)
-- 	* Display ONLY: title and price
SELECT books.title, stock.retail, FROM stock, editions, books WHERE stock.isbn = editions.isbn AND books.id = editions.book_id ORDER BY retail DESC;


-- * Find the book "Dune" and display ONLY the following columns
-- 	* Book title
-- 	* ISBN number
-- 	* Publisher name
-- 	* Retail price

SELECT books.title, editions.isbn, stock.retail, publishers.name FROM editions, books, stock, publishers WHERE stock.isbn = editions.isbn AND books.id = editions.book_id AND books.title = 'Dune';


-- * Find all shipments sorted by ship date display a result table with ONLY the following columns:
-- 	* Customer first name
-- 	* Customer last name
-- 	* ship date
-- 	* book title
SELECT books.title, shipments.ship_date, customers.last_name, customers.first_name FROM books, customers, shipments, editions WHERE customers.id = shipments.customer_id AND books.id = editions.book_id;


-- ### Grouping and Counting

-- * Get the COUNT of all books
SELECT COUNT(*) FROM books;
-- * Get the COUNT of all Locations
SELECT COUNT(subjects.location) FROM subjects;
-- * Get the COUNT of each unique location in the subjects table. Display the count and the location name. (hint: requires GROUP BY).
SELECT DISTINCT location FROM subjects;
SELECT location, COUNT (location) FROM subjects GROUP BY location;

-- * List all books. Display the book_id, title, and a count of how many editions each book has. (hint: requires GROUP BY and JOIN)

SELECT books.id, books.title, COUNT(editions.book_id) FROM books, editions WHERE books.id = editions.book_id GROUP BY books.id;






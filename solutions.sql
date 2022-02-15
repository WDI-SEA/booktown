-- ### Order

--\i booktown/booktown.sql

-- 1. Find all subjects sorted by subject
SELECT * FROM subjects;
-- 2. Find all subjects sorted by location
SELECT * FROM subjects
ORDER BY location;
-- ### Where
-- 3. Find the book "Little Women"
SELECT * FROM books;
-- 4. Find all books containing the word "Python"
SELECT * FROM books
WHERE books.title LIKE '%Python'; 


-- 5. Find all subjects with the location "Main St" sort them by subject
SELECT * FROM subjects
WHERE location='Main St';

-- ### Joins

-- 6. Find all books about Computers and list ONLY the book titles

-- SELECT * FROM books
-- WHERE subject_id='4';

SELECT title FROM books
INNER JOIN subjects
ON books.subject_id=subjects.id
WHERE subject = 'Computers';
-- 7. Find all books and display a result table with ONLY the following columns
-- 	* Book title
-- 	* Author's first name
-- 	* Author's last name
-- 	* Book subject
SELECT authors.last_name, authors.first_name, books.title, subjects.subject FROM authors
INNER JOIN books
ON authors.id=books.author_id
INNER JOIN subjects 
ON subjects.id=books.subject_id;

-- 8. Find all books that are listed in the stock table
-- 	* Sort them by retail price (most expensive first)
-- 	* Display ONLY: title and price
-- editions.isbn stock.isbn 
-- SELECT isbn FROM public.stock
SELECT books.title, stock.cost
FROM books
INNER JOIN editions
ON editions.book_id=books.id
INNER JOIN stock
on editions.isbn=stock.ISBN
ORDER BY retail DESC;
-- INNER JOIN books 
-- ON books.title=editions.isbn;



-- 9. Find the book "Dune" and display ONLY the following columns
-- 	* Book title
-- 	* ISBN number
-- 	* Publisher name
-- 	* Retail price

-- SELECT books.title, stock.isbn, publishers.name, stock.retail
-- FROM books
-- INNER JOIN editions
-- ON editions.isbn=stock.isbn
-- INNER JOIN editions
-- ON stock.isbn=stock.retail
-- INNER JOIN publishers
-- ON publishers.id=publisher_id
-- INNER JOIN book
-- on editions.book_id=books.id
-- WHERE title = 'Dune';

SELECT books.title, stock.isbn, publishers.name, stock.retail 
FROM books
INNER JOIN editions
ON editions.book_id=books.id 
INNER JOIN publishers 
ON publishers.id=editions.publisher_id 
INNER JOIN stock 
ON stock.isbn=editions.isbn
WHERE title = 'Dune';

-- 10. Find all shipments sorted by ship date display a result table with ONLY the following columns:
-- 	* Customer first name
-- 	* Customer last name
-- 	* ship date
-- 	* book title

SELECT customers.last_name, customers.first_name, shipments.ship_date, books.title
FROM customers 
INNER JOIN shipments
ON customers.id=shipments.customer_id
INNER JOIN editions 
ON shipments.isbn=editions.isbn 
INNER JOIN books 
ON books.id=editions.book_id

-- ### Grouping and Counting

-- 11. Get the COUNT of all books
SELECT SUM(stock) FROM stock;
-- 12. Get the COUNT of all Locations
SELECT COUNT(subjects.location) FROM subjects;
-- 13. Get the COUNT of each unique location in the subjects table. Display the count and the location name. (hint: requires GROUP BY).

SELECT subjects.location, COUNT(subjects.location) FROM subjects GROUP BY subjects.location;
-- 14. List all books. Display the book_id, title, and a count of how many editions each book has. (hint: requires GROUP BY and JOIN)
SELECT editions.book_id,  COUNT(editions.edition), title FROM books
INNER JOIN editions
ON books.id=editions.book_id;
WHERE title = (
  SELECT title FROM books
)
GROUP BY editions.edition


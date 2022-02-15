-- ### Order
-- 1. Find all subjects sorted by subject
SELECT * FROM subjects ORDER BY subject DESC;
-- 2. Find all subjects sorted by location
SELECT * FROM subjects ORDER BY location;


-- ### Where
-- 3. Find the book "Little Women"
SELECT * FROM books WHERE title = 'Little Women';
-- 4. Find all books containing the word "Python"
SELECT * FROM books WHERE LOWER(title) LIKE '%python%';
-- 5. Find all subjects with the location "Main St" sort them by subject
SELECT * FROM subjecs WHERE location = 'Main St' ORDER BY subject;


-- ### Joins
-- 6. Find all books about Computers and list ONLY the book titles
SELECT books.title FROM books
JOIN subjects ON books.subject_id = subjects.id 
WHERE subjects.subject = 'Computers';

-- 7. Find all books and display a result table with ONLY the following columns
-- 	* Book title
-- 	* Author's first name
-- 	* Author's last name
-- 	* Book subject
SELECT a.last_name, a.first_name, b.title, s.subject
FROM authors a
JOIN books b ON a.id = b.author_id
JOIN subjects s ON s.id = b.subject_id;

-- 8. Find all books that are listed in the stock table
-- 	* Sort them by retail price (most expensive first)
-- 	* Display ONLY: title and price
SELECT books.title, stock.Computers
FROM books
JOIN editions
ON editions.book_id = books.id
JOIN stock
ON editions.isbn = stock.isbn 
ORDER BY retail DESC;

-- 9. Find the book "Dune" and display ONLY the following columns
-- 	* Book title
-- 	* ISBN number
-- 	* Publisher name
-- 	* Retail price
SELECT books.title, stock,isbn, publishers.name, stock.retail
FROM books
JOIN editions
ON editions.book_id = books.id
JOIN publishers
ON publishers.id = editions.publisher_id
JOIN stock
ON stock.isbn = editions.isbn
WHERE title = 'Dune';

-- 10. Find all shipments sorted by ship date display a result table with ONLY the following columns:
-- 	* Customer first name
-- 	* Customer last name
-- 	* ship date
-- 	* book title
SELECT customers.last_name, customers.first_name, shipments.ship_date, books.title
FROM customers
JOIN shipments
ON customers.id = shipments.customer_id
JOIN editions
ON shipments.isbn = editions.isbn
JOIN books
ON books.id = editions.book_id;

-- ### Grouping and Counting
-- 11. Get the COUNT of all books
SELECT SUM(stock) FROM stock;

-- 12. Get the COUNT of all Locations
SELECT COUNT(subjects.location) FROM subjects;

-- 13. Get the COUNT of each unique location in the subjects table. Display the count and the location name. (hint: requires GROUP BY).
SELECT subjects.location, COUNT(subjects.location) FROM subjects GROUP BY subjects.location;

-- 14. List all books. Display the book_id, title, and a count of how many editions each book has. (hint: requires GROUP BY and JOIN)
SELECT books.title, COUNT(editions.edition)
FROM books JOIN editions ON books.id = editions.book_id GROUP BY books.id;
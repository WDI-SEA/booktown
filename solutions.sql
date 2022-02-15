-- ### Order
-- 1. Find all subjects sorted by subject
SELECT subject FROM subjects ORDER BY subject ASC;
-- 2. Find all subjects sorted by location
SELECT subject, location FROM subjects ORDER BY location ASC;

-- ### Where
-- 3. Find the book "Little Women"
SELECT * FROM books WHERE title = 'Little Women';
-- 4. Find all books containing the word "Python"
SELECT * FROM books WHERE title LIKE '%python%' OR title LIKE '%Python%'
-- 5. Find all subjects with the location "Main St" sort them by subject
SELECT subject, location FROM subjects WHERE location = 'Main St' ORDER BY subject ASC;


-- ### Joins

-- 6. Find all books about Computers and list ONLY the book titles
SELECT title FROM books 
JOIN subjects ON books.subject_id = subjects.id
WHERE subject_id = 4;
-- ** Computer ID is 4 **

-- 7. Find all books and display a result table with ONLY the following columns
SELECT books.title, authors.first_name, authors.last_name, subjects.subject FROM books
JOIN subjects ON subjects.id = books.subject_id
JOIN authors ON authors.id = books.author_id;
-- 	* Book title
-- 	* Author's first name (books - author_id)
-- 	* Author's last name (books- - author_id)
-- 	* Book subject (subjects - subject_id)
-- 8. Find all books that are listed in the stock table
SELECT books.title, stock.retail FROM stock
JOIN editions ON editions.isbn = stock.isbn
JOIN books ON editions.book_id = books.id
WHERE stock > 0
ORDER BY stock.retail DESC;
-- 	* Sort them by retail price (most expensive first)
-- join with isbn
-- editions has : isbn and book_id
-- 	* Display ONLY: title and price
-- 9. Find the book "Dune" and display ONLY the following columns
SELECT books.title, editions.isbn, stock.retail, publishers.name
FROM stock
JOIN editions on editions.isbn = stock.isbn
JOIN books on books.id = editions.book_id
JOIN publishers on publishers.id = editions.publisher_id
WHERE title = 'Dune';
-- 	* Book title
-- 	* ISBN number
-- 	* Publisher name -- editions has publisher_id, book_id, isbn
-- 	* Retail price
-- 10. Find all shipments sorted by ship date display a result table with ONLY the following columns:
SELECT customers.first_name, customers.last_name, shipments.ship_date, books.title
FROM customers
JOIN shipments ON shipments.customer_id = customers.id
JOIN editions ON editions.isbn = shipments.isbn
JOIN books ON books.id = editions.book_id
ORDER BY ship_date ASC;
-- 	* Customer first name (customers - id, last_name, first_name)
-- 	* Customer last name
-- 	* ship date (shipments - id, customer_id, isbn, ship_date)
-- 	* book title ()

-- ### Grouping and Counting

-- 11. Get the COUNT of all books
SELECT COUNT(title) FROM books;
-- 12. Get the COUNT of all Locations
SELECT COUNT(location) FROM subjects
WHERE location IS NOT NULL;
-- 13. Get the COUNT of each unique location in the subjects table. Display the count and the location name. (hint: requires GROUP BY).
SELECT location, count(location) FROM subjects
GROUP BY location;
-- 14. List all books. Display the book_id, title, and a count of how many editions each book has. (hint: requires GROUP BY and JOIN)
SELECT books.id, books.title, COUNT(editions.edition) FROM editions
JOIN books ON books.id = editions.book_id
GROUP BY id;
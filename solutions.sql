-- ### Order
-- 1. Find all subjects sorted by subject
booktown=# SELECT * FROM subjects;
-- 2. Find all subjects sorted by location
booktown=# SELECT * FROM subjects ORDER BY location;
-- ### Where
-- 3. Find the book "Little Women"
booktown=# SELECT * FROM books WHERE title='Little Women';
-- 4. Find all books containing the word "Python"
booktown=# SELECT * FROM books WHERE title LIKE '%Python%';
-- 5. Find all subjects with the location "Main St" sort them by subject
booktown=# SELECT * FROM subjects WHERE location='Main St' ORDER BY subject;


-- ### Joins

-- 6. Find all books about Computers and list ONLY the book titles
booktown=# SELECT title FROM books WHERE subject_id=4;
-- 7. Find all books and display a result table with ONLY the following columns
-- 	* Book title
-- 	* Author's first name
-- 	* Author's last name
-- 	* Book subject
booktown=# SELECT books.title, authors.first_name, authors.last_name, subjects.subject
FROM books
INNER JOIN subjects ON subjects.id=books.subject_id
INNER JOIN authors ON authors.id=books.author_id;
-- 8. Find all books that are listed in the stock table
-- 	* Sort them by retail price (most expensive first)
-- 	* Display ONLY: title and price
booktown=# SELECT books.title, stock.retail FROM books
INNER JOIN editions ON editions.book_id=books.id
INNER JOIN stock ON stock.isbn=editions.isbn
ORDER BY stock.retail DESC;
-- 9. Find the book "Dune" and display ONLY the following columns
booktown=# SELECT books.title, editions.isbn, publishers.name, stock.retail FROM books
INNER JOIN editions ON editions.book_id=books.id
INNER JOIN publishers ON editions.publisher_id=publishers.id
INNER JOIN stock ON stock.isbn=editions.isbn WHERE editions.isbn='044100590X';
-- 	* Book title
-- 	* ISBN number
-- 	* Publisher name
-- 	* Retail price
-- 10. Find all shipments sorted by ship date display a result table with ONLY the following columns:
booktown=# SELECT customers.first_name, customers.last_name, shipments.ship_date, books.title FROM customers
INNER JOIN shipments ON shipments.customer_id=customers.id
INNER JOIN editions ON editions.isbn=shipments.isbn
INNER JOIN books ON editions.book_id=books.id ORDER BY shipments.ship_date;
-- 	* Customer first name
-- 	* Customer last name
-- 	* ship date
-- 	* book title

-- ### Grouping and Counting

-- 11. Get the COUNT of all books
booktown=# SELECT SUM(stock) FROM stock;
-- 12. Get the COUNT of all Locations
booktown=# SELECT COUNT(location) FROM subjects;
-- 13. Get the COUNT of each unique location in the subjects table. Display the count and the location name. (hint: requires GROUP BY).
booktown=# SELECT location, COUNT(location) FROM subjects GROUP BY location;
-- 14. List all books. Display the book_id, title, and a count of how many editions each book has. (hint: requires GROUP BY and JOIN)
SELECT books.id, books.title, COUNT(editions.edition) FROM editions 
INNER JOIN books ON books.id=editions.book_id GROUP BY books.id;
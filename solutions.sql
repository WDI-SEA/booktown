-- ### Order
-- 1. Find all subjects sorted by subject
booktown=# SELECT * FROM subjects ORDER BY subject;
-- 2. Find all subjects sorted by location
booktown=# SELECT * FROM subjects ORDER BY location; 

-- ### Where
-- 3. Find the book "Little Women"
booktown=# SELECT * FROM books WHERE title = 'Little Women';
-- 4. Find all books containing the word "Python"
booktown=# SELECT * FROM books WHERE title LIKE '%Python%';
-- 5. Find all subjects with the location "Main St" sort them by subject
booktown=# SELECT * FROM subjects WHERE location='Main St' ORDER BY subject;


-- ### Joins

-- 6. Find all books about Computers and list ONLY the book titles
booktown=# SELECT books.title FROM books INNER JOIN subjects ON subjects.id=books.subject_id WHERE subjects.id=4;
-- 7. Find all books and display a result table with ONLY the following columns
-- 	* Book title
-- 	* Author's first name
-- 	* Author's last name
-- 	* Book subject
SELECT books.title, authors.first_name, authors.last_name, books.subject_id FROM books INNER JOIN authors ON books.author_id = authors.id;
-- 8. Find all books that are listed in the stock table
-- 	* Sort them by retail price (most expensive first)
-- 	* Display ONLY: title and price
booktown=# SELECT books.title, 
stock.retail
FROM editions
INNER JOIN stock ON stock.isbn = editions.isbn
INNER JOIN books ON editions.book_id = books.id ORDER BY retail DESC;
-- 9. Find the book "Dune" and display ONLY the following columns
-- 	* Book title
-- 	* ISBN number
-- 	* Publisher name
-- 	* Retail price
booktown=# SELECT books.title,
stock.isbn,
stock.retail,
publishers.name
FROM editions
INNER JOIN books ON books.id = editions.book_id
INNER JOIN publishers ON publishers.id=editions.publisher_id
INNER JOIN stock ON stock.isbn=editions.isbn
booktown-# WHERE title = 'Dune';

-- 10. Find all shipments sorted by ship date display a result table with ONLY the following columns:
-- 	* Customer first name
-- 	* Customer last name
-- 	* ship date
-- 	* book title
SELECT customers.first_name, 
customers.last_name, 
shipments.ship_date, 
books.title
FROM shipments
INNER JOIN customers ON customers.id = shipments.customer_id
INNER JOIN editions ON editions.isbn = shipments.isbn
INNER JOIN books ON books.id = editions.book_id ORDER BY ship_date DESC;
-- ### Grouping and Counting

-- 11. Get the COUNT of all books
SELECT SUM(stock)
FROM stock;
-- 12. Get the COUNT of all Locations
SELECT COUNT(location) FROM subjects;
-- 13. Get the COUNT of each unique location in the subjects table. Display the count and the location name. (hint: requires GROUP BY).
SELECT COUNT(location), subjects.location
	FROM subjects
	GROUP BY location;
-- 14. List all books. Display the book_id, title, and a count of how many editions each book has. (hint: requires GROUP BY and JOIN)
SELECT books.id, books.title, COUNT(books.id) FROM editions INNER JOIN books ON editions.book_id = books.id GROUP BY id;

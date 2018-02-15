-- ### Order
-- * Find all subjects sorted by subject
SELECT * FROM subjects ORDER BY subject;
-- * Find all subjects sorted by location
SELECT * FROM subjects ORDER BY location;

-- ### Where
-- * Find the book "Little Women"
SELECT * FROM books WHERE title = 'Little Women';
-- * Find all books containing the word "Python"
SELECT * FROM books WHERE title LIKE '%Python%';
-- * Find all subjects with the location "Main St" sort them by subject
SELECT subject FROM subjects WHERE location = 'Main St' GROUP BY subject;


-- ### Joins

-- * Find all books about Computers and list ONLY the book titles
SELECT title FROM books JOIN subjects ON books.subject_id = subjects.id WHERE subjects.subject LIKE '%Computers%';
-- * Find all books and display a result table with ONLY the following columns
-- 	* Book title
-- 	* Author's first name
-- 	* Author's last name
-- 	* Book subject
SELECT title, authors.first_name, authors.last_name, subjects.subject FROM books JOIN subjects ON books.subject_id = subjects.id JOIN authors ON books.author_id = authors.id;

-- * Find all books that are listed in the stock table
-- 	* Sort them by retail price (most expensive first)
-- 	* Display ONLY: title and price
SELECT title, cost FROM stock JOIN editions ON stock.isbn = editions.isbn JOIN books ON editions.book_id = books.id ORDER BY cost DESC;

-- * Find the book "Dune" and display ONLY the following columns
-- 	* Book title
-- 	* ISBN number
-- 	* Publisher name
-- 	* Retail price
SELECT title, editions.isbn, publishers.name, stock.cost FROM books JOIN editions ON books.id = editions.book_id JOIN stock ON editions.isbn = stock.isbn JOIN publishers ON editions.publisher_id = publishers.id WHERE title = 'Dune';

-- * Find all shipments sorted by ship date display a result table with ONLY the following columns:
-- 	* Customer first name
-- 	* Customer last name
-- 	* ship date
-- 	* book title
SELECT first_name, last_name, books.title, shipments.ship_date FROM customers JOIN shipments ON customers.id = shipments.customer_id JOIN editions ON shipments.isbn = editions.isbn JOIN books ON editions.book_id = books.id;

-- ### Grouping and Counting

-- * Get the COUNT of all books
SELECT COUNT(*) FROM books;
-- * Get the COUNT of all Locations
SELECT COUNT(location) FROM subjects;
-- * Get the COUNT of each unique location in the subjects table. Display the count and the location name. (hint: requires GROUP BY).
SELECT DISTINCT location, COUNT(location) FROM subjects GROUP BY location;
-- * List all books. Display the book_id, title, and a count of how many editions each book has. (hint: requires GROUP BY and JOIN)
SELECT id, title, COUNT(edition) FROM books JOIN editions ON books.id = editions.book_id GROUP BY id;





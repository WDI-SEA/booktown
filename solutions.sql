-- ### Order
-- 1. Find all subjects sorted by subject
SELECT * FROM subjects ORDER BY subject;
-- 2. Find all subjects sorted by location
SELECT * FROM subjects ORDER BY location;
-- ### Where
-- 3. Find the book "Little Women"
SELECT * FROM books WHERE title = 'Little Women';
-- 4. Find all books containing the word "Python"
SELECT * FROM books WHERE title LIKE '%Python%';
-- 5. Find all subjects with the location "Main St" sort them by subject
SELECT * FROM subjects where location = 'Main St';

-- ### Joins

-- 6. Find all books about Computers and list ONLY the book titles
SELECT title FROM books WHERE subject_id=4;
-- 7. Find all books and display a result table with ONLY the following columns
-- 	* Book title
-- 	* Author's first name
-- 	* Author's last name
-- 	* Book subject
 SELECT books.title, authors.first_name, authors.last_name, subjects.subject FROM books  JOIN authors ON books.author_id=authors.id JOIN subjects ON books.subject_id=subjects.id;
 SELECT books.title, authors.first_name, authors.last_name, subjects.subject FROM books  JOIN authors ON books.author_id=authors.id JOIN subjects ON books.subject_id=subjects.id

-- 8. Find all books that are listed in the stock table
-- 	* Sort them by retail price (most expensive first)
-- 	* Display ONLY: title and price
select books.title, stock.retail from editions Join books on editions.book_id = books.id Join stock on editions.isbn=stock.isbn ORDER BY retail;
-- 9. Find the book "Dune" and display ONLY the following columns
-- 	* Book title
-- 	* ISBN number
-- 	* Publisher name
-- 	* Retail price
 SELECT books.title, editions.isbn, publishers.name, stock.retail FROM books JOIN editions ON books.id=editions.book_id JOIN          stock ON stock.isbn = editions.isbn JOIN publishers ON publishers.id = editions.publisher_id WHERE books.title = 'Dune';

-- 10. Find all shipments sorted by ship date display a result table with ONLY the following columns:
-- 	* Customer first name
-- 	* Customer last name
-- 	* ship date
-- 	* book title
SELECT customers.first_name, customers.last_name, shipments.ship_date, books.title FROM customers JOIN shipments ON shipments.customer_id = customers.id JOIN editions ON editions.isbn = shipments.isbn JOIN books ON books.id = editions.book_id ORDER BY shipments.ship_date;

-- ### Grouping and Counting

-- 11. Get the COUNT of all books
SELECT COUNT(title) FROM books;
-- 12. Get the COUNT of all Locations
SELECT COUNT(location) FROM subjects;
-- 13. Get the COUNT of each unique location in the subjects table. Display the count and the location name. (hint: requires GROUP BY).
SELECT COUNT(location) FROM subjects GROUP BY location;
-- 14. List all books. Display the book_id, title, and a count of how many editions each book has. (hint: requires GROUP BY and JOIN)
 SELECT editions.book_id, books.title, COUNT(book_id)  FROM editions JOIN books ON editions.book_id = books.id GROUP BY books.id, editions.book_id;
 
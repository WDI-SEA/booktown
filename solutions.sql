-- ### Order
-- 1. Find all subjects sorted by subject
SELECT * FROM books
JOIN subjects ON books.subject_id = subjects.id; ???
--not sure what we're looking for here?
SELECT subject FROM subjects ORDER BY subject;
-- 2. Find all subjects sorted by location
SELECT subject FROM subjects ORDER BY location;

-- ### Where
-- 3. Find the book "Little Women"
SELECT * FROM books WHERE title = 'Little Women'
-- 4. Find all books containing the word "Python"
SELECT * FROM books WHERE title LIKE '%Python%'
-- 5. Find all subjects with the location "Main St" sort them by subject
SELECT * FROM subjects WHERE location LIKE '%Main St%' ORDER BY subject;


-- ### Joins

-- 6. Find all books about Computers and list ONLY the book titles
SELECT * FROM subjects;
--to learn that computers is subject 4
SELECT title FROM books WHERE subject_id = 4; --OR
--'one line' version  using nested selectors
SELECT title FROM books WHERE subject_id =(
    SELECT id FROM subjects WHERE subject = 'Computers'
)
-- 7. Find all books and display a result table with ONLY the following columns
-- 	* Book title
-- 	* Author's first name
-- 	* Author's last name
-- 	* Book subject
SELECT title, authors.first_name, authors.last_name, subjects.subject FROM books
JOIN authors ON books.author_id = authors.id
JOIN subjects ON books.subject_id = subjects.id;

-- 8. Find all books that are listed in the stock table
-- 	* Sort them by retail price (most expensive first)
-- 	* Display ONLY: title and price
SELECT title, stock.retail FROM books
JOIN editions ON books.id = editions.book_id
JOIN stock ON editions.isbn = stock.isbn;


-- 9. Find the book "Dune" and display ONLY the following columns
-- 	* Book title
-- 	* ISBN number
-- 	* Publisher name
-- 	* Retail price
SELECT title, stock.isbn, publishers.name, stock.retail FROM books
JOIN editions ON books.id = editions.book_id
JOIN stock ON editions.isbn = stock.isbn
JOIN publishers ON publishers.id = editions.publisher_id
WHERE title = 'Dune' LIMIT 1;

-- 10. Find all shipments sorted by ship date display a result table with ONLY the following columns:
-- 	* Customer first name
-- 	* Customer last name
-- 	* ship date
-- 	* book title
SELECT customers.first_name, customers.last_name, shipments.ship_date, title FROM books
JOIN editions ON books.id = editions.book_id
JOIN stock ON editions.isbn = stock.isbn
JOIN shipments ON shipments.isbn = stock.isbn
JOIN customers ON shipments.customer_id = customers.id;


-- ### Grouping and Counting

-- 11. Get the COUNT of all books
SELECT COUNT(*) FROM books;

-- 12. Get the COUNT of all Locations
SELECT COUNT(location) FROM subjects;

-- 13. Get the COUNT of each unique location in the subjects table. Display the count and the location name. (hint: requires GROUP BY).
SELECT COUNT(location), location FROM subjects GROUP BY location

-- 14. List all books. Display the book_id, title, and a count of how many editions each book has. (hint: requires GROUP BY and JOIN)
SELECT id, title, editions.edition FROM books
JOIN editions ON books.id = editions.book_id;
-- Enter preSQL
psql
-- List databases.
\l 
-- Connect / cd to a database.
\connect booktown
-- Display all the tables within that database. 
\d
-- Display subjects table.
\d subjects
-- Quit preSQL
\q

-- ### Order
-- 1. Find all subjects sorted by subject
SELECT * FROM subjects ORDER BY subject ASC;
-- 2. Find all subjects sorted by location
SELECT * FROM subjects ORDER BY location ASC;

-- ### Where
-- 3. Find the book "Little Women"
SELECT title FROM books WHERE title='Little Women';
SELECT * FROM books WHERE title='Little Women';
-- 4. Find all books containing the word "Python";
SELECT * FROM books WHERE title LIKE 'Python%' OR title LIKE '%Python' OR title LIKE '%Python%';
-- 5. Find all subjects with the location "Main St" sort them by subject
SELECT * FROM subjects WHERE location = 'Main St';

-- ### Joins
-- 6. Find all books about Computers and list ONLY the book titles
books has id, title, author_id, subject_id
subjects has id, subject, location
According to subjects, 'Computers' has an id of 4. 

SELECT b.title 
FROM books b INNER JOIN subjects s
ON b.subject_id = s.id
WHERE s.subject = 'Computers';
-- 7. Find all books and display a result table with ONLY the following columns
-- 	* Book title
-- 	* Author's first name
-- 	* Author's last name
-- 	* Book subject
-- How to join multiple tables: https://learnsql.com/blog/how-to-join-3-tables-or-more-in-sql/
books.id, books.title, books.author_id, books.subject_id
authors.id, authors.last_name, authors.first_name
subjects.id, subjects.subject, subject.location

SELECT b.title, a.first_name, a.last_name, s.subject
FROM books b INNER JOIN authors a 
ON b.author_id = a.id 
INNER JOIN subjects s
ON b.subject_id = s.id;

-- 8. Find all books that are listed in the stock table
-- 	* Sort them by retail price (most expensive first)
-- 	* Display ONLY: title and price
stock.isbn, stock.cost, stock.retail, stock.stock
editions.isbn, editions.book_id
books.id, books.title

SELECT b.title, s.cost
FROM stock s INNER JOIN editions e
ON s.isbn = e.isbn 
INNER JOIN books b
ON e.book_id = b.id;

-- 9. Find the book "Dune" and display ONLY the following columns
-- 	* Book title
-- 	* ISBN number
-- 	* Publisher name
-- 	* Retail price
-- 10. Find all shipments sorted by ship date display a result table with ONLY the following columns:
-- 	* Customer first name
-- 	* Customer last name
-- 	* ship date
-- 	* book title


-- ### Grouping and Counting

-- 11. Get the COUNT of all books
-- 12. Get the COUNT of all Locations
-- 13. Get the COUNT of each unique location in the subjects table. Display the count and the location name. (hint: requires GROUP BY).
-- 14. List all books. Display the book_id, title, and a count of how many editions each book has. (hint: requires GROUP BY and JOIN)

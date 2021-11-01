-- ### Order
-- 1. Find all subjects sorted by subject
SELECT * FROM subjects ORDER BY subject ASC;

-- 2. Find all subjects sorted by location
SELECT * FROM subjects ORDER BY location;

-- ### Where
-- 3. Find the book "Little Women"
SELECT * FROM books WHERE title = 'Little Women'
-- 4. Find all books containing the word "Python"
SELECT * FROM books WHERE title LIKE '%Python%'
-- 5. Find all subjects with the location "Main St" sort them by subject
SELECT * FROM subjects WHERE location LIKE 'Main St' ORDER BY subject;

-- ### Joins

-- 6. Find all books about Computers and list ONLY the book titles
SELECT books.title FROM books INNER JOIN subjects ON subjects.id=books.subject_id WHERE subject_id = '4';
-- 7. Find all books and display a result table with ONLY the following columns
SELECT books.title, authors.first_name, authors.last_name, subjects.subject
FROM books
INNER JOIN subjects ON subjects.id=books.subject_id
INNER JOIN authors ON authors.id=books.author_id;
-- 	* Book title
-- 	* Author's first name
-- 	* Author's last name
-- 	* Book subject


-- 8. Find all books that are listed in the stock table
-- 	* Sort them by retail price (most expensive first)
-- 	* Display ONLY: title and price

SELECT books.title, stock.cost -- Selecting the Columns we want to display
FROM editions -- From the Table we want to put this joins to
INNER JOIN books ON editions.book_id=books.id -- We want to join books where their ids match
INNER JOIN stock ON editions.isbn=stock.isbn -- We want to join stock where the ISBN matches
ORDER BY stock.cost DESC;



-- 9. Find the book "Dune" and display ONLY the following columns
-- 	* Book title
-- 	* ISBN number
-- 	* Publisher name
-- 	* Retail price
SELECT books.title, publishers.name, stock.isbn, stock.retail
FROM editions
INNER JOIN books on editions.book_id=books.id
INNER JOIN stock on editions.isbn=stock.isbn
INNER JOIN publishers on editions.publisher_id=publishers.id
WHERE books.title = 'Dune';

-- 10. Find all shipments sorted by ship date display a result table with ONLY the following columns:
-- 	* Customer first name
-- 	* Customer last name
-- 	* ship date
-- 	* book title
SELECT customers.first_name, customers.last_name, shipments.ship_date, books.title
FROM shipments
INNER JOIN editions ON shipments.isbn=editions.isbn
INNER JOIN customers ON shipments.customer_id=customers.id
INNER JOIN books ON editions.book_id=books.id;

-- ### Grouping and Counting

-- 11. Get the COUNT of all books
SELECT COUNT(*) FROM books;
-- 12. Get the COUNT of all Locations
SELECT COUNT(subjects.location) FROM subjects;
-- 13. Get the COUNT of each unique location in the subjects table. Display the count and the location name. (hint: requires GROUP BY).
SELECT location, COUNT(subjects.location) FROM subjects GROUP BY Location;
-- 14. List all books. Display the book_id, title, and a count of how many editions each book has. (hint: requires GROUP BY and JOIN)
SELECT books.id, books.title, COUNT(books.id)
FROM editions
INNER JOIN books ON editions.book_id=books.id
GROUP BY books.id
ORDER BY COUNT DESC;




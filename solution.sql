 -- Find all subjects sorted by subject
SELECT subject_id FROM books ORDER BY subject_id ASC;

 -- Find all subjects sorted by location
SELECT subjects FROM subjects ORDER BY location;

 -- Find the book "Little Women"
SELECT title FROM books WHERE title='Little Women';

 -- Find all books containing the word "Python"
SELECT title FROM books WHERE title LIKE '%Python%';

-- Find all subjects with the location "Main St" sort them by subject
SELECT subject FROM subjects WHERE location = 'Main St' ORDER BY subjects ASC;

-- Find all books about Computers and list ONLY the book titles
SELECT title FROM books WHERE subject_id = 4;


--  Find all books and display a result table with ONLY the following columns
--   Book title
--   Author's first name
--  Author's last name
--   Book subject
SELECT books.title, authors.first_name, authors.last_name, subjects.subject
FROM books, subjects, authors
WHERE authors.id = books.author_id AND subjects.id = books.subject_id;


--  Find all books that are listed in the stock table
-- 	Sort them by retail price (most expensive first)
-- 	Display ONLY: title and price
SELECT books.title, stock.retail
FROM books, stock, editions
WHERE stock.isbn = editions.isbn AND books.id = editions.book_id;



--    Find the book "Dune" and display ONLY the following columns
-- 	Book title
-- 	ISBN number
-- 	Publisher name
-- 	Retail price

SELECT books.title, editions.isbn, stock.retail, publishers.name
FROM books, editions, stock, publishers
WHERE books.title = 'Dune'
AND stock.isbn = editions.isbn
AND books.id = editions.book_id
AND editions.publisher_id = publishers.id;



--    Find all shipments sorted by ship date display a result table with ONLY the following columns:
-- 	Customer first name
-- 	Customer last name
-- 	ship date
--     book title

SELECT books.title, shipments.ship_date, customers.first_name, customers.last_name

FROM books, shipments, customers, editions
WHERE books.id = editions.book_id
AND shipments.isbn = editions.isbn
AND shipments.customer_id = customers.id
ORDER BY ship_date ASC;

-- ### Grouping and Counting

-- * Get the COUNT of all books
SELECT COUNT(books) FROM books;


-- * Get the COUNT of all Locations
SELECT COUNT(location) FROM subjects;


-- * Get the COUNT of each unique location in the subjects table. Display the count and the location name. (hint: requires GROUP BY).
SELECT location, COUNT(location) FROM subjects GROUP BY location;


-- * List all books. Display the book_id, title, and a count of how many editions each book has. (hint: requires GROUP BY and JOIN)
SELECT books.id, books.title, COUNT(edition)
FROM books, editions
WHERE books.id = editions.book_id
GROUP BY edition, books.id;

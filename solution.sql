-- ORDER
-- Find all subjects sorted by subject
SELECT * FROM subjects;

-- Find all subjects sorted by location
SELECT * FROM subjects ORDER BY location;


-- WHERE
-- Find the book "Little Women"
SELECT * FROM books WHERE title='Little Women';

-- Find all books containing the word "Python"
SELECT * FROM books WHERE title LIKE '%Python%';

-- Find all subjects with the location "Main St" sort them by subject
SELECT * FROM subjects WHERE location='Main St' ORDER BY subject;


-- JOINS
-- Find all books about Computers and list ONLY the book titles
-- Computers Subject ID: 4
SELECT * FROM books WHERE subject_id=4;


-- Find all books and display a result table with ONLY the following columns
-- ---- Book title
-- SELECT title FROM books;

-- ---- Author's first name
-- SELECT first_name
-- FROM authors, books
-- WHERE authors.id = books.author_id;

-- ---- Author's last name
-- SELECT last_name
-- FROM authors, books
-- WHERE authors.id = books.author_id;

-- ---- Book subject
-- SELECT subject
-- FROM books, subjects
-- WHERE subject.id = books.subject_id;

SELECT title, first_name, last_name, subject FROM authors, books, subjects WHERE authors.id = books.author_id AND subjects.id = books.subject_id;


-- Find all books that are listed in the stock table
---- Sort them by retail price (most expensive first)
---- Display ONLY: title and price
-- isbn cost retail stock (stock)
-- isbn book_id (editions)
-- id title (books)

SELECT title, retail FROM stock, editions, books WHERE books.id = editions.book_id AND editions.isbn = stock.isbn ORDER BY retail DESC;


-- Find the book "Dune" and display ONLY the following columns
---- Book title
---- ISBN number
---- Publisher name
---- Retail price
-- title id (books)
-- isbn book_id publisher_id(editions)
-- id name (publishers)
-- isbn retail (stock)


SELECT title, editions.isbn, name, retail FROM books, editions, publishers, stock WHERE books.id = editions.book_id AND editions.isbn = stock.isbn AND editions.publisher_id = publishers.id AND title='Dune';


-- Find all shipments sorted by ship date display a result table with ONLY the following columns:
---- Customer first name
---- Customer last name
---- ship date
---- book title
id customer_id isbn ship_date (shipments)
id last_name first_name (customer)
title id (books)
isbn book_id publisher_id(editions)

SELECT first_name, last_name, ship_date, title FROM shipments, customers, books, editions WHERE books.id=editions.book_id AND editions.isbn=shipments.isbn AND customers.id=shipments.customer_id;


-- GROUPING AND COUNTING

-- Get the COUNT of all books
SELECT COUNT(*) FROM books;

-- Get the COUNT of all Locations
SELECT COUNT(location) FROM subjects;

-- Get the COUNT of each unique location in the subjects table. Display the count and the location name. (hint: requires GROUP BY).

SELECT COUNT(location), location FROM subjects GROUP BY location;

-- List all books. Display the book_id, title, and a count of how many editions each book has. (hint: requires GROUP BY and JOIN)

-- id title author_id subject_id (books)
-- isbn book_id edition publisher_id publication type (editions)

SELECT books.id, books.title, COUNT(edition) FROM books, editions WHERE books.id = editions.book_id GROUP BY books.id;



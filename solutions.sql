--Complete the following exercises to practice using SQL.

--Order

--Find all subjects sorted by subject

SELECT * FROM subjects ORDER BY subject;

--Find all subjects sorted by location

SELECT * FROM subjects ORDER BY location;

--Find the book "Little Women"

SELECT * FROM books WHERE title = 'Little Women';

-- Find all books containing the word "Python"

SELECT * FROM books WHERE title LIKE '%Python';

-- Find all subjects with the location "Main St" sort them by subject

SELECT * FROM subjects WHERE location = 'Main St';

-- Joins

-- Find all books about Computers and list ONLY the book titles

SELECT books.title 
FROM books, subjects
WHERE books.subject_id = subjects.id
AND subjects.subject = 'Computers';


SELECT books.title 
FROM books
WHERE books.subject_id = 4;

-- Find all books and display a result table with ONLY the following columns

SELECT books.title, authors.first_name, authors.last_name, subjects.subject 
FROM books, authors, subjects
WHERE books.author_id = authors.id 
AND books.subject_id = subjects.id;

-- Book title


-- Author's first name


-- Author's last name


-- Book subject


-- Find all books that are listed in the stock table

SELECT books.title,  stock.cost
FROM books, stock, editions
WHERE books.id = editions.book_id
AND editions.isbn = stock.isbn
ORDER BY stock.cost DESC;

-- Sort them by retail price (most expensive first)


-- Display ONLY: title and price


-- Find the book "Dune" and display ONLY the following columns

SELECT books.title, publishers.name, stock.cost
FROM books, editions, publishers, stock
WHERE books.id = editions.book_id
AND editions.publisher_id = publishers.id
AND editions.isbn = stock.isbn;

-- Book title



-- ISBN number



-- Publisher name

-- Retail price

-- Find all shipments sorted by ship date display a result table with ONLY the following columns:

SELECT shipments.ship_date, customers.first_name, customers.last_name, books.title
FROM shipments, customers, books, stock, editions
WHERE shipments.customer_id = customers.id
AND shipments.isbn = stock.isbn
AND stock.isbn = editions.isbn
AND editions.book_id = books.id
ORDER BY shipments.ship_date;


-- Customer first name
-- Customer last name
-- ship date
-- book title

-- Grouping and Counting

-- Get the COUNT of all books

SELECT COUNT (*) FROM books;

-- Get the COUNT of all Locations

SELECT COUNT (subjects.location) FROM subjects;

-- Get the COUNT of each unique location in the subjects table. Display the count and the location name. (hint: requires GROUP BY).

SELECT DISTINCT COUNT (subjects.location) 
FROM subjects
GROUP BY location;

-- List all books. Display the book_id, title, and a count of how many editions each book has. (hint: requires GROUP BY and JOIN)

SELECT (books.title, books.id) 
AND JOIN DISTINCT COUNT (editions.edition) 
FROM books, editions
WHERE books.id = editions.book_id;


-- YAY! You're done!!



























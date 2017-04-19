--Find all subjects sorted by subject
SELECT * FROM subjects ORDER BY subject;

--Find all subjects sorted by location
SELECT * FROM subjects ORDER BY location;


--Find the book "Little Women"
SELECT * FROM books WHERE title = 'Little Women';

--Find all books containing the word "Python"
SELECT * FROM books WHERE title LIKE '%Python%';


--Find all subjects with the location "Main St" sort them by subject
SELECT * FROM subjects WHERE location = 'Main St' ORDER BY subject;

-- Find all books about Computers and list ONLY the book titles
SELECT title FROM books WHERE subject_id = 4;

-- Find all books and display a result table with ONLY the following columns
	-- Book title
	-- Author's first name
	-- Author's last name
	-- Book subject
SELECT title, first_name, last_name, subject
FROM books, authors, subjects
WHERE subjects.id = books.subject_id AND authors.id = books.author_id;

-- Find all books that are listed in the stock table
	-- Sort them by retail price (most expensive first)
	-- Display ONLY: title and price
SELECT title, retail
FROM books, stock, editions
WHERE books.id = editions.book_id
and editions.isbn = stock.isbn
ORDER BY retail DESC;

-- Find the book "Dune" and display ONLY the following columns
	-- Book title
	-- ISBN number
	-- Publisher name
	-- Retail price
SELECT title, name, retail, editions.isbn
FROM books, editions, publishers, stock
WHERE title = 'Dune'
	and books.id = editions.book_id
	and publishers.id = publisher_id
	and editions.isbn = stock.isbn;

-- Find all shipments sorted by ship date display a result table with ONLY the following columns:
	-- Customer first name
	-- Customer last name
	-- ship date
	-- book title
SELECT first_name, last_name, ship_date, title
FROM shipments, customers, editions, books
WHERE customers.id = shipments.customer_id
	and books.id = editions.book_id
ORDER BY ship_date;

-- Get the COUNT of all books
SELECT COUNT(*) FROM books;

-- Get the COUNT of all Locations
SELECT COUNT(location) FROM subjects;

-- Get the COUNT of each unique location in the subjects table. Display the count and the location name. (hint: requires GROUP BY).
SELECT location, COUNT(location) FROM subjects GROUP BY location;

-- List all books. Display the book_id, title, and a count of how many editions each book has. (hint: requires GROUP BY and JOIN)
SELECT book_id, title, COUNT(edition)
FROM books, editions
WHERE books.id=editions.book_id
GROUP BY book_id, title;

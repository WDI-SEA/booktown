--Order
--Find all subjects sorted by subject
SELECT subject FROM subjects;

--Find all subjects sorted by location
SELECT subject, location FROM subjects ORDER BY location;

--Where

-- Find the book "Little Women"
SELECT * FROM books WHERE title = 'Little Women';

-- Find all books containing the word "Python"
SELECT * FROM books WHERE title LIKE '%Python%';

-- Find all subjects with the location "Main St" sort them by subject
SELECT subject FROM subjects GROUP BY subject;

-- Joins

-- Find all books about Computers and list ONLY the book titles
SELECT title FROM books, subjects WHERE books.subject_id = subjects.id AND subject = 'Computers';

-- Find all books and display a result table with ONLY the following columns
-- Book title
-- Author's first name
-- Author's last name
-- Book subject
SELECT title, first_name, last_name, subject FROM books, authors, subjects WHERE subject_id = subjects.id AND author_id = authors.id;

-- Find all books that are listed in the stock table
-- Sort them by retail price (most expensive first)
-- Display ONLY: title and price
-- //Stock: isbn, cost, retail, stock
-- //Editions: isbn, book_id, edition, publisher_id, publication
-- //Books: id, title, author_id, subject_id
SELECT title, retail FROM stock, editions, books  WHERE books.id = book_id AND editions.isbn = stock.isbn ORDER BY retail DESC;


-- Find the book "Dune" and display ONLY the following columns
-- Book title
-- ISBN number
-- Publisher name
-- Retail price
-- //Books: id, title, author_id, subject_id
-- //Editions: isbn, book_id, edition, publisher_id, publication
-- //Stock: isbn, cost, retail, stock
-- //Publishers: id, name, address
SELECT books.title, editions.isbn, publishers.name, stock.retail FROM books, stock, editions, publishers WHERE books.id = editions.book_id AND editions.isbn = stock.isbn AND editions.publisher_id = publishers.id AND title = 'Dune';


-- Find all shipments sorted by ship date display a result table with ONLY the following columns:
-- Customer first name
-- Customer last name
-- ship date
-- book title



-- Grouping and Counting

-- Get the COUNT of all books
-- Get the COUNT of all Locations
-- Get the COUNT of each unique location in the subjects table. Display the count and the location name. (hint: requires GROUP BY).
-- List all books. Display the book_id, title, and a count of how many editions each book has. (hint: requires GROUP BY and JOIN)

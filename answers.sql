Complete the following exercises to practice using SQL.

-- Order
-- Find all subjects sorted by subject
select * from subjects;
-- Find all subjects sorted by locations
select * from subjects order by location;

-- Where
Find the book "Little Women”
select * from books where title = ‘Little Women’;


-- Find all books containing the word “Python"
booktown=# select*from books where title like '%Python%';

-- Find all subjects with the location "Main St" sort them by subject
select * from subjects where location = 'Main St' order by subject;

-- Joins
-- Find all books about Computers and list ONLY the book titles
select title from books join subjects on books.subject_id = subjects.id where subject_id=4;

-- Find all books and display a result table with ONLY the following columns
-- Book title
-- Author's first name
-- Author's last name
-- Book subject
SELECT books.title, authors.first_name, authors.last_name, subjects.subject FROM books
JOIN authors ON authors.id = books.author_id
JOIN subjects ON subjects.id = books.subject_id;

-- Find all books that are listed in the stock table
-- Sort them by retail price (most expensive first)
-- Display ONLY: title and price
SELECT  books.title, stock.retail FROM books
JOIN editions ON editions.book_id = books.id
JOIN stock ON stock.isbn = editions.isbn
ORDER BY stock.retail DESC;

-- Find the book "Dune" and display ONLY the following columns
-- Book title
-- ISBN number
-- Publisher name
-- Retail price
SELECT books.title, stock.retail, editions.isbn, publishers.name FROM books
JOIN editions ON editions.book_id = books.id
JOIN publishers ON publishers.id = editions.publisher_id
JOIN stock ON stock.isbn = editions.isbn
WHERE books.title = 'Dune';

-- Find all shipments sorted by ship date display a result table with ONLY the following columns:
-- Customer first name
-- Customer last name
-- ship date
-- book title
SELECT customers.first_name, customers.last_name, shipments.ship_date, books.title FROM shipments
JOIN customers ON customers.id = shipments.customer_id
JOIN editions ON editions.isbn = shipments.isbn
JOIN books ON books.id = editions.book_id
ORDER BY shipments.ship_date;


-- RECIEVED A LITTLE HELP HERE

-- Grouping and Counting
-- Get the COUNT of all books
SELECT COUNT(id) FROM books;

-- Get the COUNT of all Locations
SELECT COUNT(id) FROM subjects;

-- Get the COUNT of each unique location in the subjects table. Display the count and the location name. (hint: requires GROUP BY).
SELECT COUNT(id), location FROM subjects GROUP BY (location);

-- List all books. Display the book_id, title, and a count of how many editions each book has. (hint: requires GROUP BY and JOIN)
SELECT books.id, books.title, COUNT(editions.edition) FROM books
JOIN editions ON editions.book_id = books.id
GROUP BY (books.id);

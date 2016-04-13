-- 1. Find all subjects sorted by subject
SELECT * FROM subjects ORDER BY subject ASC;

-- 2. Find all subjects sorted by location
SELECT * FROM subjects ORDER BY location ASC;

-- 1. Find the book "Little Women"
SELECT * FROM books WHERE title='Little Women';

-- 2. Find all books containing the word "Python"
SELECT * FROM books WHERE title LIKE '%Python%';

-- 3. Find all subjects with the location "Main St" sort them by subject
SELECT * FROM subjects WHERE location='Main St' ORDER BY subject ASC;

--Find all books about Computers list ONLY book title
SELECT title FROM books WHERE subject_id = 4;
-- below is the long way to go about it
SELECT books.title FROM books LEFT OUTER JOIN subjects ON subjects.id = books.subject_id WHERE subjects.subject='Computers';

--Find all books and display ONLY book title, author's first name, last name, subject
SELECT something.title, authors.first_name, authors.last_name, something.subject  FROM 
(SELECT books.title, books.author_id, subjects.subject FROM books INNER JOIN subjects ON books.subject_id = subjects.id) AS something 
INNER JOIN authors ON something.author_id = authors.id;

--Find all books that are listed in the stock table, display only title and price and sort by most expensive first
SELECT something.title, stock.retail FROM 
(SELECT books.title, editions.isbn FROM books INNER JOIN editions ON books.id=editions.book_id) AS something 
INNER JOIN stock ON something.isbn=stock.isbn ORDER BY retail DESC;

--Find the book "Dune" and display ONLY ttile, isbn, publisher name, retail price
SELECT stuff.title, stuff.isbn, stuff.name, stock.retail FROM (SELECT dunestuff.title, dunestuff.isbn, publishers.name FROM (SELECT dune.title, editions.isbn, editions.publisher_id FROM 
(SELECT books.title, books.id FROM books WHERE books.title='Dune') AS dune 
INNER JOIN editions ON dune.id=editions.book_id) AS dunestuff INNER JOIN publishers ON dunestuff.publisher_id=publishers.id) AS stuff INNER JOIN stock ON stuff.isbn=stock.isbn;

--Find all shipments sorted by ship date display ONLY: customer first name, last name, ship date, book title
SELECT customers.first_name, customers.last_name, blah.ship_date, blah.title FROM 
(SELECT stuff.title, stuff.isbn, shipments.ship_date, shipments.customer_id FROM 
(SELECT books.title, books.id, editions.isbn FROM books INNER JOIN editions ON books.id=editions.book_id) AS stuff 
INNER JOIN shipments ON stuff.isbn=shipments.isbn) AS blah 
INNER JOIN customers ON blah.customer_id=customers.id ORDER BY customers.last_name ASC;

--Get the COUNT of all books
SELECT COUNT(DISTINCT title) FROM books;

--Get the COUNT of all Locations
SELECT COUNT(DISTINCT location) FROM subjects;

--Get the COUNT of each unique location in the subjects table. Display the count and the location name. (hint: requires GROUP BY)
SELECT COUNT(DISTINCT location), location FROM subjects GROUP BY location;

--List all books. Display the book_id, title, and a count of how many editions each book has. (hint: requires GROUP BY and JOIN)
SELECT books.id, books.title, COUNT(editions.edition) 
FROM books INNER JOIN editions ON books.id=editions.book_id
GROUP BY books.title;
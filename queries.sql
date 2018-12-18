--Find all subjects sorted by subject
SELECT * FROM subjects ORDER BY subject;

--Find all subjects sorted by location
SELECT * FROM subjects ORDER BY location;


--Find the book "Little Women"
SELECT title FROM books WHERE title='Little Women';

--Find all books containing the word "Python"
SELECT title FROM books WHERE title LIKE '%Python%';

--Find all subjects with the location "Main St" sort them by subject
SELECT * FROM subjects WHERE location='Main St' ORDER BY subject;

--Find all books about Computers and list ONLY the book titles
SELECT
title
FROM books
JOIN subjects on books.subject_id = subjects.id WHERE subjects.subject='Computers';

--Find all books and display a result table with ONLY the following columns
	--Book title
	--Author's first name
	--Author's last name
	--Book subject
SELECT
books.title AS Book_Title,
authors.first_name AS Authors_first_name,
authors.last_name AS Authors_last_name,
subjects.subject
FROM books
JOIN authors ON books.author_id = authors.id
JOIN subjects ON books.subject_id = subjects.id;


--Find all books that are listed in the stock table
	--Sort them by retail price (most expensive first)
	--Display ONLY: title and price
SELECT
title AS Book_Title,
stock.retail AS Retail_Price
FROM stock
JOIN editions ON stock.isbn = editions.isbn
JOIN books ON books.id = editions.book_id ORDER BY Retail_Price DESC;


--Find the book "Dune" and display ONLY the following columns
	--Book title
	--ISBN number
	--Publisher name
	--Retail price
SELECT
title AS Book_Title,
editions.isbn AS ISBN_number,
publishers.name AS Publisher_name,
stock.retail AS Retail_price
FROM books
JOIN editions ON editions.book_id = books.id
JOIN publishers ON publishers.id = editions.publisher_id
JOIN stock ON stock.isbn = editions.isbn WHERE books.title='Dune';



--Find all shipments sorted by ship date display a result table with ONLY the following columns:
	--Customer first name
	--Customer last name
	--ship date
	--book title
SELECT
customers.first_name,
customers.last_name,
shipments.ship_date,
books.title AS Book_Title
FROM customers
JOIN shipments ON shipments.customer_id = customers.id
JOIN editions ON editions.isbn = shipments.isbn
JOIN books ON books.id = editions.book_id ORDER BY shipments.ship_date;


--Get the COUNT of all books
SELECT COUNT(title) AS Count_of_books FROM books;
--SELECT title, COUNT(title) AS Count_of_titles FROM books GROUP BY title;


--Get the COUNT of all Locations
SELECT COUNT(location) AS Count_of_location FROM subjects;
--SELECT location, COUNT(location) AS Count_of_location FROM subjects WHERE location IS NOT NULL GROUP BY location;

--Get the COUNT of each unique location in the subjects table. Display the count and the location name. (hint: requires GROUP BY).
SELECT location, COUNT(location) AS Count_of_location FROM subjects WHERE location IS NOT NULL GROUP BY location;

--List all books. Display the book_id, title, and a count of how many editions each book has. (hint: requires GROUP BY and JOIN)
SELECT
books.id AS Book_ID,
books.title AS Book_Title,
COUNT(editions.edition) AS Number_of_editions
FROM books
JOIN editions ON books.id = editions.book_id GROUP BY books.id;





















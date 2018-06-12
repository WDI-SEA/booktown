-- Order
-- Find all subjects sorted by subject
select subject from subjects order by subject;   

-- Find all subjects sorted by location
select subject from subjects order by location;

-- Where
-- Find the book "Little Women"
select * from books where title = 'Little Women';

-- Find all books containing the word "Python"
select * from books where title like '%Python%';

-- Find all subjects with the location "Main St" sort them by subject
select * from subjects where location = 'Main St' order by subject;

-- Joins
-- Find all books about Computers and list ONLY the book titles
select title from books join subjects on books.subject_id = subjects.id where subjects.id=4;

-- Find all books and display a result table with ONLY the following columns
	-- Book title
	-- Author's first name
	-- Author's last name
	-- Book subject
select title, first_name, last_name, subject from books join authors on books.author_id = authors.id join subjects on books.subject_id = subjects.id;

-- Find all books that are listed in the stock table
	-- Sort them by retail price (most expensive first)
	-- Display ONLY: title and price

select title, retail from books join editions on editions.book_id = books.id join stock on editions.isbn = stock.isbn order by cost DESC;

-- Find the book "Dune" and display ONLY the following columns
	-- Book title
	-- ISBN number
	-- Publisher name
	-- Retail price

select title, editions.isbn, name, retail from books join editions on editions.book_id = books.id join publishers on editions.publisher_id = publishers.id join stock on stock.isbn = editions.isbn where title = 'Dune';

-- Find all shipments sorted by ship date display a result table with ONLY the following columns:
	-- Customer first name
	-- Customer last name
	-- ship date
	-- book title

select first_name, last_name, ship_date, title from customers join shipments on customers.id = shipments.customer_id join editions on editions.isbn = shipments.isbn join books on books.id = editions.book_id order by ship_date;

-- Grouping and Counting

-- Get the COUNT of all books
select count(books) from books;

-- Get the COUNT of all Locations
select count(subjects.location) from subjects;

-- Get the COUNT of each unique location in the subjects table. Display the count and the location name. (hint: requires GROUP BY).
select location, count(location) from subjects group by location order by count(location) DESC;

-- List all books. Display the book_id, title, and a count of how many editions each book has. (hint: requires GROUP BY and JOIN)
select id, title, count(editions.edition) from books join editions on editions.book_id = books.id group by books.id;





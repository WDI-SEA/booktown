
-- Find all subjects sorted by subject
SELECT * FROM subjects ORDER BY subject
-- Find all subjects sorted by location
SELECT * FROM subjects ORDER BY location

-- Find the book "Little Women"
SELECT * FROM books WHERE title = 'Little Women';
-- Find all books containing the word "Python"
SELECT * FROM books WHERE title LIKE '%Python%';
-- Find all subjects with the location "Main St" sort them by subject
SELECT * FROM subjects WHERE location = 'Main St' ORDER BY subject;
-- Find all books about Computers and list ONLY the book titles
SELECT title FROM books JOIN subjects ON subjects.id = books.subject_id WHERE subject = 'Computers';
-- Find all books and display a result table with ONLY the following columns
SELECT title, authors.first_name, authors.last_name, subjects.subject FROM books JOIN authors ON books.author_id = authors.id JOIN subjects ON books.subject_id = subjects.id;
-- Book title
-- Author's first name
-- Author's last name
-- Book subject

-- Find all books that are listed in the stock table
SELECT books.title, stock.retail FROM books JOIN editions ON books.id = editions.book_id JOIN stock ON editions.isbn = stock.isbn ORDER BY retail DESC;
-- Sort them by retail price (most expensive first)
-- Display ONLY: title and price

-- Find the book "Dune" and display ONLY the following columns
SELECT books.title, editions.isbn, publishers.name, stock.retail FROM books JOIN editions ON books.id = editions.book_id JOIN stock ON editions.isbn = stock.isbn JOIN publishers ON editions.publisher_id = publishers.id WHERE books.title = 'Dune';
-- Book title
-- ISBN number
-- Publisher name
-- Retail price

-- Find all shipments sorted by ship date display a result table with ONLY the following columns:
SELECT customers.first_name, customers.last_name, books.title, shipments.ship_date FROM books JOIN editions ON books.id = editions.book_id JOIN shipments ON editions.isbn = shipments.isbn JOIN customers ON shipments.customer_id = customers.id;
-- Customer first name
-- Customer last name
-- ship date
-- book title


-- Get the COUNT of all books
SELECT count(*) FROM books;
-- Get the COUNT of all Locations
SELECT COUNT(subjects.location) FROM subjects;
-- Get the COUNT of each unique location in the subjects table. Display the count and the location name. (hint: requires GROUP BY).
SELECT COUNT(subjects.location), subjects.location  FROM subjects GROUP BY subjects.location;
-- List all books. Display the book_id, title, and a count of how many editions each book has. (hint: requires GROUP BY and JOIN)
SELECT books.id,books.title, COUNT(editions.edition) AS number_of_editions FROM books JOIN editions ON books.id = editions.book_id GROUP BY books.id;
--or(incase i did this wrong)
SELECT books.id, books.title, editions.edition FROM books JOIN editions ON editions.book_id = books.id GROUP BY editions.edition, books.title, books.id;


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
SELECT books.title FROM books INNER JOIN subjects ON subjects.id = books.subject_id WHERE subject = 'Computers';
-- Find all books and display a result table with ONLY the following columns
SELECT b.title, a.first_name, a.last_name, s.subject FROM books b INNER JOIN authors a ON b.author_id = a.id INNER JOIN subjects s ON b.subject_id = s.id;
-- Book title
-- Author's first name
-- Author's last name
-- Book subject

-- Find all books that are listed in the stock table
SELECT b.title, s.retail FROM books b INNER JOIN editions e ON b.id = e.book_id INNER JOIN stock s ON e.isbn = s.isbn ORDER BY retail DESC;
-- Sort them by retail price (most expensive first)
-- Display ONLY: title and price

-- Find the book "Dune" and display ONLY the following columns
SELECT b.title, e.isbn, p.name, s.retail FROM books b INNER JOIN editions e ON b.id = e.book_id INNER JOIN stock s ON e.isbn = s.isbn INNER JOIN publishers p ON e.publisher_id = p.id WHERE b.title = 'Dune';
-- Book title
-- ISBN number
-- Publisher name
-- Retail price

-- Find all shipments sorted by ship date display a result table with ONLY the following columns:
SELECT c.first_name, c.last_name, b.title, s.ship_date FROM books b INNER JOIN editions e ON b.id = e.book_id INNER JOIN shipments s ON e.isbn = s.isbn INNER JOIN customers c ON s.customer_id = c.id ORDER BY shipments.ship_date DESC;
-- Customer first name
-- Customer last name
-- ship date
-- book title


-- Get the COUNT of all books
SELECT count(*) FROM books;
-- Get the COUNT of all Locations
SELECT COUNT(subjects.location) FROM subjects;
-- Get the COUNT of each unique location in the subjects table. Display the count and the location name. (hint: requires GROUP BY).
SELECT COUNT(s.location), s.location  FROM subjects s GROUP BY s.location;
-- List all books. Display the book_id, title, and a count of how many editions each book has. (hint: requires GROUP BY and JOIN)
SELECT b.id,b.title, COUNT(e.edition) AS number_of_editions FROM books b INNER JOIN editions e ON b.id = e.book_id GROUP BY b.id;
--or(incase i did this wrong)
SELECT b.id, b.title, e.edition FROM books b INNER JOIN editions e ON e.book_id = b.id GROUP BY e.edition, b.title, b.id;

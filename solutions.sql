-- ### Order
-- 1. Find all subjects sorted by subject
    SELECT subject FROM subjects ORDER BY subject;
-- 2. Find all subjects sorted by location
    SELECT location FROM subjects ORDER BY location;

-- ### Where
-- 3. Find the book "Little Women"
    SELECT * FROM books WHERE title = 'Little Women';
-- 4. Find all books containing the word "Python"
    SELECT * FROM books WHERE title LIKE '%Python%';
-- 5. Find all subjects with the location "Main St" sort them by subject
    SELECT * FROM subjects WHERE location = 'Main St' ORDER BY subject;


-- ### Joins

-- 6. Find all books about Computers and list ONLY the book titles
    SELECT title FROM books INNER JOIN subjects ON subjects.id = 4 and  subjects.id = books.subject_id;
-- 7. Find all books and display a result table with ONLY the following columns
-- 	* Book title
    SELECT titles FROM books;
-- 	* Author's first name
    SELECT authors.first_name FROM authors INNER JOIN books ON authors.id = books.author_id;
-- 	* Author's last name
    SELECT authors.last_name FROM authors INNER JOIN books ON authors.id = books.author_id;
-- 	* Book subject 
    SELECT subjects.subject  FROM subjects INNER JOIN books ON subjects.id = books.subject_id;
-- 8. Find all books that are listed in the stock table
    SELECT books.title FROM books INNER JOIN (SELECT editions.book_id FROM editions INNER JOIN stock ON editions.isbn = stock.isbn) AS EditionSummary ON EditionSummary.book_id = books.id;
-- 	* Sort them by retail price (most expensive first)
    SELECT books.title FROM books INNER JOIN (SELECT editions.book_id FROM editions INNER JOIN stock ON editions.isbn = stock.isbn ORDER BY stock.retail DESC) AS EditionSummary ON EditionSummary.book_id = books.id;
-- 	* Display ONLY: title and price
    SELECT books.title, EditionSummary.retail FROM books INNER JOIN (SELECT editions.book_id, stock.retail FROM editions INNER JOIN stock ON editions.isbn = stock.isbn ORDER BY stock.retail DESC) AS EditionSummary ON EditionSummary.book_id = books.id;
-- 9. Find the book "Dune" and display ONLY the following columns
-- 	* Book title
-- 	* ISBN number
-- 	* Publisher name
-- 	* Retail price
    SELECT thefinaltable.title, stock.isbn, thefinaltable.name, stock.retail FROM stock INNER JOIN (SELECT Final.title, publishers.name, Final.isbn FROM publishers INNER JOIN (SELECT editions.publisher_id, editions.book_id, Title.title, editions.isbn FROM editions INNER JOIN (SELECT*FROM books WHERE title = 'Dune') AS Title ON editions.book_id = Title.id) AS Final ON Final.publisher_id = publishers.id) AS thefinaltable ON stock.isbn = thefinaltable.isbn;
-- 10. Find all shipments sorted by ship date display a result table with ONLY the following columns:
-- 	* Customer first name
-- 	* Customer last name
-- 	* ship date
-- 	* book title
    SELECT books.title,table2.first_name, table2.last_name, table2.ship_date FROM books INNER JOIN (SELECT editions.book_id, table1.first_name, table1.last_name, table1.ship_date FROM editions INNER JOIN (SELECT customers.first_name, customers.last_name, shipments.ship_date, shipments.isbn  FROM shipments INNER JOIN customers ON shipments.customer_id = customers.id) AS table1 ON table1.isbn = editions.isbn) AS table2 ON table2.book_id = books.id;

-- ### Grouping and Counting

-- 11. Get the COUNT of all books
    SELECT COUNT(title) FROM books;
-- 12. Get the COUNT of all Locations
    SELECT COUNT(location) FROM subjects;
-- 13. Get the COUNT of each unique location in the subjects table. Display the count and the location name. (hint: requires GROUP BY).
    SELECT location, COUNT(*) FROM subjects GROUP BY location;
-- 14. List all books. Display the book_id, title, and a count of how many editions each book has. (hint: requires GROUP BY and JOIN)
    SELECT books.title, books.id, table1.count FROM books INNER JOIN (SELECT book_id, COUNT(edition) FROM editions GROUP BY book_id ORDER BY book_id ASC) AS table1 ON books.id = table1.book_id;




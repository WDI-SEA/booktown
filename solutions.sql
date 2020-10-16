-- ### Order
-- 1. Find all subjects sorted by subject
SELECT subject FROM subjects ORDER BY subject;

-- 2. Find all subjects sorted by location
SELECT location FROM subjects ORDER BY location;

-- ### Where
-- 3. Find the book "Little Women"
SELECT * FROM books;
SELECT * FROM books WHERE title='Little Women';

-- 4. Find all books containing the word "Python"
SELECT * FROM books WHERE title LIKE '%Python%';

-- 5. Find all subjects with the location "Main St" sort them by subject
SELECT subject FROM subjects WHERE location='Main St' ORDER BY subject;

-- ### Joins
-- 6. Find all books about Computers and list ONLY the book titles
SELECT title FROM books INNER JOIN subjects s ON subject_id = s.id WHERE s.subject='Computers';

-- 7. Find all books and display a result table with ONLY the following columns
-- 	* Book title
SELECT title FROM books;
--SELECT b.title, bb.title FROM books b FULL OUTER JOIN book_backup bb ON b.id=bb.id ORDER BY bb.title;
-- 	* Author's first name
--\dt; --shows there is an authors table
--SELECT * FROM authors; --shows authors table has id, last_name, and first_name columns
SELECT first_name FROM authors a INNER JOIN books ON author_id= a.id;
-- 	* Author's last name
SELECT last_name FROM authors a INNER JOIN books ON author_id= a.id;
-- 	* Book subject
--books has subject_id and subjects has id
SELECT subject FROM books LEFT JOIN subjects s ON subject_id=s.id;

-- 8. Find all books that are listed in the stock table
--SELECT * FROM stock; --shows theres a isbn, cost, retail, stock columns
--SELECT * FROM books; --shows theres id, title, author_id, subject_id columns
 --SELECT * FROM editions;--editions has isbn, book_id, edition, publisher_id, publication, type
 --NOTE: book has an id in books which can be connected to the edition table to give the isbn of the book depending on the book id. Then move into the stock column to find the books that are in stock, based on their isbn.
--SELECT s.isbn, e.isbn, book_id FROM stock s FULL OUTER JOIN editions e ON s.isbn=e.isbn;
--SELECT b.id, book_id, isbn FROM books b INNER JOIN editions ON b.id= book_id;
--SELECT s.isbn, e.isbn, b.id, book_id, title FROM stock s FULL OUTER JOIN editions e ON s.isbn=e.isbn FULL OUTER JOIN books b ON b.id=book_id;
SELECT title FROM stock s INNER JOIN editions e ON s.isbn=e.isbn INNER JOIN books b ON b.id=book_id; 
-- 	* Sort them by retail price (most expensive first)
SELECT title FROM stock s INNER JOIN editions e ON s.isbn=e.isbn INNER JOIN books b ON b.id=book_id ORDER BY retail DESC; 
-- 	* Display ONLY: title and price
SELECT title, cost, retail FROM stock s INNER JOIN editions e ON s.isbn=e.isbn INNER JOIN books b ON b.id=book_id; 

-- 9. Find the book "Dune" and display ONLY the following columns
-- 	* Book title
SELECT title FROM books WHERE title='Dune';
-- 	* ISBN number
SELECT isbn FROM editions INNER JOIN books b ON book_id= b.id WHERE title= 'Dune'; 
-- 	* Publisher name
--SELECT * FROM publishers; --publisher has id, name, address
-- editions has publisher id and book_id
SELECT name FROM publishers p FULL OUTER JOIN editions ON p.id = publisher_id FULL OUTER JOIN books b ON book_id= b.id WHERE title= 'Dune';
-- 	* Retail price
SELECT retail FROM stock s FULL OUTER JOIN editions e ON s.isbn=e.isbn FULL OUTER JOIN books b ON book_id=b.id WHERE title='Dune';

-- 10. Find all shipments sorted by ship date display a result table with ONLY the following columns:
--SELECT * FROM shipments; shipments has id, customer_id, isbn, and ship_date
--SELECT * FROM customers; customers has id, last_name, and first_name
SELECT id, ship_date FROM shipments ORDER BY ship_date;
-- 	* Customer first name
SELECT first_name FROM customers c RIGHT JOIN shipments ON c.id=customer_id ORDER BY ship_date;
-- 	* Customer last name
SELECT last_name FROM customers c RIGHT JOIN shipments ON c.id=customer_id ORDER BY ship_date;
-- 	* ship date
--SELECT ship_date FROM customers c RIGHT JOIN shipments ON c.id=customer_id ORDER BY ship_date;
SELECT ship_date FROM shipments LEFT JOIN customers c ON c.id=customer_id ORDER BY ship_date;
-- 	* book title
SELECT title FROM shipments s LEFT JOIN editions e ON s.isbn=e.isbn LEFT JOIN books b ON book_id=b.id ORDER BY ship_date;

-- ### Grouping and Counting
-- 11. Get the COUNT of all books
SELECT COUNT(title) FROM books;

-- 12. Get the COUNT of all Locations
SELECT COUNT(location) FROM subjects;

-- 13. Get the COUNT of each unique location in the subjects table. Display the count and the location name. (hint: requires GROUP BY).
SELECT location, COUNT(location) FROM subjects GROUP BY location;

-- 14. List all books. Display the book_id, title, and a count of how many editions each book has. (hint: requires GROUP BY and JOIN)
SELECT title, book_id, COUNT(edition) FROM editions RIGHT JOIN books b ON book_id=b.id GROUP BY title, book_id;

--HELPFUL NOTE TIP:
--use below to find where a certain column exists 
SELECT TABLE_SCHEMA,TABLE_NAME, COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE COLUMN_NAME LIKE '%isbn%';

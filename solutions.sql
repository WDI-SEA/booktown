-- ### Order
-- 1. Find all subjects sorted by subject
SELECT subject FROM subjects ORDER BY subject
-- 2. Find all subjects sorted by location
SELECT subject, location FROM subjects ORDER BY location;

-- ### Where
-- 3. Find the book "Little Women"
SELECT * FROM books WHERE title='Little Women';
-- 4. Find all books containing the word "Python"
--SQL is case sensitive
--LIKE has two wildcards, % and _, the former is used for zero, one or + characters
--_ is used for one, single character
SELECT * FROM books WHERE title LIKE '%Python%';
-- 5. Find all subjects with the location "Main St" sort them by subject
SELECT * FROM subjects WHERE location LIKE '%Main St%' ORDER BY subject;

-- ### Joins

-- 6. Find all books about Computers and list ONLY the book titles
SELECT b.title FROM books b LEFT JOIN subject s ON b.subject_id=s.id WHERE s.subject='Computers';

--editions table has isbn plus book_id

-- 7. Find all books and display a result table with ONLY the following columns
-- 	* Book title
-- 	* Author's first name
-- 	* Author's last name
-- 	* Book subject
SELECT b.title, a.first_name, a.last_name, s.subject FROM books b JOIN authors a ON b.author_id=a.id JOIN subjects s ON b.subject_id=s.id;

-- 8. Find all books that are listed in the stock table
-- 	* Sort them by retail price (most expensive first)
-- 	* Display ONLY: title and price
--Editions has isbn plus book_id 
--Stock has isbn and retail price
--Books has title and id
--Order goes Stock=>Editions=>Books

SELECT b.title, s.retail, FROM stock s JOIN editions e ON s.isbn=e.isbn JOIN books b ON e.book_id=b.id ORDER BY retail DESC;

-- 9. Find the book "Dune" and display ONLY the following columns
-- 	* Book title
-- 	* ISBN number
-- 	* Publisher name
-- 	* Retail price

SELECT b.title, e.isbn, p.name, s.retail FROM books b JOIN editions e ON b.id=e.book_id JOIN publishers p ON e.publisher_id=p.id JOIN stock s ON e.isbn=s.isbn WHERE title='Dune';

-- 10. Find all shipments sorted by ship date display a result table with ONLY the following columns:
-- 	* Customer first name
-- 	* Customer last name
-- 	* ship date
-- 	* book title

SELECT c.first_name, c.last_name, s.ship_date, b.title FROM shipments s JOIN customers c ON s.customer_id=c.id JOIN editions e ON s.isbn=e.isbn JOIN books b ON e.book_id=b.id ORDER BY ship_date;

-- ### Grouping and Counting

-- 11. Get the COUNT of all books
SELECT COUNT(*) FROM books;
-- 12. Get the COUNT of all Locations
SELECT COUNT(location) FROM subjects;
-- 13. Get the COUNT of each unique location in the subjects table. Display the count and the location name. (hint: requires GROUP BY).
SELECT location FROM subjects GROUP BY location;
-- 14. List all books. Display the book_id, title, and a count of how many editions each book has. (hint: requires GROUP BY and JOIN)
SELECT e.book_id, b.title, COUNT(e.edition) FROM books b JOIN editions e ON b.id=e.book_id GROUP BY e.book_id, b.title;
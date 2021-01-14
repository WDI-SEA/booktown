-- ### Order
-- 1. Find all subjects sorted by subject
SELECT * FROM subjects ORDER BY subject;
-- 2. Find all subjects sorted by location
SELECT * FROM subjects ORDER BY location;

-- ### Where
-- 3. Find the book "Little Women"
SELECT title FROM books WHERE title = 'Little Women';
-- 4. Find all books containing the word "Python"
SELECT title FROM books WHERE title LIKE '%Python%';
-- 5. Find all subjects with the location "Main St" sort them by subject
SELECT * FROM subjects WHERE location = "Main St" ORDER BY subject;


-- ### Joins
-- 6. Find all books about Computers and list ONLY the book titles
SELECT b.title FROM books b JOIN subjects s ON b.subject_id=s.id WHERE s.subject = 'Computers';
-- 7. Find all books and display a result table with ONLY the following columns
booktown=# SELECT b.title, a.first_name, a.last_name, s.subject
booktown-# FROM authors a
booktown-# JOIN books b ON b.author_id = a.id
booktown-# JOIN subjects s ON s.id = b.subject_id;
-- 	* Book title
-- 	* Author's first name
-- 	* Author's last name
-- 	* Book subject

-- 8. Find all books that are listed in the stock table
SELECT b.title, s.retail FROM books b INNER JOIN editions e ON b.id=e.books_id INNER JOIN 
stock s ON s.isbn=e.isbn ORDER BY s.retail DESC;
-- 	* Sort them by retail price (most expensive first)
-- 	* Display ONLY: title and price

-- 9. Find the book "Dune" and display ONLY the following columns
SELECT b.title, p.name, s.retail, s.isbn FROM books b JOIN editions e ON b.id = e.book_id 
JOIN stock s ON s.isbn = e.idbn 
JOIN publishers p ON e.publish_id = p.id
WHERE b.title = 'Dune';

-- 	* Book title
-- 	* ISBN number
-- 	* Publisher name
-- 	* Retail price

-- 10. Find all shipments sorted by ship date display a result table with ONLY the following columns:
-- 	* Customer first name
-- 	* Customer last name
-- 	* ship date
-- 	* book title
SELECT c.first_name, c.last_name, s.ship_date, b.title FROM customers c 
JOIN shipments s ON c.id = s.customer_id
JOIN editions e ON e.isbn = s.isbn
JOIN books b ON b.id = e.book_id
ORDER BY s.ship_date DESC;

-- ### Grouping and Counting

-- 11. Get the COUNT of all books
SELECT COUNT (*) FROM books;
-- 12. Get the COUNT of all Locations
SELECT COUNT (location) FROM subjects; 
-- 13. Get the COUNT of each unique location in the subjects table. Display the count and the location name. (hint: requires GROUP BY).
SELECT location, COUNT(location) FROM subjects GROUP BY location;
-- 14. List all books. Display the book_id, title, and a count of how many editions each book has. (hint: requires GROUP BY and JOIN)
SELECT b.id, b.title, COUNT(e.edition) FROM books b JOIN editions e ON b.id = e.book_id
GROUP BY b.id;
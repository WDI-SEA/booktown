-- ### Order
-- 1. Find all subjects sorted by subject
-- 2. Find all subjects sorted by location

-- ### Where
-- 3. Find the book "Little Women"
-- 4. Find all books containing the word "Python"
-- 5. Find all subjects with the location "Main St" sort them by subject


-- ### Joins

-- 6. Find all books about Computers and list ONLY the book titles
-- 7. Find all books and display a result table with ONLY the following columns
-- 	* Book title
-- 	* Author's first name
-- 	* Author's last name
-- 	* Book subject
-- 8. Find all books that are listed in the stock table
-- 	* Sort them by retail price (most expensive first)
-- 	* Display ONLY: title and price
-- 9. Find the book "Dune" and display ONLY the following columns
-- 	* Book title
-- 	* ISBN number
-- 	* Publisher name
-- 	* Retail price
-- 10. Find all shipments sorted by ship date display a result table with ONLY the following columns:
-- 	* Customer first name
-- 	* Customer last name
-- 	* ship date
-- 	* book title

-- ### Grouping and Counting

-- 11. Get the COUNT of all books
-- 12. Get the COUNT of all Locations
-- 13. Get the COUNT of each unique location in the subjects table. Display the count and the location name. (hint: requires GROUP BY).
-- 14. List all books. Display the book_id, title, and a count of how many editions each book has. (hint: requires GROUP BY and JOIN)


-- 1.SELECT * FROM subjects
-- 2.SELECT * FROM subjects ORDER BY location;
-- 3.SELECT * FROM books    SELECT * FROM books WHERE id = '190'
-- 4.SELECT * FROM books WHERE title LIKE '%Python';
-- 5.SELECT * FROM subjects WHERE location ='Main St' ORDER BY subject;
-- 6.SELECT * FROM books WHERE subject_id = '4';
-- 7.SELECT books.title, authors.first_name, authors.last_name, subjects.subject
-- booktown-# FROM authors
-- booktown-# JOIN books ON books.author_id = authors.id
-- booktown-# JOIN subjects ON subjects.id = books.subject_id;
-- 8.SELECT * FROM stock ORDER BY retail DESC;
--  SELECT books.title, stock.retail FROM books INNER JOIN editions ON books.id=editions.book_id INNER JOIN
-- booktown-# stock ON stock.isbn=editions.isbn ORDER BY stock.retail DESC;     
-- 9.SELECT b.title, s.isbn, p.name, s.retail FROM books b JOIN editions e ON b.id=e.book_id JOIN stock s
-- booktown-# ON s.isbn=e.isbn JOIN publishers p ON e.publisher_id=p.id WHERE b.title = 'Dune';
-- 10.SELECT c.first_name, c.last_name, s.ship_date, b.title FROM customers c JOIN shipments s ON
-- booktown-# c.id=s.customer_id JOIN editions e ON e.isbn=s.isbn JOIN books b ON b.id=e.book_id ORDER BY s.ship_date DESC;
-- 11. SELECT COUNT(*) FROM books;
-- 12.SELECT COUNT(location) FROM subjects;
-- 13.  SELECT location, COUNT(location) FROM subjects GROUP BY location;
-- 14. SELECT b.id, b.title, COUNT(e.edition) FROM books b JOIN editions e ON b.id=e.book_id GROUP BY b.id;
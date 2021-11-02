-- ### Order
-- 1. Find all subjects sorted by subject
-- 2. Find all subjects sorted by location
SELECT * FROM subjects ORDER BY subject;
SELECT * FROM subjects ORDER BY location;

-- ### Where
-- 3. Find the book "Little Women"
-- 4. Find all books containing the word "Python"
-- 5. Find all subjects with the location "Main St" sort them by subject
\d
\d books
SELECT * FROM books WHERE title='Little Woman';
SELECT * FROM books WHERE title LIKE '%Python%';
\d subjects
SELECT * FROM subjects WHERE location = 'Main St';

-- ### Joins

-- 6. Find all books about Computers and list ONLY the book titles
\d
\d subjects
SELECT * FROM subjects ORDER BY subject;
SELECT * FROM books WHERE subject_id = 4;
SELECT title FROM books WHERE subject_id = 4;
-- 7. Find all books and display a result table with ONLY the following columns
-- 	* Book title
-- 	* Author's first name
-- 	* Author's last name
-- 	* Book subject
\d authors
SELECT c.title, o.last_name, o.first_name, x.subject FROM books c LEFT JOIN authors o ON o.id=c.author_id LEFT JOIN subjects x ON x.id=c.subject_id;
-- 8. Find all books that are listed in the stock table
-- 	* Sort them by retail price (most expensive first)
SELECT retail FROM stock ORDER BY reatil DESC;
-- 	* Display ONLY: title and price
\d
SELECT o.retail, x.title FROM editions c RIGHT JOIN stock o ON c.isbn = o.isbn LEFT JOIN books x ON c.book_id=x.id;
-- 9. Find the book "Dune" and display ONLY the following columns
-- 	* Book title
-- 	* ISBN number
-- 	* Publisher name
-- 	* Retail price
SELECT o.title, c.isbn, x.name, y.retail
FROM books o
LEFT JOIN editions c ON c.book_id=o.id
LEFT JOIN publishers x ON x.id=c.publisher_id
LEFT JOIN stock y ON y.isbn=c.isbn
WHERE title='Dune';
-- 10. Find all shipments sorted by ship date display a result table with ONLY the following columns:
-- 	* Customer first name
-- 	* Customer last name
-- 	* ship date
-- 	* book title
SELECT c.first_name, c.last_name, o.ship_date, x.title
FROM shipments o
LEFT JOIN customers c ON c.id=o.customer_id
LEFT JOIN editions y ON y.isbn=o.isbn
LEFT JOIN books x ON y.book_id=x.id;
-- ### Grouping and Counting

-- 11. Get the COUNT of all books
SELECT COUNT(title) FROM books;
-- 12. Get the COUNT of all Locations
SELECT COUNT(location) FROM books;
-- 13. Get the COUNT of each unique location in the subjects table. Display the count and the location name. (hint: requires GROUP BY).
SELECT COUNT(location), location FROM subjects GROUP BY location;
-- 14. List all books. Display the book_id, title, and a count of how many editions each book has. (hint: requires GROUP BY and JOIN)
SELECT o.book_id, c.title, COUNT(o.book_id) AS Editions
FROM editions o
LEFT JOIN books c ON c.id=o.book_id
GROUP BY o.book_id, c.id;
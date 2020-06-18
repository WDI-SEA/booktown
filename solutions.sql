-- ### Order
-- 1. Find all subjects sorted by subject
SELECT subject FROM subjects;
-- 2. Find all subjects sorted by location
SELECT subject FROM subjects ORDER BY location;

-- ### Where
-- 3. Find the book "Little Women"
SELECT * FROM books WHERE title = 'Little Women';
-- 4. Find all books containing the word "Python"
SELECT * FROM books WHERE title LIKE '%Python%';
-- 5. Find all subjects with the location "Main St" sort them by subject
SELECT subject FROM subjects WHERE location = 'Main St' ORDER BY subject;

-- ### Joins

-- 6. Find all books about Computers and list ONLY the book titles
SELECT b.title FROM books b
JOIN subjects s
ON b.subject_id = s.id
WHERE s.subject = 'Computers';
-- 7. Find all books and display a result table with ONLY the following columns
-- 	* Book title
-- 	* Author's first name
-- 	* Author's last name
-- 	* Book subject
SELECT b.title, a.first_name, a.last_name, s.subject
FROM books b
JOIN authors a
ON b.author_id = a.id
JOIN subjects s
ON b.subject_id = s.id;
-- 8. Find all books that are listed in the stock table
SELECT b.title FROM books b
JOIN editions e
ON b.id = e.book_id
JOIN stock s
ON e.isbn = s.isbn
GROUP BY b.title;
-- 	* Sort them by retail price (most expensive first)
-- 	* Display ONLY: title and price
SELECT b.title, s.retail FROM books b
JOIN editions e
ON b.id = e.book_id
JOIN stock s
ON e.isbn = s.isbn
ORDER BY s.retail DESC;
-- 9. Find the book "Dune" and display ONLY the following columns
-- 	* Book title
-- 	* ISBN number
-- 	* Publisher name
-- 	* Retail price
SELECT b.title, e.isbn, p.name AS publisher_name, s.retail
FROM books b
JOIN editions e
ON b.id = e.book_id
JOIN publishers p
ON e.publisher_id = p.id
JOIN stock s
ON e.isbn = s.isbn;
-- 10. Find all shipments sorted by ship date display a result table with ONLY the following columns:
-- 	* Customer first name
-- 	* Customer last name
-- 	* ship date
-- 	* book title
SELECT c.first_name, c.last_name, s.ship_date, b.title
FROM books b
JOIN editions e
ON b.id = e.book_id
JOIN shipments s
ON e.isbn = s.isbn
JOIN customers c
ON c.id = s.customer_id;

-- ### Grouping and Counting

-- 11. Get the COUNT of all books
SELECT COUNT(*) FROM books;
-- 12. Get the COUNT of all Locations
SELECT COUNT(location) FROM subjects;
-- 13. Get the COUNT of each unique location in the subjects table. Display the count and the location name. (hint: requires GROUP BY).
SELECT location, COUNT(location) FROM subjects GROUP BY location;
-- 14. List all books. Display the book_id, title, and a count of how many editions each book has. (hint: requires GROUP BY and JOIN)
SELECT b.title, COUNT(e.book_id) AS editions
FROM books b
JOIN editions e
ON b.id = e.book_id
GROUP BY b.title;

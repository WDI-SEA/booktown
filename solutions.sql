-- ### Order
-- 1. Find all subjects sorted by subject

SELECT subject FROM subjects;

-- 2. Find all subjects sorted by location
SELECT location, subject FROM subjects;

-- ### Where
-- 3. Find the book "Little Women"
SELECT title FROM books WHERE title = 'Little Women';

-- 4. Find all books containing the word "Python"
SELECT title FROM books WHERE title LIKE '%Python%'
-- 5. Find all subjects with the location "Main St" sort them by subject
SELECT subject FROM subjects WHERE location = 'Main St' ORDER BY subject;
-- SELECT location, subject FROM subjects WHERE LOCATION LIKE '%MAIN ST%' ORDER BY SUBJECT
-- ### Joins

-- 6. Find all books about Computers and list ONLY the book titles

SELECT b.title FROM books b INNER JOIN subjects s ON s.subjects = 'Computers' AND s.id = b.subject_id;
-- 7. Find all books and display a result table with ONLY the following columns
-- 	* Book title
-- 	* Author's first name
-- 	* Author's last name
-- 	* Book subject
SELECT books.title, authors.first_name, authors.last_name, subjects.subject 
FROM books 
INNER JOIN subjects ON subjects.id=books.subject_id 
INNER JOIN authors ON authors.id=books.author_id;
-- 8. Find all books that are listed in the stock table
-- 	* Sort them by retail price (most expensive first)
-- 	* Display ONLY: title and price
SELECT books.title, stock.cost FROM editions INNERR JOIN books ON editions.book_id = book_id
INNER JOIN stock ON editions.isbn = stock.isbn ORDER BY stock.cost DESC;
-- 9. Find the book "Dune" and display ONLY the following columns
-- 	* Book title
-- 	* ISBN number
-- 	* Publisher name
-- 	* Retail price
SELECT books.title, stock.isbn, stock.retail, publishers.name FROM editions INNER JOIN books ON boos.id = editions.books_id
INNER JOIN publishers ON publishers.id = editions.publisher_id
INNER JOIN stock ON stock.isbn = editions.isbn WHERE title = 'Dune';

-- 10. Find all shipments sorted by ship date display a result table with ONLY the following columns:
-- 	* Customer first name
-- 	* Customer last name
-- 	* ship date
-- 	* book title
SELECT c.first_name, c.last_name, s.ship_date, b.title
FROM shipments s 
JOIN customers columns
ON s.customer_id = c.id
JOIN editions e
ON e.isbn = s.isbn
JOIN books b
ON e.book_id = b.id
ORDER BY ship_date;


-- ### Grouping and Counting

-- 11. Get the COUNT of all books
SELECT COUNT (*) FROM books;
-- 12. Get the COUNT of all Locations
SELECT COUNT (location) FROM subjects;
-- 13. Get the COUNT of each unique location in the subjects table. Display the count and the location name. (hint: requires GROUP BY).
SELECT location, COUNT(location) FROM subjects GROUP BY location;
-- 14. List all books. Display the book_id, title, and a count of how many editions each book has. (hint: requires GROUP BY and JOIN)
SELECT books.id, books.title, COUNT(editions.edition) FROM editions INNER JOIN books ON books.id =
editions.book_id GROUP BY books.id;
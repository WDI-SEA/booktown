-- ### Order
-- 1. Find all subjects sorted by subject
-- 2. Find all subjects sorted by location

-- 1
SELECT * FROM subjects ORDER BY subject;

-- 2
SELECT * FROM subjects ORDER BY location;

-- ### Where
-- 3. Find the book "Little Women"
-- 4. Find all books containing the word "Python"
-- 5. Find all subjects with the location "Main St" sort them by subject

-- 3
SELECT * FROM books WHERE title = 'Little Women';

-- 4
SELECT * FROM books WHERE LOWER(title) LIKE '%python%';

-- 5
SELECT * FROM subjects WHERE location = 'Main St' ORDER BY subject;

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

-- 6
SELECT books.title FROM books JOIN subjects ON books.subject_id = subjects.id WHERE subject = 'Computers';

-- 7
SELECT b.title, a.first_name, a.last_name, s.subject
FROM books AS b
JOIN subjects AS s ON b.subject_id = s.id
JOIN authors AS a ON b.author_id = a.id;

-- 8
SELECT books.title, stock.retail FROM stock
JOIN editions ON stock.isbn = editions.isbn
JOIN books ON editions.book_id = books.id
ORDER BY stock.retail DESC;

-- 9
SELECT books.title, editions.isbn, publishers.name AS publisher, stock.retail
FROM books
JOIN editions ON books.id = editions.book_id
JOIN publishers ON editions.publisher_id = publishers.id
JOIN stock ON editions.isbn = stock.isbn
WHERE books.title = 'Dune';

-- 10
SELECT customers.first_name, customers.last_name, shipments.ship_date, books.title
FROM shipments
JOIN editions on shipments.isbn = editions.isbn
JOIN customers on shipments.customer_id = customers.id
JOIN books on editions.book_id = books.id
ORDER BY shipments.ship_date;

-- ### Grouping and Counting

-- 11. Get the COUNT of all books
-- 12. Get the COUNT of all Locations
-- 13. Get the COUNT of each unique location in the subjects table. Display the count and the location name. (hint: requires GROUP BY).
-- 14. List all books. Display the book_id, title, and a count of how many editions each book has. (hint: requires GROUP BY and JOIN)

-- 11
SELECT COUNT(*) FROM books;

-- 12
SELECT COUNT(DISTINCT location) FROM subjects;

-- 13
SELECT COUNT(location), location
FROM subjects
WHERE location IS NOT NULL
GROUP BY location;

-- 14
SELECT editions.book_id, books.title, COUNT(editions.book_id) AS num_of_editions
FROM books
JOIN editions ON books.id = editions.book_id
GROUP BY editions.book_id, books.title;
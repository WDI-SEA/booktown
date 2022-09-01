-- ### Order
-- 1. Find all subjects sorted by subject
SELECT subject FROM subjects;
-- 2. Find all subjects sorted by location
SELECT location FROM subjects;

-- ### Where
-- 3. Find the book "Little Women"
SELECT * FROM books
    SELECT * FROM books WHERE id = 190;
-- 4. Find all books containing the word "Python"
SELECT * FROM books WHERE title LIKE '%Python';
-- 5. Find all subjects with the location "Main St" sort them by subject
SELECT * FROM subjects WHERE location = 'Main St' ORDER BY subject ASC;


-- ### Joins

-- 6. Find all books about Computers and list ONLY the book titles
SELECT title FROM books WHERE books.subject_id = 4;
-- 7. Find all books and display a result table with ONLY the following columns
-- 	* Book title
-- 	* Author's first name
-- 	* Author's last name
-- 	* Book subject
SELECT books.title, authors.first_name, authors.last_name, subjects.subject FROM books
JOIN authors ON books.author_id = authors.id
JOIN subjects ON books.subject_id = subjects.id;
-- 8. Find all books that are listed in the stock table
SELECT books.title, stock.retail FROM books
JOIN editions ON books.id = editions.book_id
JOIN stock ON editions.isbn = stock.isbn
ORDER BY retail DESC;
-- 	* Sort them by retail price (most expensive first)
-- 	* Display ONLY: title and price
-- 9. Find the book "Dune" and display ONLY the following columns
SELECT books.title, editions.isbn, publishers.name, stock.retail FROM books
JOIN editions ON books.id = editions.book_id
JOIN publishers ON editions.publisher_id = publishers.id
JOIN stock ON editions.isbn = stock.isbn
WHERE title = 'Dune';
-- 	* Book title
-- 	* ISBN number
-- 	* Publisher name
-- 	* Retail price
-- 10. Find all shipments sorted by ship date display a result table with ONLY the following columns:
SELECT customers.first_name, customers.last_name, shipments.ship_date, books.title FROM customers
JOIN shipments ON customers.id = shipments.customer_id
JOIN editions ON shipments.isbn = editions.isbn
JOIN books ON editions.book_id = books.id;  
-- 	* Customer first name
-- 	* Customer last name
-- 	* ship date
-- 	* book title

-- ### Grouping and Counting

-- 11. Get the COUNT of all books
SELECT COUNT(*) FROM books;
-- 12. Get the COUNT of all Locations
SELECT COUNT(location) FROM subjects;
-- 13. Get the COUNT of each unique location in the subjects table. Display the count and the location name. (hint: requires GROUP BY).
-- 14. List all books. Display the book_id, title, and a count of how many editions each book has. (hint: requires GROUP BY and JOIN)

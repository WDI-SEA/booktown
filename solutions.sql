-- ### Order
-- 1. Find all subjects sorted by subject
    SELECT * FROM subjects 
-- 2. Find all subjects sorted by location
    SELECT location FROM subjects;

-- ### Where
-- 3. Find the book "Little Women"
    SELECT * FROM books WHERE title = 'Little Women'
-- 4. Find all books containing the word "Python"
    SELECT * FROM books WHERE title  LIKE '%Python%'
-- 5. Find all subjects with the location "Main St" sort them by subject
    SELECT * FROM books WHERE location = 'Main St' AND ORDER BY subject

-- ### Joins

-- 6. Find all books about Computers and list ONLY the book titles
    SELECT * FROM books WHERE subject_id = '4';
-- 7. Find all books and display a result table with ONLY the following columns
-- 	* Book title
    SELECT title FROM books
-- 	* Author's first name
    SELECT first_name FROM authors
-- 	* Author's last name
    SELECT last_name FROM authors
-- 	* Book subject
    SELECT subject FROM subjects
-- 8. Find all books that are listed in the stock table
-- 	* Sort them by retail price (most expensive first)
SELECT * FROM stock ORDER BY retail ASC;
-- 	* Display ONLY: title and price

-- 9. Find the book "Dune" and display ONLY the following columns
-- 	* Book title    
    SELECT * FROM books WHERE title = 'Dune'
-- 	* ISBN number
SELECT * FROM editions WHERE book_id = '4513'
-- 	* Publisher name
SELECT * FROM publishers WHERE id = '99';
-- 	* Retail price
SELECT * FROM stock WHERE isbn = '044100590X'

-- 10. Find all shipments sorted by ship date display a result table with ONLY the following columns:
-- 	* Customer first name
SELECT first_name FROM cusomers;
-- 	* Customer last name
SELECT last_name FROM customers;
-- 	* ship date
SELECT ship_date FROM shipments;
-- 	* book title

-- ### Grouping and Counting

-- 11. Get the COUNT of all books
SELECT COUNT(title) FROM books;
-- 12. Get the COUNT of all Locations
SELECT COUNT(location) FROM subjects;
-- 13. Get the COUNT of each unique location in the subjects table. Display the count and the location name. (hint: requires GROUP BY).
-- 14. List all books. Display the book_id, title, and a count of how many editions each book has. (hint: requires GROUP BY and JOIN)

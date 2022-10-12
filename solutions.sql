-- ### Order
-- 1. Find all subjects sorted by subject
SELECT subjects FROM subjects;
-- 2. Find all subjects sorted by location
SELECT location FROM subjects;

-- ### Where
-- 3. Find the book "Little Women"
SELECT*FROM books WHERE title = 'Little Women';
-- 4. Find all books containing the word "Python"
SELECT*FROM books
WHERE title LIKE '%Python%'

-- 5. Find all subjects with the location "Main St" sort them by subject
SELECT location FROM subjects
WHERE location LIKE '%Main St%'

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

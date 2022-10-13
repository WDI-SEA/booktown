-- ### Order
-- 1. Find all subjects sorted by subject
SELECT subject FROM subject ORDER by subject;

-- 2. Find all subjects sorted by location
SELECT subject FROM subject ORDER by location;

-- ### Where
-- 3. Find the book "Little Women"
SELECT * FROM books Where title = "Ltitle Women" ;

-- 4. Find all books containing the word "Python"

SELECT  * FROM books WHERE title LIKE '%Python%';


-- 5. Find all subjects with the location "Main St" sort them by subject

SELECT * FROM subject WHERE location LIKE 'Main St' Order by subject


-- ### Joins

-- 6. Find all books about Computers and list ONLY the book titles

SELECT book.title FROM book b
INNER JOIN subject s
ON b.subject_id = s.id 
WHERE s.subject = 'computers';
--WHERE s.id = '4'
--WHERE s.subject LIKE '%COMPUTERS%'


-- 7. Find all books and display a result table with ONLY the following columns
-- 	* Book title * Author's first name * Author's last name * Book subject

SELECT b.title, a.first_name, a.last_name, s.subject
FROM books b
 INNER JOIN Author a ON b.Author_id = a.id
INNER JOIN subjects s ON b.subject_id = s.id;


-- 8. Find all books that are listed in the stock table
-- 	* Sort them by retail price (most expensive first)
-- 	* Display ONLY: title and price

SELECT b.title, s.retail 
FROM editions e INNER JOIN stock s 
ON e.isbn = s.isban 
INNER JOIN books b 
ON b.id = e.book_id
ORDER BY retail DESC 


-- 9. Find the book "Dune" and display ONLY the following columns
-- 	* Book title 	* ISBN number- 	* Publisher name 	* Retail price




-- 10. Find all shipments sorted by ship date display a result table with ONLY the following columns:
-- 	* Customer first name- 	* Customer last name- 	* ship date- 	* book title


-- ### Grouping and Counting

-- 11. Get the COUNT of all books
-- 12. Get the COUNT of all Locations
-- 13. Get the COUNT of each unique location in the subjects table. Display the count and the location name. (hint: requires GROUP BY).
-- 14. List all books. Display the book_id, title, and a count of how many editions each book has. (hint: requires GROUP BY and JOIN)

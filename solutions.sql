-- ### Order
-- 1. Find all subjects sorted by subject
booktown=# SELECT * FROM subjects ORDER BY subjects;

-- 2. Find all subjects sorted by location
booktown=# SELECT * FROM subjects ORDER BY location;


-- ### Where
-- 3. Find the book "Little Women"
booktown=# SELECT * FROM books WHERE title='Little Women';
-- 4. Find all books containing the word "Python"
booktown=# SELECT * FROM books WHERE title LIKE '%Python';

-- 5. Find all subjects with the location "Main St" sort them by subject
booktown=# SELECT * FROM subjects WHERE location='Main St' ORDER BY subject;
 

-- ### Joins

-- 6. Find all books about Computers and list ONLY the book titles
booktown=# SELECT b.title FROM books b INNER JOIN subject
s s ON b.subject_id=s.id WHERE subject='Computers';

-- 7. Find all books and display a result table with ONLY the following columns
-- 	* Book title
-- 	* Author's first name
-- 	* Author's last name
-- 	* Book subject
booktown=# SELECT b.title, a.first_name, a.last_name, s.subject FROM books b INNER JOIN authors a ON b.author_id = a.id INNER JOIN subjects s ON b.su
bject_id = s.id;

-- 8. Find all books that are listed in the stock table
-- 	* Sort them by retail price (most expensive first)
-- 	* Display ONLY: title and price
booktown=# SELECT b.title, s.retail FROM books b INNER JOIN editions e ON e.book_id = b.id IN
NER JOIN stock s ON e.isbn = s.isbn ORDER BY retail DESC;

-- 9. Find the book "Dune" and display ONLY the following columns
-- 	* Book title
-- 	* ISBN number
-- 	* Publisher name
-- 	* Retail price
booktown=# SELECT b.title, e.isbn, p.name, s.retail FROM books b INNER JOIN editions e ON e.b
ook_id = b.id INNER JOIN publishers p ON e.publisher_id = p.id INNER JOIN stock s ON e.isbn =
 s.isbn WHERE title = 'Dune';

-- 10. Find all shipments sorted by ship date display a result table with ONLY the following columns:
-- 	* Customer first name
-- 	* Customer last name
-- 	* ship date
-- 	* book title
booktown=# SELECT s.ship_date, b.title, c.last_name, c.first_name FROM shipments s INNER JOIN editions e ON e.isbn = s.
isbn INNER JOIN books b ON b.id = e.book_id INNER JOIN customers c ON c.id = s.customer_id;

-- ### Grouping and Counting

-- 11. Get the COUNT of all books
booktown=# SELECT COUNT (*) FROM books;

-- 12. Get the COUNT of all Locations
booktown=# SELECT COUNT  (location) FROM subjects;

-- 13. Get the COUNT of each unique location in the subjects table. Display the count and the location name. (hint: requires GROUP BY).
booktown=# SELECT location FROM subjects GROUP BY location;

-- 14. List all books. Display the book_id, title, and a count of how many editions each book has. (hint: requires GROUP BY and JOIN)
booktown=# SELECT b.title, e.book_id, e.edition FROM books b INNER JOIN editions e ON b.id = e.book_id;

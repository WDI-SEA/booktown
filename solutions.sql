-- ### Order
-- 1. Find all subjects sorted by subject
SELECT * FROM subjects ORDER BY subjects;
-- 2. Find all subjects sorted by location
SELECT * FROM subjects ORDER BY location;

-- ### Where
-- 3. Find the book "Little Women"
 SELECT title FROM books WHERE title='Little Women';

-- 4. Find all books containing the word "Python"
SELECT * FROM books WHERE LOWER(title) LIKE '%python';

-- 5. Find all subjects with the location "Main St" sort them by subject
SELECT * FROM subjects WHERE location='Main St';


-- ### Joins

-- 6. Find all books about Computers and list ONLY the book titles
SELECT books.title FROM books                                                             
   JOIN subjects
    ON books.subject_id = subjects.id  
      WHERE subjects.subject = 'Computers';                                                                   


-- 7. Find all books and display a result table with ONLY the following columns
-- 	* Book title
-- 	* Author's first name
-- 	* Author's last name
-- 	* Book subject
SELECT b.title, a.first_name, a.last_name, s.subject FROM books b       
                     JOIN authors a                                                                                        
                       ON b.author_id = a.id                                                                                
                          JOIN subjects s                                                                                   
                                ON b.subject_id = s.id;
-- 8. Find all books that are listed in the stock table
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
SELECT title, stock.isbn, name, retail FROM editions 
booktown-# JOIN books
booktown-# ON editions.book_id = books.id
booktown-# JOIN stock
booktown-# ON editions.isbn = stock.isbn
booktown-# JOIN publishers
booktown-# ON editions.publisher_id = publishers.id
booktown-# WHERE title = 'Dune';

-- 10. Find all shipments sorted by ship date display a result table with ONLY the following columns:
-- 	* Customer first name
-- 	* Customer last name
-- 	* ship date
-- 	* book title
SELECT last_name, first_name, ship_date, title
FROM shipments
JOIN customers
ON shipments.customer_id = customers.id
JOIN editions
ON shipments.isbn = editions.isbn
JOIN books
ON editions.book_id = books.id
ORDER BY ship_date;


-- ### Grouping and Counting

-- 11. Get the COUNT of all books
SELECT COUNT(*) FROM books;
-- 12. Get the COUNT of all Locations
SELECT COUNT(location) FROM subjects;
-- 13. Get the COUNT of each unique location in the subjects table. Display the count and the location name. (hint: requires GROUP BY).
SELECT COUNT(location) FROM subjects GROUP BY location;
-- 14. List all books. Display the book_id, title, and a count of how many editions each book has. (hint: requires GROUP BY and JOIN)
SELECT books.title, COUNT(editions.edition)
FROM books
 JOIN editions
  ON books.id=editions.book_id
   GROUP BY books.id;
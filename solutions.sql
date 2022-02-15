-- ### Order
-- 1. Find all subjects sorted by subject
SELECT * FROM subjects ORDER BY subject;

                    List of relations
 Schema |         Name          |   Type   |    Owner    
--------+-----------------------+----------+-------------
 public | alternate_stock       | table    | vijaypersad
 public | authors               | table    | vijaypersad
 public | book_backup           | table    | vijaypersad
 public | book_ids              | sequence | vijaypersad
 public | book_queue            | table    | vijaypersad
 public | books                 | table    | vijaypersad
 public | customers             | table    | vijaypersad
 public | daily_inventory       | table    | vijaypersad
 public | distinguished_authors | table    | vijaypersad
 public | editions              | table    | vijaypersad
 public | employees             | table    | vijaypersad
 public | favorite_authors      | table    | vijaypersad
 public | favorite_books        | table    | vijaypersad
 public | money_example         | table    | vijaypersad
 public | my_list               | table    | vijaypersad
 public | numeric_values        | table    | vijaypersad
 public | publishers            | table    | vijaypersad
 public | schedules             | table    | vijaypersad
 public | shipments             | table    | vijaypersad
 public | states                | table    | vijaypersad
 public | stock                 | table    | vijaypersad
 public | stock_backup          | table    | vijaypersad
 public | subject_ids           | sequence | vijaypersad
 public | subjects              | table    | vijaypersad
 public | text_sorting          | table    | vijaypersad
(25 rows)



-- 2. Find all subjects sorted by location
SELECT * FROM subjects ORDER BY location;

-- ### Where
-- 3. Find the book "Little Women"
SELECT * FROM books WHERE title = 'Little Women';
 id  |    title     | author_id | subject_id 
-----+--------------+-----------+------------
 190 | Little Women |        16 |          6
-- 4. Find all books containing the word "Python"
SELECT * FROM books WHERE title LIKE '%Python%' OR WHERE title LIKE '%python%';
--case sensitive queries!!
-- WHERE LOWER(title) LIKE '%python%'; -- will still find the title Python 
--tried a couple combinations here

-- 5. Find all subjects with the location "Main St" sort them by subject
SELECT * FROM subjects WHERE location = 'Main St' ORDER BY subject;
 id |     subject     | location 
----+-----------------+----------
  6 | Drama           | Main St
  7 | Entertainment   | Main St
 13 | Romance         | Main St
 15 | Science Fiction | Main St


-- ### Joins

-- 6. Find all books about Computers and list ONLY the book titles
SELECT books.title 
FROM books 
INNER JOIN subjects ON books.subject_id=subjects.id 
WHERE subjects.id='4';

-- 7. Find all books and display a result table with ONLY the following columns
-- 	* Book title
-- 	* Author's first name
-- 	* Author's last name
-- 	* Book subject

-- SELECT books.title, authors.first_name, authors.last_name, subjects.subject FROM books JOIN authors ON books.id=authors.id JOIN subjects ON subjects.id=authors.id;

--alias method
SELECT a.last_name, a.first_name, b.title, s.subject
FROM authors a 
JOIN books b ON a.id=b.author_id
JOIN subjects s ON s.id=b.subject_id;


-- 8. Find all books that are listed in the stock table
-- 	* Sort them by retail price (most expensive first)
SELECT * FROM stock ORDER BY cost DESC;
-- 	* Display ONLY: title and price
cant find link between isbn and titles?


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
SELECT COUNT(*) FROM books;
-- 12. Get the COUNT of all Locations
-- 13. Get the COUNT of each unique location in the subjects table. Display the count and the location name. (hint: requires GROUP BY).
-- 14. List all books. Display the book_id, title, and a count of how many editions each book has. (hint: requires GROUP BY and JOIN)
SELECT books.title, COUNT(editions.edition)
FROM books JOIN editions ON books.id=editions.book_id GROUP BY books.id;
-- ### Order
-- 1. Find all subjects sorted by subject

SELECT * FROM subjects
booktown-# ;
 id |     subject      |     location     
----+------------------+------------------
  0 | Arts             | Creativity St
  1 | Business         | Productivity Ave
  2 | Children's Books | Kids Ct
  3 | Classics         | Academic Rd
  4 | Computers        | Productivity Ave
  5 | Cooking          | Creativity St
  6 | Drama            | Main St
  7 | Entertainment    | Main St
  8 | History          | Academic Rd
  9 | Horror           | Black Raven Dr
 10 | Mystery          | Black Raven Dr
 11 | Poetry           | Sunset Dr
 12 | Religion         | 
 13 | Romance          | Main St
 14 | Science          | Productivity Ave
 15 | Science Fiction  | Main St
(16 rows)

-- 2. Find all subjects sorted by location

SELECT * FROM subjects ORDER BY location;
 id |     subject      |     location     
----+------------------+------------------
  8 | History          | Academic Rd
  3 | Classics         | Academic Rd
 10 | Mystery          | Black Raven Dr
  9 | Horror           | Black Raven Dr
  0 | Arts             | Creativity St
  5 | Cooking          | Creativity St
  2 | Children's Books | Kids Ct
  7 | Entertainment    | Main St
  6 | Drama            | Main St
 13 | Romance          | Main St
 15 | Science Fiction  | Main St
 14 | Science          | Productivity Ave
  4 | Computers        | Productivity Ave
  1 | Business         | Productivity Ave
 11 | Poetry           | Sunset Dr
 12 | Religion         | 
(16 rows)


-- ### Where
-- 3. Find the book "Little Women"
SELECT * FROM public.books WHERE title = 'Little Women';
 id  |    title     | author_id | subject_id 
-----+--------------+-----------+------------
 190 | Little Women |        16 |          6
(1 row)

-- 4. Find all books containing the word "Python"
SELECT * FROM public.books WHERE title LIKE '%Python';
  id   |       title        | author_id | subject_id 
-------+--------------------+-----------+------------
 41473 | Programming Python |      7805 |          4
 41477 | Learning Python    |      7805 |          4
(2 rows)

-- 5. Find all subjects with the location "Main St" sort them by subject

SELECT * FROM subjects WHERE location = 'Main St'
booktown-# ;
 id |     subject     | location 
----+-----------------+----------
  6 | Drama           | Main St
  7 | Entertainment   | Main St
 13 | Romance         | Main St
 15 | Science Fiction | Main St
(4 rows)


-- ### Joins

-- 6. Find all books about Computers and list ONLY the book titles
ELECT books.title FROM books 
booktown-# JOIN subjects ON books.subject_id = subjects.id;
            title            
-----------------------------
 Dynamic Anatomy
 Goodnight Moon
 Franklin in the Dark
 Bartholomew and the Oobleck
 The Cat in the Hat
 The Velveteen Rabbit
 Practical PostgreSQL
 Perl Cookbook
 Learning Python
 Programming Python
 Little Women
 The Tell-Tale Heart
 The Shining
 2001: A Space Odyssey
 Dune
(15 rows)
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
SELECT COUNT(title)
booktown-# FROM books;
 count 
-------
    15
(1 row)

-- 12. Get the COUNT of all Locations
SELECT COUNT(location)
booktown-# FROM subjects;
 count 
-------
    15
(1 row)

-- 13. Get the COUNT of each unique location in the subjects table. Display the count and the location name. (hint: requires GROUP BY).
SELECT DISTINCT location FROM subjects;
     location     
------------------
 
 Sunset Dr
 Kids Ct
 Black Raven Dr
 Creativity St
 Academic Rd
 Main St
 Productivity Ave
(8 rows)

-- 14. List all books. Display the book_id, title, and a count of how many editions each book has. (hint: requires GROUP BY and JOIN)

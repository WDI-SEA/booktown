-- ### Order
-- 1. Find all subjects sorted by subject
-- 2. Find all subjects sorted by location

-- ### Where
-- 3. Find the book "Little Women"
-- 4. Find all books containing the word "Python"
-- 5. Find all subjects with the location "Main St" sort them by subject


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


ANSWERS 

1. booktown=# SELECT * FROM subjects ORDER BY subject;
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

 2.booktown=# SELECT subjects FROM subjects ORDER BY location;
             subjects             
----------------------------------
 (8,History,"Academic Rd")
 (3,Classics,"Academic Rd")
 (10,Mystery,"Black Raven Dr")
 (9,Horror,"Black Raven Dr")
 (0,Arts,"Creativity St")
 (5,Cooking,"Creativity St")
 (2,"Children's Books","Kids Ct")
 (7,Entertainment,"Main St")
 (6,Drama,"Main St")
 (13,Romance,"Main St")
 (15,"Science Fiction","Main St")
 (14,Science,"Productivity Ave")
 (4,Computers,"Productivity Ave")
 (1,Business,"Productivity Ave")
 (11,Poetry,"Sunset Dr")
 (12,Religion,)

3. booktown=# SELECT title FROM books WHERE title LIKE 'Litt%';
    title     
--------------
 Little Women

4. booktown=# SELECT * FROM books WHERE title LIKE '%Python%';
  id   |       title        | author_id | subject_id 
-------+--------------------+-----------+------------
 41473 | Programming Python |      7805 |          4
 41477 | Learning Python    |      7805 |          4

5.booktown=# SELECT location FROM subjects WHERE location = 'Main St' ORDER BY subject;
 location 
----------
 Main St
 Main St
 Main St
 Main St

6.


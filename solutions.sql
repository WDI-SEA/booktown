-- ### Order
-- 1. Find all subjects sorted by subject
 id |     subject      |     location     
----+------------------+------------------
  0 | Arts             | Creativity St
  1 | Business         | Productivity Ave
  2 | Childrens Books | Kids Ct
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
-- 2. Find all subjects sorted by location
     subject      
------------------
 History
 Classics
 Mystery
 Horror
 Arts
 Cooking
 Childrens Books
 Entertainment
 Drama
 Romance
 Science Fiction
 Science
 Computers
 Business
 Poetry
 Religion

-- ### Where
-- 3. Find the book "Little Women"
    title     
--------------
 Little Women
-- 4. Find all books containing the word "Python"
       title        
--------------------
 Programming Python
 Learning Python
-- 5. Find all subjects with the location "Main St" sort them by subject
     subject     
-----------------
 Drama
 Entertainment
 Romance
 Science Fiction

-- ### Joins

-- 6. Find all books about Computers and list ONLY the book titles
        title         
----------------------
 Programming Python
 Learning Python
 Perl Cookbook
 Practical PostgreSQL
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
 count 
-------
    15
-- 12. Get the COUNT of all Locations
 count 
-------
    15
-- 13. Get the COUNT of each unique location in the subjects table. Display the count and the location name. (hint: requires GROUP BY).
 count 
-------
    17
-- 14. List all books. Display the book_id, title, and a count of how many editions each book has. (hint: requires GROUP BY and JOIN)
  id   |            title            | count 
-------+-----------------------------+-------
  2038 | Dynamic Anatomy             |     1
 25908 | Franklin in the Dark        |     1
  7808 | The Shining                 |     2
  4267 | 2001: A Space Odyssey       |     2
 41473 | Programming Python          |     1
  1234 | The Velveteen Rabbit        |     1
  4513 | Dune                        |     2
  1608 | The Cat in the Hat          |     2
   190 | Little Women                |     1
  1501 | Goodnight Moon              |     1
   156 | The Tell-Tale Heart         |     2
  1590 | Bartholomew and the Oobleck |     1

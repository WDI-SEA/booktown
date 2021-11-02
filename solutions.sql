-- ### Order
-- 1. Find all subjects sorted by subject
booktown=# SELECT subject FROM subjects;
     subject      
------------------
 Arts
 Business
 Children's Books
 Classics
 Computers
 Cooking
 Drama
 Entertainment
 History
 Horror
 Mystery
 Poetry
 Religion
 Romance
 Science
 Science Fiction
(16 rows)

-- 2. Find all subjects sorted by location
booktown=# SELECT location FROM subjects;
     location     
------------------
 Creativity St
 Productivity Ave
 Kids Ct
 Academic Rd
 Productivity Ave
 Creativity St
 Main St
 Main St
 Academic Rd
 Black Raven Dr
 Black Raven Dr
 Sunset Dr
 
 Main St
 Productivity Ave
 Main St
(16 rows)

-- ### Where
-- 3. Find the book "Little Women"
booktown=# SELECT * FROM books
booktown-# ;
  id   |            title            | author_id | subject_id 
-------+-----------------------------+-----------+------------
  7808 | The Shining                 |      4156 |          9
  4513 | Dune                        |      1866 |         15
  4267 | 2001: A Space Odyssey       |      2001 |         15
  1608 | The Cat in the Hat          |      1809 |          2
  1590 | Bartholomew and the Oobleck |      1809 |          2
 25908 | Franklin in the Dark        |     15990 |          2
  1501 | Goodnight Moon              |      2031 |          2
   190 | Little Women                |        16 |          6
  1234 | The Velveteen Rabbit        |     25041 |          3
  2038 | Dynamic Anatomy             |      1644 |          0
   156 | The Tell-Tale Heart         |       115 |          9
 41473 | Programming Python          |      7805 |          4
 41477 | Learning Python             |      7805 |          4
 41478 | Perl Cookbook               |      7806 |          4
 41472 | Practical PostgreSQL        |      1212 |          4
(15 rows)

booktown=# 
-- 4. Find all books containing the word "Python"
booktown=# SELECT title FROM books WHERE title LIKE '%Python%';
       title        
--------------------
 Programming Python
 Learning Python
(2 rows)

booktown=# 
-- 5. Find all subjects with the location "Main St" sort them by subject
booktown=# SELECT subject, location FROM subjects WHERE location = 'Main St';
     subject     | location 
-----------------+----------
 Drama           | Main St
 Entertainment   | Main St
 Romance         | Main St
 Science Fiction | Main St
(4 rows)

booktown=# 

-- ### Joins

-- 6. Find all books about Computers and list ONLY the book titles
booktown=# SELECT b.title, s.subject FROM books b INNER JOIN subjects s ON b.subject_id = s.id WHERE subject = 'Computers';
        title         |  subject  
----------------------+-----------
 Practical PostgreSQL | Computers
 Perl Cookbook        | Computers
 Learning Python      | Computers
 Programming Python   | Computers
(4 rows)
-- 7. Find all books and display a result table with ONLY the following columns
-- 	* Book title
-- 	* Author's first name
-- 	* Author's last name
-- 	* Book subject
booktown=# SELECT a.first_name,a.last_name,b.title,s.subject
FROM books b INNER JOIN authors a 
ON b.author_id = a.id 
INNER JOIN subjects s
ON b.subject_id = s.id;
    first_name    |  last_name   |            title            |     subject      
------------------+--------------+-----------------------------+------------------
 John             | Worsley      | Practical PostgreSQL        | Computers
 Paulette         | Bourgeois    | Franklin in the Dark        | Children's Books
 Margery Williams | Bianco       | The Velveteen Rabbit        | Classics
 Louisa May       | Alcott       | Little Women                | Drama
 Stephen          | King         | The Shining                 | Horror
 Frank            | Herbert      | Dune                        | Science Fiction
 Burne            | Hogarth      | Dynamic Anatomy             | Arts
 Margaret Wise    | Brown        | Goodnight Moon              | Children's Books
 Edgar Allen      | Poe          | The Tell-Tale Heart         | Horror
 Mark             | Lutz         | Programming Python          | Computers
 Mark             | Lutz         | Learning Python             | Computers
 Tom              | Christiansen | Perl Cookbook               | Computers
 Arthur C.        | Clarke       | 2001: A Space Odyssey       | Science Fiction
 Theodor Seuss    | Geisel       | The Cat in the Hat          | Children's Books
 Theodor Seuss    | Geisel       | Bartholomew and the Oobleck | Children's Books
(15 rows)
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

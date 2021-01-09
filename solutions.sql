-- ### Order
----------------------------------------
-- 1. Find all subjects sorted by subject

-- booktown=# SELECT subject FROM subjects ;
--      subject
-- ------------------
--  Arts
--  Business
--  Children's Books
--  Classics
--  Computers
--  Cooking
--  Drama
--  Entertainment
--  History
--  Horror
--  Mystery
--  Poetry
--  Religion
--  Romance
--  Science
--  Science Fiction
------------------------------------------
-------------------------------------------------------------------
-- 2. Find all subjects sorted by location

-- booktown=# SELECT subject, location FROM subjects;
--      subject      |     location
-- ------------------+------------------
--  Arts             | Creativity St
--  Business         | Productivity Ave
--  Children's Books | Kids Ct
--  Classics         | Academic Rd
--  Computers        | Productivity Ave
--  Cooking          | Creativity St
--  Drama            | Main St
--  Entertainment    | Main St
--  History          | Academic Rd
--  Horror           | Black Raven Dr
--  Mystery          | Black Raven Dr
--  Poetry           | Sunset Dr
--  Religion         |
--  Romance          | Main St
--  Science          | Productivity Ave
--  Science Fiction  | Main St
-----------------------------------------------------------------
-- ### Where
----------------------------------------------------------------------
-- 3. Find the book "Little Women"
booktown=# SELECT * FROM books WHERE title='Little Women';     
 id  |    title     | author_id | subject_id
-----+--------------+-----------+------------
 190 | Little Women |        16 |          6
------------------------------------------------------------------
-- 4. Find all books containing the word "Python"

booktown=# SELECT * FROM books WHERE title LIKE '%Python%'; 
  id   |       title        | author_id | subject_id
-------+--------------------+-----------+------------
 41473 | Programming Python |      7805 |          4
 41477 | Learning Python    |      7805 |          4
--------------------------------------------------------------------
-- 5. Find all subjects with the location "Main St" sort them by subject
booktown=# SELECT * FROM subjects WHERE location='Main St' ORDER BY subject;
 id |     subject     | location
----+-----------------+----------
  6 | Drama           | Main St
  7 | Entertainment   | Main St
 13 | Romance         | Main St
 15 | Science Fiction | Main St
-----------------------------------------------------------------------------

-- ### Joins

-- 6. Find all books about Computers and list ONLY the book titles
booktown=# SELECT books.title  
booktown-# FROM books INNER JOIN subjects
booktown-# ON books.subject_id=subjects.id WHERE subjects.subject='Computers';
        title
----------------------
 Practical PostgreSQL
 Perl Cookbook
 Learning Python
 Programming Python
-------------------------------------------------------------------------------------------
-- 7. Find all books and display a result table with ONLY the following columns
-- 	* Book title
-- 	* Author's first name
-- 	* Author's last name
-- 	* Book subject
booktown=# SELECT books.title, authors.last_name, authors.first_name, subjects.subject
booktown-# FROM books JOIN subjects
booktown-# ON books.subject_id=subjects.id
booktown-# JOIN
booktown-# authors
booktown-# ON books.author_id=authors.id;
            title            |  last_name   |    first_name    |     subject
-----------------------------+--------------+------------------+------------------
 Practical PostgreSQL        | Worsley      | John             | Computers
 Franklin in the Dark        | Bourgeois    | Paulette         | Children's Books
 The Velveteen Rabbit        | Bianco       | Margery Williams | Classics
 Little Women                | Alcott       | Louisa May       | Drama
 The Shining                 | King         | Stephen          | Horror
 Dune                        | Herbert      | Frank            | Science Fiction
 Dynamic Anatomy             | Hogarth      | Burne            | Arts
 Goodnight Moon              | Brown        | Margaret Wise    | Children's Books
 The Tell-Tale Heart         | Poe          | Edgar Allen      | Horror
 Programming Python          | Lutz         | Mark             | Computers
 Learning Python             | Lutz         | Mark             | Computers
 Perl Cookbook               | Christiansen | Tom              | Computers
 2001: A Space Odyssey       | Clarke       | Arthur C.        | Science Fiction
 The Cat in the Hat          | Geisel       | Theodor Seuss    | Children's Books
 Bartholomew and the Oobleck | Geisel       | Theodor Seuss    | Children's Books
--------------------------------------------------------------------------------------------------
-- 8. Find all books that are listed in the stock table
-- 	* Sort them by retail price (most expensive first)
-- 	* Display ONLY: title and price
booktown=# SELECT books.title , stock.retail 
booktown-# FROM books
booktown-# INNER JOIN editions
booktown-# ON books.id=editions.book_id
booktown-# INNER JOIN stock ON stock.isbn=editions.isbn ORDER BY stock.retail DESC;  
            title            | retail
-----------------------------+--------
 2001: A Space Odyssey       |  46.95
 Dune                        |  45.95
 The Shining                 |  36.95
 The Cat in the Hat          |  32.95
 Goodnight Moon              |  28.95
 The Shining                 |  28.95
 Dynamic Anatomy             |  28.95
 The Tell-Tale Heart         |  24.95
 The Velveteen Rabbit        |  24.95
 The Cat in the Hat          |  23.95
 Franklin in the Dark        |  23.95
 Little Women                |  23.95
 2001: A Space Odyssey       |  22.95
 The Tell-Tale Heart         |  21.95
 Dune                        |  21.95
 Bartholomew and the Oobleck |  16.95
-----------------------------------------------------------------------------
-- 9. Find the book "Dune" and display ONLY the following columns
-- 	* Book title
-- 	* ISBN number
-- 	* Publisher name
-- 	* Retail price
booktown=# SELECT books.title, stock.isbn, publishers.name, stock.retail
booktown-# FROM books
booktown-#  INNER JOIN editions ON books.id=editions.book_id
booktown-# INNER JOIN publishers ON publishers.id=editions.publisher_id  
booktown-# INNER JOIN stock ON stock.isbn = editions.isbn;
            title            |    isbn    |            name             | retail
-----------------------------+------------+-----------------------------+--------
 The Cat in the Hat          | 039480001X | Random House                |  32.95
 The Shining                 | 0451160916 | Doubleday                   |  28.95
 Bartholomew and the Oobleck | 0394800753 | Random House                |  16.95
 Franklin in the Dark        | 0590445065 | Kids Can Press              |  23.95
 Goodnight Moon              | 0694003611 | HarperCollins               |  28.95
 The Velveteen Rabbit        | 0679803335 | Penguin                     |  24.95
 Little Women                | 0760720002 | Henry Holt & Company, Inc.  |  23.95
 The Cat in the Hat          | 0394900014 | Random House                |  23.95
 The Shining                 | 0385121679 | Doubleday                   |  36.95
 The Tell-Tale Heart         | 1885418035 | Mojo Press                  |  24.95
 The Tell-Tale Heart         | 0929605942 | Books of Wonder             |  21.95
 Dune                        | 0441172717 | Ace Books                   |  21.95
 Dune                        | 044100590X | Ace Books                   |  45.95
 2001: A Space Odyssey       | 0451457994 | Roc                         |  22.95
 2001: A Space Odyssey       | 0451198492 | Roc                         |  46.95
 Dynamic Anatomy             | 0823015505 | Watson-Guptill Publications |  28.95
-- 10. Find all shipments sorted by ship date display a result table with ONLY the following columns:
-- 	* Customer first name
-- 	* Customer last name
-- 	* ship date
-- 	* book title
booktown=# SELECT customers.last_name, customers.first_name,shipments.ship_date,books.title
booktown-# FROM books 
booktown-# INNER JOIN editions ON books.id=editions.book_id
booktown-# INNER JOIN shipments ON shipments.isbn=editions.isbn
booktown-# INNER JOIN customers ON customers.id=shipments.customer_id; 
 last_name | first_name |       ship_date        |            title
-----------+------------+------------------------+-----------------------------
 Jackson   | Annie      | 2001-09-14 17:42:22-07 | The Cat in the Hat
 King      | Jenny      | 2001-09-14 16:46:32-07 | The Cat in the Hat
 Bollman   | Julie      | 2001-08-13 09:42:10-07 | The Cat in the Hat
 Morrill   | Eric       | 2001-08-10 13:47:52-07 | The Cat in the Hat
 Allen     | Chad       | 2001-08-06 09:29:21-07 | The Cat in the Hat
 Anderson  | Jonathan   | 2001-08-08 08:36:44-07 | The Shining
 King      | Jenny      | 2001-08-14 13:45:51-07 | The Shining
 Brown     | Chuck      | 2001-08-14 10:36:41-07 | The Shining
 Jackson   | Annie      | 2001-09-22 20:58:56-07 | Bartholomew and the Oobleck
 Jackson   | Annie      | 2001-09-22 11:23:28-07 | Bartholomew and the Oobleck
 Jackson   | Annie      | 2001-08-08 10:46:13-07 | Bartholomew and the Oobleck
 Jackson   | Annie      | 2001-08-06 11:46:36-07 | Bartholomew and the Oobleck
 Jackson   | Annie      | 2001-08-07 10:58:36-07 | Bartholomew and the Oobleck
 Jackson   | Annie      | 2001-08-11 09:55:05-07 | Bartholomew and the Oobleck
 Thomas    | Rich       | 2001-08-10 07:29:52-07 | Franklin in the Dark
 Robinson  | Tammy      | 2001-08-14 13:49:00-07 | Franklin in the Dark
 Owens     | Jean       | 2001-08-12 12:09:47-07 | Franklin in the Dark
 Clark     | James      | 2001-08-15 11:57:40-07 | Goodnight Moon
 Bennett   | Laura      | 2001-08-06 07:49:44-07 | Goodnight Moon
 Brown     | Richard    | 2001-08-11 10:52:34-07 | Goodnight Moon
 Black     | Wendy      | 2001-08-09 09:30:46-07 | The Velveteen Rabbit
 Olson     | Dave       | 2001-08-09 07:30:07-07 | The Velveteen Rabbit
 Morrill   | Eric       | 2001-08-07 13:00:48-07 | Little Women
 Bollman   | Owen       | 2001-08-05 09:34:04-07 | Little Women
 Corner    | Kathy      | 2001-08-13 09:47:04-07 | The Cat in the Hat
 Williams  | James      | 2001-08-11 13:34:08-07 | The Cat in the Hat
 Becker    | Owen       | 2001-08-12 13:39:22-07 | The Shining
 Gould     | Ed         | 2001-08-08 09:53:46-07 | The Shining
 Morrill   | Royce      | 2001-08-07 11:31:57-07 | The Tell-Tale Heart
 Holloway  | Adam       | 2001-08-14 13:41:39-07 | The Tell-Tale Heart
 Black     | Jean       | 2001-08-10 08:29:42-07 | The Tell-Tale Heart
 Young     | Trevor     | 2001-08-14 08:42:58-07 | Dune
 Gerdes    | Kate       | 2001-08-12 08:46:35-07 | Dune
 Holloway  | Christine  | 2001-08-07 11:56:42-07 | 2001: A Space Odyssey
 Gould     | Shirley    | 2001-08-15 14:02:01-07 | 2001: A Space Odyssey
 Owens     | Tim        | 2001-08-14 07:33:47-07 | Dynamic Anatomy
(36 rows)

-- ### Grouping and Counting

-- 11. Get the COUNT of all books
booktown=# SELECT COUNT(*) FROM books; 
 count
-------
    15
(1 row)
-- 12. Get the COUNT of all Locations
booktown=# SELECT COUNT(location) FROM subjects;
 count
-------
    15
-- 13. Get the COUNT of each unique location in the subjects table. Display the count and the location name. (hint: requires GROUP BY).
booktown=# SELECT COUNT(location),location FROM subjects GROUP BY location; 
 count |     location
-------+------------------
     0 |
     1 | Sunset Dr
     1 | Kids Ct
     2 | Black Raven Dr
     2 | Creativity St
     2 | Academic Rd
     4 | Main St
     3 | Productivity Ave
-- 14. List all books. Display the book_id, title, and a count of how many editions each book has. (hint: requires GROUP BY and JOIN)
booktown=# SELECT books.title,editions.book_id,COUNT(editions.book_id)
booktown-# FROM books INNER JOIN editions                              
booktown-# ON books.id=editions.book_id                                
booktown-# GROUP BY editions.book_id , books.title;                    
            title            | book_id | count
-----------------------------+---------+-------
 The Velveteen Rabbit        |    1234 |     1
 Franklin in the Dark        |   25908 |     1
 Goodnight Moon              |    1501 |     1
 Programming Python          |   41473 |     1
 Bartholomew and the Oobleck |    1590 |     1
 The Tell-Tale Heart         |     156 |     2
 Little Women                |     190 |     1
 The Shining                 |    7808 |     2
 The Cat in the Hat          |    1608 |     2
 2001: A Space Odyssey       |    4267 |     2
 Dune                        |    4513 |     2
 Dynamic Anatomy             |    2038 |     1
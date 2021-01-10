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

6.booktown=# SELECT books.title FROM books JOIN subjects ON books.subject_id = subjects.id WHERE subjects.subject = 'Computers';
        title         
----------------------
 Practical PostgreSQL
 Perl Cookbook
 Learning Python
 Programming Python

7.booktown=# SELECT b.title, a.first_name, a.last_name, s.subject 
booktown-# FROM books b 
booktown-# JOIN authors a
booktown-# ON b.author_id = a.id
booktown-# JOIN subjects s
booktown-# ON b.subject_id = s.id;
        title            |    first_name    |  last_name   |     subject      
-----------------------------+------------------+--------------+------------------
 Practical PostgreSQL        | John             | Worsley      | Computers
 Franklin in the Dark        | Paulette         | Bourgeois    | Children's Books
 The Velveteen Rabbit        | Margery Williams | Bianco       | Classics
 Little Women                | Louisa May       | Alcott       | Drama
 The Shining                 | Stephen          | King         | Horror
 Dune                        | Frank            | Herbert      | Science Fiction
 Dynamic Anatomy             | Burne            | Hogarth      | Arts
 Goodnight Moon              | Margaret Wise    | Brown        | Children's Books
 The Tell-Tale Heart         | Edgar Allen      | Poe          | Horror
 Programming Python          | Mark             | Lutz         | Computers
 Learning Python             | Mark             | Lutz         | Computers
 Perl Cookbook               | Tom              | Christiansen | Computers
 2001: A Space Odyssey       | Arthur C.        | Clarke       | Science Fiction
 The Cat in the Hat          | Theodor Seuss    | Geisel       | Children's Books
 Bartholomew and the Oobleck | Theodor Seuss    | Geisel       | Children's Books
(15 rows)

8.booktown=# SELECT s.retail, b.title FROM stock s
booktown-# JOIN editions e 
booktown-# ON s.isbn = e.isbn
booktown-# JOIN books b
booktown-# ON b.id = e.book_id
booktown-# ORDER BY s.retail DESC;
 retail |            title            
--------+-----------------------------
  46.95 | 2001: A Space Odyssey
  45.95 | Dune
  36.95 | The Shining
  32.95 | The Cat in the Hat
  28.95 | Goodnight Moon
  28.95 | The Shining
  28.95 | Dynamic Anatomy
  24.95 | The Tell-Tale Heart
  24.95 | The Velveteen Rabbit
  23.95 | The Cat in the Hat
  23.95 | Franklin in the Dark
  23.95 | Little Women
  22.95 | 2001: A Space Odyssey
  21.95 | The Tell-Tale Heart
  21.95 | Dune
  16.95 | Bartholomew and the Oobleck

9. booktown=# SELECT b.title, e.isbn, p.name, s.retail
booktown-# FROM books b
booktown-# JOIN editions e
booktown-# ON b.id = e.book_id
booktown-# JOIN publishers p
booktown-# ON p.id = e.publisher_id
booktown-# JOIN stock s
booktown-# ON s.isbn = e.isbn
booktown-# WHERE b.title = 'Dune';
 title |    isbn    |   name    | retail 
-------+------------+-----------+--------
 Dune  | 0441172717 | Ace Books |  21.95
 Dune  | 044100590X | Ace Books |  45.95

 10.booktown=# SELECT c.first_name, c.last_name, sh.ship_date, b.title
booktown-# FROM customers c
booktown-# JOIN shipments sh
booktown-# ON c.id = sh.customer_id
booktown-# JOIN editions e
booktown-# ON e.isbn = sh.isbn
booktown-# JOIN books b
booktown-# ON e.book_id = b.id;
 first_name | last_name |       ship_date        |            title            
------------+-----------+------------------------+-----------------------------
 Annie      | Jackson   | 2001-09-14 20:42:22-04 | The Cat in the Hat
 Jenny      | King      | 2001-09-14 19:46:32-04 | The Cat in the Hat
 Julie      | Bollman   | 2001-08-13 12:42:10-04 | The Cat in the Hat
 Eric       | Morrill   | 2001-08-10 16:47:52-04 | The Cat in the Hat
 Chad       | Allen     | 2001-08-06 12:29:21-04 | The Cat in the Hat
 Jonathan   | Anderson  | 2001-08-08 11:36:44-04 | The Shining
 Jenny      | King      | 2001-08-14 16:45:51-04 | The Shining
 Chuck      | Brown     | 2001-08-14 13:36:41-04 | The Shining
 Annie      | Jackson   | 2001-09-22 23:58:56-04 | Bartholomew and the Oobleck
 Annie      | Jackson   | 2001-09-22 14:23:28-04 | Bartholomew and the Oobleck
 Annie      | Jackson   | 2001-08-08 13:46:13-04 | Bartholomew and the Oobleck
 Annie      | Jackson   | 2001-08-06 14:46:36-04 | Bartholomew and the Oobleck
 Annie      | Jackson   | 2001-08-07 13:58:36-04 | Bartholomew and the Oobleck
 Annie      | Jackson   | 2001-08-11 12:55:05-04 | Bartholomew and the Oobleck
 Rich       | Thomas    | 2001-08-10 10:29:52-04 | Franklin in the Dark
 Tammy      | Robinson  | 2001-08-14 16:49:00-04 | Franklin in the Dark
 Jean       | Owens     | 2001-08-12 15:09:47-04 | Franklin in the Dark
 James      | Clark     | 2001-08-15 14:57:40-04 | Goodnight Moon
 Laura      | Bennett   | 2001-08-06 10:49:44-04 | Goodnight Moon
 Richard    | Brown     | 2001-08-11 13:52:34-04 | Goodnight Moon
 Wendy      | Black     | 2001-08-09 12:30:46-04 | The Velveteen Rabbit
 Dave       | Olson     | 2001-08-09 10:30:07-04 | The Velveteen Rabbit
 Eric       | Morrill   | 2001-08-07 16:00:48-04 | Little Women
 Owen       | Bollman   | 2001-08-05 12:34:04-04 | Little Women
 Kathy      | Corner    | 2001-08-13 12:47:04-04 | The Cat in the Hat
 James      | Williams  | 2001-08-11 16:34:08-04 | The Cat in the Hat
 Owen       | Becker    | 2001-08-12 16:39:22-04 | The Shining
 Ed         | Gould     | 2001-08-08 12:53:46-04 | The Shining
 Royce      | Morrill   | 2001-08-07 14:31:57-04 | The Tell-Tale Heart
 Adam       | Holloway  | 2001-08-14 16:41:39-04 | The Tell-Tale Heart
 Jean       | Black     | 2001-08-10 11:29:42-04 | The Tell-Tale Heart
 Trevor     | Young     | 2001-08-14 11:42:58-04 | Dune
 Kate       | Gerdes    | 2001-08-12 11:46:35-04 | Dune

11.booktown=# SELECT COUNT (*) FROM books;
 count 
-------
    15
(1 row)

12.booktown=# SELECT COUNT (*) FROM states;
 count 
-------
     2

13. booktown=# SELECT DISTINCT COUNT (location), location FROM subjects GROUP BY location;
 count |     location     
-------+------------------
     2 | Black Raven Dr
     1 | Sunset Dr
     2 | Academic Rd
     3 | Productivity Ave
     2 | Creativity St
     0 | 
     4 | Main St
     1 | Kids Ct

14.booktown=# SELECT b.id, b.title, e.edition
booktown-# FROM books b
booktown-# JOIN editions e
booktown-# ON b.id = e.book_id;
  id   |            title            | edition 
-------+-----------------------------+---------
  1608 | The Cat in the Hat          |       1
  7808 | The Shining                 |       1
  1590 | Bartholomew and the Oobleck |       1
 25908 | Franklin in the Dark        |       1
  1501 | Goodnight Moon              |       1
  1234 | The Velveteen Rabbit        |       1
   190 | Little Women                |       1
  1608 | The Cat in the Hat          |       1
  7808 | The Shining                 |       2
   156 | The Tell-Tale Heart         |       1
   156 | The Tell-Tale Heart         |       2
  4513 | Dune                        |       2
  4513 | Dune                        |       3
  4267 | 2001: A Space Odyssey       |       3
  4267 | 2001: A Space Odyssey       |       3
  2038 | Dynamic Anatomy             |       1
 41473 | Programming Python          |       2
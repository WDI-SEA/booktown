-- ### Order
-- 1. Find all subjects sorted by subject
SELECT subject FROM subjects GROUP BY subject
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

-- 2. Find all subjects sorted by location
SELECT location FROM subjects GROUP BY location
     subject
------------------
 Religion
 Poetry
 Business
 Computers
 Science
 Drama
 Entertainment
 Science Fiction
 Romance
 Children's Books
 Arts
 Cooking
 Mystery
 Horror
 History
 Classics

-- ### Where
-- 3. Find the book "Little Women"
SELECT location FROM subjects WHERE subject_id = 6;
Main Street

-- 4. Find all books containing the word "Python"
SELECT * FROM books WHERE title LIKE '%Python%'
  id   |       title        | author_id | subject_id
-------+--------------------+-----------+------------
 41473 | Programming Python |      7805 |          4
 41477 | Learning Python    |      7805 |          4

-- 5. Find all subjects with the location "Main St" sort them by subjec
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
 Practical PostgreSQL
 Perl Cookbook
 Learning Python
 Programming Python

-- 7. Find all books and display a result table with ONLY the following columns
-- 	* Book title
-- 	* Author's first name
-- 	* Author's last name
-- 	* Book subject
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
\d\
-- 8. Find all books that are listed in the stock table
-- 	* Sort them by retail price (most expensive first)
-- 	* Display ONLY: title and price
            title            | cost
-----------------------------+-------
 2001: A Space Odyssey       | 36.00
 Dune                        | 36.00
 The Cat in the Hat          | 30.00
 The Shining                 | 29.00
 Dynamic Anatomy             | 26.00
 Goodnight Moon              | 25.00
 The Shining                 | 24.00
 The Cat in the Hat          | 23.00
 Franklin in the Dark        | 23.00
 The Tell-Tale Heart         | 23.00
 The Velveteen Rabbit        | 20.00
 The Tell-Tale Heart         | 19.00
 Little Women                | 18.00
 2001: A Space Odyssey       | 17.00
 Dune                        | 17.00
 Bartholomew and the Oobleck | 16.00

-- 9. Find the book "Dune" and display ONLY the following columns
-- 	* Book title
-- 	* ISBN number
-- 	* Publisher name
-- 	* Retail price

booktown=# SELECT b.title, s.isbn, p.name, s.retail FROM books b
booktown-# INNER JOIN editions e ON b.id = e.book_id
booktown-# INNER JOIN stock s ON e.isbn = s.isbn
booktown-# INNER JOIN publishers p ON e.publisher_id = p.id WHERE b.title = 'Dune';
 title |    isbn    |   name    | retail
-------+------------+-----------+--------
 Dune  | 0441172717 | Ace Books |  21.95
 Dune  | 044100590X | Ace Books |  45.95

-- 10. Find all shipments sorted by ship date display a result table with ONLY the following columns:
-- 	* Customer first name
-- 	* Customer last name
-- 	* ship date
-- 	* book title

booktown=# SELECT c.first_name, c.last_name, s.ship_date, b.title FROM customers c
booktown-# INNER JOIN shipments s ON s.customer_id = c.id
booktown-# INNER JOIN editions e ON e.isbn = s.isbn
booktown-# INNER JOIN books b ON e.book_id = b.id;
 first_name | last_name |       ship_date        |            title
------------+-----------+------------------------+-----------------------------
 Annie      | Jackson   | 2001-09-14 19:42:22-05 | The Cat in the Hat
 Jenny      | King      | 2001-09-14 18:46:32-05 | The Cat in the Hat
 Julie      | Bollman   | 2001-08-13 11:42:10-05 | The Cat in the Hat
 Eric       | Morrill   | 2001-08-10 15:47:52-05 | The Cat in the Hat
 Chad       | Allen     | 2001-08-06 11:29:21-05 | The Cat in the Hat
 Jonathan   | Anderson  | 2001-08-08 10:36:44-05 | The Shining
 Jenny      | King      | 2001-08-14 15:45:51-05 | The Shining
 Chuck      | Brown     | 2001-08-14 12:36:41-05 | The Shining
 Annie      | Jackson   | 2001-09-22 22:58:56-05 | Bartholomew and the Oobleck
 Annie      | Jackson   | 2001-09-22 13:23:28-05 | Bartholomew and the Oobleck
 Annie      | Jackson   | 2001-08-08 12:46:13-05 | Bartholomew and the Oobleck
 Annie      | Jackson   | 2001-08-06 13:46:36-05 | Bartholomew and the Oobleck
 Annie      | Jackson   | 2001-08-07 12:58:36-05 | Bartholomew and the Oobleck
 Annie      | Jackson   | 2001-08-11 11:55:05-05 | Bartholomew and the Oobleck
 Rich       | Thomas    | 2001-08-10 09:29:52-05 | Franklin in the Dark
 Tammy      | Robinson  | 2001-08-14 15:49:00-05 | Franklin in the Dark
 Jean       | Owens     | 2001-08-12 14:09:47-05 | Franklin in the Dark
 James      | Clark     | 2001-08-15 13:57:40-05 | Goodnight Moon
 Laura      | Bennett   | 2001-08-06 09:49:44-05 | Goodnight Moon
 Richard    | Brown     | 2001-08-11 12:52:34-05 | Goodnight Moon
 Wendy      | Black     | 2001-08-09 11:30:46-05 | The Velveteen Rabbit
 Dave       | Olson     | 2001-08-09 09:30:07-05 | The Velveteen Rabbit
 Eric       | Morrill   | 2001-08-07 15:00:48-05 | Little Women
 Owen       | Bollman   | 2001-08-05 11:34:04-05 | Little Women
 Kathy      | Corner    | 2001-08-13 11:47:04-05 | The Cat in the Hat
 James      | Williams  | 2001-08-11 15:34:08-05 | The Cat in the Hat
 Owen       | Becker    | 2001-08-12 15:39:22-05 | The Shining
 Ed         | Gould     | 2001-08-08 11:53:46-05 | The Shining
 Royce      | Morrill   | 2001-08-07 13:31:57-05 | The Tell-Tale Heart
 Adam       | Holloway  | 2001-08-14 15:41:39-05 | The Tell-Tale Heart
 Jean       | Black     | 2001-08-10 10:29:42-05 | The Tell-Tale Heart
 Trevor     | Young     | 2001-08-14 10:42:58-05 | Dune
 Kate       | Gerdes    | 2001-08-12 10:46:35-05 | Dune
 Christine  | Holloway  | 2001-08-07 13:56:42-05 | 2001: A Space Odyssey
 Shirley    | Gould     | 2001-08-15 16:02:01-05 | 2001: A Space Odyssey
 Tim        | Owens     | 2001-08-14 09:33:47-05 | Dynamic Anatomy


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
     0
     1
     1
     2
     2
     2
     4
     3

-- 14. List all books. Display the book_id, title, and a count of how many editions each book has. (hint: requires GROUP BY and JOIN)

booktown=# SELECT b.id, b.title, COUNT(e.edition) FROM books b
booktown-# INNER JOIN editions e ON e.book_id = b.id GROUP BY b.id;
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

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



booktown=# SELECT * FROM subjects ORDER BY location;
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


booktown=# SELECT * FROM books WHERE title = 'Little Women';
 id  |    title     | author_id | subject_id 
-----+--------------+-----------+------------
 190 | Little Women |        16 |          6
(1 row)


booktown=# SELECT * FROM books WHERE title LIKE '%Python';
  id   |       title        | author_id | subject_id 
-------+--------------------+-----------+------------
 41473 | Programming Python |      7805 |          4
 41477 | Learning Python    |      7805 |          4
(2 rows)


booktown=# SELECT * FROM subjects WHERE location = 'Main St';
 id |     subject     | location 
----+-----------------+----------
  6 | Drama           | Main St
  7 | Entertainment   | Main St
 13 | Romance         | Main St
 15 | Science Fiction | Main St
(4 rows)

booktown=# SELECT * FROM subjects WHERE location = 'Main St' ORDER BY subject;
 id |     subject     | location 
----+-----------------+----------
  6 | Drama           | Main St
  7 | Entertainment   | Main St
 13 | Romance         | Main St
 15 | Science Fiction | Main St
(4 rows)

booktown=# SELECT title FROM books WHERE subject_id = '4';
        title         
----------------------
 Programming Python
 Learning Python
 Perl Cookbook
 Practical PostgreSQL
(4 rows)


7. booktown=# SELECT a.first_name, a.last_name, b.title, b.subject_id FROM books b JOIN authors a ON b.author_id=a.id;
    first_name    |  last_name   |            title            | subject_id 
------------------+--------------+-----------------------------+------------
 John             | Worsley      | Practical PostgreSQL        |          4
 Paulette         | Bourgeois    | Franklin in the Dark        |          2
 Margery Williams | Bianco       | The Velveteen Rabbit        |          3
 Louisa May       | Alcott       | Little Women                |          6
 Stephen          | King         | The Shining                 |          9
 Frank            | Herbert      | Dune                        |         15
 Burne            | Hogarth      | Dynamic Anatomy             |          0
 Margaret Wise    | Brown        | Goodnight Moon              |          2
 Edgar Allen      | Poe          | The Tell-Tale Heart         |          9
 Mark             | Lutz         | Learning Python             |          4
 Mark             | Lutz         | Programming Python          |          4
 Tom              | Christiansen | Perl Cookbook               |          4
 Arthur C.        | Clarke       | 2001: A Space Odyssey       |         15
 Theodor Seuss    | Geisel       | Bartholomew and the Oobleck |          2
 Theodor Seuss    | Geisel       | The Cat in the Hat          |          2
(15 rows)

booktown=# 

8. booktown=# SELECT books.title, stock.retail FROM books JOIN editions ON books.id = editions.book_id JOIN stock ON editions.isbn = stock.isbn ORDER BY stock.retail;
            title            | retail 
-----------------------------+--------
 Bartholomew and the Oobleck |  16.95
 The Tell-Tale Heart         |  21.95
 Dune                        |  21.95
 2001: A Space Odyssey       |  22.95
 Franklin in the Dark        |  23.95
 Little Women                |  23.95
 The Cat in the Hat          |  23.95
 The Tell-Tale Heart         |  24.95
 The Velveteen Rabbit        |  24.95
 The Shining                 |  28.95
 Dynamic Anatomy             |  28.95
 Goodnight Moon              |  28.95
 The Cat in the Hat          |  32.95
 The Shining                 |  36.95
 Dune                        |  45.95
 2001: A Space Odyssey       |  46.95
(16 rows)

9. booktown=# SELECT books.title, editions.isbn, publishers.name, stock.retail FROM books JOIN editions ON books.id = editions.book_id JOIN stock ON editions.isbn = stock.isbn JOIN publishers ON editions.publisher_id = publishers.id WHERE title = 'Dune';
 title |    isbn    |   name    | retail 
-------+------------+-----------+--------
 Dune  | 0441172717 | Ace Books |  21.95
 Dune  | 044100590X | Ace Books |  45.95
(2 rows)

10. booktown=# SELECT customers.first_name, customers.last_name, shipments.ship_date, books.title FROM shipments JOIN customers ON shipments.customer_id = customers.id JOIN editions ON shipments.isbn = editions.isbn JOIN books ON books.id = editions.book_id;
 first_name | last_name |       ship_date        |            title            
------------+-----------+------------------------+-----------------------------
 Annie      | Jackson   | 2001-09-14 17:42:22-07 | The Cat in the Hat
 Jenny      | King      | 2001-09-14 16:46:32-07 | The Cat in the Hat
 Julie      | Bollman   | 2001-08-13 09:42:10-07 | The Cat in the Hat
 Eric       | Morrill   | 2001-08-10 13:47:52-07 | The Cat in the Hat
 Chad       | Allen     | 2001-08-06 09:29:21-07 | The Cat in the Hat
 Jonathan   | Anderson  | 2001-08-08 08:36:44-07 | The Shining
 Jenny      | King      | 2001-08-14 13:45:51-07 | The Shining
 Chuck      | Brown     | 2001-08-14 10:36:41-07 | The Shining
 Annie      | Jackson   | 2001-09-22 20:58:56-07 | Bartholomew and the Oobleck
 Annie      | Jackson   | 2001-09-22 11:23:28-07 | Bartholomew and the Oobleck
 Annie      | Jackson   | 2001-08-08 10:46:13-07 | Bartholomew and the Oobleck
 Annie      | Jackson   | 2001-08-06 11:46:36-07 | Bartholomew and the Oobleck
 Annie      | Jackson   | 2001-08-07 10:58:36-07 | Bartholomew and the Oobleck
 Annie      | Jackson   | 2001-08-11 09:55:05-07 | Bartholomew and the Oobleck
 Rich       | Thomas    | 2001-08-10 07:29:52-07 | Franklin in the Dark
 Tammy      | Robinson  | 2001-08-14 13:49:00-07 | Franklin in the Dark
 Jean       | Owens     | 2001-08-12 12:09:47-07 | Franklin in the Dark
 James      | Clark     | 2001-08-15 11:57:40-07 | Goodnight Moon
 Laura      | Bennett   | 2001-08-06 07:49:44-07 | Goodnight Moon
 Richard    | Brown     | 2001-08-11 10:52:34-07 | Goodnight Moon
 Wendy      | Black     | 2001-08-09 09:30:46-07 | The Velveteen Rabbit
 Dave       | Olson     | 2001-08-09 07:30:07-07 | The Velveteen Rabbit
 Eric       | Morrill   | 2001-08-07 13:00:48-07 | Little Women
 Owen       | Bollman   | 2001-08-05 09:34:04-07 | Little Women
 Kathy      | Corner    | 2001-08-13 09:47:04-07 | The Cat in the Hat
 James      | Williams  | 2001-08-11 13:34:08-07 | The Cat in the Hat
 Owen       | Becker    | 2001-08-12 13:39:22-07 | The Shining
 Ed         | Gould     | 2001-08-08 09:53:46-07 | The Shining
 Royce      | Morrill   | 2001-08-07 11:31:57-07 | The Tell-Tale Heart
 Adam       | Holloway  | 2001-08-14 13:41:39-07 | The Tell-Tale Heart
 Jean       | Black     | 2001-08-10 08:29:42-07 | The Tell-Tale Heart
 Trevor     | Young     | 2001-08-14 08:42:58-07 | Dune
 Kate       | Gerdes    | 2001-08-12 08:46:35-07 | Dune
 Christine  | Holloway  | 2001-08-07 11:56:42-07 | 2001: A Space Odyssey
 Shirley    | Gould     | 2001-08-15 14:02:01-07 | 2001: A Space Odyssey
 Tim        | Owens     | 2001-08-14 07:33:47-07 | Dynamic Anatomy
(36 rows)

11. booktown=# SELECT count(*) FROM books;
 count 
-------
    15
(1 row)

12. booktown=# SELECT count(location) FROM subjects;
 count 
-------
    15
(1 row)

13. booktown=# SELECT location, count(location) FROM subjects GROUP BY location;
     location     | count 
------------------+-------
                  |     0
 Sunset Dr        |     1
 Kids Ct          |     1
 Black Raven Dr   |     2
 Creativity St    |     2
 Academic Rd      |     2
 Main St          |     4
 Productivity Ave |     3
(8 rows)

14. 
booktown=# SELECT books.id, books.title, COUNT(editions.book_id) FROM books INNER JOIN editions ON books.id = editions.book_id GROUP BY books.id;
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
(12 rows)

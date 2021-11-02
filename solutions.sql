-- ### Order
-- 1. Find all subjects sorted by subject

-- booktown=# SELECT * FROM subjects ORDER BY subject;
--  id |     subject      |     location     
-- ----+------------------+------------------
--   0 | Arts             | Creativity St
--   1 | Business         | Productivity Ave
--   2 | Children's Books | Kids Ct
--   3 | Classics         | Academic Rd
--   4 | Computers        | Productivity Ave
--   5 | Cooking          | Creativity St
--   6 | Drama            | Main St
--   7 | Entertainment    | Main St
--   8 | History          | Academic Rd
--   9 | Horror           | Black Raven Dr
--  10 | Mystery          | Black Raven Dr
--  11 | Poetry           | Sunset Dr
--  12 | Religion         | 
--  13 | Romance          | Main St
--  14 | Science          | Productivity Ave
--  15 | Science Fiction  | Main St
-- (16 rows)


-- 2. Find all subjects sorted by location

-- booktown=# SELECT * FROM subjects ORDER BY location;
--  id |     subject      |     location     
-- ----+------------------+------------------
--   8 | History          | Academic Rd
--   3 | Classics         | Academic Rd
--  10 | Mystery          | Black Raven Dr
--   9 | Horror           | Black Raven Dr
--   0 | Arts             | Creativity St
--   5 | Cooking          | Creativity St
--   2 | Children's Books | Kids Ct
--   7 | Entertainment    | Main St
--   6 | Drama            | Main St
--  13 | Romance          | Main St
--  15 | Science Fiction  | Main St
--  14 | Science          | Productivity Ave
--   4 | Computers        | Productivity Ave
--   1 | Business         | Productivity Ave
--  11 | Poetry           | Sunset Dr
--  12 | Religion         | 
-- (16 rows)


-- ### Where
-- 3. Find the book "Little Women"

-- booktown=# SELECT * FROM books WHERE title = 'Little Women';
--  id  |    title     | author_id | subject_id 
-- -----+--------------+-----------+------------
--  190 | Little Women |        16 |          6
-- (1 row)

-- 4. Find all books containing the word "Python"

-- booktown=# SELECT * FROM books WHERE title LIKE '%Python';
--   id   |       title        | author_id | subject_id 
-- -------+--------------------+-----------+------------
--  41473 | Programming Python |      7805 |          4
--  41477 | Learning Python    |      7805 |          4
-- (2 rows)

-- 5. Find all subjects with the location "Main St" sort them by subject

-- booktown=# SELECT * FROM subjects WHERE location LIKE '%Main St';
--  id |     subject     | location 
-- ----+-----------------+----------
--   6 | Drama           | Main St
--   7 | Entertainment   | Main St
--  13 | Romance         | Main St
--  15 | Science Fiction | Main St
-- (4 rows)


-- ### Joins

-- 6. Find all books about Computers and list ONLY the book titles

-- booktown=# SELECT s.subject, b.title    
-- FROM subjects s INNER JOIN books b 
-- ON s.id=b.subject_id WHERE subject = 'Computers';
--   subject  |        title         
-- -----------+----------------------
--  Computers | Practical PostgreSQL
--  Computers | Perl Cookbook
--  Computers | Learning Python
--  Computers | Programming Python
-- (4 rows)

-- 7. Find all books and display a result table with ONLY the following columns
-- 	* Book title
-- 	* Author's first name
-- 	* Author's last name
-- 	* Book subject

-- booktown=# SELECT b.title, a.first_name, a.last_name, s.subject    
-- FROM books b JOIN authors a 
-- ON b.author_id=a.id Join subjects s ON b.subject_id=s.id;
--             title            |    first_name    |  last_name   |     subject      
-- -----------------------------+------------------+--------------+------------------
--  Practical PostgreSQL        | John             | Worsley      | Computers
--  Franklin in the Dark        | Paulette         | Bourgeois    | Children's Books
--  The Velveteen Rabbit        | Margery Williams | Bianco       | Classics
--  Little Women                | Louisa May       | Alcott       | Drama
--  The Shining                 | Stephen          | King         | Horror
--  Dune                        | Frank            | Herbert      | Science Fiction
--  Dynamic Anatomy             | Burne            | Hogarth      | Arts
--  Goodnight Moon              | Margaret Wise    | Brown        | Children's Books
--  The Tell-Tale Heart         | Edgar Allen      | Poe          | Horror
--  Programming Python          | Mark             | Lutz         | Computers
--  Learning Python             | Mark             | Lutz         | Computers
--  Perl Cookbook               | Tom              | Christiansen | Computers
--  2001: A Space Odyssey       | Arthur C.        | Clarke       | Science Fiction
--  The Cat in the Hat          | Theodor Seuss    | Geisel       | Children's Books
--  Bartholomew and the Oobleck | Theodor Seuss    | Geisel       | Children's Books
-- (15 rows)

-- 8. Find all books that are listed in the stock table
-- 	* Sort them by retail price (most expensive first)
-- 	* Display ONLY: title and price

-- booktown=# SELECT b.title, s.retail FROM books b Join editions e On b.id=e.book_id Join stock s On s.isbn=e.isbn ORDER BY retail DESC;
--             title            | retail 
-- -----------------------------+--------
--  2001: A Space Odyssey       |  46.95
--  Dune                        |  45.95
--  The Shining                 |  36.95
--  The Cat in the Hat          |  32.95
--  Goodnight Moon              |  28.95
--  The Shining                 |  28.95
--  Dynamic Anatomy             |  28.95
--  The Tell-Tale Heart         |  24.95
--  The Velveteen Rabbit        |  24.95
--  The Cat in the Hat          |  23.95
--  Franklin in the Dark        |  23.95
--  Little Women                |  23.95
--  2001: A Space Odyssey       |  22.95
--  The Tell-Tale Heart         |  21.95
--  Dune                        |  21.95
--  Bartholomew and the Oobleck |  16.95
-- (16 rows)


-- 9. Find the book "Dune" and display ONLY the following columns
-- 	* Book title
-- 	* ISBN number
-- 	* Publisher name
-- 	* Retail price

-- booktown=# SELECT b.title, e.isbn, p.name, s.retail FROM editions e Join publishers p On e.publisher_id=p.id Join books b On e.book_id=b.id Join stock s On e.isbn=s.isbn;
--             title            |    isbn    |            name             | retail 
-- -----------------------------+------------+-----------------------------+--------
--  The Cat in the Hat          | 039480001X | Random House                |  32.95
--  The Shining                 | 0451160916 | Doubleday                   |  28.95
--  Bartholomew and the Oobleck | 0394800753 | Random House                |  16.95
--  Franklin in the Dark        | 0590445065 | Kids Can Press              |  23.95
--  Goodnight Moon              | 0694003611 | HarperCollins               |  28.95
--  The Velveteen Rabbit        | 0679803335 | Penguin                     |  24.95
--  Little Women                | 0760720002 | Henry Holt & Company, Inc.  |  23.95
--  The Cat in the Hat          | 0394900014 | Random House                |  23.95
--  The Shining                 | 0385121679 | Doubleday                   |  36.95
--  The Tell-Tale Heart         | 1885418035 | Mojo Press                  |  24.95
--  The Tell-Tale Heart         | 0929605942 | Books of Wonder             |  21.95
--  Dune                        | 0441172717 | Ace Books                   |  21.95
--  Dune                        | 044100590X | Ace Books                   |  45.95
--  2001: A Space Odyssey       | 0451457994 | Roc                         |  22.95
--  2001: A Space Odyssey       | 0451198492 | Roc                         |  46.95
--  Dynamic Anatomy             | 0823015505 | Watson-Guptill Publications |  28.95
-- (16 rows)

-- booktown=# SELECT b.title, e.isbn, p.name, s.retail FROM editions e Join publishers p On e.publisher_id=p.id Join books b On e.book_id=b.id Join stock s On e.isbn=s.isbn WHERE title = 'Dune';
--  title |    isbn    |   name    | retail 
-- -------+------------+-----------+--------
--  Dune  | 0441172717 | Ace Books |  21.95
--  Dune  | 044100590X | Ace Books |  45.95
-- (2 rows)


-- 10. Find all shipments sorted by ship date display a result table with ONLY the following columns:
-- 	* Customer first name
-- 	* Customer last name
-- 	* ship date
-- 	* book title


-- booktown=# SELECT c.first_name, c.last_name, s.ship_date, b.title FROM shipments s Join customers c On s.customer_id=c.id Join editions e On e.isbn=s.isbn Join books b On b.id=e.book_id ORDER BY ship_date;
--  first_name | last_name |       ship_date        |            title            
-- ------------+-----------+------------------------+-----------------------------
--  Owen       | Bollman   | 2001-08-05 12:34:04-04 | Little Women
--  Laura      | Bennett   | 2001-08-06 10:49:44-04 | Goodnight Moon
--  Chad       | Allen     | 2001-08-06 12:29:21-04 | The Cat in the Hat
--  Annie      | Jackson   | 2001-08-06 14:46:36-04 | Bartholomew and the Oobleck
--  Annie      | Jackson   | 2001-08-07 13:58:36-04 | Bartholomew and the Oobleck
--  Royce      | Morrill   | 2001-08-07 14:31:57-04 | The Tell-Tale Heart
--  Christine  | Holloway  | 2001-08-07 14:56:42-04 | 2001: A Space Odyssey
--  Eric       | Morrill   | 2001-08-07 16:00:48-04 | Little Women
--  Jonathan   | Anderson  | 2001-08-08 11:36:44-04 | The Shining
--  Ed         | Gould     | 2001-08-08 12:53:46-04 | The Shining
--  Annie      | Jackson   | 2001-08-08 13:46:13-04 | Bartholomew and the Oobleck
--  Dave       | Olson     | 2001-08-09 10:30:07-04 | The Velveteen Rabbit
--  Wendy      | Black     | 2001-08-09 12:30:46-04 | The Velveteen Rabbit
--  Rich       | Thomas    | 2001-08-10 10:29:52-04 | Franklin in the Dark
--  Jean       | Black     | 2001-08-10 11:29:42-04 | The Tell-Tale Heart
--  Eric       | Morrill   | 2001-08-10 16:47:52-04 | The Cat in the Hat
--  Annie      | Jackson   | 2001-08-11 12:55:05-04 | Bartholomew and the Oobleck
--  Richard    | Brown     | 2001-08-11 13:52:34-04 | Goodnight Moon
--  James      | Williams  | 2001-08-11 16:34:08-04 | The Cat in the Hat
--  Kate       | Gerdes    | 2001-08-12 11:46:35-04 | Dune
--  Jean       | Owens     | 2001-08-12 15:09:47-04 | Franklin in the Dark
--  Owen       | Becker    | 2001-08-12 16:39:22-04 | The Shining
--  Julie      | Bollman   | 2001-08-13 12:42:10-04 | The Cat in the Hat
--  Kathy      | Corner    | 2001-08-13 12:47:04-04 | The Cat in the Hat
--  Tim        | Owens     | 2001-08-14 10:33:47-04 | Dynamic Anatomy
--  Trevor     | Young     | 2001-08-14 11:42:58-04 | Dune
--  Chuck      | Brown     | 2001-08-14 13:36:41-04 | The Shining
--  Adam       | Holloway  | 2001-08-14 16:41:39-04 | The Tell-Tale Heart
--  Jenny      | King      | 2001-08-14 16:45:51-04 | The Shining
--  Tammy      | Robinson  | 2001-08-14 16:49:00-04 | Franklin in the Dark
--  James      | Clark     | 2001-08-15 14:57:40-04 | Goodnight Moon
--  Shirley    | Gould     | 2001-08-15 17:02:01-04 | 2001: A Space Odyssey
--  Jenny      | King      | 2001-09-14 19:46:32-04 | The Cat in the Hat
--  Annie      | Jackson   | 2001-09-14 20:42:22-04 | The Cat in the Hat
--  Annie      | Jackson   | 2001-09-22 14:23:28-04 | Bartholomew and the Oobleck
--  Annie      | Jackson   | 2001-09-22 23:58:56-04 | Bartholomew and the Oobleck
-- (36 rows)


-- ### Grouping and Counting

-- 11. Get the COUNT of all books

-- booktown=# SELECT COUNT (*) FROM books;
--  count 
-- -------
--     15
-- (1 row)

-- 12. Get the COUNT of all Locations

-- booktown=# SELECT COUNT (location) FROM subjects;
--  count 
-- -------
--     15
-- (1 row)

-- 13. Get the COUNT of each unique location in the subjects table. Display the count and the location name. (hint: requires GROUP BY).

-- booktown=# SELECT location, COUNT(location) FROM subjects GROUP BY location;
--      location     | count 
-- ------------------+-------
--                   |     0
--  Sunset Dr        |     1
--  Kids Ct          |     1
--  Black Raven Dr   |     2
--  Creativity St    |     2
--  Academic Rd      |     2
--  Main St          |     4
--  Productivity Ave |     3
-- (8 rows)

-- 14. List all books. Display the book_id, title, and a count of how many editions each book has. (hint: requires GROUP BY and JOIN)

-- booktown=# SELECT e.book_id, b.title, e.edition From editions e Join books b On e.book_id=b.id;
--  book_id |            title            | edition 
-- ---------+-----------------------------+---------
--     1608 | The Cat in the Hat          |       1
--     7808 | The Shining                 |       1
--     1590 | Bartholomew and the Oobleck |       1
--    25908 | Franklin in the Dark        |       1
--     1501 | Goodnight Moon              |       1
--     1234 | The Velveteen Rabbit        |       1
--      190 | Little Women                |       1
--     1608 | The Cat in the Hat          |       1
--     7808 | The Shining                 |       2
--      156 | The Tell-Tale Heart         |       1
--      156 | The Tell-Tale Heart         |       2
--     4513 | Dune                        |       2
--     4513 | Dune                        |       3
--     4267 | 2001: A Space Odyssey       |       3
--     4267 | 2001: A Space Odyssey       |       3
--     2038 | Dynamic Anatomy             |       1
--    41473 | Programming Python          |       2
-- (17 rows)

-- booktown=# SELECT b.id, b.title, COUNT(b.id) FROM editions e INNER JOIN books b ON b.id=e.book_id GROUP BY b.id;
--   id   |            title            | count 
-- -------+-----------------------------+-------
--   2038 | Dynamic Anatomy             |     1
--  25908 | Franklin in the Dark        |     1
--   7808 | The Shining                 |     2
--   4267 | 2001: A Space Odyssey       |     2
--  41473 | Programming Python          |     1
--   1234 | The Velveteen Rabbit        |     1
--   4513 | Dune                        |     2
--   1608 | The Cat in the Hat          |     2
--    190 | Little Women                |     1
--   1501 | Goodnight Moon              |     1
--    156 | The Tell-Tale Heart         |     2
--   1590 | Bartholomew and the Oobleck |     1
-- (12 rows)
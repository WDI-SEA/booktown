-- ### Order
-- 1. Find all subjects sorted by subject
booktown=# SELECT id, subject FROM subjects ORDER BY subject; 

--  id |     subject      
-- ----+------------------
--   0 | Arts
--   1 | Business
--   2 | Children's Books
--   3 | Classics
--   4 | Computers
--   5 | Cooking
--   6 | Drama
--   7 | Entertainment
--   8 | History
--   9 | Horror
--  10 | Mystery
--  11 | Poetry
--  12 | Religion
--  13 | Romance
--  14 | Science
--  15 | Science Fiction
-- (16 rows)

-- 2. Find all subjects sorted by location
booktown=# SELECT * FROM subjects ORDER BY location;

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
booktown=# SELECT * FROM books WHERE title = 'Little Women';

--  id  |    title     | author_id | subject_id 
-- -----+--------------+-----------+------------
--  190 | Little Women |        16 |          6
-- (1 row)

-- 4. Find all books containing the word "Python"
booktown=# SELECT * FROM books WHERE title LIKE '%Python%';

--   id   |       title        | author_id | subject_id 
-- -------+--------------------+-----------+------------
--  41473 | Programming Python |      7805 |          4
--  41477 | Learning Python    |      7805 |          4
-- (2 rows)

-- 5. Find all subjects with the location "Main St" sort them by subject
booktown=# SELECT * FROM subjects WHERE location = 'Main St' ORDER BY subject;

--  id |     subject     | location 
-- ----+-----------------+----------
--   6 | Drama           | Main St
--   7 | Entertainment   | Main St
--  13 | Romance         | Main St
--  15 | Science Fiction | Main St
-- (4 rows)

-- ### Joins

-- 6. Find all books about Computers and list ONLY the book titles
booktown=# SELECT b.title FROM books b INNER JOIN subjects s ON s.subject = 'Computers' AND s.id = b.subject_id;

--         title         
-- ----------------------
--  Practical PostgreSQL
--  Perl Cookbook
--  Learning Python
--  Programming Python
-- (4 rows)

-- 7. Find all books and display a result table with ONLY the following columns
-- 	* Book title
-- 	* Author's first name
-- 	* Author's last name
-- 	* Book subject
booktown=# SELECT b.title, a.first_name, a.last_name, s.subject FROM books b LEFT JOIN authors a ON b.author_id=a.id LEFT JOIN subjects s ON b.subject_id=s.id;

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
booktown=# SELECT b.title, s.retail FROM stock s LEFT JOIN editions e ON e.isbn = s.isbn LEFT JOIN books b ON e.book_id=b.id ORDER BY s.retail DESC;
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
booktown=# SELECT b.title, e.isbn, p.name, s.retail FROM books b LEFT JOIN editions e ON b.id=e.book_id LEFT JOIN publishers p ON e.publisher_id=p.id LEFT JOIN stock s ON e.isbn=s.isbn WHERE b.title='Dune';

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

booktown=# SELECT c.first_name, c.last_name, s.ship_date, b.title FROM shipments s LEFT JOIN customers c ON s.customer_id=c.id LEFT JOIN editions e ON s.isbn=e.isbn LEFT JOIN books b ON e.book_id = b.id ORDER BY s.ship_date;

--  first_name | last_name |       ship_date        |            title            
-- ------------+-----------+------------------------+-----------------------------
--  Owen       | Bollman   | 2001-08-05 10:34:04-06 | Little Women
--  Laura      | Bennett   | 2001-08-06 08:49:44-06 | Goodnight Moon
--  Chad       | Allen     | 2001-08-06 10:29:21-06 | The Cat in the Hat
--  Annie      | Jackson   | 2001-08-06 12:46:36-06 | Bartholomew and the Oobleck
--  Annie      | Jackson   | 2001-08-07 11:58:36-06 | Bartholomew and the Oobleck
--  Royce      | Morrill   | 2001-08-07 12:31:57-06 | The Tell-Tale Heart
--  Christine  | Holloway  | 2001-08-07 12:56:42-06 | 2001: A Space Odyssey
--  Eric       | Morrill   | 2001-08-07 14:00:48-06 | Little Women
--  Jonathan   | Anderson  | 2001-08-08 09:36:44-06 | The Shining
--  Ed         | Gould     | 2001-08-08 10:53:46-06 | The Shining
--  Annie      | Jackson   | 2001-08-08 11:46:13-06 | Bartholomew and the Oobleck
--  Dave       | Olson     | 2001-08-09 08:30:07-06 | The Velveteen Rabbit
--  Wendy      | Black     | 2001-08-09 10:30:46-06 | The Velveteen Rabbit
--  Rich       | Thomas    | 2001-08-10 08:29:52-06 | Franklin in the Dark
--  Jean       | Black     | 2001-08-10 09:29:42-06 | The Tell-Tale Heart
--  Eric       | Morrill   | 2001-08-10 14:47:52-06 | The Cat in the Hat
--  Annie      | Jackson   | 2001-08-11 10:55:05-06 | Bartholomew and the Oobleck
--  Richard    | Brown     | 2001-08-11 11:52:34-06 | Goodnight Moon
--  James      | Williams  | 2001-08-11 14:34:08-06 | The Cat in the Hat
--  Kate       | Gerdes    | 2001-08-12 09:46:35-06 | Dune
--  Jean       | Owens     | 2001-08-12 13:09:47-06 | Franklin in the Dark
--  Owen       | Becker    | 2001-08-12 14:39:22-06 | The Shining
--  Julie      | Bollman   | 2001-08-13 10:42:10-06 | The Cat in the Hat
--  Kathy      | Corner    | 2001-08-13 10:47:04-06 | The Cat in the Hat
--  Tim        | Owens     | 2001-08-14 08:33:47-06 | Dynamic Anatomy
--  Trevor     | Young     | 2001-08-14 09:42:58-06 | Dune
--  Chuck      | Brown     | 2001-08-14 11:36:41-06 | The Shining
--  Adam       | Holloway  | 2001-08-14 14:41:39-06 | The Tell-Tale Heart
--  Jenny      | King      | 2001-08-14 14:45:51-06 | The Shining
--  Tammy      | Robinson  | 2001-08-14 14:49:00-06 | Franklin in the Dark
--  James      | Clark     | 2001-08-15 12:57:40-06 | Goodnight Moon


-- ### Grouping and Counting

-- 11. Get the COUNT of all books
booktown=# SELECT count(*) FROM books;
--  count 
-- -------
--     15
-- (1 row)

-- 12. Get the COUNT of all Locations
booktown=# SELECT count(location) FROM subjects;
--  count 
-- -------
--     15
-- (1 row)

-- 13. Get the COUNT of each unique location in the subjects table. Display the count and the location name. (hint: requires GROUP BY).
booktown=# SELECT location, count(location) FROM subjects GROUP BY location;
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
booktown=# SELECT b.id, b.title, count(e.isbn) FROM books b LEFT JOIN editions e ON e.book_id=b.id GROUP BY b.id;
--   id   |            title            | count 
-- -------+-----------------------------+-------
--  41477 | Learning Python             |     0
--  25908 | Franklin in the Dark        |     1
--  41478 | Perl Cookbook               |     0
--    190 | Little Women                |     1
--   1501 | Goodnight Moon              |     1
--    156 | The Tell-Tale Heart         |     2
--  41472 | Practical PostgreSQL        |     0
--   2038 | Dynamic Anatomy             |     1
--   7808 | The Shining                 |     2
--   4267 | 2001: A Space Odyssey       |     2
--  41473 | Programming Python          |     1
--   1234 | The Velveteen Rabbit        |     1
--   4513 | Dune                        |     2
--   1608 | The Cat in the Hat          |     2
--   1590 | Bartholomew and the Oobleck |     1
-- (15 rows)
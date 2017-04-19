-- Queries

-- ***********Where*******************
-- Schema |         Name          |   Type   |      Owner       |    Size    | Description 
-- --------+-----------------------+----------+------------------+------------+-------------
--  public | alternate_stock       | table    | christinasevilla | 16 kB      | 
--  public | authors               | table    | christinasevilla | 16 kB      | 
--  public | book_backup           | table    | christinasevilla | 16 kB      | 
--  public | book_ids              | sequence | christinasevilla | 8192 bytes | 
--  public | book_queue            | table    | christinasevilla | 16 kB      | 
--  public | books                 | table    | christinasevilla | 16 kB      | 
--  public | customers             | table    | christinasevilla | 16 kB      | 
--  public | daily_inventory       | table    | christinasevilla | 16 kB      | 
--  public | distinguished_authors | table    | christinasevilla | 16 kB      | 
--  public | editions              | table    | christinasevilla | 16 kB      | 
--  public | employees             | table    | christinasevilla | 16 kB      | 
--  public | favorite_authors      | table    | christinasevilla | 16 kB      | 
--  public | favorite_books        | table    | christinasevilla | 16 kB      | 
--  public | money_example         | table    | christinasevilla | 8192 bytes | 
--  public | my_list               | table    | christinasevilla | 16 kB      | 
--  public | numeric_values        | table    | christinasevilla | 8192 bytes | 
--  public | publishers            | table    | christinasevilla | 16 kB      | 
--  public | schedules             | table    | christinasevilla | 16 kB      | 
-- :

-- INSTRUCTIONS: Complete the following exercises to practice using SQL.

-- **********Order*******************
-- Q:Find all subjects sorted by subject
SELECT * FROM subjects ORDER BY subject;
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


-- Q:Find all subjects sorted by location
SELECT * FROM subjects ORDER BY location;
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


-- Q:Find the book "Little Women"
SELECT title FROM books WHERE title = 'Little Women';
--     title     
-- --------------
--  Little Women
-- (1 row)

-- Q:Find all books containing the word "Python"
SELECT * FROM books WHERE title LIKE '%Python';
--   id   |       title        | author_id | subject_id 
-- -------+--------------------+-----------+------------
--  41473 | Programming Python |      7805 |          4
--  41477 | Learning Python    |      7805 |          4
-- (2 rows)

-- Q:Find all subjects with the location "Main St" sort them by subject
SELECT * FROM subjects WHERE location LIKE '%Main St' ORDER BY subject;
--  id |     subject     | location 
-- ----+-----------------+----------
--   6 | Drama           | Main St
--   7 | Entertainment   | Main St
--  13 | Romance         | Main St
--  15 | Science Fiction | Main St
-- (4 rows)

-- *************Joins******************
-- Q:Find all books about Computers and list ONLY the book titles
-- table.column
SELECT books.title FROM books, subjects WHERE books.subject_id = subjects.id AND subject = 'Computers';

--         title         
-- ----------------------
--  Practical PostgreSQL
--  Perl Cookbook
--  Learning Python
--  Programming Python
-- (4 rows)


-- Q:Find all books and display a result table with ONLY the following columns
-- Book title
-- Author's first name
-- Author's last name
-- Book subject
SELECT books.title, authors.first_name, authors.last_name, subjects.subject FROM books, authors, subjects;

--             title            |    first_name    |  last_name   |     subject      
-- -----------------------------+------------------+--------------+------------------
--  The Shining                 | Ariel            | Denham       | Arts
--  The Shining                 | Ariel            | Denham       | Business
--  The Shining                 | Ariel            | Denham       | Children's Books
--  The Shining                 | Ariel            | Denham       | Classics
--  The Shining                 | Ariel            | Denham       | Computers
--  The Shining                 | Ariel            | Denham       | Cooking
--  The Shining                 | Ariel            | Denham       | Drama
--  The Shining                 | Ariel            | Denham       | Entertainment


-- Q:Find all books that are listed in the stock table
-- Sort them by retail price (most expensive first)
-- Display ONLY: title and price
SELECT books.title, stock.retail FROM books, stock, editions WHERE stock.isbn = editions.isbn AND book_id = editions.book_id ORDER BY retail DESC;

--             title            | retail 
-- -----------------------------+--------
--  Learning Python             |  46.95
--  The Shining                 |  46.95
--  Programming Python          |  46.95
--  Practical PostgreSQL        |  46.95
--  Little Women                |  46.95
--  Dune                        |  46.95
--  The Velveteen Rabbit        |  46.95
--  Goodnight Moon              |  46.95
--  Franklin in the Dark        |  46.95
--  Perl Cookbook               |  46.95
--  Bartholomew and the Oobleck |  46.95
--  The Cat in the Hat          |  46.95
--  Dynamic Anatomy             |  46.95
--  2001: A Space Odyssey       |  46.95
--  The Tell-Tale Heart         |  46.95
--  The Shining                 |  45.95
--  Goodnight Moon              |  45.95
--  Bartholomew and the Oobleck |  45.95
--  Franklin in the Dark        |  45.95
--  Learning Python             |  45.95
--  Dune                        |  45.95
--  Practical PostgreSQL        |  45.95
--  Programming Python          |  45.95
--  The Tell-Tale Heart         |  45.95
--  2001: A Space Odyssey       |  45.95
--  Dynamic Anatomy             |  45.95
--  The Velveteen Rabbit        |  45.95
--  The Cat in the Hat          |  45.95
--  Little Women                |  45.95
--  Perl Cookbook               |  45.95
--  Programming Python          |  36.95
--  Bartholomew and the Oobleck |  36.95
--  2001: A Space Odyssey       |  36.95
--  Goodnight Moon              |  36.95
--  The Tell-Tale Heart         |  36.95
--  Franklin in the Dark        |  36.95
--  Practical PostgreSQL        |  36.95
--  Dynamic Anatomy             |  36.95
--  The Shining                 |  36.95
--  The Cat in the Hat          |  36.95
--  The Velveteen Rabbit        |  36.95
--  Little Women                |  36.95
--  Learning Python             |  36.95
--  Dune                        |  36.95
--  Perl Cookbook               |  36.95

-- Q:Find the book "Dune" and display ONLY the following columns
SELECT books.title, editions.isbn, stock.retail, publishers.name FROM books, stock, publishers, editions WHERE stock.isbn = editions.isbn AND editions.book_id = books.id AND editions.publisher_id = publishers.id AND books.title = 'Dune';

-- Book title
-- ISBN number
-- Publisher name
-- Retail price

--  title |    isbn    | retail |   name    
-- -------+------------+--------+-----------
--  Dune  | 0441172717 |  21.95 | Ace Books
--  Dune  | 044100590X |  45.95 | Ace Books
-- (2 rows)

-- Q:Find all shipments sorted by ship date display a result table with ONLY the following columns:
-- Customer first name
-- Customer last name
-- ship date
-- book title

SELECT customers.first_name, customers.last_name, shipments.ship_date, books.title FROM customers, shipments, books, editions WHERE books.id = editions.book_id AND editions.isbn = shipments.isbn AND shipments.customer_id = customers.id ORDER BY shipments.ship_date;

-- first_name | last_name |       ship_date        |            title            
-- ------------+-----------+------------------------+-----------------------------
--  Owen       | Bollman   | 2001-08-05 09:34:04-07 | Little Women
--  Laura      | Bennett   | 2001-08-06 07:49:44-07 | Goodnight Moon
--  Chad       | Allen     | 2001-08-06 09:29:21-07 | The Cat in the Hat
--  Annie      | Jackson   | 2001-08-06 11:46:36-07 | Bartholomew and the Oobleck
--  Annie      | Jackson   | 2001-08-07 10:58:36-07 | Bartholomew and the Oobleck
--  Royce      | Morrill   | 2001-08-07 11:31:57-07 | The Tell-Tale Heart
--  Christine  | Holloway  | 2001-08-07 11:56:42-07 | 2001: A Space Odyssey
--  Eric       | Morrill   | 2001-08-07 13:00:48-07 | Little Women
--  Jonathan   | Anderson  | 2001-08-08 08:36:44-07 | The Shining
--  Ed         | Gould     | 2001-08-08 09:53:46-07 | The Shining
--  Annie      | Jackson   | 2001-08-08 10:46:13-07 | Bartholomew and the Oobleck
--  Dave       | Olson     | 2001-08-09 07:30:07-07 | The Velveteen Rabbit
--  Wendy      | Black     | 2001-08-09 09:30:46-07 | The Velveteen Rabbit
--  Rich       | Thomas    | 2001-08-10 07:29:52-07 | Franklin in the Dark
--  Jean       | Black     | 2001-08-10 08:29:42-07 | The Tell-Tale Heart
--  Eric       | Morrill   | 2001-08-10 13:47:52-07 | The Cat in the Hat
--  Annie      | Jackson   | 2001-08-11 09:55:05-07 | Bartholomew and the Oobleck
--  Richard    | Brown     | 2001-08-11 10:52:34-07 | Goodnight Moon
--  James      | Williams  | 2001-08-11 13:34:08-07 | The Cat in the Hat
--  Kate       | Gerdes    | 2001-08-12 08:46:35-07 | Dune
--  Jean       | Owens     | 2001-08-12 12:09:47-07 | Franklin in the Dark
--  Owen       | Becker    | 2001-08-12 13:39:22-07 | The Shining
--  Julie      | Bollman   | 2001-08-13 09:42:10-07 | The Cat in the Hat
--  Kathy      | Corner    | 2001-08-13 09:47:04-07 | The Cat in the Hat
--  Tim        | Owens     | 2001-08-14 07:33:47-07 | Dynamic Anatomy
--  Trevor     | Young     | 2001-08-14 08:42:58-07 | Dune
--  Chuck      | Brown     | 2001-08-14 10:36:41-07 | The Shining
--  Adam       | Holloway  | 2001-08-14 13:41:39-07 | The Tell-Tale Heart
--  Jenny      | King      | 2001-08-14 13:45:51-07 | The Shining
--  Tammy      | Robinson  | 2001-08-14 13:49:00-07 | Franklin in the Dark
--  James      | Clark     | 2001-08-15 11:57:40-07 | Goodnight Moon
--  Shirley    | Gould     | 2001-08-15 14:02:01-07 | 2001: A Space Odyssey
--  Jenny      | King      | 2001-09-14 16:46:32-07 | The Cat in the Hat
--  Annie      | Jackson   | 2001-09-14 17:42:22-07 | The Cat in the Hat
--  Annie      | Jackson   | 2001-09-22 11:23:28-07 | Bartholomew and the Oobleck
--  Annie      | Jackson   | 2001-09-22 20:58:56-07 | Bartholomew and the Oobleck
-- (36 rows)

-- *******************Grouping and Counting**************

-- Q:Get the COUNT of all books
SELECT COUNT(*) FROM books;
--  count 
-- -------
--     15
-- (1 row)

-- Q:Get the COUNT of all Locations

SELECT COUNT(location) FROM subjects;
--  count 
-- -------
--     15
-- (1 row)

-- Q:Get the COUNT of each unique location in the subjects table. Display the count and the location name. (hint: requires GROUP BY).
SELECT location, COUNT(location) FROM subjects
GROUP BY location;

--      location     | count 
-- ------------------+-------
--                   |     0
--  Academic Rd      |     2
--  Main St          |     4
--  Productivity Ave |     3
--  Sunset Dr        |     1
--  Creativity St    |     2
--  Black Raven Dr   |     2
--  Kids Ct          |     1
-- (8 rows)

-- Q:List all books. Display the book_id, title, and a count of how many editions each book has. (hint: requires GROUP BY and JOIN)
SELECT books.id, books.title, COUNT(editions.book_id) FROM books, editions WHERE books.id = editions.book_id GROUP BY books.id;

--   id   |            title            | count 
-- -------+-----------------------------+-------
--   7808 | The Shining                 |     2
--   4513 | Dune                        |     2
--   1590 | Bartholomew and the Oobleck |     1
--  25908 | Franklin in the Dark        |     1
--    156 | The Tell-Tale Heart         |     2
--   4267 | 2001: A Space Odyssey       |     2
--   1501 | Goodnight Moon              |     1
--   2038 | Dynamic Anatomy             |     1
--  41473 | Programming Python          |     1
--    190 | Little Women                |     1
--   1608 | The Cat in the Hat          |     2
--   1234 | The Velveteen Rabbit        |     1
-- (12 rows)

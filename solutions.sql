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

-- booktown=# 

-- 4. Find all books containing the word "Python"
-- booktown=# SELECT * FROM books WHERE title LIKE '%Python%';
--   id   |       title        | author_id | subject_id 
-- -------+--------------------+-----------+------------
--  41473 | Programming Python |      7805 |          4
--  41477 | Learning Python    |      7805 |          4
-- (2 rows)


-- 5. Find all subjects with the location "Main St" sort them by subject
-- booktown=# SELECT * FROM subjects WHERE location = 'Main St' ORDER BY subject;
--  id |     subject     | location 
-- ----+-----------------+----------
--   6 | Drama           | Main St
--   7 | Entertainment   | Main St
--  13 | Romance         | Main St
--  15 | Science Fiction | Main St
-- (4 rows)


-- ### Joins

-- 6. Find all books about Computers and list ONLY the book titles
-- booktown=# SELECT title FROM books WHERE subject_id = '4';
--         title         
-- ----------------------
--  Programming Python
--  Learning Python
--  Perl Cookbook
--  Practical PostgreSQL
-- (4 rows)

-- booktown=# 
-- 7. Find all books and display a result table with ONLY the following columns
-- 	* Book title
-- 	* Author's first name
-- 	* Author's last name
-- 	* Book subject
-- booktown=# SELECT title, last_name, first_name, subject FROM books INNER JOIN authors ON books.author_id = authors.id INNER JOIN subjects ON books.subject_id = subjects.id;
--             title            |  last_name   |    first_name    |     subject      
-- -----------------------------+--------------+------------------+------------------
--  Practical PostgreSQL        | Worsley      | John             | Computers
--  Franklin in the Dark        | Bourgeois    | Paulette         | Children's Books
--  The Velveteen Rabbit        | Bianco       | Margery Williams | Classics
--  Little Women                | Alcott       | Louisa May       | Drama
--  The Shining                 | King         | Stephen          | Horror
--  Dune                        | Herbert      | Frank            | Science Fiction
--  Dynamic Anatomy             | Hogarth      | Burne            | Arts
--  Goodnight Moon              | Brown        | Margaret Wise    | Children's Books
--  The Tell-Tale Heart         | Poe          | Edgar Allen      | Horror
--  Programming Python          | Lutz         | Mark             | Computers
--  Learning Python             | Lutz         | Mark             | Computers
--  Perl Cookbook               | Christiansen | Tom              | Computers
--  2001: A Space Odyssey       | Clarke       | Arthur C.        | Science Fiction
--  The Cat in the Hat          | Geisel       | Theodor Seuss    | Children's Books
--  Bartholomew and the Oobleck | Geisel       | Theodor Seuss    | Children's Books
-- (15 rows)

-- booktown=# 

-- 8. Find all books that are listed in the stock table
-- 	* Sort them by retail price (most expensive first)
-- 	* Display ONLY: title and price
-- booktown=# SELECT title, cost FROM books INNER JOIN editions ON books.id = editions.book_id INNER JOIN stock ON stock.isbn = editions.isbn ORDER BY cost DESC;
--             title            | cost  
-- -----------------------------+-------
--  2001: A Space Odyssey       | 36.00
--  Dune                        | 36.00
--  The Cat in the Hat          | 30.00
--  The Shining                 | 29.00
--  Dynamic Anatomy             | 26.00
--  Goodnight Moon              | 25.00
--  The Shining                 | 24.00
--  The Cat in the Hat          | 23.00
--  Franklin in the Dark        | 23.00
--  The Tell-Tale Heart         | 23.00
--  The Velveteen Rabbit        | 20.00
--  The Tell-Tale Heart         | 19.00
--  Little Women                | 18.00
--  2001: A Space Odyssey       | 17.00
--  Dune                        | 17.00
--  Bartholomew and the Oobleck | 16.00
-- (16 rows)


-- 9. Find the book "Dune" and display ONLY the following columns
-- 	* Book title
-- 	* ISBN number
-- 	* Publisher name
-- 	* Retail price
-- booktown=# SELECT editions.isbn, title, name, cost FROM editions INNER JOIN stock ON editions.isbn = stock.isbn INNER JOIN books ON editions.book_id = books.id INNER JOIN publishers ON editions.publisher_id = publishers.id WHERE title = 'Dune';
--     isbn    | title |   name    | cost  
-- ------------+-------+-----------+-------
--  0441172717 | Dune  | Ace Books | 17.00
--  044100590X | Dune  | Ace Books | 36.00
-- (2 rows)

-- booktown=# 
 
-- 10. Find all shipments sorted by ship date display a result table with ONLY the following columns:
-- 	* Customer first name
-- 	* Customer last name
-- 	* ship date
-- 	* book title
-- booktown=# SELECT first_name, last_name, ship_date, title FROM shipments INNER JOIN editions ON shipments.isbn = editions.isbn INNER JOIN books ON editions.book_id = books.id INNER JOIN customers ON shipments.customer_id = customers.id ORDER BY ship_date;
--  first_name | last_name |       ship_date        |            title            
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


-- ### Grouping and Counting

-- 11. Get the COUNT of all books
-- booktown=# SELECT COUNT(title) FROM books;
--  count 
-- -------
--     15
-- (1 row)


-- 12. Get the COUNT of all Locations
-- booktown=# SELECT COUNT(location) FROM subjects;
--  count 
-- -------
--     15
-- (1 row)

-- 13. Get the COUNT of each unique location in the subjects table. Display the count and the location name. (hint: requires GROUP BY).
-- booktown=# SELECT location, COUNT(DISTINCT location) FROM subjects GROUP BY location;
--      location     | count 
-- ------------------+-------
--  Academic Rd      |     1
--  Black Raven Dr   |     1
--  Creativity St    |     1
--  Kids Ct          |     1
--  Main St          |     1
--  Productivity Ave |     1
--  Sunset Dr        |     1
--                   |     0
-- (8 rows)

--I am fairly certain the above is what is meant by unique locations

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
-- booktown=# SELECT b.title, COUNT(e.book_id) AS editions FROM books b JOIN editions e ON b.id = e.book_id GROUP BY b.title;
--             title            | editions 
-- -----------------------------+----------
--  The Tell-Tale Heart         |        2
--  Bartholomew and the Oobleck |        1
--  Programming Python          |        1
--  2001: A Space Odyssey       |        2
--  Dune                        |        2
--  The Shining                 |        2
--  The Velveteen Rabbit        |        1
--  Little Women                |        1
--  The Cat in the Hat          |        2
--  Franklin in the Dark        |        1
--  Dynamic Anatomy             |        1
--  Goodnight Moon              |        1
-- (12 rows)

-- booktown=# 

------Am I doing the above right? technically i am not displaying the book id but I am not sure about the aggregate funciton error im getting? 
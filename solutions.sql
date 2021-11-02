-- ### Order
-- 1. Find all subjects sorted by subject
    booktown=# SELECT subject FROM subjects GROUP BY subject
    booktown-# ;
    --      subject      
    -- ------------------
    --  Entertainment
    --  Romance
    --  Classics
    --  History
    --  Arts
    --  Cooking
    --  Poetry
    --  Computers
    --  Religion
    --  Horror
    --  Drama
    --  Children's Books
    --  Mystery
    --  Business
    --  Science Fiction
    --  Science
    -- (16 rows)

-- 2. Find all subjects sorted by location
    booktown=# SELECT subject, location FROM subjects ORDER BY location;
    --      subject      |     location     
    -- ------------------+------------------
    --  History          | Academic Rd
    --  Classics         | Academic Rd
    --  Mystery          | Black Raven Dr
    --  Horror           | Black Raven Dr
    --  Arts             | Creativity St
    --  Cooking          | Creativity St
    --  Children's Books | Kids Ct
    --  Entertainment    | Main St
    --  Drama            | Main St
    --  Romance          | Main St
    --  Science Fiction  | Main St
    --  Science          | Productivity Ave
    --  Computers        | Productivity Ave
    --  Business         | Productivity Ave
    --  Poetry           | Sunset Dr
    --  Religion         | 
    -- (16 rows)

-- ### Where
-- 3. Find the book "Little Women"
    booktown=# SELECT title FROM books WHERE title='Little Women'
    booktown-# ;
    --     title     
    -- --------------
    --  Little Women
    -- (1 row)

-- 4. Find all books containing the word "Python"
    booktown=# SELECT title FROM books WHERE title LIKE '%Python';
    --        title        
    -- --------------------
    --  Programming Python
    --  Learning Python
    -- (2 rows)

-- 5. Find all subjects with the location "Main St" sort them by subject
    booktown=# SELECT subjects FROM subjects WHERE location='Main St' ORDER BY subject;
    --              subjects             
    -- ----------------------------------
    --  (6,Drama,"Main St")
    --  (7,Entertainment,"Main St")
    --  (13,Romance,"Main St")
    --  (15,"Science Fiction","Main St")
    -- (4 rows)

-- ### Joins

-- 6. Find all books about Computers and list ONLY the book titles

    booktown=# SELECT b.title, s.subject FROM books b INNER JOIN subjects s ON b.subject_id=s.id WHERE subject='Computers';
    --         title         |  subject  
    -- ----------------------+-----------
    --  Practical PostgreSQL | Computers
    --  Perl Cookbook        | Computers
    --  Learning Python      | Computers
    --  Programming Python   | Computers
    -- (4 rows)

-- 7. Find all books and display a result table with ONLY the following columns
-- 	* Book title
-- 	* Author's first name
-- 	* Author's last name
-- 	* Book subject
    booktown=# SELECT b.title, a.first_name, a.last_name, s.subject FROM books b FULL JOIN authors a ON b.author_id=a.id FULL JOIN subjects s ON b.subject_id=s.id;
--             title            |    first_name    |  last_name   |     subject      
-- -----------------------------+------------------+--------------+------------------
--                              | Ariel            | Denham       | 
--  Practical PostgreSQL        | John             | Worsley      | Computers
--  Franklin in the Dark        | Paulette         | Bourgeois    | Children's Books
--  The Velveteen Rabbit        | Margery Williams | Bianco       | Classics
--  Little Women                | Louisa May       | Alcott       | Drama
--  The Shining                 | Stephen          | King         | Horror
--  Dune                        | Frank            | Herbert      | Science Fiction
--  Dynamic Anatomy             | Burne            | Hogarth      | Arts
--  Goodnight Moon              | Margaret Wise    | Brown        | Children's Books
--  The Tell-Tale Heart         | Edgar Allen      | Poe          | Horror
--  Learning Python             | Mark             | Lutz         | Computers
--  Programming Python          | Mark             | Lutz         | Computers
--  Perl Cookbook               | Tom              | Christiansen | Computers
--                              | Richard          | Brautigan    | 
--                              | Poppy Z.         | Brite        | 
--                              | Edward           | Gorey        | 
--  2001: A Space Odyssey       | Arthur C.        | Clarke       | Science Fiction
--                              | Andrew           | Brookins     | 
--                              | Neil             | Simon        | 
--  Bartholomew and the Oobleck | Theodor Seuss    | Geisel       | Children's Books
--  The Cat in the Hat          | Theodor Seuss    | Geisel       | Children's Books
--                              |                  |              | Poetry
--                              |                  |              | Religion
--                              |                  |              | Mystery
--                              |                  |              | Romance
--                              |                  |              | Cooking
--                              |                  |              | History
--                              |                  |              | Business
--                              |                  |              | Science
--                              |                  |              | Entertainment
-- (30 rows)

-- 8. Find all books that are listed in the stock table
-- 	* Sort them by retail price (most expensive first)
-- 	* Display ONLY: title and price
    booktown=# SELECT b.title, s.retail FROM editions e FULL JOIN books b ON e.book_id=b.id FULL JOIN stock s ON e.isbn=s.isbn ORDER BY retail DESC;
    --             title            | retail 
    -- -----------------------------+--------
    -- Perl Cookbook               |       
    -- Learning Python             |       
    -- Practical PostgreSQL        |       
    -- Programming Python          |       
    -- 2001: A Space Odyssey       |  46.95
    -- Dune                        |  45.95
    -- The Shining                 |  36.95
    -- The Cat in the Hat          |  32.95
    -- Goodnight Moon              |  28.95
    -- Dynamic Anatomy             |  28.95
    -- The Shining                 |  28.95
    -- The Velveteen Rabbit        |  24.95
    -- The Tell-Tale Heart         |  24.95
    -- Franklin in the Dark        |  23.95
    -- The Cat in the Hat          |  23.95
    -- Little Women                |  23.95
    -- 2001: A Space Odyssey       |  22.95
    -- Dune                        |  21.95
    -- The Tell-Tale Heart         |  21.95
    -- Bartholomew and the Oobleck |  16.95
    -- (20 rows)

-- 9. Find the book "Dune" and display ONLY the following columns
-- 	* Book title
-- 	* ISBN number
-- 	* Publisher name
-- 	* Retail price
    booktown=# SELECT b.title, e.isbn, p.name, s.retail FROM editions e FULL JOIN books b ON e.book_id=b.id FULL JOIN stock s ON e.isbn=s.isbn FULL JOIN publishers p ON e.publisher_id=p.id WHERE title='Dune';
    -- title |    isbn    |   name    | retail 
    -- -------+------------+-----------+--------
    -- Dune  | 0441172717 | Ace Books |  21.95
    -- Dune  | 044100590X | Ace Books |  45.95
    -- (2 rows)

-- 10. Find all shipments sorted by ship date display a result table with ONLY the following columns:
-- 	* Customer first name
-- 	* Customer last name
-- 	* ship date
-- 	* book title
    booktown=# SELECT c.first_name, c.last_name, s.ship_date, b.title FROM shipments s FULL JOIN customers c ON s.customer_id=c.id FULL JOIN editions e ON s.isbn=e.isbn FULL JOIN books b ON e.book_id=b.id;
    -- first_name | last_name |       ship_date        |            title            
    -- ------------+-----------+------------------------+-----------------------------
    -- Annie      | Jackson   | 2001-09-22 23:58:56-04 | Bartholomew and the Oobleck
    -- Annie      | Jackson   | 2001-09-22 14:23:28-04 | Bartholomew and the Oobleck
    -- Annie      | Jackson   | 2001-08-08 13:46:13-04 | Bartholomew and the Oobleck
    -- Annie      | Jackson   | 2001-08-06 14:46:36-04 | Bartholomew and the Oobleck
    -- Annie      | Jackson   | 2001-08-07 13:58:36-04 | Bartholomew and the Oobleck
    -- Annie      | Jackson   | 2001-08-11 12:55:05-04 | Bartholomew and the Oobleck
    -- Annie      | Jackson   | 2001-09-14 20:42:22-04 | The Cat in the Hat
    -- Ed         | Gould     | 2001-08-08 12:53:46-04 | The Shining
    -- Chad       | Allen     | 2001-08-06 12:29:21-04 | The Cat in the Hat
    -- James      | Williams  | 2001-08-11 16:34:08-04 | The Cat in the Hat
    -- Richard    | Brown     | 2001-08-11 13:52:34-04 | Goodnight Moon
    -- Eric       | Morrill   | 2001-08-07 16:00:48-04 | Little Women
    -- Eric       | Morrill   | 2001-08-10 16:47:52-04 | The Cat in the Hat
    -- Jenny      | King      | 2001-09-14 19:46:32-04 | The Cat in the Hat
    -- Jenny      | King      | 2001-08-14 16:45:51-04 | The Shining
    -- Julie      | Bollman   | 2001-08-13 12:42:10-04 | The Cat in the Hat
    -- Royce      | Morrill   | 2001-08-07 14:31:57-04 | The Tell-Tale Heart
    -- Christine  | Holloway  | 2001-08-07 14:56:42-04 | 2001: A Space Odyssey
    -- Jean       | Black     | 2001-08-10 11:29:42-04 | The Tell-Tale Heart
    -- James      | Clark     | 2001-08-15 14:57:40-04 | Goodnight Moon
    -- Rich       | Thomas    | 2001-08-10 10:29:52-04 | Franklin in the Dark
    -- Trevor     | Young     | 2001-08-14 11:42:58-04 | Dune
    -- Laura      | Bennett   | 2001-08-06 10:49:44-04 | Goodnight Moon
    -- Jonathan   | Anderson  | 2001-08-08 11:36:44-04 | The Shining
    -- Dave       | Olson     | 2001-08-09 10:30:07-04 | The Velveteen Rabbit
    -- Chuck      | Brown     | 2001-08-14 13:36:41-04 | The Shining
    -- Don        | Eisele    |                        | 
    -- Adam       | Holloway  | 2001-08-14 16:41:39-04 | The Tell-Tale Heart
    -- Shirley    | Gould     | 2001-08-15 17:02:01-04 | 2001: A Space Odyssey
    -- Royce      | Robertson |                        | 
    -- Wendy      | Black     | 2001-08-09 12:30:46-04 | The Velveteen Rabbit
    -- Tim        | Owens     | 2001-08-14 10:33:47-04 | Dynamic Anatomy
    -- Tammy      | Robinson  | 2001-08-14 16:49:00-04 | Franklin in the Dark
    -- Kate       | Gerdes    | 2001-08-12 11:46:35-04 | Dune
    -- Ramon      | Gould     |                        | 
    -- Jean       | Owens     | 2001-08-12 15:09:47-04 | Franklin in the Dark
    -- Owen       | Bollman   | 2001-08-05 12:34:04-04 | Little Women
    -- Owen       | Becker    | 2001-08-12 16:39:22-04 | The Shining
    -- Kathy      | Corner    | 2001-08-13 12:47:04-04 | The Cat in the Hat
    --             |           |                        | Programming Python
    --             |           |                        | Perl Cookbook
    --             |           |                        | Practical PostgreSQL
    --             |           |                        | Learning Python
    -- (43 rows)

-- ### Grouping and Counting

-- 11. Get the COUNT of all books
    booktown=# SELECT COUNT(stock) FROM stock;
    -- count 
    -- -------
    --     16
    -- (1 row)

    booktown=# SELECT SUM(stock) FROM stock;
    -- sum 
    -- -----
    -- 512
    -- (1 row)

-- 12. Get the COUNT of all Locations
    booktown=# SELECT COUNT(location) FROM subjects;
    --  count 
    -- -------
    --     15
    -- (1 row)

-- 13. Get the COUNT of each unique location in the subjects table. Display the count and the location name. (hint: requires GROUP BY).
    booktown=# SELECT location, COUNT(location) FROM subjects GROUP BY location;
    --     location     | count 
    -- ------------------+-------
    --                 |     0
    -- Sunset Dr        |     1
    -- Kids Ct          |     1
    -- Black Raven Dr   |     2
    -- Creativity St    |     2
    -- Academic Rd      |     2
    -- Main St          |     4
    -- Productivity Ave |     3
    -- (8 rows)

-- 14. List all books. Display the book_id, title, and a count of how many editions each book has. (hint: requires GROUP BY and JOIN)
    booktown=# SELECT e.book_id, b.title, COUNT(e.edition) FROM books b JOIN editions e ON b.id=e.book_id GROUP BY title, book_id;
    -- book_id |            title            | count 
    -- ---------+-----------------------------+-------
    --     1608 | The Cat in the Hat          |     2
    --     190 | Little Women                |     1
    --     4513 | Dune                        |     2
    --     1234 | The Velveteen Rabbit        |     1
    --     7808 | The Shining                 |     2
    --     1590 | Bartholomew and the Oobleck |     1
    --     4267 | 2001: A Space Odyssey       |     2
    --     2038 | Dynamic Anatomy             |     1
    -- 41473 | Programming Python          |     1
    -- 25908 | Franklin in the Dark        |     1
    --     156 | The Tell-Tale Heart         |     2
    --     1501 | Goodnight Moon              |     1
    -- (12 rows)

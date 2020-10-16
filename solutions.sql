-- ### Order
-- 1. Find all subjects sorted by subject
\d subjects;
SELECT subject FROM subjects;
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
    -- (16 rows)

-- 2. Find all subjects sorted by location
SELECT location FROM subjects;
    --      location
    -- ------------------
    --  Creativity St
    --  Productivity Ave
    --  Kids Ct
    --  Academic Rd
    --  Productivity Ave
    --  Creativity St
    --  Main St
    --  Main St
    --  Academic Rd
    --  Black Raven Dr
    --  Black Raven Dr
    --  Sunset Dr

    --  Main St
    --  Productivity Ave
    --  Main St
    -- (16 rows)

-- ### Where
-- 3. Find the book "Little Women"
\d books
SELECT * FROM books WHERE title = 'Little Women';
    --  id  |    title     | author_id | subject_id
    -- -----+--------------+-----------+------------
    --  190 | Little Women |        16 |          6
    -- (1 row)

-- 4. Find all books containing the word "Python"
SELECT * FROM books WHERE title LIKE '%Python%';
    --   id   |       title        | author_id | subject_id
    -- -------+--------------------+-----------+------------
    --  41473 | Programming Python |      7805 |          4
    --  41477 | Learning Python    |      7805 |          4
    -- (2 rows)
-- 5. Find all subjects with the location "Main St" sort them by subject
\d subjects
SELECT * FROM subjects WHERE location = 'Main St' ORDER BY subjects;
    --  id |     subject     | location
    -- ----+-----------------+----------
    --   6 | Drama           | Main St
    --   7 | Entertainment   | Main St
    --  13 | Romance         | Main St
    --  15 | Science Fiction | Main St
    -- (4 rows)

-- ### Joins

-- 6. Find all books about Computers and list ONLY the book titles
\d books
SELECT b.title
FROM subjects s INNER JOIN books b
ON s.id=b.subject_id
WHERE subject = 'Computers';
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
SELECT * FROM books;
SELECT * FROM subjects;
SELECT * FROM authors;
SELECT books.title AS book_title, authors.first_name AS authors_first_name, authors.last_name AS authors_last_name, subjects.subject 
FROM books 
JOIN authors ON books.author_id = authors.id 
JOIN subjects ON books.subject_id = subjects.id;
    --          book_title          | authors_first_name | authors_last_name |     subject
    -- -----------------------------+--------------------+-------------------+------------------
    --  Practical PostgreSQL        | John               | Worsley           | Computers
    --  Franklin in the Dark        | Paulette           | Bourgeois         | Children's Books
    --  The Velveteen Rabbit        | Margery Williams   | Bianco            | Classics
    --  Little Women                | Louisa May         | Alcott            | Drama
    --  The Shining                 | Stephen            | King              | Horror
    --  Dune                        | Frank              | Herbert           | Science Fiction
    --  Dynamic Anatomy             | Burne              | Hogarth           | Arts
    --  Goodnight Moon              | Margaret Wise      | Brown             | Children's Books
    --  The Tell-Tale Heart         | Edgar Allen        | Poe               | Horror
    --  Programming Python          | Mark               | Lutz              | Computers
    --  Learning Python             | Mark               | Lutz              | Computers
    --  Perl Cookbook               | Tom                | Christiansen      | Computers
    --  2001: A Space Odyssey       | Arthur C.          | Clarke            | Science Fiction
    --  The Cat in the Hat          | Theodor Seuss      | Geisel            | Children's Books
    --  Bartholomew and the Oobleck | Theodor Seuss      | Geisel            | Children's Books

-- 8. Find all books that are listed in the stock table
-- 	* Sort them by retail price (most expensive first)
-- 	* Display ONLY: title and price
SELECT * FROM books;
SELECT * FROM stock;
SELECT * FROM editions;

SELECT title AS title, stock.retail AS price
FROM stock
JOIN editions ON stock.isbn = editions.isbn
JOIN books ON books.id = editions.book_id ORDER BY price DESC;
    --             title            | price
    -- -----------------------------+-------
    --  2001: A Space Odyssey       | 46.95
    --  Dune                        | 45.95
    --  The Shining                 | 36.95
    --  The Cat in the Hat          | 32.95
    --  Goodnight Moon              | 28.95
    --  The Shining                 | 28.95
    --  Dynamic Anatomy             | 28.95
    --  The Tell-Tale Heart         | 24.95
    --  The Velveteen Rabbit        | 24.95
    --  The Cat in the Hat          | 23.95
    --  Franklin in the Dark        | 23.95
    --  Little Women                | 23.95
    --  2001: A Space Odyssey       | 22.95
    --  The Tell-Tale Heart         | 21.95
    --  Dune                        | 21.95
    --  Bartholomew and the Oobleck | 16.95
    -- (16 rows)

-- 9. Find the book "Dune" and display ONLY the following columns
-- 	* Book title
-- 	* ISBN number
-- 	* Publisher name
-- 	* Retail price
\d publishers
\d books
SELECT * FROM publishers;
SELECT books.title AS book_title, stock.isbn AS ISBN_number, publishers.name AS publisher_name, stock.retail as retail_price
FROM books
JOIN editions ON editions.book_id = books.id
JOIN publishers ON publishers.id = editions.publisher_id
JOIN stock ON stock.isbn = editions.isbn WHERE books.title = 'Dune';
    --  book_title | isbn_number | publisher_name | retail_price
    -- ------------+-------------+----------------+--------------
    --  Dune       | 0441172717  | Ace Books      |        21.95
    --  Dune       | 044100590X  | Ace Books      |        45.95
    -- (2 rows)

-- 10. Find all shipments sorted by ship date display a result table with ONLY the following columns:
-- 	* Customer first name
-- 	* Customer last name
-- 	* ship date 
-- 	* book title
\d
\d customers 
    -- has: id | first_name | last_name
\d shipments
    -- has: id | customer_id | isbn | ship_date
\d books 
    -- has: id | title 
\d editions
    -- has: isbn | book_id
SELECT customers.first_name, customers.last_name, shipments.ship_date, books.title
FROM customers
JOIN shipments ON shipments.customer_id = customers.id
JOIN editions ON editions.isbn = shipments.isbn
JOIN books ON books.id = editions.book_id
ORDER BY shipments.ship_date;
    -- first_name | last_name |       ship_date        |            title
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
SELECT COUNT(*) FROM books;
    -- count
    -- -------
    --     15
    -- (1 row)
-- 12. Get the COUNT of all Locations
SELECT COUNT(location) FROM subjects;
    --  count
    -- -------
    --     15
    -- (1 row)
-- 13. Get the COUNT of each unique location in the subjects table. Display the count and the location name. (hint: requires GROUP BY).
SELECT location, COUNT(*) AS Location_Count FROM subjects WHERE location IS NOT NULL GROUP BY location;
    --      location     | location_count
    -- ------------------+----------------
    --  Sunset Dr        |              1
    --  Kids Ct          |              1
    --  Black Raven Dr   |              2
    --  Creativity St    |              2
    --  Academic Rd      |              2
    --  Main St          |              4
    --  Productivity Ave |              3
    -- (7 rows)

-- 14. List all books. Display the book_id, title, and a count of how many editions each book has. (hint: requires GROUP BY and JOIN)
SELECT books.id, books.title, COUNT(editions.edition) AS Num_of_editions FROM books JOIN editions ON books.id = editions.book_id GROUP BY books.id;
    --   id   |            title            | num_of_editions
    -- -------+-----------------------------+-----------------
    --   2038 | Dynamic Anatomy             |               1
    --  25908 | Franklin in the Dark        |               1
    --   7808 | The Shining                 |               2
    --   4267 | 2001: A Space Odyssey       |               2
    --  41473 | Programming Python          |               1
    --   1234 | The Velveteen Rabbit        |               1
    --   4513 | Dune                        |               2
    --   1608 | The Cat in the Hat          |               2
    --    190 | Little Women                |               1
    --   1501 | Goodnight Moon              |               1
    --    156 | The Tell-Tale Heart         |               2
    --   1590 | Bartholomew and the Oobleck |               1
    -- (12 rows)
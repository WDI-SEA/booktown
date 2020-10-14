-- ### Order
-- 1. Find all subjects sorted by subject

SELECT subject FROM subjects ORDER BY subjects;

/*
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
(16 rows)
*/

-- 2. Find all subjects sorted by location

SELECT subject FROM subjects ORDER BY location;

/*
     subject
------------------
 History
 Classics
 Mystery
 Horror
 Arts
 Cooking
 Children's Books
 Entertainment
 Drama
 Romance
 Science Fiction
 Science
 Computers
 Business
 Poetry
 Religion
(16 rows)
*/

-- ### Where
-- 3. Find the book "Little Women"

SELECT * FROM books WHERE title = 'Little Women';

/*
 id  |    title     | author_id | subject_id
-----+--------------+-----------+------------
 190 | Little Women |        16 |          6
*/


-- 4. Find all books containing the word "Python"

SELECT * FROM books WHERE title LIKE '%Python%';

/*
  id   |       title        | author_id | subject_id
-------+--------------------+-----------+------------
 41473 | Programming Python |      7805 |          4
 41477 | Learning Python    |      7805 |          4
(2 rows)
*/

-- 5. Find all subjects with the location "Main St" sort them by subject

SELECT * FROM subjects WHERE location = 'Main St' ORDER BY subject ASC;

/*
 id |     subject     | location
----+-----------------+----------
  6 | Drama           | Main St
  7 | Entertainment   | Main St
 13 | Romance         | Main St
 15 | Science Fiction | Main St
(4 rows)
*/

-- ### Joins

-- 6. Find all books about Computers and list ONLY the book titles

SELECT b.title 
FROM books b LEFT JOIN subjects s
ON b.subject_id = s.id
WHERE s.subject = 'Computers';

/*
        title
----------------------
 Practical PostgreSQL
 Perl Cookbook
 Learning Python
 Programming Python
(4 rows)
*/

-- 7. Find all books and display a result table with ONLY the following columns
-- 	* Book title
-- 	* Author's first name
-- 	* Author's last name
-- 	* Book subject

SELECT b.title, a.first_name, a.last_name, s.subject
FROM books b 
LEFT JOIN authors a
ON b.author_id = a.id
LEFT JOIN subjects s
ON b.subject_id = s.id;

/*
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
*/

-- 8. Find all books that are listed in the stock table
-- 	* Sort them by retail price (most expensive first)
-- 	* Display ONLY: title and price

SELECT b.title, s.retail
FROM books b
LEFT JOIN editions e
ON b.id = e.book_id
INNER JOIN stock s
ON s.isbn = e.isbn
ORDER BY s.retail DESC;

/*
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
(16 rows)
*/

-- 9. Find the book "Dune" and display ONLY the following columns
-- 	* Book title
-- 	* ISBN number
-- 	* Publisher name
-- 	* Retail price

SELECT b.title, s.isbn, p.name, s.retail
FROM books b
LEFT JOIN editions e
ON b.id = e.book_id
INNER JOIN stock s
ON s.isbn = e.isbn
LEFT JOIN publishers p
ON p.id = e.publisher_id
WHERE b.title = 'Dune';  

/*
 title |    isbn    |   name    | retail
-------+------------+-----------+--------
 Dune  | 0441172717 | Ace Books |  21.95
 Dune  | 044100590X | Ace Books |  45.95
(2 rows)
*/

-- 10. Find all shipments sorted by ship date display a result table with ONLY the following columns:
-- 	* Customer first name
-- 	* Customer last name
-- 	* ship date
-- 	* book title

SELECT c.first_name, c.last_name, ship.ship_date, b.title
FROM shipments ship
LEFT JOIN customers c
ON c.id = ship.customer_id
LEFT JOIN editions e
ON e.isbn = ship.isbn
LEFT JOIN books b
ON b.id = e.book_id
ORDER BY ship.ship_date DESC;

/*
first_name | last_name |       ship_date        |            title
------------+-----------+------------------------+-----------------------------
 Annie      | Jackson   | 2001-09-22 20:58:56-07 | Bartholomew and the Oobleck
 Annie      | Jackson   | 2001-09-22 11:23:28-07 | Bartholomew and the Oobleck
 Annie      | Jackson   | 2001-09-14 17:42:22-07 | The Cat in the Hat
 Jenny      | King      | 2001-09-14 16:46:32-07 | The Cat in the Hat
 Shirley    | Gould     | 2001-08-15 14:02:01-07 | 2001: A Space Odyssey
 James      | Clark     | 2001-08-15 11:57:40-07 | Goodnight Moon
 Tammy      | Robinson  | 2001-08-14 13:49:00-07 | Franklin in the Dark
 Jenny      | King      | 2001-08-14 13:45:51-07 | The Shining
 Adam       | Holloway  | 2001-08-14 13:41:39-07 | The Tell-Tale Heart
 Chuck      | Brown     | 2001-08-14 10:36:41-07 | The Shining
 Trevor     | Young     | 2001-08-14 08:42:58-07 | Dune
 Tim        | Owens     | 2001-08-14 07:33:47-07 | Dynamic Anatomy
 Kathy      | Corner    | 2001-08-13 09:47:04-07 | The Cat in the Hat
 Julie      | Bollman   | 2001-08-13 09:42:10-07 | The Cat in the Hat
 Owen       | Becker    | 2001-08-12 13:39:22-07 | The Shining
 Jean       | Owens     | 2001-08-12 12:09:47-07 | Franklin in the Dark
 Kate       | Gerdes    | 2001-08-12 08:46:35-07 | Dune
 James      | Williams  | 2001-08-11 13:34:08-07 | The Cat in the Hat
 Richard    | Brown     | 2001-08-11 10:52:34-07 | Goodnight Moon
 Annie      | Jackson   | 2001-08-11 09:55:05-07 | Bartholomew and the Oobleck
 Eric       | Morrill   | 2001-08-10 13:47:52-07 | The Cat in the Hat
 Jean       | Black     | 2001-08-10 08:29:42-07 | The Tell-Tale Heart
*/

-- ### Grouping and Counting

-- 11. Get the COUNT of all books

SELECT COUNT(title) FROM books;

/*
 count
-------
    15
(1 row)
*/

SELECT title, COUNT(title) FROM books GROUP BY title;

/*
           title            | count
-----------------------------+-------
 2001: A Space Odyssey       |     1
 Dune                        |     1
 The Shining                 |     1
 The Velveteen Rabbit        |     1
 Perl Cookbook               |     1
 Dynamic Anatomy             |     1
 Learning Python             |     1
 The Tell-Tale Heart         |     1
 Bartholomew and the Oobleck |     1
 Programming Python          |     1
 Little Women                |     1
 The Cat in the Hat          |     1
 Franklin in the Dark        |     1
 Goodnight Moon              |     1
 Practical PostgreSQL        |     1
(15 rows)
*/

-- 12. Get the COUNT of all Locations

/*Get count of all unique locations*/
SELECT COUNT(DISTINCT location) FROM subjects;
/*
 count
-------
     7
(1 row)
*/

/*Get count of subjects at each location*/
SELECT location, COUNT(location) FROM subjects GROUP BY location ;

/*
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
*/

-- 13. Get the COUNT of each unique location in the subjects table. Display the count and the location name. (hint: requires GROUP BY).

SELECT location, COUNT(location) 
FROM subjects
GROUP BY location;

/*
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
*/

-- 14. List all books. Display the book_id, title, and a count of how many editions each book has. (hint: requires GROUP BY and JOIN)

SELECT b.id, b.title, COUNT(e.edition)
FROM books b
LEFT JOIN editions e
ON b.id = e.book_id
GROUP BY b.id, b.title;

/*
 id   |            title            | count
-------+-----------------------------+-------
 41477 | Learning Python             |     0
 25908 | Franklin in the Dark        |     1
 41478 | Perl Cookbook               |     0
   190 | Little Women                |     1
  1501 | Goodnight Moon              |     1
   156 | The Tell-Tale Heart         |     2
 41472 | Practical PostgreSQL        |     0
  2038 | Dynamic Anatomy             |     1
  7808 | The Shining                 |     2
  4267 | 2001: A Space Odyssey       |     2
 41473 | Programming Python          |     1
  1234 | The Velveteen Rabbit        |     1
  4513 | Dune                        |     2
  1608 | The Cat in the Hat          |     2
  1590 | Bartholomew and the Oobleck |     1
(15 rows)
*/
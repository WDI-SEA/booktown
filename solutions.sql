-- ### Order
-- 1. Find all subjects sorted by subject
SELECT subject FROM subjects ORDER BY subject;

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


--- 2. Find all subjects sorted by location

SELECT subject FROM subjects ORDER BY location;
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

-- ### Where
-- 3. Find the book "Little Women"
SELECT * FROM books WHERE title='Little Women';
id  |    title     | author_id | subject_id
-----+--------------+-----------+------------
 190 | Little Women |        16 |          6
(1 row)

-- 4. Find all books containing the word "Python"
SELECT title FROM books WHERE title LIKE '%Python%';
id   |       title        | author_id | subject_id
-------+--------------------+-----------+------------
41473 | Programming Python |      7805 |          4
41477 | Learning Python    |      7805 |          4
(2 rows)
-- 5. Find all subjects with the location "Main St" sort them by subject
SELECT subject FROM subjects WHERE location='Main St' ORDER BY subject;
subject
-----------------
Drama
Entertainment
Romance
Science Fiction
(4 rows)

-- ### Joins

-- 6. Find all books about Computers and list ONLY the book titles
SELECT books.title FROM books INNER JOIN subjects ON books.subject_id=subjects.id WHERE subjects.subject='Computers';
title
----------------------
Practical PostgreSQL
Perl Cookbook
Learning Python
Programming Python
(4 rows)


-- 7. Find all books and display a result table with ONLY the following columns
-- 	* Book title
-- 	* Author's first name
-- 	* Author's last name
-- 	* Book subject
SELECT b.title, a.first_name, a.last_name, s.subject
FROM books b INNER JOIN authors a ON b.author_id=a.id
INNER JOIN subjects s ON b.subject_id=s.id;

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


-- 8. Find all books that are listed in the stock table
-- 	* Sort them by retail price (most expensive first)
-- 	* Display ONLY: title and price
SELECT b.title, s.retail FROM stock s
INNER JOIN editions e ON s.isbn=e.isbn
INNER JOIN books b ON e.book_id=b.id
ORDER BY s.retail DESC;

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



-- 9. Find the book "Dune" and display ONLY the following columns
-- 	* Book title
-- 	* ISBN number
-- 	* Publisher name
-- 	* Retail price
SELECT b.title, st.isbn, p.name ,st.retail FROM books b
INNER JOIN editions e ON e.book_id = b.id
INNER JOIN stock st ON st.isbn=e.isbn
INNER JOIN publishers p ON p.id=e.publisher_id
WHERE b.title='Dune';

 title |    isbn    |   name    | retail
-------+------------+-----------+--------
 Dune  | 0441172717 | Ace Books |  21.95
 Dune  | 044100590X | Ace Books |  45.95
(2 rows)


-- 10. Find all shipments sorted by ship date display a result table with ONLY the following columns:
-- 	* Customer first name
-- 	* Customer last name
-- 	* ship date
-- 	* book title
SELECT c.first_name, c.last_name, s.ship_date, b.title FROM customers c INNER JOIN shipments s ON s.customer_id=c.id INNER JOIN editions e ON e.isbn=s.isbn INNER JOIN books b ON e.book_id=b.id;

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
 Christine  | Holloway  | 2001-08-07 14:56:42-04 | 2001: A Space Odyssey
 Shirley    | Gould     | 2001-08-15 17:02:01-04 | 2001: A Space Odyssey
 Tim        | Owens     | 2001-08-14 10:33:47-04 | Dynamic Anatomy
(36 rows)

-- ### Grouping and Counting

-- 11. Get the COUNT of all books
SELECT count(*) FROM books;
 count
-------
    15
(1 row)


-- 12. Get the COUNT of all Locations
SELECT COUNT(location) FROM subjects;
 count
-------
    15
(1 row)

-- 13. Get the COUNT of each unique location in the subjects table. Display the count and the location name. (hint: requires GROUP BY).
SELECT location, COUNT(location) FROM subjects GROUP BY location;

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

-- 14. List all books. Display the book_id, title, and a count of how many editions each book has. (hint: requires GROUP BY and JOIN)
SELECT b.id,b.title, count(b.title) AS editions_num
FROM books b
INNER JOIN editions e ON b.id=e.book_id
GROUP BY b.id;

  id   |            title            | editions_num
-------+-----------------------------+--------------
  2038 | Dynamic Anatomy             |            1
 25908 | Franklin in the Dark        |            1
  7808 | The Shining                 |            2
  4267 | 2001: A Space Odyssey       |            2
 41473 | Programming Python          |            1
  1234 | The Velveteen Rabbit        |            1
  4513 | Dune                        |            2
  1608 | The Cat in the Hat          |            2
   190 | Little Women                |            1
  1501 | Goodnight Moon              |            1
   156 | The Tell-Tale Heart         |            2
  1590 | Bartholomew and the Oobleck |            1
(12 rows)

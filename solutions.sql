-- ### Order
-- 1. Find all subjects sorted by subject

booktown=# SELECT * FROM subjects ORDER BY subject;

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

-- 2. Find all subjects sorted by location

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

-- ### Where
-- 3. Find the book "Little Women"
                                        ^
booktown=# SELECT * FROM books WHERE title='Little Women';
 
 id  |    title     | author_id | subject_id
-----+--------------+-----------+------------
 190 | Little Women |        16 |          6

-- 4. Find all books containing the word "Python"

booktown=# SELECT * FROM books WHERE title LIKE '%Python%';

  id   |       title        | author_id | subject_id
-------+--------------------+-----------+------------
 41473 | Programming Python |      7805 |          4
 41477 | Learning Python    |      7805 |          4

-- 5. Find all subjects with the location "Main St" sort them by subject

booktown=# SELECT * FROM subjects WHERE location= 'Main St' ORDER BY subject;

 id |     subject     | location
----+-----------------+----------
  6 | Drama           | Main St
  7 | Entertainment   | Main St
 13 | Romance         | Main St
 15 | Science Fiction | Main St

-- ### Joins

-- 6. Find all books about Computers and list ONLY the book titles

booktown=# SELECT title FROM books b INNER JOIN subjects s ON b.subject_id = s.id AND s.subject = 'Computers';
 
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

booktown=# SELECT DISTINCT b.title, a.first_name, a.last_name, s.subject FROM books b INNER JOIN authors a ON a.id = b.author_id INNER JOIN subjects s ON s.id = b.subject_id;

            title            |    first_name    |  last_name   |     subject
-----------------------------+------------------+--------------+------------------
 2001: A Space Odyssey       | Arthur C.        | Clarke       | Science Fiction
 Practical PostgreSQL        | John             | Worsley      | Computers
 Programming Python          | Mark             | Lutz         | Computers
 The Tell-Tale Heart         | Edgar Allen      | Poe          | Horror
 Little Women                | Louisa May       | Alcott       | Drama
 The Velveteen Rabbit        | Margery Williams | Bianco       | Classics
 Learning Python             | Mark             | Lutz         | Computers
 The Shining                 | Stephen          | King         | Horror
 Goodnight Moon              | Margaret Wise    | Brown        | Children's Books
 The Cat in the Hat          | Theodor Seuss    | Geisel       | Children's Books
 Dynamic Anatomy             | Burne            | Hogarth      | Arts
 Franklin in the Dark        | Paulette         | Bourgeois    | Children's Books
 Perl Cookbook               | Tom              | Christiansen | Computers
 Bartholomew and the Oobleck | Theodor Seuss    | Geisel       | Children's Books
 Dune

-- 8. Find all books that are listed in the stock table
-- 	* Sort them by retail price (most expensive first)
-- 	* Display ONLY: title and price

booktown=# SELECT b.title, s.retail FROM books b JOIN editions e ON b.id = e.book_id JOIN stock s ON e.isbn = s.isbn ORDER BY s.retail DESC;

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

-- 9. Find the book "Dune" and display ONLY the following columns
-- 	* Book title
-- 	* ISBN number
-- 	* Publisher name
-- 	* Retail price

SELECT b.title, e.isbn, p.name AS publisher_name, s.retail
FROM books b
JOIN editions e
ON b.id = e.book_id
JOIN publishers p
ON e.publisher_id = p.id
JOIN stock s
ON e.isbn = s.isbn;

            title            |    isbn    |       publisher_name        | retail
-----------------------------+------------+-----------------------------+--------
 The Cat in the Hat          | 039480001X | Random House                |  32.95
 The Shining                 | 0451160916 | Doubleday                   |  28.95
 Bartholomew and the Oobleck | 0394800753 | Random House                |  16.95
 Franklin in the Dark        | 0590445065 | Kids Can Press              |  23.95
 Goodnight Moon              | 0694003611 | HarperCollins               |  28.95
 The Velveteen Rabbit        | 0679803335 | Penguin                     |  24.95
 Little Women                | 0760720002 | Henry Holt & Company, Inc.  |  23.95
 The Cat in the Hat          | 0394900014 | Random House                |  23.95
 The Shining                 | 0385121679 | Doubleday                   |  36.95
 The Tell-Tale Heart         | 1885418035 | Mojo Press                  |  24.95
 The Tell-Tale Heart         | 0929605942 | Books of Wonder             |  21.95
 Dune                        | 0441172717 | Ace Books                   |  21.95
 Dune                        | 044100590X | Ace Books                   |  45.95
 2001: A Space Odyssey       | 0451457994 | Roc                         |  22.95
 2001: A Space Odyssey       | 0451198492 | Roc                         |  46.95
 Dynamic Anatomy             | 0823015505 | Watson-Guptill Publications |  28.95

-- 10. Find all shipments sorted by ship date display a result table with ONLY the following columns:
-- 	* Customer first name
-- 	* Customer last name
-- 	* ship date
-- 	* book title

SELECT c.first_name, c.last_name, s.ship_date, b.title
FROM books b
JOIN editions e
ON b.id = e.book_id
JOIN shipments s
ON e.isbn = s.isbn
JOIN customers c
ON c.id = s.customer_id;

 first_name | last_name |       ship_date        |            title
------------+-----------+------------------------+-----------------------------
 Annie      | Jackson   | 2001-09-14 18:42:22-06 | The Cat in the Hat
 Jenny      | King      | 2001-09-14 17:46:32-06 | The Cat in the Hat
 Julie      | Bollman   | 2001-08-13 10:42:10-06 | The Cat in the Hat
 Eric       | Morrill   | 2001-08-10 14:47:52-06 | The Cat in the Hat
 Chad       | Allen     | 2001-08-06 10:29:21-06 | The Cat in the Hat
 Jonathan   | Anderson  | 2001-08-08 09:36:44-06 | The Shining
 Jenny      | King      | 2001-08-14 14:45:51-06 | The Shining
 Chuck      | Brown     | 2001-08-14 11:36:41-06 | The Shining
 Annie      | Jackson   | 2001-09-22 21:58:56-06 | Bartholomew and the Oobleck
 Annie      | Jackson   | 2001-09-22 12:23:28-06 | Bartholomew and the Oobleck
 Annie      | Jackson   | 2001-08-08 11:46:13-06 | Bartholomew and the Oobleck
 Annie      | Jackson   | 2001-08-06 12:46:36-06 | Bartholomew and the Oobleck
 Annie      | Jackson   | 2001-08-07 11:58:36-06 | Bartholomew and the Oobleck
 Annie      | Jackson   | 2001-08-11 10:55:05-06 | Bartholomew and the Oobleck
 Rich       | Thomas    | 2001-08-10 08:29:52-06 | Franklin in the Dark
 Tammy      | Robinson  | 2001-08-14 14:49:00-06 | Franklin in the Dark
 Jean       | Owens     | 2001-08-12 13:09:47-06 | Franklin in the Dark
 James      | Clark     | 2001-08-15 12:57:40-06 | Goodnight Moon
 Laura      | Bennett   | 2001-08-06 08:49:44-06 | Goodnight Moon
 Richard    | Brown     | 2001-08-11 11:52:34-06 | Goodnight Moon
 Wendy      | Black     | 2001-08-09 10:30:46-06 | The Velveteen Rabbit
 Dave       | Olson     | 2001-08-09 08:30:07-06 | The Velveteen Rabbit
 Eric       | Morrill   | 2001-08-07 14:00:48-06 | Little Women
 Owen       | Bollman   | 2001-08-05 10:34:04-06 | Little Women
 Kathy      | Corner    | 2001-08-13 10:47:04-06 | The Cat in the Hat
 James      | Williams  | 2001-08-11 14:34:08-06 | The Cat in the Hat
 Owen       | Becker    | 2001-08-12 14:39:22-06 | The Shining

-- ### Grouping and Counting

-- 11. Get the COUNT of all books

SELECT COUNT(title) FROM books;

 count
-------
    15

-- 12. Get the COUNT of all Locations

SELECT COUNT(location) FROM subjects;

 count
-------
    15

-- 13. Get the COUNT of each unique location in the subjects table. Display the count and the location name. (hint: requires GROUP BY).

SELECT COUNT(location), location FROM subjects GROUP BY location;

 count |     location
-------+------------------
     0 |
     1 | Sunset Dr
     1 | Kids Ct
     2 | Black Raven Dr
     2 | Creativity St
     2 | Academic Rd
     4 | Main St
     3 | Productivity Ave

-- 14. List all books. Display the book_id, title, and a count of how many editions each book has. (hint: requires GROUP BY and JOIN)

SELECT b.title, COUNT(e.book_id) AS editions
FROM books b
JOIN editions e
ON b.id = e.book_id
GROUP BY b.title;

            title            | editions
-----------------------------+----------
 The Tell-Tale Heart         |        2
 Bartholomew and the Oobleck |        1
 Programming Python          |        1
 2001: A Space Odyssey       |        2
 Dune                        |        2
 The Shining                 |        2
 The Velveteen Rabbit        |        1
 Little Women                |        1
 The Cat in the Hat          |        2
 Franklin in the Dark        |        1
 Dynamic Anatomy             |        1
 Goodnight Moon              |        1

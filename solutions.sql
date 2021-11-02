-- ### Order
-- 1. Find all subjects sorted by subject
SELECT subject FROM subjects ORDER BY subject;
output:  Arts
 Business
 Childrens Books
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
-- 2. Find all subjects sorted by location
SELECT subject FROM subjects ORDER BY location;
output:  History
 Classics
 Mystery
 Horror
 Arts
 Cooking
 Childrens Books
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
SELECT * FROM books WHERE title = 'Little Women';
output:  
id  |    title     | author_id | subject_id 
-----+--------------+-----------+------------
 190 | Little Women |        16 |          6
(1 row)


-- 4. Find all books containing the word "Python"
SELECT * FROM books WHERE title LIKE '%Python%';
output:
  id   |       title        | author_id | subject_id 
-------+--------------------+-----------+------------
 41473 | Programming Python |      7805 |          4
 41477 | Learning Python    |      7805 |          4
(2 rows)
-- 5. Find all subjects with the location "Main St" sort them by subject
SELECT * FROM subjects WHERE location = 'Main St';
output: 
 id |     subject     | location 
----+-----------------+----------
  6 | Drama           | Main St
  7 | Entertainment   | Main St
 13 | Romance         | Main St
 15 | Science Fiction | Main St
(4 rows)
-- ### Joins

-- 6. Find all books about Computers and list ONLY the book titles
SELECT * FROM subjects;
Computers id='4'

answer: SELECT DISTINCT title FROM books WHERE subject_id = '4';
output: 
  title         
----------------------
 Learning Python
 Perl Cookbook
 Practical PostgreSQL
 Programming Python
(4 rows)

-- 7. Find all books and display a result table with ONLY the following columns
-- 	* Book title
SELECT DISTINCT title FROM books;
output:
title            
-----------------------------
 2001: A Space Odyssey
 Dune
 The Shining
 The Velveteen Rabbit
 Perl Cookbook
 Dynamic Anatomy
 Learning Python
 The Tell-Tale Heart
 Bartholomew and the Oobleck
 Programming Python
 Little Women
 The Cat in the Hat
 Franklin in the Dark
 Goodnight Moon
 Practical PostgreSQL
(15 rows)

-- 	* Author's first name
SELECT a.first_name FROM
books b LEFT JOIN authors a 
ON b.author_id=a.id;

output: 
first_name    
------------------
 John
 Paulette
 Margery Williams
 Louisa May
 Stephen
 Frank
 Burne
 Margaret Wise
 Edgar Allen
 Mark
 Mark
 Tom
 Arthur C.
 Theodor Seuss
 Theodor Seuss
(15 rows)


-- 	* Author's last name
SELECT a.last_name FROM
books b LEFT JOIN authors a 
ON b.author_id=a.id;

output:
last_name   
--------------
 Worsley
 Bourgeois
 Bianco
 Alcott
 King
 Herbert
 Hogarth
 Brown
 Poe
 Lutz
 Lutz
 Christiansen
 Clarke
 Geisel
 Geisel
(15 rows)

-- 	* Book subject
SELECT s.subject FROM
books b LEFT JOIN subjects s 
ON b.subject_id=s.id
output: 

subject      
------------------
 Arts
 Childrens Books
 Childrens Books
 Childrens Books
 Childrens Books
 Classics
 Computers
 Computers
 Computers
 Computers
 Drama
 Horror
 Horror
 Science Fiction
 Science Fiction
(15 rows)

-- 8. Find all books that are listed in the stock table
SELECT b.title FROM 
books b FULL JOIN editions e
ON id=book_id 
RIGHT JOIN stock s 
ON e.isbn=s.isbn;


output:
            title            
-----------------------------
 The Cat in the Hat
 The Shining
 Bartholomew and the Oobleck
 Franklin in the Dark
 Goodnight Moon
 The Velveteen Rabbit
 Little Women
 The Cat in the Hat
 The Shining
 The Tell-Tale Heart
 The Tell-Tale Heart
 Dune
 Dune
 2001: A Space Odyssey
 2001: A Space Odyssey
 Dynamic Anatomy
(16 rows)



-- 	* Sort them by retail price (most expensive first)
SELECT b.title FROM
books b FULL JOIN editions e
ON id=book_id 
RIGHT JOIN stock s
ON e.isbn=s.isbn
ORDER BY s.retail DESC;

output:
 2001: A Space Odyssey
 Dune
 The Shining
 The Cat in the Hat
 Goodnight Moon
 The Shining
 Dynamic Anatomy
 The Tell-Tale Heart
 The Velveteen Rabbit
 The Cat in the Hat
 Franklin in the Dark
 Little Women
 2001: A Space Odyssey
 The Tell-Tale Heart
 Dune
 Bartholomew and the Oobleck
(16 rows)



-- 	* Display ONLY: title and price
SELECT b.title, s.retail FROM
books b FULL JOIN editions e
ON id=book_id 
RIGHT JOIN stock s
ON e.isbn=s.isbn
ORDER BY s.retail DESC;

output:
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
SELECT b.title, e.isbn, p.name, s.retail FROM
books b FULL JOIN editions e
ON id=book_id 
RIGHT JOIN stock s
ON e.isbn=s.isbn
LEFT JOIN publishers p
ON e.publisher_id=p.id;
-- 	* Book title
-- 	* ISBN number
-- 	* Publisher name
-- 	* Retail price
output:
            title            |    isbn    |            name             | retail 
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
SELECT c.first_name, c.last_name, s.ship_date, b.title FROM
shipments s LEFT JOIN customers c
ON s.customer_id=c.id
LEFT JOIN editions e 
ON s.isbn=e.isbn 
LEFT JOIN books b
ON e.book_id=b.id
ORDER BY s.ship_date;

-- 	* Customer first name
-- 	* Customer last name
-- 	* ship date
-- 	* book title
output:
 first_name | last_name |       ship_date        |            title            
------------+-----------+------------------------+-----------------------------
 Owen       | Bollman   | 2001-08-05 12:34:04-04 | Little Women
 Laura      | Bennett   | 2001-08-06 10:49:44-04 | Goodnight Moon
 Chad       | Allen     | 2001-08-06 12:29:21-04 | The Cat in the Hat
 Annie      | Jackson   | 2001-08-06 14:46:36-04 | Bartholomew and the Oobleck
 Annie      | Jackson   | 2001-08-07 13:58:36-04 | Bartholomew and the Oobleck
 Royce      | Morrill   | 2001-08-07 14:31:57-04 | The Tell-Tale Heart
 Christine  | Holloway  | 2001-08-07 14:56:42-04 | 2001: A Space Odyssey
 Eric       | Morrill   | 2001-08-07 16:00:48-04 | Little Women
 Jonathan   | Anderson  | 2001-08-08 11:36:44-04 | The Shining
 Ed         | Gould     | 2001-08-08 12:53:46-04 | The Shining
 Annie      | Jackson   | 2001-08-08 13:46:13-04 | Bartholomew and the Oobleck
 Dave       | Olson     | 2001-08-09 10:30:07-04 | The Velveteen Rabbit
 Wendy      | Black     | 2001-08-09 12:30:46-04 | The Velveteen Rabbit
 Rich       | Thomas    | 2001-08-10 10:29:52-04 | Franklin in the Dark
 Jean       | Black     | 2001-08-10 11:29:42-04 | The Tell-Tale Heart
 Eric       | Morrill   | 2001-08-10 16:47:52-04 | The Cat in the Hat
 Annie      | Jackson   | 2001-08-11 12:55:05-04 | Bartholomew and the Oobleck
 Richard    | Brown     | 2001-08-11 13:52:34-04 | Goodnight Moon
 James      | Williams  | 2001-08-11 16:34:08-04 | The Cat in the Hat
 Kate       | Gerdes    | 2001-08-12 11:46:35-04 | Dune
 Jean       | Owens     | 2001-08-12 15:09:47-04 | Franklin in the Dark
 Owen       | Becker    | 2001-08-12 16:39:22-04 | The Shining
 Julie      | Bollman   | 2001-08-13 12:42:10-04 | The Cat in the Hat
 Kathy      | Corner    | 2001-08-13 12:47:04-04 | The Cat in the Hat
 Tim        | Owens     | 2001-08-14 10:33:47-04 | Dynamic Anatomy
 Trevor     | Young     | 2001-08-14 11:42:58-04 | Dune
 Chuck      | Brown     | 2001-08-14 13:36:41-04 | The Shining
 Adam       | Holloway  | 2001-08-14 16:41:39-04 | The Tell-Tale Heart
 Jenny      | King      | 2001-08-14 16:45:51-04 | The Shining
 Tammy      | Robinson  | 2001-08-14 16:49:00-04 | Franklin in the Dark
 James      | Clark     | 2001-08-15 14:57:40-04 | Goodnight Moon
 Shirley    | Gould     | 2001-08-15 17:02:01-04 | 2001: A Space Odyssey
 Jenny      | King      | 2001-09-14 19:46:32-04 | The Cat in the Hat
 Annie      | Jackson   | 2001-09-14 20:42:22-04 | The Cat in the Hat
 Annie      | Jackson   | 2001-09-22 14:23:28-04 | Bartholomew and the Oobleck
 Annie      | Jackson   | 2001-09-22 23:58:56-04 | Bartholomew and the Oobleck
(36 rows)



-- ### Grouping and Counting

-- 11. Get the COUNT of all books
SELECT count(*) FROM books;

output:
    15
(1 row)

-- 12. Get the COUNT of all Locations
SELECT count(location) FROM subjects;

output: 
    15
(1 row)

-- 13. Get the COUNT of each unique location in the subjects table. Display the count and the location name. (hint: requires GROUP BY).
SELECT location, count(location) FROM subjects GROUP BY location;

output:
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
-- 14. List all books. Display the book_id, title, and a count of how many editions each book has. (hint: requires GROUP BY and JOIN)
SELECT b.id, b.title, count(e.edition) FROM 
books b JOIN editions e
ON b.id=e.book_id 
GROUP BY b.id;

output: 
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


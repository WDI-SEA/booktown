-- ### Order
-- 1. Find all subjects sorted by subject
booktown=# SELECT subject FROM subjects;
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

-- 2. Find all subjects sorted by location
booktown=# SELECT location FROM subjects;
     location     
------------------
 Creativity St
 Productivity Ave
 Kids Ct
 Academic Rd
 Productivity Ave
 Creativity St
 Main St
 Main St
 Academic Rd
 Black Raven Dr
 Black Raven Dr
 Sunset Dr
 
 Main St
 Productivity Ave
 Main St
(16 rows)

-- ### Where
-- 3. Find the book "Little Women"
booktown=# SELECT * FROM books WHERE title='Little Women';
 id  |    title     | author_id | subject_id 
-----+--------------+-----------+------------
 190 | Little Women |        16 |          6
(1 row)


-- 4. Find all books containing the word "Python"
booktown=# SELECT title FROM books WHERE title LIKE '%Python%';
       title        
--------------------
 Programming Python
 Learning Python
(2 rows)

-- 5. Find all subjects with the location "Main St" sort them by subject
booktown=# SELECT location, subject FROM subjects WHERE location LIKE '%Main St%' ORDER BY subject;
 location |     subject     
----------+-----------------
 Main St  | Drama
 Main St  | Entertainment
 Main St  | Romance
 Main St  | Science Fiction
(4 rows)



-- ### Joins

-- 6. Find all books about Computers and list ONLY the book titles
booktown=# SELECT b.title, s.subject FROM books b INNER JOIN subjects s ON b.subject_id=s.id WHERE subject='Computers';
        title         |  subject  
----------------------+-----------
 Practical PostgreSQL | Computers
 Perl Cookbook        | Computers
 Learning Python      | Computers
 Programming Python   | Computers
(4 rows)
-- 7. Find all books and display a result table with ONLY the following columns
-- 	* Book title
-- 	* Author's first name
-- 	* Author's last name
-- 	* Book subject
booktown=# SELECT b.title, a.first_name, a.last_name, s.subject FROM books b INNER JOIN authors a ON b.author_id=a.id INNER JOIN subjects s ON b.subject_id=s.id;
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
SELECT b.title, s.retail FROM books b INNER JOIN editions e ON b.id=e.book_id INNER JOIN stock s ON e.isbn=s.isbn ORDER BY s.retail DESC;
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
booktown=# SELECT b.title, e.isbn, p.name, s.retail FROM books b INNER JOIN editions e ON b.id=e.book_id INNER JOIN publishers p ON p.id=e.publisher_id INNER JOIN stock s ON s.isbn=e.isbn WHERE b.title='Dune'
booktown-# ;
 title |    isbn    |   name    | retail 
-------+------------+-----------+--------
 Dune  | 0441172717 | Ace Books |  21.95
 Dune  | 044100590X | Ace Books |  45.95
(2 rows)
-- 10. Find all shipments sorted by ship date display a result table with ONLY the following columns:
-- 	* Customer first name
-- 	* Customer last name
-- 	* ship date/
-- 	* book title
booktown=# SELECT c.first_name, c.last_name, s.ship_date, b.title FROM books b INNER JOIN editions e ON b.id=e.book_id INNER JOIN shipments s ON e.isbn=s.isbn INNER JOIN customers c ON s.customer_id=c.id ORDER BY s.ship_date;
 first_name | last_name |       ship_date        |            title            
------------+-----------+------------------------+-----------------------------
 Owen       | Bollman   | 2001-08-05 10:34:04-06 | Little Women
 Laura      | Bennett   | 2001-08-06 08:49:44-06 | Goodnight Moon
 Chad       | Allen     | 2001-08-06 10:29:21-06 | The Cat in the Hat
 Annie      | Jackson   | 2001-08-06 12:46:36-06 | Bartholomew and the Oobleck
 Annie      | Jackson   | 2001-08-07 11:58:36-06 | Bartholomew and the Oobleck
 Royce      | Morrill   | 2001-08-07 12:31:57-06 | The Tell-Tale Heart
 Christine  | Holloway  | 2001-08-07 12:56:42-06 | 2001: A Space Odyssey
 Eric       | Morrill   | 2001-08-07 14:00:48-06 | Little Women
 Jonathan   | Anderson  | 2001-08-08 09:36:44-06 | The Shining
 Ed         | Gould     | 2001-08-08 10:53:46-06 | The Shining
 Annie      | Jackson   | 2001-08-08 11:46:13-06 | Bartholomew and the Oobleck
 Dave       | Olson     | 2001-08-09 08:30:07-06 | The Velveteen Rabbit
 Wendy      | Black     | 2001-08-09 10:30:46-06 | The Velveteen Rabbit
 Rich       | Thomas    | 2001-08-10 08:29:52-06 | Franklin in the Dark
 Jean       | Black     | 2001-08-10 09:29:42-06 | The Tell-Tale Heart
 Eric       | Morrill   | 2001-08-10 14:47:52-06 | The Cat in the Hat
 Annie      | Jackson   | 2001-08-11 10:55:05-06 | Bartholomew and the Oobleck
 Richard    | Brown     | 2001-08-11 11:52:34-06 | Goodnight Moon
 James      | Williams  | 2001-08-11 14:34:08-06 | The Cat in the Hat
 Kate       | Gerdes    | 2001-08-12 09:46:35-06 | Dune
 Jean       | Owens     | 2001-08-12 13:09:47-06 | Franklin in the Dark
 Owen       | Becker    | 2001-08-12 14:39:22-06 | The Shining
 Julie      | Bollman   | 2001-08-13 10:42:10-06 | The Cat in the Hat
 Kathy      | Corner    | 2001-08-13 10:47:04-06 | The Cat in the Hat
 Tim        | Owens     | 2001-08-14 08:33:47-06 | Dynamic Anatomy
 Trevor     | Young     | 2001-08-14 09:42:58-06 | Dune
 Chuck      | Brown     | 2001-08-14 11:36:41-06 | The Shining
 Adam       | Holloway  | 2001-08-14 14:41:39-06 | The Tell-Tale Heart
 Jenny      | King      | 2001-08-14 14:45:51-06 | The Shining
 Tammy      | Robinson  | 2001-08-14 14:49:00-06 | Franklin in the Dark
 James      | Clark     | 2001-08-15 12:57:40-06 | Goodnight Moon
 Shirley    | Gould     | 2001-08-15 15:02:01-06 | 2001: A Space Odyssey
 Jenny      | King      | 2001-09-14 17:46:32-06 | The Cat in the Hat
 Annie      | Jackson   | 2001-09-14 18:42:22-06 | The Cat in the Hat
 Annie      | Jackson   | 2001-09-22 12:23:28-06 | Bartholomew and the Oobleck
 Annie      | Jackson   | 2001-09-22 21:58:56-06 | Bartholomew and the Oobleck
(36 rows
-- ### Grouping and Counting

-- 11. Get the COUNT of all books
booktown=# SELECT COUNT(*) FROM books;
 count 
-------
    15
(1 row)
-- 12. Get the COUNT of all Locations
booktown=# SELECT COUNT(location) FROM subjects;
 count 
-------
    15
(1 row)
-- 13. Get the COUNT of each unique location in the subjects table. Display the count and the location name. (hint: requires GROUP BY).
booktown=# SELECT location, COUNT(location) FROM subjects GROUP BY location;
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

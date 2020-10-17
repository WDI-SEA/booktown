-- ### Order
-- 1. Find all subjects sorted by subjects
SELECT subject 
FROM subjects 
ORDER BY subjects ASC;

RESULTS: 
     subject      
------------------
 Arts
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
SELECT 
subject, 
location 
FROM subjects 
ORDER BY location ASC;

RESULTS:
     subject      |     location     
------------------+------------------
 History          | Academic Rd
 Classics         | Academic Rd
 Mystery          | Black Raven Dr
 Horror           | Black Raven Dr
 Arts             | Creativity St
 Cooking          | Creativity St
 Childrens Books | Kids Ct
 Entertainment    | Main St
 Drama            | Main St
 Romance          | Main St
 Science Fiction  | Main St
 Science          | Productivity Ave
 Computers        | Productivity Ave
 Business         | Productivity Ave
 Poetry           | Sunset Dr
 Religion         | 
(16 rows)

-- ### Where
-- 3. Find the book "Little Women"
SELECT * 
FROM books 
WHERE title ='Little Women' ;

RESULTS:
 id  |    title     | author_id | subject_id 
-----+--------------+-----------+------------
 190 | Little Women |        16 |          6
(1 row)

-- 4. Find all books containing the word "Python"
SELECT * FROM books WHERE title LIKE '%Python%' ;

RESULTS:
  id   |       title        | author_id | subject_id 
-------+--------------------+-----------+------------
 41473 | Programming Python |      7805 |          4
 41477 | Learning Python    |      7805 |          4
(2 rows)

-- 5. Find all subjects with the location "Main St" sort them by subject
SELECT * 
FROM subjects 
WHERE location = 'Main St' 
ORDER BY subject;

RESULTS:
 id |     subject     | location 
----+-----------------+----------
  6 | Drama           | Main St
  7 | Entertainment   | Main St
 13 | Romance         | Main St
 15 | Science Fiction | Main St
(4 rows)

-- ### Joins

-- 6. Find all books about Computers and list ONLY the book titles
SELECT 
b.title 
FROM books b 
    LEFT JOIN subjects s 
    ON (b.subject_id = s.id)
WHERE s.subject = 'Computers'
ORDER BY b.title ASC;

RESULTS:
        title         
----------------------
 Learning Python
 Perl Cookbook
 Practical PostgreSQL
 Programming Python
(4 rows)

-- 7. Find all books and display a result table with ONLY the following columns
-- 	* Book title
-- 	* Author's first name
-- 	* Author's last name
-- 	* Book subject
SELECT 
b.title,
a.first_name,
a.last_name,
s.subject
FROM books b 
    LEFT JOIN authors a
        ON (b.author_id= a.id)
    LEFT JOIN subjects s 
        ON (b.subject_id = s.id)
ORDER BY b.title ASC;

RESULTS:
            title            |    first_name    |  last_name   |     subject      
-----------------------------+------------------+--------------+------------------
 2001: A Space Odyssey       | Arthur C.        | Clarke       | Science Fiction
 Bartholomew and the Oobleck | Theodor Seuss    | Geisel       | Childrens Books
 Dune                        | Frank            | Herbert      | Science Fiction
 Dynamic Anatomy             | Burne            | Hogarth      | Arts
 Franklin in the Dark        | Paulette         | Bourgeois    | Childrens Books
 Goodnight Moon              | Margaret Wise    | Brown        | Childrens Books
 Learning Python             | Mark             | Lutz         | Computers
 Little Women                | Louisa May       | Alcott       | Drama
 Perl Cookbook               | Tom              | Christiansen | Computers
 Practical PostgreSQL        | John             | Worsley      | Computers
 Programming Python          | Mark             | Lutz         | Computers
 The Cat in the Hat          | Theodor Seuss    | Geisel       | Childrens Books
 The Shining                 | Stephen          | King         | Horror
 The Tell-Tale Heart         | Edgar Allen      | Poe          | Horror
 The Velveteen Rabbit        | Margery Williams | Bianco       | Classics
(15 rows)

-- 8. Find all books that are listed in the stock table
-- 	* Sort them by retail price (most expensive first)
-- 	* Display ONLY: title and price
SELECT 
b.title,
s.retail
FROM stock s 
    LEFT JOIN editions e
        ON (s.isbn=e.isbn)
    LEFT JOIN books b
        ON (e.book_id= b.id)
ORDER BY s.retail DESC;

RESULTS:
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
SELECT 
b.title,
e.isbn,
p.name,
s.retail
FROM stock s 
    LEFT JOIN editions e
        ON (s.isbn=e.isbn)
    LEFT JOIN books b
        ON (e.book_id= b.id)
    LEFT JOIN publishers p
        ON (p.id=e.publisher_id)
WHERE b.title = 'Dune';

RESULTS:
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
SELECT 
CONCAT(cust.first_name,' ',cust.last_name) AS customer_name,
DATE(ship.ship_date) AS shipped,
b.title
FROM shipments ship
    LEFT JOIN customers cust
        ON (ship.customer_id= cust.id)
    LEFT JOIN editions e
        ON (ship.isbn=e.isbn)
    LEFT JOIN books b
            ON (e.book_id= b.id)
ORDER BY ship.ship_date ASC;

RESULTS:
customer_name    |  shipped   |            title            
--------------------+------------+-----------------------------
 Owen Bollman       | 2001-08-05 | Little Women
 Laura Bennett      | 2001-08-06 | Goodnight Moon
 Chad Allen         | 2001-08-06 | The Cat in the Hat
 Annie Jackson      | 2001-08-06 | Bartholomew and the Oobleck
 Annie Jackson      | 2001-08-07 | Bartholomew and the Oobleck
 Royce Morrill      | 2001-08-07 | The Tell-Tale Heart
 Christine Holloway | 2001-08-07 | 2001: A Space Odyssey
 Eric Morrill       | 2001-08-07 | Little Women
 Jonathan Anderson  | 2001-08-08 | The Shining
 Ed Gould           | 2001-08-08 | The Shining
 Annie Jackson      | 2001-08-08 | Bartholomew and the Oobleck
 Dave Olson         | 2001-08-09 | The Velveteen Rabbit
 Wendy Black        | 2001-08-09 | The Velveteen Rabbit
 Rich Thomas        | 2001-08-10 | Franklin in the Dark
 Jean Black         | 2001-08-10 | The Tell-Tale Heart
 Eric Morrill       | 2001-08-10 | The Cat in the Hat
 Annie Jackson      | 2001-08-11 | Bartholomew and the Oobleck
 Richard Brown      | 2001-08-11 | Goodnight Moon
 James Williams     | 2001-08-11 | The Cat in the Hat
 Kate Gerdes        | 2001-08-12 | Dune
 Jean Owens         | 2001-08-12 | Franklin in the Dark
 Owen Becker        | 2001-08-12 | The Shining
 Julie Bollman      | 2001-08-13 | The Cat in the Hat
 Julie Bollman      | 2001-08-13 | The Cat in the Hat
 Kathy Corner       | 2001-08-13 | The Cat in the Hat
 Tim Owens          | 2001-08-14 | Dynamic Anatomy
 Trevor Young       | 2001-08-14 | Dune
 Chuck Brown        | 2001-08-14 | The Shining
 Adam Holloway      | 2001-08-14 | The Tell-Tale Heart
 Jenny King         | 2001-08-14 | The Shining
 Tammy Robinson     | 2001-08-14 | Franklin in the Dark
 James Clark        | 2001-08-15 | Goodnight Moon
 Shirley Gould      | 2001-08-15 | 2001: A Space Odyssey
 Jenny King         | 2001-09-14 | The Cat in the Hat
 Annie Jackson      | 2001-09-14 | The Cat in the Hat
 Annie Jackson      | 2001-09-22 | Bartholomew and the Oobleck
 Annie Jackson      | 2001-09-22 | Bartholomew and the Oobleck
(36 rows)

-- ### Grouping and Counting

-- 11. Get the COUNT of all books
SELECT 
COUNT(b.title)
FROM books b;

RESULTS:
 count 
-------
    15
(1 row)

-- 12. Get the COUNT of all Locations
SELECT 
COUNT(s.location) AS all_locations,
COUNT(DISTINCT s.location) AS distinct_locations
FROM subjects s;

RESULTS:
 all_locations | distinct_locations 
---------------+--------------------
            15 |                  7
(1 row)





-- 13. Get the COUNT of each unique location in the subjects table. Display the count and the location name. (hint: requires GROUP BY).
SELECT 
s.location,
COUNT(s.location)
FROM subjects s
GROUP BY s.location 
ORDER BY COUNT(s.location) DESC;

RESULTS:
     location     | count 
------------------+-------
 Main St          |     4
 Productivity Ave |     3
 Creativity St    |     2
 Black Raven Dr   |     2
 Academic Rd      |     2
 Sunset Dr        |     1
 Kids Ct          |     1
                  |     0
(8 rows)

-- 14. List all books. Display the book_id, title, and a count of how many editions each book has. (hint: requires GROUP BY and JOIN)

SELECT 
b.title,
b.id,-- using this one over e.books_id to prevent null values
COUNT(e.edition)
FROM books b 
    FULL OUTER JOIN editions e
        ON (e.book_id= b.id)
GROUP BY 1,2
ORDER BY b.title;

RESULTS:
            title            |  id   | count 
-----------------------------+-------+-------
 2001: A Space Odyssey       |  4267 |     2
 Bartholomew and the Oobleck |  1590 |     1
 Dune                        |  4513 |     2
 Dynamic Anatomy             |  2038 |     1
 Franklin in the Dark        | 25908 |     1
 Goodnight Moon              |  1501 |     1
 Learning Python             | 41477 |     0
 Little Women                |   190 |     1
 Perl Cookbook               | 41478 |     0
 Practical PostgreSQL        | 41472 |     0
 Programming Python          | 41473 |     1
 The Cat in the Hat          |  1608 |     2
 The Shining                 |  7808 |     2
 The Tell-Tale Heart         |   156 |     2
 The Velveteen Rabbit        |  1234 |     1
(15 rows)


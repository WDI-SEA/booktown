/* ORDER 1
Find all subjects sorted by subject */

SELECT subject FROM subjects ORDER BY subject;

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


/* ORDER 2
Find all subjects sorted by location */

SELECT subject FROM subjects ORDER BY location;

subject      
------------------
 History
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


/*WHERE 1:
Find the book "Little Women" */

SELECT title
FROM books
WHERE title = 'Little Women';

    title     
--------------
 Little Women
(1 row)

/*WHERE 2:
Find all books containing the word "Python" */

SELECT title
FROM books
WHERE title ILIKE '%Python%';

       title        
--------------------
 Programming Python
 Learning Python
(2 rows)


/*WHERE 3:
Find all subjects with the location "Main St" sort them by subject */

SELECT subject
FROM subjects
WHERE location = 'Main St'
ORDER BY subject;

     subject     
-----------------
 Drama
 Entertainment
 Romance
 Science Fiction
(4 rows)


/*JOINS 1:
Find all books about Computers list ONLY book title */

SELECT b.title 
FROM books b
JOIN subjects s ON s.id=b.subject_id 
WHERE s.subject = 'Computers';

title         
----------------------
 Practical PostgreSQL
 Perl Cookbook
 Learning Python
 Programming Python
(4 rows)


/*JOINS 2:
Find all books and display ONLY
  -Book title
  -Author's first name
  -Author's last name
  -Book subject
*/

SELECT b.title, a.first_name, a.last_name, s.subject
FROM books b
JOIN subjects s ON b.subject_id = s.id
JOIN authors a ON b.author_id = a.id;

            title            |    first_name    |  last_name   |     subject      
-----------------------------+------------------+--------------+------------------
 Practical PostgreSQL        | John             | Worsley      | Computers
 Franklin in the Dark        | Paulette         | Bourgeois    | Childrens Books
 The Velveteen Rabbit        | Margery Williams | Bianco       | Classics
 Little Women                | Louisa May       | Alcott       | Drama
 The Shining                 | Stephen          | King         | Horror
 Dune                        | Frank            | Herbert      | Science Fiction
 Dynamic Anatomy             | Burne            | Hogarth      | Arts
 Goodnight Moon              | Margaret Wise    | Brown        | Childrens Books
 The Tell-Tale Heart         | Edgar Allen      | Poe          | Horror
 Programming Python          | Mark             | Lutz         | Computers
 Learning Python             | Mark             | Lutz         | Computers
 Perl Cookbook               | Tom              | Christiansen | Computers
 2001: A Space Odyssey       | Arthur C.        | Clarke       | Science Fiction
 The Cat in the Hat          | Theodor Seuss    | Geisel       | Childrens Books
 Bartholomew and the Oobleck | Theodor Seuss    | Geisel       | Childrens Books
(15 rows)


/*JOINS 3:
Find all books that are listed in the stock table
  -Sort them by retail price (most expensive first)
  -Display ONLY: title and price
*/

SELECT b.title, s.cost
FROM editions e
JOIN books b ON b.id = e.book_id
JOIN stock s ON s.isbn = e.isbn
ORDER BY s.retail DESC;

            title            | cost  
-----------------------------+-------
 2001: A Space Odyssey       | 36.00
 Dune                        | 36.00
 The Shining                 | 29.00
 The Cat in the Hat          | 30.00
 Goodnight Moon              | 25.00
 The Shining                 | 24.00
 Dynamic Anatomy             | 26.00
 The Tell-Tale Heart         | 23.00
 The Velveteen Rabbit        | 20.00
 The Cat in the Hat          | 23.00
 Franklin in the Dark        | 23.00
 Little Women                | 18.00
 2001: A Space Odyssey       | 17.00
 The Tell-Tale Heart         | 19.00
 Dune                        | 17.00
 Bartholomew and the Oobleck | 16.00
(16 rows)

/*JOINS 4:
Find the book "Dune" and display ONLY
  -Book title
  -ISBN number
  -Publisher name
  -Retail price
*/

SELECT b.title, s.isbn, p.name, s.retail
FROM editions e
JOIN stock s ON e.isbn = s.isbn
JOIN publishers p ON e.publisher_id = p.id
JOIN books b ON e.book_id = b.id
WHERE b.title = 'Dune';

 title |    isbn    |   name    | retail 
-------+------------+-----------+--------
 Dune  | 0441172717 | Ace Books |  21.95
 Dune  | 044100590X | Ace Books |  45.95
(2 rows)


/*JOINS 5:
- Find all shipments sorted by ship date (shipments) display ONLY:

    - Customer first name (shipments: customer_id --> customers: id - first_name)
    - Customer last name (shipments: customer_id --> customers: id - last_name)
    - ship date (shipments:  ship_date)
    - book title (shipments: isbn —> editions: isbn —>  : book_id —> books: id —>:  title*/

SELECT c.first_name, c.last_name, s.ship_date, b.title
FROM shipments s
JOIN customers c ON s.customer_id = c.id
JOIN editions e ON s.isbn = e.isbn
JOIN books b ON b.id = e.book_id
ORDER BY s.ship_date;

 first_name | last_name |       ship_date        |            title            
------------+-----------+------------------------+-----------------------------
 Owen       | Bollman   | 2001-08-05 09:34:04-07 | Little Women
 Laura      | Bennett   | 2001-08-06 07:49:44-07 | Goodnight Moon
 Chad       | Allen     | 2001-08-06 09:29:21-07 | The Cat in the Hat
 Annie      | Jackson   | 2001-08-06 11:46:36-07 | Bartholomew and the Oobleck
 Annie      | Jackson   | 2001-08-07 10:58:36-07 | Bartholomew and the Oobleck
 Royce      | Morrill   | 2001-08-07 11:31:57-07 | The Tell-Tale Heart
 Christine  | Holloway  | 2001-08-07 11:56:42-07 | 2001: A Space Odyssey
 Eric       | Morrill   | 2001-08-07 13:00:48-07 | Little Women
 Jonathan   | Anderson  | 2001-08-08 08:36:44-07 | The Shining
 Ed         | Gould     | 2001-08-08 09:53:46-07 | The Shining
 Annie      | Jackson   | 2001-08-08 10:46:13-07 | Bartholomew and the Oobleck
 Dave       | Olson     | 2001-08-09 07:30:07-07 | The Velveteen Rabbit
 Wendy      | Black     | 2001-08-09 09:30:46-07 | The Velveteen Rabbit
 Rich       | Thomas    | 2001-08-10 07:29:52-07 | Franklin in the Dark
 Jean       | Black     | 2001-08-10 08:29:42-07 | The Tell-Tale Heart
 Eric       | Morrill   | 2001-08-10 13:47:52-07 | The Cat in the Hat
 Annie      | Jackson   | 2001-08-11 09:55:05-07 | Bartholomew and the Oobleck
 Richard    | Brown     | 2001-08-11 10:52:34-07 | Goodnight Moon
 James      | Williams  | 2001-08-11 13:34:08-07 | The Cat in the Hat
 Kate       | Gerdes    | 2001-08-12 08:46:35-07 | Dune
 Jean       | Owens     | 2001-08-12 12:09:47-07 | Franklin in the Dark
 Owen       | Becker    | 2001-08-12 13:39:22-07 | The Shining
 Julie      | Bollman   | 2001-08-13 09:42:10-07 | The Cat in the Hat
 Kathy      | Corner    | 2001-08-13 09:47:04-07 | The Cat in the Hat
 Tim        | Owens     | 2001-08-14 07:33:47-07 | Dynamic Anatomy
 Trevor     | Young     | 2001-08-14 08:42:58-07 | Dune
 Chuck      | Brown     | 2001-08-14 10:36:41-07 | The Shining
 Adam       | Holloway  | 2001-08-14 13:41:39-07 | The Tell-Tale Heart
 Jenny      | King      | 2001-08-14 13:45:51-07 | The Shining
 Tammy      | Robinson  | 2001-08-14 13:49:00-07 | Franklin in the Dark
 James      | Clark     | 2001-08-15 11:57:40-07 | Goodnight Moon
 Shirley    | Gould     | 2001-08-15 14:02:01-07 | 2001: A Space Odyssey
 Jenny      | King      | 2001-09-14 16:46:32-07 | The Cat in the Hat
 Annie      | Jackson   | 2001-09-14 17:42:22-07 | The Cat in the Hat
 Annie      | Jackson   | 2001-09-22 11:23:28-07 | Bartholomew and the Oobleck
 Annie      | Jackson   | 2001-09-22 20:58:56-07 | Bartholomew and the Oobleck
(36 rows)

/* Grouping and Counting 1
Get the COUNT of all books */

SELECT COUNT(*) FROM books;

 count 
-------
    15
(1 row)


/* Grouping and Counting 2
Get the COUNT of all Locations */

SELECT COUNT(location) FROM subjects;

 count 
-------
    15
(1 row)

/* Grouping and Counting 3
Get the COUNT of each unique location in the subjects table. 
Display the count and the location name. (hint: requires GROUP BY). */

SELECT DISTINCT location, COUNT(location) FROM subjects
GROUP BY location;

     location     | count 
------------------+-------
 Creativity St    |     2
 Black Raven Dr   |     2
 Academic Rd      |     2
 Main St          |     4
 Productivity Ave |     3
 Sunset Dr        |     1
                  |     0
 Kids Ct          |     1
(8 rows)

/* Grouping and Counting 4
List all books. Display the book_id, title, and a count of how many editions each book has.
(hint: requires GROUP BY and JOIN) */

SELECT b.id, b.title, COUNT(e.edition) 
FROM books b
JOIN editions e ON b.id = e.book_id
GROUP BY b.id;

id   |            title            | count 
-------+-----------------------------+-------
  7808 | The Shining                 |     2
  4513 | Dune                        |     2
  1590 | Bartholomew and the Oobleck |     1
 25908 | Franklin in the Dark        |     1
   156 | The Tell-Tale Heart         |     2
  4267 | 2001: A Space Odyssey       |     2
  1501 | Goodnight Moon              |     1
  2038 | Dynamic Anatomy             |     1
 41473 | Programming Python          |     1
   190 | Little Women                |     1
  1608 | The Cat in the Hat          |     2
  1234 | The Velveteen Rabbit        |     1
(12 rows)
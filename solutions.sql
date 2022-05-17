-- ### Order
-- 1. Find all subjects sorted by subject
booktown=# select subjects from subjects order by subjects;
             subjects             
----------------------------------
 (0,Arts,"Creativity St")
 (1,Business,"Productivity Ave")
 (2,"Children's Books","Kids Ct")
 (3,Classics,"Academic Rd")
 (4,Computers,"Productivity Ave")
 (5,Cooking,"Creativity St")
 (6,Drama,"Main St")
 (7,Entertainment,"Main St")
 (8,History,"Academic Rd")
 (9,Horror,"Black Raven Dr")
 (10,Mystery,"Black Raven Dr")
 (11,Poetry,"Sunset Dr")
 (12,Religion,)
 (13,Romance,"Main St")
 (14,Science,"Productivity Ave")
 (15,"Science Fiction","Main St")
(16 rows)
-- 2. Find all subjects sorted by location
booktown=# select subjects from subjects order by location;
             subjects             
----------------------------------
 (8,History,"Academic Rd")
 (3,Classics,"Academic Rd")
 (10,Mystery,"Black Raven Dr")
 (9,Horror,"Black Raven Dr")
 (0,Arts,"Creativity St")
 (5,Cooking,"Creativity St")
 (2,"Children's Books","Kids Ct")
 (7,Entertainment,"Main St")
 (6,Drama,"Main St")
 (13,Romance,"Main St")
 (15,"Science Fiction","Main St")
 (14,Science,"Productivity Ave")
 (4,Computers,"Productivity Ave")
 (1,Business,"Productivity Ave")
 (11,Poetry,"Sunset Dr")
 (12,Religion,)

-- ### Where
-- 3. Find the book "Little Women"
booktown=# select title from books where title = 'Little Women'
booktown-# ;
    title     
--------------
 Little Women
-- 4. Find all books containing the word "Python"
booktown=# SELECT * FROM books WHERE title like '%Python'
booktown-# ;
  id   |       title        | author_id | subject_id 
-------+--------------------+-----------+------------
 41473 | Programming Python |      7805 |          4
 41477 | Learning Python    |      7805 |          4
(2 rows)

-- 5. Find all subjects with the location "Main St" sort them by subject
booktown=# select subjects from subjects where location = 'Main St' order by subjects
booktown-# ;
             subjects             
----------------------------------
 (6,Drama,"Main St")
 (7,Entertainment,"Main St")
 (13,Romance,"Main St")
 (15,"Science Fiction","Main St")
(4 rows)



-- ### Joins

-- 6. Find all books about Computers and list ONLY the book titles
booktown=# select books.title from books join subjects on books.subject_id = subjects.id where subject = 'Computers'
booktown-# ;
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
booktown=# select books.title, subjects.subject, authors.first_name, authors.last_name from books
booktown-# join subjects on books.subject_id = subjects.id
booktown-# join authors on books.author_id = authors.id
booktown-# ;
            title            |     subject      |    first_name    |  last_name   
-----------------------------+------------------+------------------+--------------
 Practical PostgreSQL        | Computers        | John             | Worsley
 Franklin in the Dark        | Children's Books | Paulette         | Bourgeois
 The Velveteen Rabbit        | Classics         | Margery Williams | Bianco
 Little Women                | Drama            | Louisa May       | Alcott
 The Shining                 | Horror           | Stephen          | King
 Dune                        | Science Fiction  | Frank            | Herbert
 Dynamic Anatomy             | Arts             | Burne            | Hogarth
 Goodnight Moon              | Children's Books | Margaret Wise    | Brown
 The Tell-Tale Heart         | Horror           | Edgar Allen      | Poe
 Programming Python          | Computers        | Mark             | Lutz
 Learning Python             | Computers        | Mark             | Lutz
 Perl Cookbook               | Computers        | Tom              | Christiansen
 2001: A Space Odyssey       | Science Fiction  | Arthur C.        | Clarke
 The Cat in the Hat          | Children's Books | Theodor Seuss    | Geisel
 Bartholomew and the Oobleck | Children's Books | Theodor Seuss    | Geisel
 The Cat in the Hat          | Children's Books | Theodor Seuss    | Geisel
 Bartholomew and the Oobleck | Children's Books | Theodor Seuss    | Geisel
(17 rows)
-- 8. Find all books that are listed in the stock table
-- 	* Sort them by retail price (most expensive first)
-- 	* Display ONLY: title and price
booktown=# SELECT books.title, stock.retail FROM books
booktown-# JOIN editions on books.id = editions.book_id
booktown-# JOIN stock on editions.isbn = stock.isbn
booktown-# ORDER BY retail DESC;
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
booktown=# select books.title, editions.isbn, publishers.name, stock.retail from books                                                                                  join editions on books.id = editions.book_id                                        join stock on editions.isbn = stock.isbn                                            join publishers on editions.publisher_id = publishers.id                            where title = 'Dune'                                                                ;
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
booktown=# select customers.first_name, customers.last_name, shipments.ship_date, books.title from books
booktown-# join editions on books.id = editions.book_id
booktown-# join shipments on editions.isbn = shipments.isbn
booktown-# join customers on shipments.customer_id = customers.id
booktown-# order by shipments.ship_date;

-- ### Grouping and Counting

-- 11. Get the COUNT of all books
-- 12. Get the COUNT of all Locations
-- 13. Get the COUNT of each unique location in the subjects table. Display the count and the location name. (hint: requires GROUP BY).
-- 14. List all books. Display the book_id, title, and a count of how many editions each book has. (hint: requires GROUP BY and JOIN)

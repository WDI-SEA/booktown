-- ### Order
-- 1. Find all subjects sorted by subject

booktown=# select subject from subjects;
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

booktown=# select subject from subjects order by location;
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

booktown=# 
-- ### Where
-- 3. Find the book "Little Women"
booktown=# select * from books where title='Little Women';
 id  |    title     | author_id | subject_id 
-----+--------------+-----------+------------
 190 | Little Women |        16 |          6
(1 row)

booktown=# 
-- 4. Find all books containing the word "Python"
booktown=# select * from books where title like '%Python%';
  id   |       title        | author_id | subject_id 
-------+--------------------+-----------+------------
 41473 | Programming Python |      7805 |          4
 41477 | Learning Python    |      7805 |          4
(2 rows)

booktown=# 
-- 5. Find all subjects with the location "Main St" sort them by subject
booktown=# select * from subjects where location='Main St' order by subject;
 id |     subject     | location 
----+-----------------+----------
  6 | Drama           | Main St
  7 | Entertainment   | Main St
 13 | Romance         | Main St
 15 | Science Fiction | Main St
(4 rows)

booktown=# 

-- ### Joins

-- 6. Find all books about Computers and list ONLY the book titles
booktown=# select b.title from books b join subjects s on b.subject_id=s.id where s.subject='Computers';
        title         
----------------------
 Practical PostgreSQL
 Perl Cookbook
 Learning Python
 Programming Python
(4 rows)

booktown=# 
-- 7. Find all books and display a result table with ONLY the following columns
-- 	* Book title
-- 	* Author's first name
-- 	* Author's last name
-- 	* Book subject
booktown=# SELECT b.title, a.first_name, a.last_name, s.subject                                                                                       
booktown-# FROM books b
booktown-# JOIN authors a
booktown-# ON b.author_id = a.id
booktown-# JOIN subjects s
booktown-# ON b.subject_id = s.id;
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

booktown=# 
-- 8. Find all books that are listed in the stock table
booktown=# select * from stock
booktown-# ;
    isbn    | cost  | retail | stock 
------------+-------+--------+-------
 0385121679 | 29.00 |  36.95 |    65
 039480001X | 30.00 |  32.95 |    31
 0394900014 | 23.00 |  23.95 |     0
 044100590X | 36.00 |  45.95 |    89
 0441172717 | 17.00 |  21.95 |    77
 0451160916 | 24.00 |  28.95 |    22
 0451198492 | 36.00 |  46.95 |     0
 0451457994 | 17.00 |  22.95 |     0
 0590445065 | 23.00 |  23.95 |    10
 0679803335 | 20.00 |  24.95 |    18
 0694003611 | 25.00 |  28.95 |    50
 0760720002 | 18.00 |  23.95 |    28
 0823015505 | 26.00 |  28.95 |    16
 0929605942 | 19.00 |  21.95 |    25
 1885418035 | 23.00 |  24.95 |    77
 0394800753 | 16.00 |  16.95 |     4
(16 rows)
-- 	* Sort them by retail price (most expensive first)
-- 	* Display ONLY: title and price
-- 9. Find the book "Dune" and display ONLY the following columns
-- 	* Book title
-- 	* ISBN number
-- 	* Publisher name
-- 	* Retail price
-- 10. Find all shipments sorted by ship date display a result table with ONLY the following columns:
-- 	* Customer first name
-- 	* Customer last name
-- 	* ship date
-- 	* book title

-- ### Grouping and Counting

-- 11. Get the COUNT of all books
-- 12. Get the COUNT of all Locations
-- 13. Get the COUNT of each unique location in the subjects table. Display the count and the location name. (hint: requires GROUP BY).
-- 14. List all books. Display the book_id, title, and a count of how many editions each book has. (hint: requires GROUP BY and JOIN)

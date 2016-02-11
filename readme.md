#SQL Books

For each item below figure out the approriate SQL. Create a text file that contains all of your answers and submit it in the Homework repo.

##Getting Started

To get started we'll need to import the booktown.sql file.

1. open terminal
2. use the command `psql -f booktown.sql`
3. type `psql` to open your psql console
4. type \list to ensure the booktown database was successfully completed

###Additionally...

Your life will be made easier with a GUI PostgreSQL client. Download [PG Commander](https://eggerapps.at/pgcommander/) if you have a Mac, or [pgAdmin](http://www.pgadmin.org/) if you have Linux.

##Order
1. Find all subjects sorted by subject

booktown=# select subject from subjects order by subject;

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

2. Find all subjects sorted by location

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


##Where
1. Find the book "Little Women"

booktown=# select * from books where title in ('Little Women');

 id  |    title     | author_id | subject_id 
-----+--------------+-----------+------------
 190 | Little Women |        16 |          6
(1 row)

2. Find all books containing the word "Python"

booktown=# select * from books where title ilike '%Python%';

  id   |       title        | author_id | subject_id 
-------+--------------------+-----------+------------
 41473 | Programming Python |      7805 |          4
 41477 | Learning Python    |      7805 |          4
(2 rows)

3. Find all subjects with the location "Main St" sort them by subject

booktown=# select subject from subjects where location='Main St' order by subject;

     subject     
-----------------
 Drama
 Entertainment
 Romance
 Science Fiction
(4 rows)

##Joins

* Find all books about Computers list ONLY book title

booktown=# SELECT title FROM subjects s JOIN books b ON b.subject_id = s.id
where subject = 'Computers';
        title         
----------------------
 Practical PostgreSQL
 Perl Cookbook
 Learning Python
 Programming Python
(4 rows)

* Find all books and display ONLY
	* Book title
	* Author's first name
	* Author's last name
	* Book subject

booktown=# SELECT b.title, a.first_name, a.last_name, s.subject
booktown-# FROM books b JOIN subjects s ON b.subject_id = s.id
booktown-# JOIN authors a ON a.id = b.author_id;
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


* Find all books that are listed in the stock table
	* Sort them by retail price (most expensive first)
	* Display ONLY: title and price

booktown=# SELECT b tile, s.retail FROM
booktown-# books b JOIN editions e ON b.id = e.book_id
booktown-# JOIN stock s ON e.isbn = s.isbn
booktown-# ORDER BY retail DESC;

                    tile                     | retail 
---------------------------------------------+--------
 (4267,"2001: A Space Odyssey",2001,15)      |  46.95
 (4513,Dune,1866,15)                         |  45.95
 (7808,"The Shining",4156,9)                 |  36.95
 (1608,"The Cat in the Hat",1809,2)          |  32.95
 (1501,"Goodnight Moon",2031,2)              |  28.95
 (7808,"The Shining",4156,9)                 |  28.95
 (2038,"Dynamic Anatomy",1644,0)             |  28.95
 (156,"The Tell-Tale Heart",115,9)           |  24.95
 (1234,"The Velveteen Rabbit",25041,3)       |  24.95
 (1608,"The Cat in the Hat",1809,2)          |  23.95
 (25908,"Franklin in the Dark",15990,2)      |  23.95
 (190,"Little Women",16,6)                   |  23.95
 (4267,"2001: A Space Odyssey",2001,15)      |  22.95
 (156,"The Tell-Tale Heart",115,9)           |  21.95
 (4513,Dune,1866,15)                         |  21.95
 (1590,"Bartholomew and the Oobleck",1809,2) |  16.95
(16 rows)


* Find the book "Dune" and display ONLY
	* Book title
	* ISBN number
	* Publisher name
	* Retail price

booktown=# SELECT b.title, e.isbn, p.name, s.retail
booktown-# FROM books b JOIN editions e ON b.id = e.book_id
booktown-# JOIN stock s ON s.isbn = e.isbn
booktown-# JOIN publishers p ON p.id = e.publisher_id WHERE b.title = 'Dune';

 title |    isbn    |   name    | retail 
-------+------------+-----------+--------
 Dune  | 0441172717 | Ace Books |  21.95
 Dune  | 044100590X | Ace Books |  45.95
(2 rows)

* Find all shipments sorted by ship date display ONLY:
	* Customer first name
	* Customer last name
	* ship date
	* book title
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

booktown=# SELECT c.first_name, c.last_name, s.ship_date, b.title
booktown-# FROM books b JOIN editions e ON b.id = e.book_id
booktown-# JOIN shipments s ON s.isbn = e.isbn
booktown-# JOIN customers c ON c.id = s.customer_id ORDER BY s.ship_date;

##Grouping and Counting

1. Get the COUNT of all books

booktown=# SELECT COUNT(*) FROM books;
 count 
-------
    15
(1 row)

* Get the COUNT of all Locations

booktown=# SELECT COUNT(location) FROM subjects;
 count 
-------
    15
(1 row)

* Get the COUNT of each unique location in the subjects table. Display the count and the location name. (hint: requires GROUP BY).

booktown=# SELECT location, COUNT(location) FROM subjects GROUP BY location;
     location     | count 
------------------+-------
                  |     0
 Academic Rd      |     2
 Main St          |     4
 Productivity Ave |     3
 Sunset Dr        |     1
 Creativity St    |     2
 Black Raven Dr   |     2
 Kids Ct          |     1
(8 rows)


* List all books. Display the book_id, title, and a count of how many editions each book has. (hint: requires GROUP BY and JOIN)

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

SELECT b.id, b.title, COUNT(e.edition) FROM books b JOIN editions e ON e.book_id = b.id GROUP BY b.id;   



####YAY! You're done!!

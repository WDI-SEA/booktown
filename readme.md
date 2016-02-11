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

	select subject from subjects;
2. Find all subjects sorted by location

	select subject from subjects order by location asc;

##Where
1. Find the book "Little Women"

	select title from books where title = 'Little Women';
2. Find all books containing the word "Python"

	select title from books where title like '%Python%';
3. Find all subjects with the location "Main St" sort them by subject
	select subject from subjects where location = 'Main St' order by subject;


##Joins

* Find all books about Computers list ONLY book title
	select title from books b join subjects s on b.subject_id = s.id where s.subject = 'Computers';

* Find all books and display ONLY
	* Book title
	* Author's first name
	* Author's last name
	* Book subject
	select b.title, a.last_name, a.first_name, s.subject from books b full join authors a on b.author_id = a.id join subjects s on b.subject_id = s.id;
            title            |  last_name   |    first_name    |     subject      
-----------------------------+--------------+------------------+------------------
 Practical PostgreSQL        | Worsley      | John             | Computers
 Franklin in the Dark        | Bourgeois    | Paulette         | Children's Books
 The Velveteen Rabbit        | Bianco       | Margery Williams | Classics
 Little Women                | Alcott       | Louisa May       | Drama
 The Shining                 | King         | Stephen          | Horror
 Dune                        | Herbert      | Frank            | Science Fiction
 Dynamic Anatomy             | Hogarth      | Burne            | Arts
 Goodnight Moon              | Brown        | Margaret Wise    | Children's Books
 The Tell-Tale Heart         | Poe          | Edgar Allen      | Horror
 Programming Python          | Lutz         | Mark             | Computers
 Learning Python             | Lutz         | Mark             | Computers
 Perl Cookbook               | Christiansen | Tom              | Computers
 2001: A Space Odyssey       | Clarke       | Arthur C.        | Science Fiction
 The Cat in the Hat          | Geisel       | Theodor Seuss    | Children's Books
 Bartholomew and the Oobleck | Geisel       | Theodor Seuss    | Children's Books
(15 rows)


* Find all books that are listed in the stock table
	* Sort them by retail price (most expensive first)
	* Display ONLY: title and price
select b.title, s.retail from stock s join editions e on s.isbn = e.isbn join books b on e.book_id = b.id;
* Find the book "Dune" and display ONLY
	* Book title
	* ISBN number
	* Publisher name
	* Retail price
            title            | retail 
-----------------------------+--------
 The Cat in the Hat          |  32.95
 The Shining                 |  28.95
 Bartholomew and the Oobleck |  16.95
 Franklin in the Dark        |  23.95
 Goodnight Moon              |  28.95
 The Velveteen Rabbit        |  24.95
 Little Women                |  23.95
 The Cat in the Hat          |  23.95
 The Shining                 |  36.95
 The Tell-Tale Heart         |  24.95
 The Tell-Tale Heart         |  21.95
 Dune                        |  21.95
 Dune                        |  45.95
 2001: A Space Odyssey       |  22.95
 2001: A Space Odyssey       |  46.95
 Dynamic Anatomy             |  28.95
(16 rows)

* Find the book "Dune" and display ONLY
	* Book title
	* ISBN number
	* Publisher name
	* Retail price
select b.title, s.retail, e.isbn, p.name from stock s join editions e on s.isbn = e.isbn join publishers p on p.id = e.publisher_id join books b on e.book_id = b.id where b.title = 'Dune';
 title | retail |    isbn    |   name    
-------+--------+------------+-----------
 Dune  |  21.95 | 0441172717 | Ace Books
 Dune  |  45.95 | 044100590X | Ace Books
(2 rows)

* Find all shipments sorted by ship date display ONLY:
	* Customer first name
	* Customer last name
	* ship date
	* book title
select b.title, s.ship_date, c.last_name, c.first_name from shipments s join customers c on s.customer_id = c.id join editions e on e.isbn = s.isbn join books b on b.id = e.book_id order by s.ship_date;

 The Velveteen Rabbit        | 2001-08-09 07:30:07-07 | Olson     | Dave
 The Velveteen Rabbit        | 2001-08-09 09:30:46-07 | Black     | Wendy
 Franklin in the Dark        | 2001-08-10 07:29:52-07 | Thomas    | Rich
 The Tell-Tale Heart         | 2001-08-10 08:29:42-07 | Black     | Jean
 The Cat in the Hat          | 2001-08-10 13:47:52-07 | Morrill   | Eric
 Bartholomew and the Oobleck | 2001-08-11 09:55:05-07 | Jackson   | Annie
 Goodnight Moon              | 2001-08-11 10:52:34-07 | Brown     | Richard
 The Cat in the Hat          | 2001-08-11 13:34:08-07 | Williams  | James
 Dune                        | 2001-08-12 08:46:35-07 | Gerdes    | Kate
 Franklin in the Dark        | 2001-08-12 12:09:47-07 | Owens     | Jean
 The Shining                 | 2001-08-12 13:39:22-07 | Becker    | Owen
 The Cat in the Hat          | 2001-08-13 09:42:10-07 | Bollman   | Julie
 The Cat in the Hat          | 2001-08-13 09:47:04-07 | Corner    | Kathy
 Dynamic Anatomy             | 2001-08-14 07:33:47-07 | Owens     | Tim
 Dune                        | 2001-08-14 08:42:58-07 | Young     | Trevor
 The Shining                 | 2001-08-14 10:36:41-07 | Brown     | Chuck
 The Tell-Tale Heart         | 2001-08-14 13:41:39-07 | Holloway  | Adam
 The Shining                 | 2001-08-14 13:45:51-07 | King      | Jenny
 Franklin in the Dark        | 2001-08-14 13:49:00-07 | Robinson  | Tammy
 Goodnight Moon              | 2001-08-15 11:57:40-07 | Clark     | James
 2001: A Space Odyssey       | 2001-08-15 14:02:01-07 | Gould     | Shirley
 The Cat in the Hat          | 2001-09-14 16:46:32-07 | King      | Jenny
 The Cat in the Hat          | 2001-09-14 17:42:22-07 | Jackson   | Annie
 Bartholomew and the Oobleck | 2001-09-22 11:23:28-07 | Jackson   | Annie
 Bartholomew and the Oobleck | 2001-09-22 20:58:56-07 | Jackson   | Annie
(36 rows)


##Grouping and Counting

1. Get the COUNT of all books
select count(*) from books;
 count 
-------
    15
(1 row)

* Get the COUNT of all Locations
select count(location) from subjects;
-------
     7
(1 row)

* Get the COUNT of each unique location in the subjects table. Display the count and the location name. (hint: requires GROUP BY).
select distinct(location), count(location) from subjects group by location;
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

* List all books. Display the book_id, title, and a count of how many editions each book has. (hint: requires GROUP BY and JOIN)
 select e.book_id, b.title, count(e.book_id) from books b join editions e on b.id = e.book_id group by e.book_id, b.title   
 book_id |            title            | count 
---------+-----------------------------+-------
     156 | The Tell-Tale Heart         |     2
    4267 | 2001: A Space Odyssey       |     2
    2038 | Dynamic Anatomy             |     1
   41473 | Programming Python          |     1
    7808 | The Shining                 |     2
    1608 | The Cat in the Hat          |     2
    1501 | Goodnight Moon              |     1
    4513 | Dune                        |     2
   25908 | Franklin in the Dark        |     1
    1590 | Bartholomew and the Oobleck |     1
    1234 | The Velveteen Rabbit        |     1
     190 | Little Women                |     1
(12 rows)


####YAY! You're done!!

### Order
* Find all subjects sorted by subject
booktown=# select subject from subjects order by subject asc;
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

* Find all subjects sorted by location
booktown=# select subject from subjects order by location asc;
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


### Where
* Find the book "Little Women"
booktown=# select*from books where title='Little Women';
 id  |    title     | author_id | subject_id
-----+--------------+-----------+------------
 190 | Little Women |        16 |          6
(1 row)

* Find all books containing the word "Python"
booktown=# select*from books where title like '%Pyth%';
  id   |       title        | author_id | subject_id
-------+--------------------+-----------+------------
 41473 | Programming Python |      7805 |          4
 41477 | Learning Python    |      7805 |          4
(2 rows)

* Find all subjects with the location "Main St" sort them by subject

booktown=# select*from subjects where location='Main St' order by subject;
 id |     subject     | location
----+-----------------+----------
  6 | Drama           | Main St
  7 | Entertainment   | Main St
 13 | Romance         | Main St
 15 | Science Fiction | Main St
(4 rows)

### Joins

* Find all books about Computers and list ONLY the book titles
booktown=# select book_backup.title from book_backup full outer join subjects on book_backup.subject_id=subjects.id where subjects.id='4';
        title
----------------------
 Practical PostgreSQL
 Programming Python
 Learning Python
 Perl Cookbook
 Programming Python
 Learning Python
 Perl Cookbook
 Practical PostgreSQL
(8 rows)

* Find all books and display a result table with ONLY the following columns
	* Book title
	* Author's first name
	* Author's last name
	* Book subject
  select book_backup.title, book_backup.subject_id, authors.first_name, authors.last_name from book_backup inner join authors on book_backup.author_id=authors.id;

* Find all books that are listed in the stock table
	* Sort them by retail price (most expensive first)
	* Display ONLY: title and price
  booktown=# select title, retail from books join editions on books.id=editions.book_id join stock on editions.isbn=stock.isbn order by retail desc;
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


* Find the book "Dune" and display ONLY the following columns
	* Book title
	* ISBN number
	* Publisher name
	* Retail price

select title, editions.isbn, name, retail from books join editions on books.id=editions.book_id
  join publishers on editions.publisher_id=publishers.id join stock on editions.isbn=stock.isbn where title like '%Dune%';

editions

* Find all shipments sorted by ship date display a result table with ONLY the following columns:
	* Customer first name
	* Customer last name
	* ship date
	* book title

select first_name, last_name, ship_date, title from customers join shipments on


### Grouping and Counting

* Get the COUNT of all books
booktown=# select count(*) from books;
 count
-------
    15

* Get the COUNT of all Locations
booktown=# select count(location) from subjects;
 count
-------
    15
(1 row)

* Get the COUNT of each unique location in the subjects table. Display the count and the location name. (hint: requires GROUP BY).
booktown=# select count(location), location from subjects group by location;
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
(8 rows)


* List all books. Display the book_id, title, and a count of how many editions each book has. (hint: requires GROUP BY and JOIN)

select book_id, title, count(editions) from books join editions on editions.book_id=books.id;

#### YAY! You're done!!

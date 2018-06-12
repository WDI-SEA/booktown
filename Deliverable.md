## Queries
Complete the following exercises to practice using SQL.

## Order
Find all subjects sorted by subject

booktown=# select * from subjects;
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
(16 rows)

Find all subjects sorted by location

booktown=# select * from subjects order by location;
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
(16 rows)

## Where
Find the book "Little Women"

booktown=# select * from books;
booktown=# select * from books where author_id=16;
 id  |    title     | author_id | subject_id
-----+--------------+-----------+------------
 190 | Little Women |        16 |          6
(1 row)

Find all books containing the word "Python"

booktown=# select * from books where title like '%Python%';
  id   |       title        | author_id | subject_id
-------+--------------------+-----------+------------
 41473 | Programming Python |      7805 |          4
 41477 | Learning Python    |      7805 |          4
(2 rows)

Find all subjects with the location "Main St" sort them by subject

booktown=# select * from subjects where location like 'Main%';
 id |     subject     | location
----+-----------------+----------
  6 | Drama           | Main St
  7 | Entertainment   | Main St
 13 | Romance         | Main St
 15 | Science Fiction | Main St
(4 rows)


## Joins
Find all books about Computers and list ONLY the book titles



Find all books and display a result table with ONLY the following columns
Book title
Author's first name
Author's last name
Book subject

booktown=# select books.title AS booktitle, authors.first_name AS firstname, authors.last_name AS lastname, subjects.subject
booktown-# from
booktown-# books join authors on books.author_id = authors.id join subjects on books.subject_id = subjects.id;

          booktitle          |    firstname     |   lastname   |     subject
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

Find all books that are listed in the stock table

Sort them by retail price (most expensive first)

Display ONLY: title and price

Find the book "Dune" and display ONLY the following columns
Book title
ISBN number
Publisher name
Retail price

Find all shipments sorted by ship date display a result table with ONLY the following columns:
Customer first name
Customer last name
ship date
book title

## Grouping and Counting
Get the COUNT of all books

Get the COUNT of all Locations

Get the COUNT of each unique location in the subjects table. 

Display the count and the location name. (hint: requires GROUP BY).

List all books. Display the book_id, title, and a count of how many editions each book has. (hint: requires GROUP BY and JOIN)

booktown=# select books.id, books.title, count(edition) as editions
booktown-# from
booktown-# books join editions on books.id = editions.book_id group by books.id;

  id   |            title            | editions
-------+-----------------------------+----------
  2038 | Dynamic Anatomy             |        1
 25908 | Franklin in the Dark        |        1
  7808 | The Shining                 |        2
  4267 | 2001: A Space Odyssey       |        2
 41473 | Programming Python          |        1
  1234 | The Velveteen Rabbit        |        1
  4513 | Dune                        |        2
  1608 | The Cat in the Hat          |        2
   190 | Little Women                |        1
  1501 | Goodnight Moon              |        1
   156 | The Tell-Tale Heart         |        2
  1590 | Bartholomew and the Oobleck |        1
(12 rows)
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
* Find all books that are listed in the stock table
	* Sort them by retail price (most expensive first)
	* Display ONLY: title and price
* Find the book "Dune" and display ONLY the following columns
	* Book title
	* ISBN number
	* Publisher name
	* Retail price
* Find all shipments sorted by ship date display a result table with ONLY the following columns:
	* Customer first name
	* Customer last name
	* ship date
	* book title

### Grouping and Counting

* Get the COUNT of all books
* Get the COUNT of all Locations
* Get the COUNT of each unique location in the subjects table. Display the count and the location name. (hint: requires GROUP BY).
* List all books. Display the book_id, title, and a count of how many editions each book has. (hint: requires GROUP BY and JOIN)

#### YAY! You're done!!

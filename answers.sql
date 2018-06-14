### Order
* Find all subjects sorted by subject
booktown=# select subject from subjects order by subject asc;

* Find all subjects sorted by location
booktown=# select subject from subjects order by location asc;

### Where
* Find the book "Little Women"
booktown=# select*from books where title='Little Women';

* Find all books containing the word "Python"
booktown=# select*from books where title like '%Pyth%';

* Find all subjects with the location "Main St" sort them by subject

booktown=# select*from subjects where location='Main St' order by subject;

### Joins

* Find all books about Computers and list ONLY the book titles
booktown=# select book_backup.title from book_backup full outer join subjects on book_backup.subject_id=subjects.id where subjects.id='4';

* Find all books and display a result table with ONLY the following columns
	* Book title
	* Author's first name
	* Author's last name
	* Book subject
booktown=# select book_backup.title, book_backup.subject_id, authors.first_name, authors.last_name from book_backup inner join authors on book_backup.author_id=authors.id;

* Find all books that are listed in the stock table
	* Sort them by retail price (most expensive first)
	* Display ONLY: title and price

booktown=# select title, retail from books join editions on books.id=editions.book_id join stock on editions.isbn=stock.isbn order by retail desc;

* Find the book "Dune" and display ONLY the following columns
	* Book title
	* ISBN number
	* Publisher name
	* Retail price

booktown=#select title, editions.isbn, name, retail from books join editions on books.id=editions.book_id
  join publishers on editions.publisher_id=publishers.id join stock on editions.isbn=stock.isbn where title like '%Dune%';


* Find all shipments sorted by ship date display a result table with ONLY the following columns:
	* Customer first name
	* Customer last name
	* ship date
	* book title

select customers.first_name, customers.last_name, shipments.ship_date, books.title from shipments join customers on customers.id=shipments.customer_id
join editions on editions.isbn = shipments.isbn join books on books.id = editions.book_id order by shipments.ship_date;

### Grouping and Counting

* Get the COUNT of all books
booktown=# select count(*) from books;

* Get the COUNT of all Locations
booktown=# select count(location) from subjects;

* Get the COUNT of each unique location in the subjects table. Display the count and the location name. (hint: requires GROUP BY).
booktown=# select count(location), location from subjects group by location;

* List all books. Display the book_id, title, and a count of how many editions each book has. (hint: requires GROUP BY and JOIN)

booktown=# select books.id, books.title, count(edition) from books join editions on books.id=editions.book_id group by books.id;

#### YAY! You're done!!

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
booktown=# SELECT * FROM subjects ORDER BY subjects;
2. Find all subjects sorted by location
booktown=# SELECT * FROM subjects ORDER BY subjects.location;


##Where
1. Find the book "Little Women"
booktown=# SELECT title, id, author_id FROM books WHERE title='Little Women'; 
2. Find all books containing the word "Python"
booktown=# SELECT * FROM books WHERE title LIKE '%Python%';
3. Find all subjects with the location "Main St" sort them by subject
booktown=# SELECT * FROM subjects WHERE location='Main St' ORDER BY subject;


##Joins

* Find all books about Computers list ONLY book title
booktown=# SELECT books.title FROM books
booktown-# JOIN subjects
booktown-# ON books.subject_id = subject.id
booktown-# WHERE subjects.subject = 'Computers';


* Find all books and display ONLY
	* Book title
	* Author's first name
	* Author's last name
	* Book subject
SELECT title, first_name, last_name,subject FROM books a
JOIN authors b
ON a.author_id = b.id
JOIN subjects c
ON c.id = a.subject_id;

* Find all books that are listed in the stock table
	* Sort them by retail price (most expensive first)
	* Display ONLY: title and price
SELECT title, retail FROM books a 
JOIN editions b
ON a.id = b.book_id
JOIN stock c
ON c.isbn = b.isbn
ORDER BY retail DESC;

* Find the book "Dune" and display ONLY
	* Book title
	* ISBN number
	* Publisher name
	* Retail price
SELECT books.title, editions.isbn, publishers.name, stock.retail FROM books 
JOIN editions
ON books.id = editions.book_id
JOIN publishers
ON publishers.id = editions.publisher_id
JOIN stock
ON stock.isbn = editions.isbn
WHERE title='Dune';

* Find all shipments sorted by ship date display ONLY:
	* Customer first name
	* Customer last name
	* ship date
	* book title
SELECT first_name, last_name, ship_date, title FROM shipments 
JOIN customers
ON customers.id = shipments.customer_id
JOIN editions
ON editions.isbn = shipments.isbn
JOIN books
ON books.id = editions.book_id
ORDER BY ship_date;

##Grouping and Counting

1. Get the COUNT of all books
* Get the COUNT of all Locations
* Get the COUNT of each unique location in the subjects table. Display the count and the location name. (hint: requires GROUP BY).
* List all books. Display the book_id, title, and a count of how many editions each book has. (hint: requires GROUP BY and JOIN)

SELECT COUNT(*) FROM books;

SELECT COUNT(*) FROM subjects
GROUP BY subjects.location;

SELECT COUNT(*), location FROM subjects
GROUP BY subjects.location;

SELECT id, title, COUNT(edition) FROM books
JOIN editions
ON editions.book_id = books.id
GROUP BY id, title;




####YAY! You're done!!

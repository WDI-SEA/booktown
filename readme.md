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
2. Find all subjects sorted by location

##Where
1. Find the book "Little Women"
2. Find all books containing the word "Python"
3. Find all subjects with the location "Main St" sort them by subject


##Joins

* Find all books about Computers list ONLY book title

* Find all books and display ONLY
	* Book title
	* Author's first name
	* Author's last name
	* Book subject

* Find all books that are listed in the stock table
	* Sort them by retail price (most expensive first)
	* Display ONLY: title and price

* Find the book "Dune" and display ONLY
	* Book title
	* ISBN number
	* Publisher name
	* Retail price

* Find all shipments sorted by ship date display ONLY:
	* Customer first name
	* Customer last name
	* ship date
	* book title

##Grouping and Counting

1. Get the COUNT of all books
* Get the COUNT of all Locations
* Get the COUNT of each unique location in the subjects table. Display the count and the location name. (hint: requires GROUP BY).
* List all books. Display the book_id, title, and a count of how many editions each book has. (hint: requires GROUP BY and JOIN)



####YAY! You're done!!

ANSWERS:

#Order:
1. SELECT * FROM subjects ORDER BY subject ASC;

2. SELECT * FROM subjects ORDER BY location ASC;

#Where:
1. SELECT * FROM books WHERE title = 'Little Women';

2. SELECT * FROM books WHERE title LIKE '%Python%';

3. SELECT * FROM subjects WHERE location = 'Main St' ORDER by
	subject ASC;

#Joins: 
1.	SELECT title FROM books b
	JOIN subjects s
	ON b.subject_id = s.id
	WHERE b.subject_id = 4;

2.	SELECT title, first_name, last_name, subject
	FROM authors JOIN books ON authors.id = books.author_id JOIN subjects ON books.subject_id = subjects.id
	WHERE title NOTNULL;

3.	SELECT title, retail
	FROM books JOIN editions ON books.id = editions.book_id JOIN stock ON editions.isbn = stock.isbn
	ORDER BY retail DESC;

4. 	SELECT title, editions.isbn, name, retail
	FROM books JOIN editions ON books.id = editions.book_id JOIN publishers ON editions.publisher_id = publishers.id JOIN stock ON editions.isbn = stock.isbn
	WHERE title = 'Dune';

5.	SELECT first_name, last_name, ship_date, title
	FROM books JOIN editions ON books.id = editions.book_id JOIN shipments ON editions.isbn = shipments.isbn JOIN customers ON shipments.customer_id = customers.id;

#Counts:
1. SELECT COUNT(*) FROM books;

2. SELECT COUNT(location) FROM subjects;

3.  SELECT location, COUNT(location) FROM subjects
	GROUP BY location;

4.	SELECT books.id, books.title, count(editions.edition)
	FROM books JOIN editions ON books.id = editions.book_id
	GROUP BY books.id;
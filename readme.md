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
> SELECT * FROM subjects ORDER BY subject ASC;

2. Find all subjects sorted by location
> SELECT * FROM subjects ORDER BY location ASC;

##Where
1. Find the book "Little Women"
> SELECT * FROM books WHERE name = 'Little Women';

2. Find all books containing the word "Python"
> SELECT * FROM books WHERE name LIKE '%Python%';

3. Find all subjects with the location "Main St" sort them by subject
> SELECT * FROM subjects WHERE location = 'Main St' ORDER BY subject ASC;

##Joins

* Find all books about Computers list ONLY book title
> SELECT * FROM books b JOIN subjects s ON b.subject_id = s.id WHERE s.subject = 'Computers';

* Find all books and display ONLY
	* Book title
	* Author's first name
	* Author's last name
	* Book subject

> SELECT b.title, a.first_name, a.last_name, s.subject FROM books b
> JOIN authors a 
> ON b.author_id = a.id
> JOIN subjects s
> ON b.subject_id = s.id;

* Find all books that are listed in the stock table
	* Sort them by retail price (most expensive first)
	* Display ONLY: title and price
	
> SELECT b.title, s.retail FROM books b
> JOIN editions e 
> ON b.id = e.book_id
> JOIN stock s
> ON e.isbn = s.isbn
> ORDER BY retail DESC;

* Find the book "Dune" and display ONLY
	* Book title
	* ISBN number
	* Publisher name
	* Retail price

> SELECT b.title, e.isbn, p.name, s.retail FROM books b
> JOIN editions e
> ON b.id = e.book_id
> JOIN publishers p
> ON e.publisher_id = p.id
> JOIN stock s
> ON e.isbn = s.isbn
> WHERE b.title = 'Dune';

* Find all shipments sorted by ship date display ONLY:
	* Customer first name
	* Customer last name
	* ship date
	* book title

> SELECT c.first_name, c.last_name, s.ship_date, b.title FROM books b
> JOIN editions e
> ON b.id = e.book_id
> JOIN shipments s
> ON e.isbn = s.isbn
> JOIN customers c
> ON s.customer_id = c.id
> ORDER BY s.ship_date ASC;

##Grouping and Counting

1. Get the COUNT of all books
> SELECT COUNT(*) FROM books;

* Get the COUNT of all Locations
> SELECT COUNT(location) FROM locations;

* Get the COUNT of each unique location in the subjects table. Display the count and the location name. (hint: requires GROUP BY).
> SELECT location, COUNT(location) FROM subjects GROUP BY location;

* List all books. Display the book_id, title, and a count of how many editions each book has. (hint: requires GROUP BY and JOIN)
> SELECT b.title, b.id, COUNT(e.edition) FROM books b
> JOIN editions e 
> ON b.id = e.book_id  
> GROUP BY b.title, b.id;


####YAY! You're done!!

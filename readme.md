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

			SELECT * from subjects ORDER BY subjects.ID;

2. Find all subjects sorted by location

			SELECT * from subjects ORDER BY location;


##Where
1. Find the book "Little Women"
		
			SELECT title from books where title = 'Little Women';

2. Find all books containing the word "Python"
		
			SELECT title from books where title LIKE '%Python%';

3. Find all subjects with the location "Main St" sort them by subject

			SELECT subject from subjects where location = 'Main St' order by subjects.id;
			

##Joins

* Find all books about Computers list ONLY book title
			
			SELECT title FROM books a
			JOIN subjects b
			ON a.subject_id = b.id
			WHERE b.subject = 'Computers';

* Find all books and display ONLY
	* Book title
	* Author's first name
	* Author's last name
	* Book subject

			SELECT a.title, b.first_name, b.last_name, c.subject from books a
			JOIN authors b
			ON a.author_id = b.id
			JOIN subjects c
			ON a.subject_id = c.id;


* Find all books that are listed in the stock table
	* Sort them by retail price (most expensive first)
	* Display ONLY: title and price

			SELECT b.title, c.retail FROM editions a
			JOIN books b
			ON a.book_id = b.id
			JOIN stock c
			ON a.isbn = c.isbn
			ORDER BY retail ASC;

* Find the book "Dune" and display ONLY
	* Book title
	* ISBN number
	* Publisher name
	* Retail price

			SELECT b.title, a.isbn, c.name, d.retail FROM editions a
			JOIN books b
			ON a.book_id = b.id
			JOIN publishers c
			ON a.publisher_id = c.id
			JOIN stock d
			ON a.isbn = d.isbn
			WHERE title = 'Dune';

* Find all shipments sorted by ship date display ONLY:
	* Customer first name
	* Customer last name
	* ship date
	* book title

			SELECT b.first_name, b.last_name, a.ship_date, d.title FROM shipments a
			JOIN customers b
			ON a.customer_id = b.id
			JOIN editions c
			ON a.isbn = c.isbn
			JOIN books d
			ON c.book_id = d.id
			ORDER BY ship_date DESC;


##Grouping and Counting

1. Get the COUNT of all books

			SELECT COUNT(*) FROM BOOKS;

* Get the COUNT of all Locations

			SELECT count(location) FROM subjects

* Get the COUNT of each unique location in the subjects table. Display the count and the location name. (hint: requires GROUP BY).

			SELECT count(location), location FROM subjects
			GROUP BY location;

* List all books. Display the book_id, title, and a count of how many editions each book has. (hint: requires GROUP BY and JOIN)

			SELECT a.id, a.title, count(b.edition) FROM books a
			JOIN editions b
			ON a.id = b.book_id
			GROUP BY a.id;



####YAY! You're done!!

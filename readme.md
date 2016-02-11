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

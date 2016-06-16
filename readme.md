#Booktown, USA

For each question below, find the approriate SQL query to obtain the information requested. Create a `.txt` or `.md` file that contains all of your answers.

##Getting Started

To get started we'll need to import the booktown.sql file.

1. Fork and clone this repository
2. `cd` into the repository
3. use the command `psql -f booktown.sql`
4. type `psql` to open your psql console
5. type \list to ensure the booktown database was successfully completed
6. type `\c booktown` to connect to the booktown database
7. type `\d` to see a list of all the tables in the booktown database
8. type `\d [TABLE_NAME]` to see information about columns and their types for a specific table. You should see output like below:

```
booktown=# \d books
       Table "public.books"
   Column   |  Type   | Modifiers 
------------+---------+-----------
 id         | integer | not null
 title      | text    | not null
 author_id  | integer | 
 subject_id | integer | 
Indexes:
    "books_id_pkey" PRIMARY KEY, btree (id)
    "books_title_idx" btree (title)
```

###Additionally...

Your life will be made easier with a GUI PostgreSQL client. We downloaded these during the installfest. Open up **Postico** if you have a Mac, or **pgAdmin** if you have Linux.

If you're missing the PostgreSQL client, download [Postico here](https://eggerapps.at/postico/) if you have a Mac, or [pgAdmin here](http://www.pgadmin.org/) if you have Linux.

1. Postico asks for a lot of information to begin with. The defaults are fine. Leave everything alone and just press connect.
2. If you don't see the booktown database after connecting you may need to move up a directory. Press the "localhost" under the back and forward buttons.
3. Double click on the `booktown` database to connect.
4. See the list of tables in the database (alternate_stock, authors, book_backup...)
5. Double click a table to see it's contents
6. Double click SQL Terminal to get to a text box where you can write and execute some queries.

![Postico new localhost connection](images/postico/00-postico-localhost-connection.jpg)
![Postico databases](images/postico/01-postico-databases.jpg)

## Queries

Complete the following exercises to practice using SQL.

###Order
1. Find all subjects sorted by subject
2. Find all subjects sorted by location

###Where
1. Find the book "Little Women"
2. Find all books containing the word "Python"
3. Find all subjects with the location "Main St" sort them by subject


###Joins

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

###Grouping and Counting

1. Get the COUNT of all books
* Get the COUNT of all Locations
* Get the COUNT of each unique location in the subjects table. Display the count and the location name. (hint: requires GROUP BY).
* List all books. Display the book_id, title, and a count of how many editions each book has. (hint: requires GROUP BY and JOIN)

####YAY! You're done!!

1.) `SELECT * FROM subjects ORDER BY subject ASC;`
2.) `SELECT * FROM subjects ORDER BY location ASC;`

1.) `select * from books WHERE title ILIKE 'Little Women';`
2.) `select * from books WHERE title ILIKE '%python%'; `
3.) `SELECT * FROM subjects WHERE location ILIKE 'Main St' ORDER BY subject ASC;`

JOINS

1.) `SELECT books.title FROM books INNER JOIN subjects ON subjects.id = books.subject_id WHERE subjects.subject ILIKE '%computer%';` 

2.) `SELECT books.title, authors.first_name, authors.last_name, subjects.subject FROM books INNER JOIN authors ON authors.id = books.author_id INNER JOIN subjects ON subjects.id = books.subject_id;`

3.) `SELECT books.title, stock.retail FROM STOCK INNER JOIN editions on stock.isbn = editions.isbn inner join books on books.id = editions.book_id order by stock.retail DESC;`

4.) `select books.title, editions.isbn, publishers.name, stock.retail FROM books INNER JOIN editions ON books.id = editions.book_id INNER JOIN publishers ON editions.publisher_id = publishers.id INNER JOIN stock ON stock.isbn = editions.isbn WHERE books.title = 'Dune';`

5.) `SELECT customers.first_name, customers.last_name, shipments.ship_date, books.title FROM shipments INNER JOIN customers ON customers.id = shipments.customer_id INNER JOIN editions ON editions.isbn = shipments.isbn INNER JOIN books ON editions.book_id = book_id;`

GROUPING

1.) `SELECT count(*) FROM books;`
2.) `SELECT count(location) FROM subjects;` 
3.) `SELECT location, count(location) FROM subjects GROUP BY location;`4.) `SELECT books.id, books.title, COUNT(editions.edition) FROM books INNER JOIN editions ON editions.book_id = books.id GROUP BY books.id;`

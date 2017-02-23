#Booktown, USA

##Getting Started
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


###Order
1. Find all subjects sorted by subject -- booktown=# SELECT subject FROM subjects ORDER BY subject;
2. Find all subjects sorted by location -- booktown=# SELECT subject FROM subjects ORDER BY location;

###Where
1. Find the book "Little Women" -- booktown=# SELECT * FROM books WHERE title = 'Little Women';
2. Find all books containing the word "Python" -- booktown=# SELECT * FROM books WHERE title LIKE '%Python';
3. Find all subjects with the location "Main St" sort them by subject -- booktown=# SELECT subject FROM subjects WHERE location = 'Main St' ORDER BY subject;


###Joins

* Find all books about Computers list ONLY book title -- booktown=# SELECT title FROM books INNER JOIN subjects ON books.subject_id=subjects.id WHERE subject = 'Computers';
* Find all books and display a result table with ONLY the following columns
	* Book title
	* Author's first name
	* Author's last name
	* Book subject
  -- booktown=# SELECT title, first_name, last_name, subject FROM books INNER JOIN authors ON books.author_id=authors.id INNER JOIN subjects ON books.subject_id=subjects.id;

* Find all books that are listed in the stock table
	* Sort them by retail price (most expensive first)
	* Display ONLY: title and price
  -- booktown=# SELECT title, cost FROM book_backup INNER JOIN editions ON book_backup.id=editions.book_id INNER JOIN stock ON stock.isbn=editions.isbn ORDER BY cost DESC;


* Find the book "Dune" and display ONLY the following columns
	* Book title
	* ISBN number
	* Publisher name
	* Retail price
  -- booktown=# SELECT title, editions.isbn, name, retail FROM books INNER JOIN editions ON books.id=editions.book_id INNER JOIN stock ON editions.isbn=stock.isbn INNER JOIN publishers ON editio
ns.publisher_id=publishers.id WHERE title = 'Dune';


* Find all shipments sorted by ship date display a result table with ONLY the following columns:
	* Customer first name
	* Customer last name
	* ship date
	* book title
  -- booktown=# SELECT customers.first_name, customers.last_name, ship_date, title FROM book_backup INNER JOIN editions ON book_backup.id=editions.book_id INNER JOIN shipments ON editions.isbn=shipments.isbn INNER
 JOIN customers ON shipments.customer_id=customers.id ORDER BY ship_date;

###Grouping and Counting

1. Get the COUNT of all books -- booktown=# SELECT COUNT(*) FROM book_backup;

* Get the COUNT of all Locations -- booktown=# SELECT COUNT(location) FROM subjects;

* Get the COUNT of each unique location in the subjects table. Display the count and the location name. (hint: requires GROUP BY). -- booktown=# SELECT COUNT(location), location FROM subjects GROUP BY location;

* List all books. Display the book_id, title, and a count of how many editions each book has. (hint: requires GROUP BY and JOIN) -- booktown=# SELECT book_id, title, COUNT(editions.edition) FROM book_backup INNER JOIN editions ON book_backup.id=editions.book_id GROUP BY book_id, title;


####YAY! You're done!!


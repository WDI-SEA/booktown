
### Where
* Find the book "Little Women"
	-> booktown=# select title from books;  

* Find all books containing the word "Python"
	-> select title from books where title like '%Python%';

* Find all subjects with the location "Main St" sort them by subject
	-> booktown=# select * from subjects where location like'Main%'; 

### Joins

* Find all books about Computers and list ONLY the book titles
	-> booktown=# select title from books inner join subjects on 			 
	books.subject_id=subjects.id where subject = 'Computers';

* Find all books and display a result table with ONLY the following columns
	* Book title
	* Author's first name
	* Author's last name
	* Book subject
	-> booktown=# SELECT books.title, authors.first_name, authors.last_name, subjects.subject 
        booktown-# FROM books
        booktown-# JOIN authors ON authors.id=books.author_id
        booktown-# JOIN subjects ON subjects.id=books.subject_id;

* Find all books that are listed in the stock table
	* Sort them by retail price (most expensive first)
	* Display ONLY: title and price
	-> booktown=# select books.title, stock.retail 
            from books join editions on books.id=editions.book_id 
            join stock on editions.isbn = stock.isbn order by stock.retail 
            desc;

* Find the book "Dune" and display ONLY the following columns
	* Book title
	* ISBN number
	* Publisher name
	* Retail price
	->  booktown=# select books.title, editions.isbn, publishers.name, stock.retail 
    from books join editions on editions.book_id = books.id JOIN publishers on publishers.id = editions.publisher_id join stock on editions.isbn = stock.isbn where title= 'Dune';

* Find all shipments sorted by ship date display a result table with ONLY the following columns:
	* Customer first name
	* Customer last name
	* ship date
	* book title
	-> select customers.first_name, customers.last_name, shipments.ship_date, books.title
    from customers join shipments on shipments.customer_id = customers.id 
    join editions on editions.isbn  = shipments.isbn join books on books.id = editions.book_id; 

### Grouping and Counting

* Get the COUNT of all books
    -> booktown=# SELECT COUNT(*) FROM books;

* Get the COUNT of all Locations
    -> booktown=# select count(*) subject_locations;

* Get the COUNT of each unique location in the subjects table. Display the count and the location name. (hint: requires GROUP BY).
    -> booktown=# select count(location),location from subjects group by location; 

* List all books. Display the book_id, title, 
    and a count of how many editions each book has. 
    (hint: requires GROUP BY and JOIN)

    -> select books.id, books.title, count(editions.edition)
        from books join editions on books.id = editions.book_id group by books.id; 

#### YAY! You're done!!


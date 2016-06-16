
###Queries

Complete the following exercises to practice using SQL.

###Order


I forgot to use table prefixes in some places--- I corrected what I could during the morning review.

1. Find all subjects sorted by subject
  
  ⋅⋅* select * from subjects order by subjects desc;
  ⋅⋅* above is wrong
  ⋅⋅* select * from subjects order by subject asc;
  ⋅⋅* correct answer

2. Find all subjects sorted by location

  ⋅⋅* select * from subjects order by location desc;

###Where

1. Find the book "Little Women"

  ⋅⋅* select title from books where title = 'Little Women';

2. Find all books containing the word "Python"

  ⋅⋅* select * from books where title ilike '%python%';

3. Find all subjects with the location "Main St" sort them by subject

  ⋅⋅* select * from subjects where location = 'Main St';
  ⋅⋅* above is wrong
  ⋅⋅* select * from subjects where localtion = 'Main St order by subject asc;

###Joins

* Find all books about Computers list ONLY book title

  ⋅⋅* select books.title from books inner join subjects on books.subject_id = subjects.id where subjects.subject ilike '%computers%';

* Find all books and display ONLY
  * Book title
  * Author's first name
  * Author's last name
  * Book subject

  ⋅⋅* select books.title, authors.first_name, authors.last_name, subjects.subject from books inner join authors on books.author_id = authors.id inner join subjects on books.subject_id = subjects.id;

* Find all books that are listed in the stock table
  * Sort them by retail price (most expensive first)
    Display ONLY: title and price

  ⋅⋅* select books.title, stock.retail from editions inner join stock on editions.isbn = editions.isbn inner join books on books.id = editions.book_id order by stock.retail desc;


* Find the book "Dune" and display ONLY
  * Book title
  * ISBN number
  * Publisher name
  * Retail price

  ⋅⋅* select books.title, publishers.name, stock.retail, editions.isbn from books inner join editions on books.id = editions.book_id inner join publishers on editions.publisher_id = publishers.id inner join stock on stock.isbn = editions.isbn where books.title = 'Dune';


* Find all shipments sorted by ship date display ONLY:
  * Customer first name
  * Customer last name
  * ship date
  * book title

  ⋅⋅* select books.title, shipments.ship_date, customers.first_name, customers.last_name from shipments left join customers on shipments.customer_id = customers.id left join editions on shipments.isbn = editions.isbn left join books on books.id = editions.book_id order by shipments.ship_date asc;
  
  
  ⋅⋅* select books.title, shipments.ship_date, customers.first_name, customers.last_name from shipments inner join customers on shipments.customer_id = customers.id inner join editions on shipments.isbn = editions.isbn inner join books on books.id = editions.book_id order by shipments.ship_date asc;
  ⋅⋅* answer from class

###Grouping and Counting

1. Get the COUNT of all books

  ⋅⋅* select count(books.title) from books;

* Get the COUNT of all Locations
 
  ⋅⋅* select count(distinct subjects.location) from subjects;

* Get the COUNT of each unique location in the subjects table. Display the count and the location name. (hint: requires GROUP BY).

  ⋅⋅* select subjects.location, count(subjects.location) from subjects group by subjects.location;
  ⋅⋅* incorrect, we have a blank row
  ⋅⋅* select subjects.location, count(subjects.location) from subjects group by subjects.location having count(subjects.location) > 0;

* List all books. Display the book_id, title, and a count of how many editions each book has. (hint: requires GROUP BY and JOIN)

  ⋅⋅* select books.title, count(editions.edition), books.id from books left join editions on editions.book_id = books.id group by books.id;

####YAY! You're done!!

Order

Find all subjects sorted by subject
  select * from subjects order by subject;

Find all subjects sorted by location
  select * from subjects order by location;

Where

Find the book "Little Women"
  select * from books where title='Little Women';

Find all books containing the word "Python"
  select * from books where title LIKE '%Python%';

Find all subjects with the location "Main St" sort them by subject

  select * from subjects where location='Main St' order by subject;

Joins

Find all books about Computers and list ONLY the book titles

  select title from books join subjects on books.subject_id = subjects.id where subjects.subject='Computers';

Find all books and display a result table with ONLY the following columns
Book title
Author's first name
Author's last name
Book subject

  select title, first_name, last_name, subject from books join authors on books.author_id = authors.id join subjects on books.subject_id = subjects.id;


Find all books that are listed in the stock table
Sort them by retail price (most expensive first)
Display ONLY: title and price

  select title, cost from books join editions on books.id = editions.book_id join stock on editions.isbn = stock.isbn order by cost;


Find the book "Dune" and display ONLY the following columns
Book title
ISBN number
Publisher name
Retail price

  select title, editions.isbn as ISBN_number, publishers.name AS publisher, cost from books join editions on books.id = editions.book_id join stock on editions.isbn = stock.isbn join publishers on editions.publisher_id = publishers.id where title='Dune';

Find all shipments sorted by ship date display a result table with ONLY the following columns:
Customer first name
Customer last name
ship date
book title

  select first_name, last_name, ship_date, title from customers join shipments on customers.id = shipments.customer_id join editions on shipments.isbn = editions.isbn join books on editions.book_id = books.id order by ship_date;


Grouping and Counting

Get the COUNT of all books

  select count(*) from books;

Get the COUNT of all Locations

  select count (distinct location) from subjects;

Get the COUNT of each unique location in the subjects table. Display the count and the location name. (hint: requires GROUP BY).

  select location, count (location) from subjects group by location;

List all books. Display the book_id, title, and a count of how many editions each book has. (hint: requires GROUP BY and JOIN)

  select book_id, title, count (edition) from books left join editions on books.id = editions.book_id group by title, book_id;

YAY! You're done!!

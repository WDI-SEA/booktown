Order
Find all subjects sorted by subject select * from subjects order by subject asc;
Find all subjects sorted by location select * from subjects order by location asc;
Where
Find the book "Little Women" select * from books where title ='Little Women';
Find all books containing the word "Python" select * from books where title like '%Python%';
Find all subjects with the location "Main St" sort them by subject select * from subjects where location = 'Main St' order by subject asc;
Joins
Find all books about Computers list ONLY book title  select title from books a join subjects b on a.subject_id = b.id where subject = 'Computers';
Find all books and display ONLY   select b.title, c.first_name, c.last_name, a.subject from subjects a join books b on a.id = b.subject_id join authors c on b.author_id = c.id
Book Title
Author’s first name
Author's last name 
Book subject 
Find all books that are listed in the stock table 
select a.title, c.retail from books a join editions b on a.id = b.book_id join stock c on b.isbn = c.isbn order by c.retail desc;
Sort them by retail price (most expensive first)
Display ONLY: title and price
Find the book "Dune" and display ONLY 
select a.title, c.isbn, d.name, c.retail from books a  join editions b on a.id = b.book_id  join stock c on b.isbn = c.isbn  join publishers d on b.publisher_id = d.id  where a.title = 'Dune';
Book title
ISBN number
Publisher name
Retail price
Find all shipments sorted by ship date display ONLY:
Shipments, Customers, Editions, Books
select c.first_name, c.last_name, d.ship_date, b.title from editions a  join books b on a.book_id = b.id join shipments d on d.isbn = a.isbn join customers c on c.id = d.customer_id order by d.ship_date;
Customer first name
Customer last name
ship date
book title
Grouping and Counting
Get the COUNT of all books 	select COUNT(*) from books;
Get the COUNT of all Locations 	select count(location) from subjects;
Get the COUNT of each unique location in the subjects table. Display the count and the location name. (hint: requires GROUP BY). 
select distinct (location), count(location) from subjects group by location;
List all books. Display the book_id, title, and a count of how many editions each book has. (hint: requires GROUP BY and JOIN) 
Need: Books, Editions
select b.book_id, a.title, count(b.book_id) from books a join editions b on a.id=b.book_id group by b.book_id, a.title
YAY! You're done!!
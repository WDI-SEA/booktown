-- ### Order
-- 1. Find all subjects sorted by subject
select books.subject_id from books order by subject_id desc;

-- 2. Find all subjects sorted by location

select book.subject_id from books order by location;


-- ### Where
-- 3. Find the book "Little Women"
select title from books where title = 'Little Women';
-- 4. Find all books containing the word "Python"
select 'Python' from books;
-- 5. Find all subjects with the location "Main St" sort them by subject
select subject from subjects where location = 'Main St' order by subject;

-- ### Joins

-- 6. Find all books about Computers and list ONLY the book titles
select title from books where books.subject_id = 4;
-- 7. Find all books and display a result table with ONLY the following columns
-- 	* Book title
-- 	* Author's first name
-- 	* Author's last name
-- 	* Book subject
 select title, first_name, last_name, subject from books, authors, subjects;
-- 8. Find all books that are listed in the stock table
-- 	* Sort them by retail price (most expensive first)
-- 	* Display ONLY: title and price
create table eight as select editions.isbn, editions.book_id, books.title, books.id, stock.retail from editions, books, stock where editions.book_id = books.id;
select title, retail from eight order by retail desc;
-- 9. Find the book "Dune" and display ONLY the following columns
-- 	* Book title
-- 	* ISBN number
-- 	* Publisher name
-- 	* Retail price
create table nine as select books.title, editions.isbn, publishers.name, stock.retail from books, editions, publishers, stock;
select * from nine where title = 'Dune';
-- 10. Find all shipments sorted by ship date display a result table with ONLY the following columns:
-- 	* Customer first name
-- 	* Customer last name
-- 	* ship date
-- 	* book title
create table ten as select editions.book_id, books.title, books.id, shipments.ship_date, shipments.customer_id, customers.last_name, customers.first_name from editions, books, shipments, customers where editions.book_id = books.id and customers.id = shipments.customer_id;
select * from ten order by ship_date;

-- ### Grouping and Counting

-- 11. Get the COUNT of all books
select count(books.title) as NumberOfBooks from books;
-- 12. Get the COUNT of all Locations
select count(subjects.location) as NumberOfLocations from subjects;
-- 13. Get the COUNT of each unique location in the subjects table. Display the count and the location name. (hint: requires GROUP BY).
select location, Count(*) as count from subjects group by location order by desc; 
-- 14. List all books. Display the book_id, title, and a count of how many editions each book has. (hint: requires GROUP BY and JOIN)
select * from books; 
create table fourteen as select editions.book_id, books.title, editions.edition from editions, books;
select book_id, title from fourteen, count(*) as count from fourteen group by edition order by count desc;

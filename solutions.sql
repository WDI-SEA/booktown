-- ### Order
-- 1. Find all subjects sorted by subject
select subject from subjects order by subject;
-- -- 2. Find all subjects sorted by location
select subject from subjects order by location;
-- ### Where
-- 3. Find the book "Little Women"
select title from books where title = 'Little Women';
-- 4. Find all books containing the word "Python"
select title from books where title like '%Python%';
-- 5. Find all subjects with the location "Main St" sort them by subject
select subject from subjects where location = 'Main St' order by subject;


-- ### Joins

-- 6. Find all books about Computers and list ONLY the book titles
select b.title from books b join subjects s on b.subject_id = s.id where s.subject = 'Computers';
-- 7. Find all books and display a result table with ONLY the following columns
-- 	* Book title
-- 	* Author's first name
-- 	* Author's last name
-- 	* Book subject
select b.title, a.first_name, a.last_name, s.subject from books b join authors a on b.author_id = a.id
join subjects s on b.subject_id = s.id;
-- 8. Find all books that are listed in the stock table
-- 	* Sort them by retail price (most expensive first)
-- 	* Display ONLY: title and price
select b.title, s.retail from books b join editions e on b.id = e.book_id Join
stock s on e.isbn = s.isbn order by s.retail Desc;
-- 9. Find the book "Dune" and display ONLY the following columns
-- 	* Book title
-- 	* ISBN number
-- 	* Publisher name
-- 	* Retail price
select b.title, e.isbn, p.name, s.retail from books b join editions e on b.id = e.book_id join
stock s on e.isbn = s.isbn join publishers p on p.id = e.publisher_id where b.title = 'Dune';


-- 10. Find all shipments sorted by ship date display a result table with ONLY the following columns:
-- 	* Customer first name
-- 	* Customer last name
-- 	* ship date
-- 	* book title
select c.first_name, c.last_name, s.ship_date, b.title from customers c join shipments s on c.id = s.customer_id
join editions e on s.isbn = e.isbn join books b on e.book_id = b.id order by s.ship_date;

-- ### Grouping and Counting

-- 11. Get the COUNT of all books
select count(*) from books;
-- 12. Get the COUNT of all Locations
select count(distinct location) from subjects;
-- 13. Get the COUNT of each unique location in the subjects table. Display the count and the location name. (hint: requires GROUP BY).
select count(location), location from subjects group by location offset 1;
-- 14. List all books. Display the book_id, title, and a count of how many editions each book has. (hint: requires GROUP BY and JOIN)
select b.id, b.title, max(e.edition) from books b join editions e on b.id = e.book_id group by b.id;

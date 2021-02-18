
-- ### Order
-- 

-- 1. Find all subjects sorted by subject
-- booktown=# SELECT * FROM subjects;
--  id |     subject      |     location
----+------------------+------------------
--   0 | Arts             | Creativity St
--   1 | Business         | Productivity Ave
--   2 | Children's Books | Kids Ct
--   3 | Classics         | Academic Rd
--   4 | Computers        | Productivity Ave
--   5 | Cooking          | Creativity St
--   6 | Drama            | Main St
--   7 | Entertainment    | Main St
--   8 | History          | Acadenamemic Rd
--   9 | Horror           | Black Raven Dr
--  10 | Mystery          | Black Raven Dr
--  11 | Poetry           | Sunset Dr
--  12 | Religion         |
--  13 | Romance          | Main St
--  14 | Science          | Productivity Ave
--  15 | Science Fiction  | Main St
-- (16 rows)


-- ### Where
-- 3. Find the book "Little Women"
-- booktown=# SELECT title FROM books WHERE id = 190;
--     title     
-- --------------
--  Little Women
-- (1 row)



-- 4. Find all books containing the word "Python"

-- 5. Find all subjects with the location "Main St" sort them by subject


-- ### Joins

-- 6. Find all books about Computers and list ONLY the book titles
SELECT * FROM books WHERE subject = computers;


-- 7. Find all books and display a result table with ONLY the following columns
-- 	* Book title
-- 	* Author's first name
-- 	* Author's last name
-- 	* Book subject
-- 8. Find all books that are listed in the stock table

select b.title, s.retail
from books b
join editions e on b.id = e.book_id
join stock s on s.isbn = e.isbn
order by retail desc;
-- 	* Sort them by retail price (most expensive first)
-- 	* Display ONLY: title and price
-- 9. Find the book "Dune" and display ONLY the following columns
SELECT books.title, editions.isbn, publishers.name, stock.retail
from editions
join books on editions.book_id = b.id
join s on s.isbn =editions.isbn
join publishers on edition.publisher_id = publishers.id
where book.title = 'Dune';
-- 	* Book title
-- 	* ISBN number
-- 	* Publisher name
-- 	* Retail price
-- 10. Find all shipments sorted by ship date display a result table with ONLY the following columns:
select customers.first_name, customers.last_name, shipments.ship_date, books.title
from shipments
join customers on customers.id = shipments.customers.id
join editions on shipments.isbn = editions.isbn
join books on books.id = editions.book_id
order by orders.

-- 	* Customer first name
-- 	* Customer last name
-- 	* ship date
-- 	* book title


-- ### Grouping and Counting

-- 11. Get the COUNT of all books
SELECT count(*) from books;

-- 12. Get the COUNT of all Locations
select count(*) from subjects;

-- 13. Get the COUNT of each unique location in the subjects table. Display the count and the location name. (hint: requires GROUP BY).
select location, count(liocation) from subjects group by location;


-- 14. List all books. Display the book_id, title, and a count of how many editions each book has. (hint: requires GROUP BY and JOIN)
SELECT editions.book_id, books.title, count(edeitions.book_id) as editions
from books
join editions on books.id = edition.book_id
group by edition.book_id, books.title;
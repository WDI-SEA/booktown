-- ### Order
-- 1. Find all subjects sorted by subject

booktown=# select subject from subjects;
     subject      
 Arts
 Business
 Children's Books
 Classics
 Computers
 Cooking
 Drama
 Entertainment
 History
 Horror
 Mystery
 Poetry
 Religion
 Romance
 Science
 Science Fiction
(16 rows)


-- 2. Find all subjects sorted by location

booktown=# select *  from subjects order by location;
 id |     subject      |     location     
----+------------------+------------------
  8 | History          | Academic Rd
  3 | Classics         | Academic Rd
 10 | Mystery          | Black Raven Dr
  9 | Horror           | Black Raven Dr
  0 | Arts             | Creativity St
  5 | Cooking          | Creativity St
  2 | Children's Books | Kids Ct
  7 | Entertainment    | Main St
  6 | Drama            | Main St
 13 | Romance          | Main St
 15 | Science Fiction  | Main St
 14 | Science          | Productivity Ave
  4 | Computers        | Productivity Ave
  1 | Business         | Productivity Ave
 11 | Poetry           | Sunset Dr
 12 | Religion         | 

-- ### Where
-- 3. Find the book "Little Women"
booktown=# select * from books
booktown-# where title = 'Little Women';
 id  |    title     | author_id | subject_id 
-----+--------------+-----------+------------
 190 | Little Women |        16 |          6
(1 row)
-- 4. Find all books containing the word "Python"
booktown=# select * from books where title like '%Python%';
  id   |       title        | author_id | subject_id 
-------+--------------------+-----------+------------
 41473 | Programming Python |      7805 |          4
 41477 | Learning Python    |      7805 |          4
(2 rows)
-- 5. Find all subjects with the location "Main St" sort them by subject
booktown=# select * from subjects WHERE location = 'Main St' order by subject;

-- ### Joins

-- 6. Find all books about Computers and list ONLY the book titles
booktown=# select title from books  JOIN subjects ON books.subject_id = subjects.id
booktown-# where books.subject_id = 4;
-- 7. Find all books and display a result table with ONLY the following columns
-- 	* Book title
-- 	* Author's first name
-- 	* Author's last name
-- 	* Book subject
booktown=# select books.title, authors.last_name, authors.first_name, subjects.subject from books     
inner join subjects ON books.subject_id = subjects.id
inner join authors ON books.author_id = authors.id;
-- 8. Find all books that are listed in the stock table
-- 	* Sort them by retail price (most expensive first)
-- 	* Display ONLY: title and price

-- 9. Find the book "Dune" and display ONLY the following columns
-- 	* Book title
-- 	* ISBN number
-- 	* Publisher name
-- 	* Retail price
booktown=# select stock.retail, books.title from books                                
INNER JOIN editions ON books.id = editions.book_id 
INNER JOIN stock ON editions.isbn = stock.isbn order by retail DESC;
-- 10. Find all shipments sorted by ship date display a result table with ONLY the following columns:
-- 	* Customer first name
-- 	* Customer last name  customers
-- 	* ship date   shipments
-- 	* book title  shipments isbn eidtions isbn, id books id
booktown=# select customers.first_name, customers.last_name, shipments.ship_date, books.title from books                                                                    
INNER JOIN editions ON books.id = editions.book_id                                    
INNER JOIN shipments ON editions.isbn = shipments.isbn                                
INNER JOIN customers ON shipments.customer_id = customers.id                          
;

-- ### Grouping and Counting

-- 11. Get the COUNT of all books
booktown=# select count(*) from books;
-- 12. Get the COUNT of all Locations
booktown=# select count(location) from subjects;
-- 13. Get the COUNT of each unique location in the subjects table. Display the count and the location name. (hint: requires GROUP BY).
booktown=# select distinct location, count(distinct location) from subjects group by location;
-- 14. List all books. Display the book_id, title, and a count of how many editions each book has. (hint: requires GROUP BY and JOIN)
booktown=# select books.title, editions.book_id, count(distinct editions.edition) from books                                                                               
INNER JOIN editions ON books.id = editions.book_id                                    
group by books.title, editions.book_id;
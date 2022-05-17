-- ### Order
-- 1. Find all subjects sorted by subject
    booktown=# select * from subjects;
-- 2. Find all subjects sorted by location
    select location from subjects;
-- ### Where
-- 3. Find the book "Little Women"
   select * from books where title = 'Little Women';
-- 4. Find all books containing the word "Python"
select * from books where title like '%Python';
-- 5. Find all subjects with the location "Main St" sort them by subject
select subject  from subjects where location = 'Main St' order by subject;





-- ### Joins

-- 6. Find all books about Computers and list ONLY the book titles
select (title)  from books where books.subject_id = 4;
-- 7. Find all books and display a result table with ONLY the following columns
booktown=# select b.title, a.first_name, a.last_name, s.subject
booktown-# from books b
booktown-# join authors a
booktown-# on b.author_id = a.id
booktown-# join subjects s
booktown-# on b.subject_id = s.id;
-- 	* Book title
-- 	* Author's first name
-- 	* Author's last name
-- 	* Book subject
-- 8. Find all books that are listed in the stock table
-- 	* Sort them by retail price (most expensive first)
-- 	* Display ONLY: title and price
-- 9. Find the book "Dune" and display ONLY the following columns
-- 	* Book title
-- 	* ISBN number
-- 	* Publisher name
-- 	* Retail price
-- 10. Find all shipments sorted by ship date display a result table with ONLY the following columns:
-- 	* Customer first name
-- 	* Customer last name
-- 	* ship date
-- 	* book title

-- ### Grouping and Counting

-- 11. Get the COUNT of all books
select count(*) from books;
-- 12. Get xthe COUNT of all Locations
select count(location) from subjects;
-- 13. Get the COUNT of each unique location in the subjects table. Display the count and the location name. (hint: requires GROUP BY).
-- 14. List all books. Display the book_id, title, and a count of how many editions each book has. (hint: requires GROUP BY and JOIN)

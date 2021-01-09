                     List of relations
 Schema |         Name          |   Type   |     Owner     
--------+-----------------------+----------+---------------
 public | alternate_stock       | table    | whitneykoslik
 public | authors               | table    | whitneykoslik
 public | book_backup           | table    | whitneykoslik
 public | book_ids              | sequence | whitneykoslik
 public | book_queue            | table    | whitneykoslik
 public | books                 | table    | whitneykoslik
 public | customers             | table    | whitneykoslik
 public | daily_inventory       | table    | whitneykoslik
 public | distinguished_authors | table    | whitneykoslik
 public | editions              | table    | whitneykoslik
 public | employees             | table    | whitneykoslik
 public | favorite_authors      | table    | whitneykoslik
 public | favorite_books        | table    | whitneykoslik
 public | money_example         | table    | whitneykoslik
 public | my_list               | table    | whitneykoslik
 public | numeric_values        | table    | whitneykoslik
 public | publishers            | table    | whitneykoslik
 public | schedules             | table    | whitneykoslik
 public | shipments             | table    | whitneykoslik
 public | states                | table    | whitneykoslik
 public | stock                 | table    | whitneykoslik
 public | stock_backup          | table    | whitneykoslik
 public | subject_ids           | sequence | whitneykoslik
 public | subjects              | table    | whitneykoslik
 public | text_sorting          | table    | whitneykoslik


-- ### Order
-- 1. Find all subjects sorted by subject
    SELECT subject FROM subjects ORDER BY subject;

-- 2. Find all subjects sorted by location
    SELECT subject, location FROM subjects ORDER BY location;

-- ### Where
-- 3. Find the book "Little Women"
    SELECT * FROM books WHERE title = 'Little Women';
-- 4. Find all books containing the word "Python"
    SELECT * FROM books WHERE title LIKE '%Python%';
-- 5. Find all subjects with the location "Main St" sort them by subject
    SELECT subject, location FROM subjects WHERE location = 'Main St' ORDER BY subject;


-- ### Joins

-- 6. Find all books about Computers and list ONLY the book titles
    SELECT title FROM books FULL JOIN subjects ON books.subject_id = subjects.id WHERE subjects.subject = 'Computers';
-- 7. Find all books and display a result table with ONLY the following columns
-- 	* Book title
-- 	* Author's first name
-- 	* Author's last name
-- 	* Book subject
    SELECT b.title, a.first_name, a.last_name, s.subject FROM books b JOIN authors a ON b.author_id = a.id JOIN subjects S ON b.subject_id = s.id;
-- 8. Find all books that are listed in the stock table
-- 	* Sort them by retail price (most expensive first)
-- 	* Display ONLY: title and price
    SELECT b.title, s.retail FROM books b JOIN editions e ON b.id = e.book_id JOIN stock s ON e.isbn = s.isbn ORDER  BY s.retail DESC;
-- 9. Find the book "Dune" and display ONLY the following columns
-- 	* Book title
-- 	* ISBN number
-- 	* Publisher name
-- 	* Retail price
    SELECT b.title, e.isbn, p.name, s.retail FROM books b JOIN editions e ON b.id = e.book_id JOIN publishers p ON e.publisher_id = p.id JOIN stock s ON e.isbn = s.isbn WHERE b.title='Dune';
-- 10. Find all shipments sorted by ship date display a result table with ONLY the following columns:
-- 	* Customer first name --> customers id last_name first_name
-- 	* Customer last name
-- 	* ship date shipments --> id customer_id isbn ship_date
-- 	* book title --> books.title --> joined on editions ISBN
    SELECT c.first_name, c.last_name, s.ship_date, b.title FROM customers c JOIN shipments s ON c.id = s.customer_id JOIN editions e ON s.isbn = e.isbn JOIN books b ON e.book_id = b.id;


-- ### Grouping and Counting

-- 11. Get the COUNT of all books
    SELECT COUNT(*) FROM books; 
-- 12. Get the COUNT of all Locations
    SELECT COUNT(location) FROM subjects;
-- 13. Get the COUNT of each unique location in the subjects table. Display the count and the location name. (hint: requires GROUP BY).
    SELECT location, COUNT(location) FROM subjects GROUP BY location;
-- 14. List all books. Display the book_id, title, and a count of how many editions each book has. (hint: requires GROUP BY and JOIN)
    SELECT b.title, COUNT(e.book_id) FROM books b JOIN editions e ON b.id = e.book_id GROUP BY b.title;
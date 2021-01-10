-- ### Order
-- 1. Find all subjects sorted by subject

SELECT * FROM subjects ORDER BY subject;

-- 2. Find all subjects sorted by location

SELECT * FROM subjects ORDER BY location;

-- ### Where
-- 3. Find the book "Little Women"

SELECT * FROM books WHERE title='Little Women';

-- 4. Find all books containing the word "Python"

SELECT * FROM books WHERE title LIKE '%Python%';

-- 5. Find all subjects with the location "Main St" sort them by subject

SELECT * FROM subjects WHERE location LIKE '%Main ST%' ORDER BY subject;

-- ### Joins

-- 6. Find all books about Computers and list ONLY the book titles

SELECT books.title FROM books WHERE subject_id = '4';

-- 7. Find all books and display a result table with ONLY the following columns
-- 	* Book title
-- 	* Author's first name
-- 	* Author's last name
-- 	* Book subject

SELECT books.title, authors.first_name, authors.last_name, subjects.subject
FROM ((books
INNER JOIN authors ON books.author_id = authors.id)
INNER JOIN subjects ON books.subject_id = subjects.id);

-- 8. Find all books that are listed in the stock table
-- 	* Sort them by retail price (most expensive first)
-- 	* Display ONLY: title and price

SELECT books.title, stock.retail
FROM ((editions
INNER JOIN stock ON editions.isbn = stock.isbn)
INNER JOIN books ON editions.book_id = books.id)
ORDER BY stock.retail DESC;

-- 9. Find the book "Dune" and display ONLY the following columns
-- 	* Book title / from 'books'
-- 	* ISBN number / match 'books.id' with 'editions.book_id
-- 	* Publisher name / match 'editions.publisher_id' with 'publishers.id'
-- 	* Retail price

SELECT books.title, editions.isbn, publishers.name, stock.retail
FROM (((editions
INNER JOIN books ON editions.book_id = books.id)
INNER JOIN publishers ON editions.publisher_id = publishers.id)
INNER JOIN stock ON editions.isbn = stock.isbn)
WHERE books.title = 'Dune';

-- 10. Find all shipments sorted by ship date display a result table with ONLY the following columns:
-- 	* Customer first name
-- 	* Customer last name
-- 	* ship date
-- 	* book title

-- ### Grouping and Counting

-- 11. Get the COUNT of all books

SELECT COUNT(id) FROM books;

-- 12. Get the COUNT of all Locations

SELECT COUNT(location) FROM subjects;

-- 13. Get the COUNT of each unique location in the subjects table. Display the count and the location name. (hint: requires GROUP BY).

SELECT location, COUNT(location) FROM subjects GROUP BY location;

-- 14. List all books. Display the book_id, title, and a count of how many editions each book has. (hint: requires GROUP BY and JOIN)

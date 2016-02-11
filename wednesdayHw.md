## Order
* Find all subjects sorted by subject
	SELECT *
	FROM subjects
	ORDER by subjects asc; 

* Find all subjects sorted by location
	SELECT *
	FROM subjects
	ORDER by location asc; 

## Where
* Find the book "Little Women"
	SELECT *
	FROM books
	WHERE title = 'Little Women'; 

* Find all books containing the word "Python"
	SELECT *
	FROM books
	WHERE title like '%Python%'; 

* Find all subjects with the location "Main St" sort them by subject
	SELECT *
	FROM subjects
	WHERE location = 'Main St'
	ORDER by subject asc; 

## Joins
* Find all books about Computers list ONLY book title
	SELECT b.title
	FROM books b
	JOIN subjects s ON b.subject_id = s.id
	WHERE s.subject = 'Computers';

* Find all books and display ONLY
	* Book title   --> Books * author_id  * subject_id
	* Author's first name  --> Authors * id * first_name
	* Author's last name --> Authors  * id * last_name
	* Book subject  -->  Subjects * id
		SELECT b.title, a.first_name, a.last_name, s.subject
		FROM books b
		JOIN subjects s ON b.subject_id = s.id
		JOIN authors a ON b.author_id = a.id;

* Find all books that are listed in the stock table
	* Sort them by retail price (most expensive first)
	* Display ONLY: title and price
		SELECT b.title, s.retail
		FROM editions e
		JOIN books b ON e.book_id = b.id
		JOIN stock s ON e.isbn = s.isbn
		ORDER by s.retail desc;

* Find the book "Dune" and display ONLY
	* Book title
	* ISBN number
	* Publisher name
	* Retail price
		SELECT b.title, e.isbn, p.name, s.retail
		FROM editions e
		JOIN books b ON e.book_id = b.id
		JOIN stock s ON e.isbn = s.isbn
		JOIN publishers p ON e.publisher_id = p.id
		WHERE b.title = 'Dune';

* Find all shipments sorted by ship date display ONLY:
	* Customer first name
	* Customer last name
	* ship date
	* book title
		SELECT c.first_name, c.last_name, s.ship_date, b.title
		FROM editions e
		JOIN books b ON b.id = e.book_id
		JOIN shipments s ON s.isbn = e.isbn
		JOIN customers c ON c.id = s.customer_id
		ORDER by s.ship_date asc;


## Grouping and Counting
* Get the COUNT of all books
	SELECT
	COUNT(*)
	FROM books;

* Get the COUNT of all Locations
	SELECT
	COUNT(location)
	FROM subjects
	WHERE location not in ('Null');

* Get the COUNT of each unique location in the subjects table. Display the count and the location name. (hint: requires GROUP BY).
	SELECT location,
	COUNT(location)
	FROM subjects
	WHERE location not in ('Null')
	GROUP by location;

* List all books. Display the book_id, title, and a count of how many editions each book has. (hint: requires GROUP BY and JOIN).
	SELECT e.book_id, b.title,
	COUNT(edition)
	FROM books b
	JOIN editions e ON b.id = e.book_id
	GROUP by e.book_id, b.title;

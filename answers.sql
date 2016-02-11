Order:

1. SELECT * from subjects ORDER BY subject;
2. SELECT * from subjects ORDER BY location;

Where:

1. SELECT * from books WHERE title = ‘Little Women’;
2. SELECT * from books WHERE title like ‘%Python%’;


Join:

1. SELECT books.title
	 FROM books
	 join subjects ON subjects.id = books.subject_id
	 WHERE books.subject_id = 4;

2. SELECT books.title, authors.first_name, authors.last_name, subjects.subject
	 FROM books
	 JOIN subjects ON books.subject_id = subjects.id
   JOIN authors ON books.author_id = authors.id;

3. SELECT stock.retail, books.title
   FROM stock
	 JOIN editions ON stock.isbn = editions.isbn
	 JOIN books ON editions.book_id = books.id;

4. SELECT books.title, stock.isbn, publishers.name, stock.retail
	 FROM stock
	 JOIN editions ON stock.isbn = editions.isbn
	 JOIN publishers ON publishers.id = editions.publisher_id
	 JOIN books ON editions.book_id = books.id
	 WHERE books.title = 'Dune';

5. SELECT customers.first_name, customers.last_name, shipments.ship_date, books.title
	 FROM customers
	 JOIN shipments ON shipments.customer_id = customers.id
	 JOIN editions ON shipments.isbn = editions.isbn
	 JOIN books ON editions.book_id = books.id
	 ORDER BY shipments.ship_date; 
	

Grouping and Counting:

1. SELECT count(*) FROM books;
2. SELECT count(location) FROM subjects;
3. SELECT location, count(location) FROM subjects GROUP BY(location);
4. SELECT books.title, books.id, count(editions.edition)
	 FROM books
	 LEFT JOIN editions ON books.id = editions.book_id
	 GROUP BY books.id;
--ORDERS--
SELECT * FROM subjects ORDER BY subject;
SELECT * FROM subjects ORDER BY location;
--WHERE--
SELECT title FROM books WHERE title='Little Woman';
SELECT title FROM books WHERE title LIKE '%Python%';
SELECT location, subject FROM subjects WHERE location='Main St' ORDER BY subject;
--JOINS--
SELECT b.title  FROM books b INNER JOIN subjects s ON b.subject_id = s.id WHERE s.subject = 'Computers';
SELECT books.title, subjects.subject, authors.last_name, authors.first_name FROM books INNER JOIN subjects ON books.subject_id = subjects.id INNER JOIN authors ON books.author_id = authors.id;
SELECT books.title, stock.cost FROM books INNER JOIN editions ON books.id = editions.book_id INNER JOIN stock ON editions.isbn = stock.isbn;
SELECT books.title, editions.isbn, publishers.name, stock.retail FROM books INNER JOIN editions ON books.id = editions.book_id INNER JOIN publishers ON editions.publisher_id = publishers.id INNER JOIN stock ON editions.isbn = stock.isbn WHERE book.title = 'Dune';
SELECT customers.first_name, customers.last_name, shipments.ship_date, books.title FROM books INNER JOIN editions ON books.id = editions.book_id INNER JOIN shipments ON editions.isbn = shipments.isbn INNER JOIN customers ON shipments.customer_id = customers.id ORDER BY shipments.ship_date;
--GROUPING AND COUNTING--
SELECT COUNT(title) FROM books;
SELECT COUNT(location) FROM subjects;
SELECT location, COUNT(location) AS locations FROM subjects GROUP BY location;
SELECT books.id, books.title, COUNT(editions.edition) FROM books INNER JOIN editions ON books.id = editions.book_id GROUP BY books.id;

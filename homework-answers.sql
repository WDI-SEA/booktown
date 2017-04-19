--ORDER

SELECT subject FROM subjects ORDER BY subject;

SELECT subject FROM subjects ORDER BY location;

--WHERE

SELECT title FROM books WHERE title = 'Little Women';

SELECT title FROM books WHERE title LIKE '%Python%';

SELECT subject FROM subjects WHERE location = 'Main St' ORDER BY subject;

--JOINS

SELECT title FROM books, subjects WHERE subjects.subject = 'Computers' AND books.subject_id = subjects.id;

SELECT title, first_name, last_name, subject FROM books, authors, subjects WHERE author_id = authors.id AND subject_id = subjects.id;

SELECT title, retail FROM books, stock, editions WHERE stock.isbn = editions.isbn AND editions.book_id = books.id ORDER BY retail DESC;

SELECT books.title, editions.isbn, publishers.name, stock.retail FROM books, editions, stock, publishers WHERE books.title = 'Dune' AND books.id = editions.book_id AND editions.isbn = stock.isbn AND publishers.id = editions.publisher_id;

SELECT customers.first_name, customers.last_name, shipments.ship_date, books.title FROM customers, shipments, editions, books WHERE customers.id = shipments.customer_id AND shipments.isbn = editions.isbn AND editions.book_id = books.id ORDER BY ship_date;

-- GROUPING and COUNTING

SELECT COUNT(books.title) FROM books;

SELECT subjects.location, COUNT(subjects.location) FROM subjects GROUP BY subjects.location;

SELECT id, title, COUNT(edition) FROM books, editions WHERE id = book_id GROUP BY id;

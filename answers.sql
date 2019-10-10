-- ORDER: answer 1 
SELECT subject FROM subjects;

-- ORDER: answer 2
SELECT location FROM subjects;

-- WHERE: answer 1 
SELECT title FROM books WHERE title='Little Women';

-- WHERE: answer 2
SELECT title FROM books WHERE title LIKE '%Python%'

-- WHERE: answer 3 
SELECT subject, location FROM subjects WHERE location='Main St' ORDER BY subject DESC;

-- JOIN: answer 1 
SELECT books.title 
FROM books
INNER JOIN subjects 
ON books.subject_id=subjects.id 
WHERE subject='Computers';

-- JOIN: answer 2
SELECT books.title, authors.first_name, authors.last_name, subjects.subject
FROM books
INNER JOIN authors ON authors.id=books.author_id
INNER JOIN subjects ON subjects.id=books.subject_id;

--JOIN: answer 3 
SELECT books.title, stock.cost
FROM editions
INNER JOIN stock on editions.isbn=stock.isbn
INNER JOIN books on editions.book_id=books.id
ORDER BY stock.cost DESC;
;

-- JOIN: answer 4
SELECT books.title, publishers.name, stock.isbn, stock.cost
FROM editions
INNER JOIN publishers on editions.publisher_id=publishers.id
INNER JOIN books on editions.book_id=books.id
INNER JOIN stock on editions.isbn=stock.isbn
WHERE books.title='Dune'
;

-- JOIN: answer 5 
SELECT customers.last_name, customers.first_name, shipments.ship_date, books.title
FROM books
INNER JOIN editions on editions.book_id=books.id
INNER JOIN shipments on shipments.isbn=editions.isbn
INNER JOIN customers on customers.id=shipments.customer_id
;

-- GROUPING and COUNTING 
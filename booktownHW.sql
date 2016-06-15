SELECT subjects FROM subjects ORDER BY subject ASC;
SELECT subjects FROM subjects ORDER BY location ASC;
SELECT * FROM books WHERE title = 'Little Women';
SELECT * FROM books WHERE title LIKE '%Python';
SELECT * FROM subjects WHERE location = 'Main St';

SELECT title FROM subjects a
Join books b
ON a.id = b.subject_id WHERE subject = 'Computers';

SELECT first_name FROM books a
Join authors b
ON a.author_id = b.id;

SELECT last_name FROM books a
Join authors b
ON a.author_id = b.id;

SELECT subject FROM books a
Join subjects b
ON a.subject_id = b.id;

SELECT * FROM stock ORDER BY cost ASC;

SELECT title,retail FROM books b
JOIN editions e
ON b.id = e.book_id
JOIN stock s
ON e.isbn = s.isbn;

SELECT title FROM books WHERE title = 'Dune';

SELECT isbn FROM books a
JOIN editions b
ON a.id = b. book_id
WHERE title = 'Dune';

SELECT name FROM books a
JOIN editions b
ON a.id = b. book_id
join publishers c
ON c.id = publisher_id
WHERE title = 'Dune';

SELECT retail FROM books a
JOIN editions b
ON a.id = b. book_id
join publishers c
ON c.id = publisher_id
JOIN stock D
ON a.id = book_id
WHERE title = 'Dune';

SELECT ship_date from shipments ORDER BY shipments ASC;

SELECT first_name FROM customers a
JOIN shipments b
ON a.id = b.customer_id;

SELECT last_name FROM customers a
JOIN shipments b
ON a.id = b.customer_id;

SELECT title FROM customers a
JOIN shipments b
ON a.id = b.customer_id
JOIN editions c
ON c.isbn = b.isbn
JOIN books d
ON d.id = c.book_id;

SELECT COUNT(*) from books;

SELECT COUNT(*) FROM subjects;

SELECT location,COUNT(location) FROM subjects
GROUP BY location;





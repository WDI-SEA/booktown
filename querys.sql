-- ORDER
-- 1.
SELECT subject FROM subjects ORDER BY subject;
-- 2.
SELECT subject FROM subjects ORDER BY location;


-- WHERE
-- 1.
SELECT * FROM books WHERE title = 'Little Women';
-- 2.
SELECT * FROM books WHERE title LIKE '%Python%';
-- 3.
SELECT subject FROM subjects WHERE location = 'Main St' ORDER BY subject;


-- JOINS
-- 1.
SELECT title FROM books b JOIN subjects s ON b.subject_id = s.id 
WHERE subject = 'Computers';
-- 2.
SELECT title, first_name, last_name, subject FROM books b 
JOIN subjects s ON b.subject_id = s.id 
JOIN authors a ON b.author_id = a.id;
-- 3.
SELECT title, retail FROM books b
JOIN editions e ON b.id = e.book_id
JOIN stock s ON e.isbn = s.isbn
ORDER BY cost DESC;
-- 4.
SELECT title, e.isbn, name, retail FROM books b
JOIN editions e ON b.id = e.book_id
JOIN stock s ON e.isbn = s.isbn
JOIN publishers p ON e.publisher_id = p.id
WHERE title = 'Dune';
-- 5.
SELECT first_name, last_name, ship_date, title FROM shipments s
JOIN customers c ON s.customer_id = c.id
JOIN editions e on s.isbn = e.isbn
JOIN books b on e.book_id = b.id;

-- Grouping and Counting
-- 1.
SELECT COUNT(*) FROM books;
-- 2.
SELECT COUNT(location) FROM subjects;
-- 3.
SELECT location, COUNT(location) from subjects GROUP BY location;
-- 4.
SELECT book_id, title, COUNT(book_id) from editions e
JOIN books b ON e.book_id = b.id
GROUP BY book_id, title;


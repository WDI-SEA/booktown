Order: 
1. SELECT * FROM subjects ORDER BY subject;
2. SELECT * FROM subjects ORDER BY location;

WHERE
1. SELECT * FROM books WHERE title='Little Women';
2. SELECT * FROM books WHERE title LIKE '%Python%';
3. SELECT * FROM subjects WHERE location='Main St' ORDER BY subject;

Joins
1. SELECT title FROM subjects s
    JOIN books b
      ON s.id = b.subject_id
      WHERE b.subject_id='4';

2.SELECT title, first_name, last_name, subject FROM books b
  JOIN subjects s
    ON b.subject_id = s.id
  JOIN authors a
    ON b.author_id = a.id;

3. SELECT title, retail FROM books b
  JOIN editions e
    ON b.id = e.book_id
  JOIN stock s
    ON e.isbn = s.isbn
ORDER BY retail ASC; 

4. SELECT title, e.isbn, p.name, retail  FROM books b
  JOIN editions e
    ON b.id = e.book_id
  JOIN stock s
    ON e.isbn = s.isbn
  JOIN publishers p
    ON p.id = e.publisher_id
WHERE b.title = 'Dune';

5. SELECT first_name, last_name, ship_date, b.title FROM customers c
  JOIN  shipments sh
    ON c.id = sh.customer_id
  JOIN editions e
    ON sh.isbn = e.isbn
  JOIN books b
    ON b.id = e.book_id
  
  ORDER BY ship_date;

Grouping & Counting
1. SELECT COUNT(*) FROM books;
2. SELECT COUNT(*) FROM states;
3. SELECT COUNT(location), location FROM subjects
GROUP BY location;
4.SELECT b.id, title, COUNT(edition) FROM books b
JOIN editions e
ON e.book_id = b.id
GROUP BY b.id;

BONUS: Summed the stock
SELECT SUM(stock) FROM stock s
JOIN editions e
ON s.isbn = e.isbn
JOIN books b
ON e.book_id = b.id;

I appreciate the enthusiasm of "YAY! YOU'RE DONE!!" :)
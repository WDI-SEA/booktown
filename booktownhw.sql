booktown=# SELECT * FROM subjects ORDER BY subjects;

booktown=# SELECT * FROM subjects ORDER BY location;

booktown=# SELECT*FROM books WHERE title ='Little Women';

booktown=# SELECT * FROM books WHERE title LIKE '%Python%';

booktown=# SELECT * FROM subjects WHERE location = 'Main St';

booktown=# select title from books join subjects on books.subject_id = subjects.id where subject_id = 4;


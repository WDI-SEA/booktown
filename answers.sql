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


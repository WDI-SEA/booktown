Order:

1.
SELECT  
  *
  FROM subjects
    ORDER BY subject ASC

2.
SELECT  
  *
  FROM subjects
    ORDER BY location ASC

Where:

1.
SELECT  
  *
  FROM books
    WHERE title = 'Little Women'

2.
SELECT  
  *
  FROM books
    WHERE title LIKE '%Python%'

3.
SELECT  
  *
  FROM subjects
    WHERE location = 'Main St'
      ORDER BY subject ASC

Joins:
  • SELECT  
    *
    FROM books
      WHERE subject_id = 4
  • SELECT  
    *
    FROM books
    FULL JOIN subjects
      ON books.subject_id = books.id…………
    


Grouping and Counting:

1.
SELECT
  COUNT(*)
  FROM books

2.
SELECT 
  COUNT (location)
  FROM subjects

3.
SELECT 
  COUNT (DISTINCT location)
  FROM subjects

4.     ?



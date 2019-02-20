SELECT b.id, b.title, count(e.book_id) AS number_of_editions 
FROM editions e 
JOIN books b 
ON e.book_id = b.id 
GROUP BY(b.id, e.book_id);
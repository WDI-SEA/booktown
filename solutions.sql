-- ### Order
-- 1. Find all subjects sorted by subject
SELECT subject FROM subjects ORDER BY subject;

subject
------------------
Arts
Business
Children's Books
Classics
Computers
Cooking
Drama
Entertainment
History
Horror
Mystery
Poetry
Religion
Romance
Science
Science Fiction
(16 rows)


--- 2. Find all subjects sorted by location

SELECT subject FROM subjects ORDER BY location;
subject
------------------
History
Classics
Mystery
Horror
Arts
Cooking
Children's Books
Entertainment
Drama
Romance
Science Fiction
Science
Computers
Business
Poetry
Religion
(16 rows)

-- ### Where
-- 3. Find the book "Little Women"
SELECT * FROM books WHERE title='Little Women';
id  |    title     | author_id | subject_id
-----+--------------+-----------+------------
 190 | Little Women |        16 |          6
(1 row)

-- 4. Find all books containing the word "Python"
SELECT title FROM books WHERE title LIKE '%Python%';
id   |       title        | author_id | subject_id
-------+--------------------+-----------+------------
41473 | Programming Python |      7805 |          4
41477 | Learning Python    |      7805 |          4
(2 rows)
-- 5. Find all subjects with the location "Main St" sort them by subject
SELECT subject FROM subjects WHERE location='Main St' ORDER BY subject;
subject
-----------------
Drama
Entertainment
Romance
Science Fiction
(4 rows)

-- ### Joins

-- 6. Find all books about Computers and list ONLY the book titles
SELECT books.title FROM books INNER JOIN subjects ON books.subject_id=subjects.id WHERE subjects.subject='Computers';
title
----------------------
Practical PostgreSQL
Perl Cookbook
Learning Python
Programming Python
(4 rows)


-- 7. Find all books and display a result table with ONLY the following columns
-- 	* Book title
-- 	* Author's first name
-- 	* Author's last name
-- 	* Book subject
SELECT b.title, a.first_name, a.last_name, s.subject
FROM books b INNER JOIN authors a ON b.author_id=a.id
INNER JOIN subjects s ON b.subject_id=s.id;

title            |    first_name    |  last_name   |     subject
-----------------------------+------------------+--------------+------------------
Practical PostgreSQL        | John             | Worsley      | Computers
Franklin in the Dark        | Paulette         | Bourgeois    | Children's Books
The Velveteen Rabbit        | Margery Williams | Bianco       | Classics
Little Women                | Louisa May       | Alcott       | Drama
The Shining                 | Stephen          | King         | Horror
Dune                        | Frank            | Herbert      | Science Fiction
Dynamic Anatomy             | Burne            | Hogarth      | Arts
Goodnight Moon              | Margaret Wise    | Brown        | Children's Books
The Tell-Tale Heart         | Edgar Allen      | Poe          | Horror
Programming Python          | Mark             | Lutz         | Computers
Learning Python             | Mark             | Lutz         | Computers
Perl Cookbook               | Tom              | Christiansen | Computers
2001: A Space Odyssey       | Arthur C.        | Clarke       | Science Fiction
The Cat in the Hat          | Theodor Seuss    | Geisel       | Children's Books
Bartholomew and the Oobleck | Theodor Seuss    | Geisel       | Children's Books
(15 rows)


-- 8. Find all books that are listed in the stock table
-- 	* Sort them by retail price (most expensive first)
-- 	* Display ONLY: title and price
SELECT b.title, s.retail FROM stock s
INNER JOIN editions e ON s.isbn=e.isbn
INNER JOIN books b ON e.book_id=b.id
ORDER BY s.retail DESC;

title            | retail
-----------------------------+--------
2001: A Space Odyssey       |  46.95
Dune                        |  45.95
The Shining                 |  36.95
The Cat in the Hat          |  32.95
Goodnight Moon              |  28.95
The Shining                 |  28.95
Dynamic Anatomy             |  28.95
The Tell-Tale Heart         |  24.95
The Velveteen Rabbit        |  24.95
The Cat in the Hat          |  23.95
Franklin in the Dark        |  23.95
Little Women                |  23.95
2001: A Space Odyssey       |  22.95
The Tell-Tale Heart         |  21.95
Dune                        |  21.95
Bartholomew and the Oobleck |  16.95
(16 rows)



-- 9. Find the book "Dune" and display ONLY the following columns
-- 	* Book title
-- 	* ISBN number
-- 	* Publisher name
-- 	* Retail price
SELECT b.title, st.isbn, p.name ,st.retail FROM books b
INNER JOIN editions e ON e.book_id = b.id
INNER JOIN stock st ON st.isbn=e.isbn
INNER JOIN publishers p ON p.id=e.publisher_id
WHERE b.title='Dune';

 title |    isbn    |   name    | retail
-------+------------+-----------+--------
 Dune  | 0441172717 | Ace Books |  21.95
 Dune  | 044100590X | Ace Books |  45.95
(2 rows)


-- 10. Find all shipments sorted by ship date display a result table with ONLY the following columns:
-- 	* Customer first name
-- 	* Customer last name
-- 	* ship date
-- 	* book title

-- ### Grouping and Counting

-- 11. Get the COUNT of all books
-- 12. Get the COUNT of all Locations
-- 13. Get the COUNT of each unique location in the subjects table. Display the count and the location name. (hint: requires GROUP BY).
-- 14. List all books. Display the book_id, title, and a count of how many editions each book has. (hint: requires GROUP BY and JOIN)

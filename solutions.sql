-- ### Order
-- 1. Find all subjects sorted by subject
SELECT subject FROM subjects;
--  Arts
--  Business
-- Children's Books
-- Classics
-- Computers
-- Cooking
-- Drama
-- Entertainment
-- History
-- Horror
-- Mystery
-- Poetry
-- Religion
-- Romance
-- Science
-- Science Fiction
-- 2. Find all subjects sorted by location
SELECT location FROM subjects;
Academic Rd
Academic Rd
Black Raven Dr
Black Raven Dr
Creativity St
Creativity St
Kids Ct
Main St
Main St
Main St
Main St
Productivity Ave
Productivity Ave
Productivity Ave
Sunset Dr
-- ### Where
-- 3. Find the book "Little Women"
SELECT title FROM books;
Little Women
-- 4. Find all books containing the word "Python"
Programming Python
Learning Python
-- 5. Find all subjects with the location "Main St" sort them by subject
SELECT subjects WHERE location LIKE 'Main St' ORDER BY subject;
Drama           
Entertainment   
Romance         
Science Fiction 

-- ### Joins

-- 6. Find all books about Computers and list ONLY the book titles
SELECT subjects.id, books.title FROM books INNER JOIN subjects ON subjects.id = books.subject_id WHERE subjects.subject = 'Computers';
Practical PostgreSQL
Perl Cookbook
Learning Python
Programming Python
-- 7. Find all books and display a result table with ONLY the following columns
-- 	* Book title
-- 	* Author's first name
-- 	* Author's last name
-- 	* Book subject
SELECT b.title, a.first_name, a.last_name, s.subject FROM books b INNER JOIN authors a ON a.id = b.author_id INNER JOIN subjects s ON s.id = b.subject_id; 
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
-- 8. Find all books that are listed in the stock table
-- 	* Sort them by retail price (most expensive first)
-- 	* Display ONLY: title and price
SELECT b.title, s.retail FROM books b INNER JOIN editions e ON e.book_id = b.id INNER JOIN stock s ON s.isbn = e.isbn ORDER BY retail DESC;
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
-- 9. Find the book "Dune" and display ONLY the following columns
-- 	* Book title
-- 	* ISBN number
-- 	* Publisher name
-- 	* Retail price
SELECT b.title, e.isbn, p.name, s.retail FROM books b INNER JOIN editions e ON e.book_id = b.id INNER JOIN stock s ON s.isbn = e.isbn INNER JOIN publishers p ON e.publisher_id = p.id WHERE b.title = 'Dune';
Dune  | 0441172717 | Ace Books |  21.95
 Dune  | 044100590X | Ace Books |  45.95

-- 10. Find all shipments sorted by ship date display a result table with ONLY the following columns:
-- 	* Customer first name
-- 	* Customer last name
-- 	* ship date
-- 	* book title
SELECT c.first_name, c.last_name, s.ship_date, b.title FROM customers c INNER JOIN shipments s ON c.id = s.customer_id INNER JOIN editions e ON s.isbn = e.isbn INNER JOIN books b ON b.id = e.book_id ORDER BY ship_date DESC;
Annie      | Jackson   | 2001-09-22 22:58:56-05 | Bartholomew and the Oobleck
 Annie      | Jackson   | 2001-09-22 13:23:28-05 | Bartholomew and the Oobleck
 Annie      | Jackson   | 2001-09-14 19:42:22-05 | The Cat in the Hat
 Jenny      | King      | 2001-09-14 18:46:32-05 | The Cat in the Hat
 Shirley    | Gould     | 2001-08-15 16:02:01-05 | 2001: A Space Odyssey
 James      | Clark     | 2001-08-15 13:57:40-05 | Goodnight Moon
 Tammy      | Robinson  | 2001-08-14 15:49:00-05 | Franklin in the Dark
 Jenny      | King      | 2001-08-14 15:45:51-05 | The Shining
 Adam       | Holloway  | 2001-08-14 15:41:39-05 | The Tell-Tale Heart
 Chuck      | Brown     | 2001-08-14 12:36:41-05 | The Shining
 Trevor     | Young     | 2001-08-14 10:42:58-05 | Dune
 Tim        | Owens     | 2001-08-14 09:33:47-05 | Dynamic Anatomy
 Kathy      | Corner    | 2001-08-13 11:47:04-05 | The Cat in the Hat
 Julie      | Bollman   | 2001-08-13 11:42:10-05 | The Cat in the Hat
 Owen       | Becker    | 2001-08-12 15:39:22-05 | The Shining
 Jean       | Owens     | 2001-08-12 14:09:47-05 | Franklin in the Dark
 Kate       | Gerdes    | 2001-08-12 10:46:35-05 | Dune
 James      | Williams  | 2001-08-11 15:34:08-05 | The Cat in the Hat
 Richard    | Brown     | 2001-08-11 12:52:34-05 | Goodnight Moon
 Annie      | Jackson   | 2001-08-11 11:55:05-05 | Bartholomew and the Oobleck
 Eric       | Morrill   | 2001-08-10 15:47:52-05 | The Cat in the Hat
 Jean       | Black     | 2001-08-10 10:29:42-05 | The Tell-Tale Heart
 Rich       | Thomas    | 2001-08-10 09:29:52-05 | Franklin in the Dark
 Wendy      | Black     | 2001-08-09 11:30:46-05 | The Velveteen Rabbit
 Dave       | Olson     | 2001-08-09 09:30:07-05 | The Velveteen Rabbit
 Annie      | Jackson   | 2001-08-08 12:46:13-05 | Bartholomew and the Oobleck
 Ed         | Gould     | 2001-08-08 11:53:46-05 | The Shining
 Jonathan   | Anderson  | 2001-08-08 10:36:44-05 | The Shining
 Eric       | Morrill   | 2001-08-07 15:00:48-05 | Little Women
 Christine  | Holloway  | 2001-08-07 13:56:42-05 | 2001: A Space Odyssey
 Royce      | Morrill   | 2001-08-07 13:31:57-05 | The Tell-Tale Heart
 Annie      | Jackson   | 2001-08-07 12:58:36-05 | Bartholomew and the Oobleck
 Annie      | Jackson   | 2001-08-06 13:46:36-05 | Bartholomew and the Oobleck
 Chad       | Allen     | 2001-08-06 11:29:21-05 | The Cat in the Hat
 Laura      | Bennett   | 2001-08-06 09:49:44-05 | Goodnight Moon
 Owen       | Bollman   | 2001-08-05 11:34:04-05 | Little Women


-- ### Grouping and Counting

-- 11. Get the COUNT of all books
SELECT COUNT(*) FROM books;
15 books
-- 12. Get the COUNT of all Locations
SELECT COUNT(location) FROM subjects;
15 locations
-- 13. Get the COUNT of each unique location in the subjects table. Display the count and the location name. (hint: requires GROUP BY).
SELECT location, COUNT(location) FROM subjects GROUP BY location;
Sunset Dr        |     1
 Kids Ct          |     1
 Black Raven Dr   |     2
 Creativity St    |     2
 Academic Rd      |     2
 Main St          |     4
 Productivity Ave |     3
-- 14. List all books. Display the book_id, title, and a count of how many editions each book has. (hint: requires GROUP BY and JOIN)
SELECT b.id, b.title, COUNT(edition) FROM books b JOIN editions e ON b.id = e.book_id GROUP BY edition, b.id;
156 | The Tell-Tale Heart         |     1
  1608 | The Cat in the Hat          |     2
  4513 | Dune                        |     1
  7808 | The Shining                 |     1
  1234 | The Velveteen Rabbit        |     1
  7808 | The Shining                 |     1
  4513 | Dune                        |     1
 41473 | Programming Python          |     1
  2038 | Dynamic Anatomy             |     1
   190 | Little Women                |     1
 25908 | Franklin in the Dark        |     1
  1501 | Goodnight Moon              |     1
  4267 | 2001: A Space Odyssey       |     2
   156 | The Tell-Tale Heart         |     1
  1590 | Bartholomew and the Oobleck |     1
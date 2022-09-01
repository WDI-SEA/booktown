-- ### Order
-- 1. Find all subjects sorted by subject
SELECT subject FROM subjects ORDER BY subject;
 Arts
 Business
 Children''s Books
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

-- 2. Find all subjects sorted by location
SELECT subject, location FROM subjects ORDER BY location;
'
 subject      |     location     
------------------+------------------
 History          | Academic Rd
 Classics         | Academic Rd
 Mystery          | Black Raven Dr
 Horror           | Black Raven Dr
 Arts             | Creativity St
 Cooking          | Creativity St
 Children's Books | Kids Ct
 Entertainment    | Main St
 Drama            | Main St
 Romance          | Main St
 Science Fiction  | Main St
 Science          | Productivity Ave
 Computers        | Productivity Ave
 Business         | Productivity Ave
 Poetry           | Sunset Dr
 Religion         | 


-- ### Where
-- 3. Find the book "Littl`e Women"
SELECT * FROM books WHERE title = 'Little Women';
 id  |    title     | author_id | subject_id 
-----+--------------+-----------+------------
 190 | Little Women |        16 |          6


-- 4. Find all books containing the word "Python"
SELECT * FROM books WHERE title LIKE '%Python%';
  id   |       title        | author_id | subject_id 
-------+--------------------+-----------+------------
 41473 | Programming Python |      7805 |          4
 41477 | Learning Python    |      7805 |          4


-- 5. Find all subjects with the location "Main St" sort them by subject
SELECT * FROM subjects WHERE location = 'Main St' ORDER BY subject;
 id |     subject     | location 
----+-----------------+----------
  6 | Drama           | Main St
  7 | Entertainment   | Main St
 13 | Romance         | Main St
 15 | Science Fiction | Main St

-- ### Joins

-- 6. Find all books about Computers and list ONLY the book titles
SELECT * FROM subjects;
 id |     subject      |     location     
----+------------------+------------------
  0 | Arts             | Creativity St
  1 | Business         | Productivity Ave
  2 | Children''s Books | Kids Ct
  3 | Classics         | Academic Rd
  4 | Computers        | Productivity Ave
  5 | Cooking          | Creativity St
  6 | Drama            | Main St
  7 | Entertainment    | Main St
  8 | History          | Academic Rd
  9 | Horror           | Black Raven Dr
 10 | Mystery          | Black Raven Dr
 11 | Poetry           | Sunset Dr
 12 | Religion         | 
 13 | Romance          | Main St
 14 | Science          | Productivity Ave
 15 | Science Fiction  | Main St

SELECT title FROM books WHERE subject_id = 4;
        title         
----------------------
 Programming Python
 Learning Python
 Perl Cookbook
 Practical PostgreSQL

-- 7. Find all books and display a result table with ONLY the following columns
-- 	* Book title
-- 	* Author's first name
-- 	* Author's last name
-- 	* Book subject

SELECT * FROM books JOIN authors ON books.author_id = authors.id;
  id   |            title            | author_id | subject_id |  id   |  last_name   |    first_name    
-------+-----------------------------+-----------+------------+-------+--------------+------------------
 41472 | Practical PostgreSQL        |      1212 |          4 |  1212 | Worsley      | John
 25908 | Franklin in the Dark        |     15990 |          2 | 15990 | Bourgeois    | Paulette
  1234 | The Velveteen Rabbit        |     25041 |          3 | 25041 | Bianco       | Margery Williams
   190 | Little Women                |        16 |          6 |    16 | Alcott       | Louisa May
  7808 | The Shining                 |      4156 |          9 |  4156 | King         | Stephen
  4513 | Dune                        |      1866 |         15 |  1866 | Herbert      | Frank
  2038 | Dynamic Anatomy             |      1644 |          0 |  1644 | Hogarth      | Burne
  1501 | Goodnight Moon              |      2031 |          2 |  2031 | Brown        | Margaret Wise
   156 | The Tell-Tale Heart         |       115 |          9 |   115 | Poe          | Edgar Allen
 41477 | Learning Python             |      7805 |          4 |  7805 | Lutz         | Mark
 41473 | Programming Python          |      7805 |          4 |  7805 | Lutz         | Mark
 41478 | Perl Cookbook               |      7806 |          4 |  7806 | Christiansen | Tom
  4267 | 2001: A Space Odyssey       |      2001 |         15 |  2001 | Clarke       | Arthur C.
  1590 | Bartholomew and the Oobleck |      1809 |          2 |  1809 | Geisel       | Theodor Seuss
  1608 | The Cat in the Hat          |      1809 |          2 |  1809 | Geisel       | Theodor Seuss

  SELECT * FROM subjects;
 id |     subject      |     location     
----+------------------+------------------
  0 | Arts             | Creativity St
  1 | Business         | Productivity Ave
  2 | Children''s Books | Kids Ct
  3 | Classics         | Academic Rd
  4 | Computers        | Productivity Ave
  5 | Cooking          | Creativity St
  6 | Drama            | Main St
  7 | Entertainment    | Main St
  8 | History          | Academic Rd
  9 | Horror           | Black Raven Dr
 10 | Mystery          | Black Raven Dr
 11 | Poetry           | Sunset Dr
 12 | Religion         | 
 13 | Romance          | Main St
 14 | Science          | Productivity Ave
 15 | Science Fiction  | Main St

CREATE TABLE results (
    id SERIAL PRIMARY KEY,
    title TEXT,
    authorfirstname TEXT,
    authorlastname TEXT,
    subject TEXT,
);

INSERT INTO results (title, authorfirstname, authorlastname, subject) VALUES ('Practical PostgreSQL','John','Worsley','Computers');
INSERT INTO results (title, authorfirstname, authorlastname, subject) VALUES ('Franklin in the Dark','Paulette','Bourgeois','Business');
INSERT INTO results (title, authorfirstname, authorlastname, subject) VALUES ('The Velveteen Rabbit','Margery Williams','Bianco','Classics');
INSERT INTO results (title, authorfirstname, authorlastname, subject) VALUES ('Little Women','Louisa May','Alcott','Drama');
INSERT INTO results (title, authorfirstname, authorlastname, subject) VALUES ('The Shining','Stephen','King','Horror');
INSERT INTO results (title, authorfirstname, authorlastname, subject) VALUES ('Dune','Frank','Herbert','Science Fiction');
INSERT INTO results (title, authorfirstname, authorlastname, subject) VALUES ('Dynamic Anatomy','Burne','Hogarth','Arts');
INSERT INTO results (title, authorfirstname, authorlastname, subject) VALUES ('Goodnight Moon','Margaret Wise','Brown','Children''s books');
INSERT INTO results (title, authorfirstname, authorlastname, subject) VALUES ('The Tell-Tale Heart','Edgar Allen','Poe','Poetry');
INSERT INTO results (title, authorfirstname, authorlastname, subject) VALUES ('Learning Python','Mark','Lutz','Computers');
INSERT INTO results (title, authorfirstname, authorlastname, subject) VALUES ('Programming Python','Mark','Lutz','Computers');
INSERT INTO results (title, authorfirstname, authorlastname, subject) VALUES ('Perl Cookbook','Tom','Christiansen','Computers');
INSERT INTO results (title, authorfirstname, authorlastname, subject) VALUES ('2001: A Space Odyssey','Arthur C.','Clarke','Science Fiction');
INSERT INTO results (title, authorfirstname, authorlastname, subject) VALUES ('Bartholomew and the Oobleck','Theodor Seuss','Geisel','Children''s books');
INSERT INTO results (title, authorfirstname, authorlastname, subject) VALUES ('The Cat in the Hat','Theodor Seuss','Geisel','Children''s books');

SELECT * FROM results;
 id |            title            | authorfirstname  | authorlastname |     subject      
----+-----------------------------+------------------+----------------+------------------
  1 | Practical PostgreSQL        | John             | Worsley        | Computers
  2 | Franklin in the Dark        | Paulette         | Bourgeois      | Business
  3 | The Velveteen Rabbit        | Margery Williams | Bianco         | Classics
  4 | Little Women                | Louisa May       | Alcott         | Drama
  5 | The Shining                 | Stephen          | King           | Horror
  6 | Dune                        | Frank            | Herbert        | Science Fiction
  7 | Dynamic Anatomy             | Burne            | Hogarth        | Arts
  8 | Goodnight Moon              | Margaret Wise    | Brown          | Children''s books
  9 | The Tell-Tale Heart         | Edgar Allen      | Poe            | Poetry
 10 | Learning Python             | Mark             | Lutz           | Computers
 11 | Programming Python          | Mark             | Lutz           | Computers
 12 | Perl Cookbook               | Tom              | Christiansen   | Computers
 13 | 2001: A Space Odyssey       | Arthur C.        | Clarke         | Science Fiction
 14 | Bartholomew and the Oobleck | Theodor Seuss    | Geisel         | Children''s books
 15 | The Cat in the Hat          | Theodor Seuss    | Geisel         | Children''s books

-- 8. Find all books that are listed in the stock table
-- 	* Sort them by retail price (most expensive first)
-- 	* Display ONLY: title and price



-- 9. Find the book "Dune" and display ONLY the following columns
-- 	* Book title
-- 	* ISBN number
-- 	* Publisher name
-- 	* Retail price
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

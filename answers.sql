1.booktown=# select * from subjects order by subject;
 id |     subject      |     location
----+------------------+------------------
  0 | Arts             | Creativity St
  1 | Business         | Productivity Ave
  2 | Children's Books | Kids Ct
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
(16 rows)

2. booktown=# select * from subjects order by location;
 id |     subject      |     location
----+------------------+------------------
  8 | History          | Academic Rd
  3 | Classics         | Academic Rd
 10 | Mystery          | Black Raven Dr
  9 | Horror           | Black Raven Dr
  0 | Arts             | Creativity St
  5 | Cooking          | Creativity St
  2 | Children's Books | Kids Ct
  7 | Entertainment    | Main St
  6 | Drama            | Main St
 13 | Romance          | Main St
 15 | Science Fiction  | Main St
 14 | Science          | Productivity Ave
  4 | Computers        | Productivity Ave
  1 | Business         | Productivity Ave
 11 | Poetry           | Sunset Dr
 12 | Religion         |
(16 rows)

3. select title from books where title = 'Little Women';
4. select title from books where title like '%Python%';
Programming Python
Learning Python
5. select subject from subjects where location like 'Main St' ORDER BY subject;
Drama
Entertainment
Romance
Science Fiction
6. select books.title from books join subjects ON subjects.id = books.subject_id where subject= 'Computers';
Practical PostgreSQL
Perl Cookbook
Learning Python
Programming Python
7 select books.title, authors.first_name, authors.last_name, subjects.subject from books
join subjects on subjects.id = books.subject_id
join authors on authors.id = books.author_id;
Practical PostgreSQL	John	Worsley	Computers
Franklin in the Dark	Paulette	Bourgeois	Children's Books
The Velveteen Rabbit	Margery Williams	Bianco	Classics
Little Women	Louisa May	Alcott	Drama
The Shining	Stephen	King	Horror
Dune	Frank	Herbert	Science Fiction
Dynamic Anatomy	Burne	Hogarth	Arts
Goodnight Moon	Margaret Wise	Brown	Children's Books
The Tell-Tale Heart	Edgar Allen	Poe	Horror
Programming Python	Mark	Lutz	Computers
Learning Python	Mark	Lutz	Computers
Perl Cookbook	Tom	Christiansen	Computers
2001: A Space Odyssey	Arthur C.	Clarke	Science Fiction
The Cat in the Hat	Theodor Seuss	Geisel	Children's Books
Bartholomew and the Oobleck	Theodor Seuss	Geisel	Children's Books
The Cat in the Hat	Theodor Seuss	Geisel	Children's Books
Bartholomew and the Oobleck	Theodor Seuss	Geisel	Children's Books
8 select books.title, stock.retail from stock
join editions on editions.isbn = stock.isbn
join books on books.id = editions.book_id
order by retail desc;
9. select title, editions.isbn, publishers.name, stock.cost from books
join editions ON books.id = editions.book_id
join stock ON editions.isbn = stock.isbn
join publishers ON editions.publisher_id = publishers.id WHERE title = 'Dune';
10
select first_name, last_name, books.title, shipments.ship_date from customers
join shipments on customers.id = shipments.customer_id
join editions on shipments.isbn = editions.isbn
join books on editions.book_id = books.id;
11 select count(*) from books;
select count (location) from subjects;
select distinct location, count(location) from subjects group by location;
select id, title, count(edition) from books join editions on books.id = editions.book_id group by id;

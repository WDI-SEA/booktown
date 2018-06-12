Fleshcakes=# \c booktown
You are now connected to database "booktown" as user "Fleshcakes".
booktown=# \d
                   List of relations
 Schema |         Name          |   Type   |   Owner
--------+-----------------------+----------+------------
 public | alternate_stock       | table    | Fleshcakes
 public | authors               | table    | Fleshcakes
 public | book_backup           | table    | Fleshcakes
 public | book_ids              | sequence | Fleshcakes
 public | book_queue            | table    | Fleshcakes
 public | books                 | table    | Fleshcakes
 public | customers             | table    | Fleshcakes
 public | daily_inventory       | table    | Fleshcakes
 public | distinguished_authors | table    | Fleshcakes
 public | editions              | table    | Fleshcakes
 public | employees             | table    | Fleshcakes
 public | favorite_authors      | table    | Fleshcakes
 public | favorite_books        | table    | Fleshcakes
 public | money_example         | table    | Fleshcakes
 public | my_list               | table    | Fleshcakes
 public | numeric_values        | table    | Fleshcakes
 public | publishers            | table    | Fleshcakes
 public | schedules             | table    | Fleshcakes
 public | shipments             | table    | Fleshcakes
 public | states                | table    | Fleshcakes
 public | stock                 | table    | Fleshcakes
 public | stock_backup          | table    | Fleshcakes
 public | subject_ids           | sequence | Fleshcakes
 public | subjects              | table    | Fleshcakes
 public | text_sorting          | table    | Fleshcakes
(25 rows)

               ^
booktown=# select subject from subjects order by location;
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


2. Sort order of subjects by location


booktown=# select * from subjects
booktown-# order by location;
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


booktown=# select * from authors;
  id   |  last_name   |    first_name
-------+--------------+------------------
  1111 | Denham       | Ariel
  1212 | Worsley      | John
 15990 | Bourgeois    | Paulette
 25041 | Bianco       | Margery Williams
    16 | Alcott       | Louisa May
  4156 | King         | Stephen
  1866 | Herbert      | Frank
  1644 | Hogarth      | Burne
  2031 | Brown        | Margaret Wise
   115 | Poe          | Edgar Allen
  7805 | Lutz         | Mark
  7806 | Christiansen | Tom
  1533 | Brautigan    | Richard
  1717 | Brite        | Poppy Z.
  2112 | Gorey        | Edward
  2001 | Clarke       | Arthur C.
  1213 | Brookins     | Andrew
 25043 | Simon        | Neil
  1809 | Geisel       | Theodor Seuss
(19 rows)
not exist
LINE 1: select * from last_name;
                      ^
booktown=# \d+ books;
                                     Table "public.books"
   Column   |  Type   | Collation | Nullable | Default | Storage  | Stats target | Description
------------+---------+-----------+----------+---------+----------+--------------+-------------
 id         | integer |           | not null |         | plain    |              |
 title      | text    |           | not null |         | extended |              |
 author_id  | integer |           |          |         | plain    |              |
 subject_id | integer |           |          |         | plain    |              |
Indexes:
    "books_id_pkey" PRIMARY KEY, btree (id)
    "books_title_idx" btree (title)

3. Find Little Women
                  ^
booktown=# select * from books where author_id='16';
 id  |    title     | author_id | subject_id
-----+--------------+-----------+------------
 190 | Little Women |        16 |          6
(1 row)


4. Find books that contain "Python"


booktown=# select * from books where title like '%Python%';
  id   |       title        | author_id | subject_id
-------+--------------------+-----------+------------
 41473 | Programming Python |      7805 |          4
 41477 | Learning Python    |      7805 |          4
(2 rows)


5. Sort subjects by location 'Main Street'


booktown=# select subject from subjects where location = 'Main St' order by subject;
     subject
-----------------
 Drama
 Entertainment
 Romance
 Science Fiction
(4 rows)


6. Find books about Computers


booktown=# select books.title from books join subjects on books.subject_id = subjects.id where subjects.subject = 'Computers';
        title
----------------------
 Practical PostgreSQL
 Perl Cookbook
 Learning Python
 Programming Python
(4 rows)


7. Find all books and display a result table with ONLY the following columns
Book title
Author's first name
Author's last name
Book subject

jhsdkljh q,md,jskldjsdlkfjvakldjvklavnlkasdmvks.d,zmv,..


8. Find all books that are listed in the stock table
Sort them by retail price (most expensive first)
Display ONLY: title and price

booktown=# select books.title, stock.retail from editions inner join stock on editions.isbn = stock.isbn inner join books on editions.book_id = books.id;
            title            | retail
-----------------------------+--------
 The Cat in the Hat          |  32.95
 The Shining                 |  28.95
 Bartholomew and the Oobleck |  16.95
 Franklin in the Dark        |  23.95
 Goodnight Moon              |  28.95
 The Velveteen Rabbit        |  24.95
 Little Women                |  23.95
 The Cat in the Hat          |  23.95
 The Shining                 |  36.95
 The Tell-Tale Heart         |  24.95
 The Tell-Tale Heart         |  21.95
 Dune                        |  21.95
 Dune                        |  45.95
 2001: A Space Odyssey       |  22.95
 2001: A Space Odyssey       |  46.95
 Dynamic Anatomy             |  28.95
(16 rows)


9. Find the book "Dune" and display ONLY the following columns
Book title
ISBN number
Publisher name
Retail price

booktown=# select books.title, stock.isbn, publishers.name, stock retail
booktown-# from editions join stock on editions.isbn = stock.isbn
booktown-# join publishers on editions.publisher_id = publishers.id
booktown-# join books ON editions.book_id = books.id where title='Dune';
 title |    isbn    |   name    | retail
-------+------------+-----------+--------
 Dune  | 0441172717 | Ace Books |     77
 Dune  | 044100590X | Ace Books |     89
(2 rows)

booktown=#

10. Find all shipments sorted by ship date display a result table with ONLY the following columns:
Customer first name
Customer last name
ship date
book title

 Goodnight Moon              | Ramon      | Gould     | 2001-08-06 07:49:44-07
 The Cat in the Hat          | Owen       | Bollman   | 2001-08-06 09:29:21-07
 The Cat in the Hat          | Jenny      | King      | 2001-08-06 09:29:21-07
 The Cat in the Hat          | Royce      | Robertson | 2001-08-06 09:29:21-07
 The Cat in the Hat          | Wendy      | Black     | 2001-08-06 09:29:21-07
 The Cat in the Hat          | Adam       | Holloway  | 2001-08-06 09:29:21-07
 The Cat in the Hat          | Don        | Eisele    | 2001-08-06 09:29:21-07
 The Cat in the Hat          | Ed         | Gould     | 2001-08-06 09:29:21-07
 The Cat in the Hat          | Tim        | Owens     | 2001-08-06 09:29:21-07
 The Cat in the Hat          | Chuck      | Brown     | 2001-08-06 09:29:21-07
 The Cat in the Hat          | Dave       | Olson     | 2001-08-06 09:29:21-07
 The Cat in the Hat          | Jonathan   | Anderson  | 2001-08-06 09:29:21-07
 The Cat in the Hat          | Kathy      | Corner    | 2001-08-06 09:29:21-07
 The Cat in the Hat          | Tammy      | Robinson  | 2001-08-06 09:29:21-07
 The Cat in the Hat          | Chad       | Allen     | 2001-08-06 09:29:21-07
 The Cat in the Hat          | Laura      | Bennett   | 2001-08-06 09:29:21-07
 The Cat in the Hat          | Trevor     | Young     | 2001-08-06 09:29:21-07
 The Cat in the Hat          | Kate       | Gerdes    | 2001-08-06 09:29:21-07
 The Cat in the Hat          | Rich       | Thomas    | 2001-08-06 09:29:21-07
 The Cat in the Hat          | James      | Williams  | 2001-08-06 09:29:21-07
 The Cat in the Hat          | James      | Clark     | 2001-08-06 09:29:21-07
 The Cat in the Hat          | Ramon      | Gould     | 2001-08-06 09:29:21-07
 The Cat in the Hat          | Jean       | Black     | 2001-08-06 09:29:21-07
 The Cat in the Hat          | Shirley    | Gould     | 2001-08-06 09:29:21-07
 The Cat in the Hat          | Annie      | Jackson   | 2001-08-06 09:29:21-07
 The Cat in the Hat          | Richard    | Brown     | 2001-08-06 09:29:21-07
 The Cat in the Hat          | Christine  | Holloway  | 2001-08-06 09:29:21-07
 The Cat in the Hat          | Owen       | Becker    | 2001-08-06 09:29:21-07
 The Cat in the Hat          | Jean       | Owens     | 2001-08-06 09:29:21-07
 The Cat in the Hat          | Royce      | Morrill   | 2001-08-06 09:29:21-07
 The Cat in the Hat          | Julie      | Bollman   | 2001-08-06 09:29:21-07
 The Cat in the Hat          | Eric       | Morrill   | 2001-08-06 09:29:21-07
 Bartholomew and the Oobleck | Annie      | Jackson   | 2001-08-06 11:46:36-07
 Bartholomew and the Oobleck | Chad       | Allen     | 2001-08-06 11:46:36-07
 Bartholomew and the Oobleck | Laura      | Bennett   | 2001-08-06 11:46:36-07
 Bartholomew and the Oobleck | Royce      | Morrill   | 2001-08-06 11:46:36-07
 Bartholomew and the Oobleck | Royce      | Robertson | 2001-08-06 11:46:36-07
 Bartholomew and the Oobleck | Richard    | Brown     | 2001-08-06 11:46:36-07
 Bartholomew and the Oobleck | Trevor     | Young     | 2001-08-06 11:46:36-07
 Bartholomew and the Oobleck | Rich       | Thomas    | 2001-08-06 11:46:36-07
 Bartholomew and the Oobleck | Jean       | Black     | 2001-08-06 11:46:36-07
 Bartholomew and the Oobleck | Ramon      | Gould     | 2001-08-06 11:46:36-07
 Bartholomew and the Oobleck | Tammy      | Robinson  | 2001-08-06 11:46:36-07
 Bartholomew and the Oobleck | Owen       | Bollman   | 2001-08-06 11:46:36-07
 Bartholomew and the Oobleck | Christine  | Holloway  | 2001-08-06 11:46:36-07
 Bartholomew and the Oobleck | Don        | Eisele    | 2001-08-06 11:46:36-07
 Bartholomew and the Oobleck | Owen       | Becker    | 2001-08-06 11:46:36-07
 Bartholomew and the Oobleck | Jonathan   | Anderson  | 2001-08-06 11:46:36-07
 Bartholomew and the Oobleck | Adam       | Holloway  | 2001-08-06 11:46:36-07
 Bartholomew and the Oobleck | Eric       | Morrill   | 2001-08-06 11:46:36-07
 Bartholomew and the Oobleck | Shirley    | Gould     | 2001-08-06 11:46:36-07
 Bartholomew and the Oobleck | Wendy      | Black     | 2001-08-06 11:46:36-07
 Bartholomew and the Oobleck | Tim        | Owens     | 2001-08-06 11:46:36-07
 Bartholomew and the Oobleck | Jenny      | King      | 2001-08-06 11:46:36-07
 Bartholomew and the Oobleck | Dave       | Olson     | 2001-08-06 11:46:36-07
 Bartholomew and the Oobleck | Ed         | Gould     | 2001-08-06 11:46:36-07
 Bartholomew and the Oobleck | Chuck      | Brown     | 2001-08-06 11:46:36-07
 Bartholomew and the Oobleck | Kathy      | Corner    | 2001-08-06 11:46:36-07
 Bartholomew and the Oobleck | James      | Williams  | 2001-08-06 11:46:36-07
 Bartholomew and the Oobleck | Kate       | Gerdes    | 2001-08-06 11:46:36-07
 Bartholomew and the Oobleck | James      | Clark     | 2001-08-06 11:46:36-07
 Bartholomew and the Oobleck | Jean       | Owens     | 2001-08-06 11:46:36-07
 Bartholomew and the Oobleck | Julie      | Bollman   | 2001-08-06 11:46:36-07
 Bartholomew and the Oobleck | Jean       | Owens     | 2001-08-07 10:58:36-07
 Bartholomew and the Oobleck | Julie      | Bollman   | 2001-08-07 10:58:36-07
 Bartholomew and the Oobleck | Dave       | Olson     | 2001-08-07 10:58:36-07
 Bartholomew and the Oobleck | Kate       | Gerdes    | 2001-08-07 10:58:36-07
 Bartholomew and the Oobleck | Kathy      | Corner    | 2001-08-07 10:58:36-07
 Bartholomew and the Oobleck | Rich       | Thomas    | 2001-08-07 10:58:36-07
 Bartholomew and the Oobleck | Tim        | Owens     | 2001-08-07 10:58:36-07
 Bartholomew and the Oobleck | Annie      | Jackson   | 2001-08-07 10:58:36-07
 Bartholomew and the Oobleck | Ed         | Gould     | 2001-08-07 10:58:36-07
 Bartholomew and the Oobleck | James      | Clark     | 2001-08-07 10:58:36-07
 Bartholomew and the Oobleck | James      | Williams  | 2001-08-07 10:58:36-07
 Bartholomew and the Oobleck | Eric       | Morrill   | 2001-08-07 10:58:36-07
 Bartholomew and the Oobleck | Chuck      | Brown     | 2001-08-07 10:58:36-07
 Bartholomew and the Oobleck | Jean       | Black     | 2001-08-07 10:58:36-07
 Bartholomew and the Oobleck | Shirley    | Gould     | 2001-08-07 10:58:36-07
 Bartholomew and the Oobleck | Ramon      | Gould     | 2001-08-07 10:58:36-07
 Bartholomew and the Oobleck | Owen       | Becker    | 2001-08-07 10:58:36-07
 Bartholomew and the Oobleck | Don        | Eisele    | 2001-08-07 10:58:36-07
 Bartholomew and the Oobleck | Christine  | Holloway  | 2001-08-07 10:58:36-07
 Bartholomew and the Oobleck | Owen       | Bollman   | 2001-08-07 10:58:36-07
 Bartholomew and the Oobleck | Wendy      | Black     | 2001-08-07 10:58:36-07
 Bartholomew and the Oobleck | Richard    | Brown     | 2001-08-07 10:58:36-07
 Bartholomew and the Oobleck | Jenny      | King      | 2001-08-07 10:58:36-07
 Bartholomew and the Oobleck | Royce      | Morrill   | 2001-08-07 10:58:36-07
 Bartholomew and the Oobleck | Royce      | Robertson | 2001-08-07 10:58:36-07
 Bartholomew and the Oobleck | Trevor     | Young     | 2001-08-07 10:58:36-07
 Bartholomew and the Oobleck | Tammy      | Robinson  | 2001-08-07 10:58:36-07
 Bartholomew and the Oobleck | Laura      | Bennett   | 2001-08-07 10:58:36-07
 Bartholomew and the Oobleck | Chad       | Allen     | 2001-08-07 10:58:36-07
 Bartholomew and the Oobleck | Adam       | Holloway  | 2001-08-07 10:58:36-07
 Bartholomew and the Oobleck | Jonathan   | Anderson  | 2001-08-07 10:58:36-07
 The Tell-Tale Heart         | Wendy      | Black     | 2001-08-07 11:31:57-07
 The Tell-Tale Heart         | Tammy      | Robinson  | 2001-08-07 11:31:57-07
 The Tell-Tale Heart         | Chuck      | Brown     | 2001-08-07 11:31:57-07
 The Tell-Tale Heart         | Tim        | Owens     | 2001-08-07 11:31:57-07
 The Tell-Tale Heart         | Shirley    | Gould     | 2001-08-07 11:31:57-07
 The Tell-Tale Heart         | Jean       | Black     | 2001-08-07 11:31:57-07
 The Tell-Tale Heart         | Kate       | Gerdes    | 2001-08-07 11:31:57-07
 The Tell-Tale Heart         | Jonathan   | Anderson  | 2001-08-07 11:31:57-07
 The Tell-Tale Heart         | Owen       | Becker    | 2001-08-07 11:31:57-07
 The Tell-Tale Heart         | James      | Clark     | 2001-08-07 11:31:57-07
 The Tell-Tale Heart         | Kathy      | Corner    | 2001-08-07 11:31:57-07
 The Tell-Tale Heart         | Owen       | Bollman   | 2001-08-07 11:31:57-07
 The Tell-Tale Heart         | Richard    | Brown     | 2001-08-07 11:31:57-07
 The Tell-Tale Heart         | Ed         | Gould     | 2001-08-07 11:31:57-07
 The Tell-Tale Heart         | Julie      | Bollman   | 2001-08-07 11:31:57-07
 The Tell-Tale Heart         | Laura      | Bennett   | 2001-08-07 11:31:57-07
 The Tell-Tale Heart         | Dave       | Olson     | 2001-08-07 11:31:57-07
 The Tell-Tale Heart         | Chad       | Allen     | 2001-08-07 11:31:57-07
 The Tell-Tale Heart         | Christine  | Holloway  | 2001-08-07 11:31:57-07
 The Tell-Tale Heart         | Jean       | Owens     | 2001-08-07 11:31:57-07
 The Tell-Tale Heart         | Annie      | Jackson   | 2001-08-07 11:31:57-07
 The Tell-Tale Heart         | Don        | Eisele    | 2001-08-07 11:31:57-07
 The Tell-Tale Heart         | Rich       | Thomas    | 2001-08-07 11:31:57-07
 The Tell-Tale Heart         | James      | Williams  | 2001-08-07 11:31:57-07
 The Tell-Tale Heart         | Jenny      | King      | 2001-08-07 11:31:57-07
 The Tell-Tale Heart         | Eric       | Morrill   | 2001-08-07 11:31:57-07
 The Tell-Tale Heart         | Trevor     | Young     | 2001-08-07 11:31:57-07
 The Tell-Tale Heart         | Ramon      | Gould     | 2001-08-07 11:31:57-07
 The Tell-Tale Heart         | Royce      | Morrill   | 2001-08-07 11:31:57-07
 The Tell-Tale Heart         | Royce      | Robertson | 2001-08-07 11:31:57-07
 The Tell-Tale Heart         | Adam       | Holloway  | 2001-08-07 11:31:57-07
 2001: A Space Odyssey       | Rich       | Thomas    | 2001-08-07 11:56:42-07
 2001: A Space Odyssey       | Shirley    | Gould     | 2001-08-07 11:56:42-07
 2001: A Space Odyssey       | Annie      | Jackson   | 2001-08-07 11:56:42-07
 2001: A Space Odyssey       | Kathy      | Corner    | 2001-08-07 11:56:42-07
 2001: A Space Odyssey       | Ed         | Gould     | 2001-08-07 11:56:42-07
 2001: A Space Odyssey       | Owen       | Becker    | 2001-08-07 11:56:42-07
 2001: A Space Odyssey       | Chad       | Allen     | 2001-08-07 11:56:42-07
 2001: A Space Odyssey       | James      | Williams  | 2001-08-07 11:56:42-07
 2001: A Space Odyssey       | Owen       | Bollman   | 2001-08-07 11:56:42-07
 2001: A Space Odyssey       | Richard    | Brown     | 2001-08-07 11:56:42-07
 2001: A Space Odyssey       | Eric       | Morrill   | 2001-08-07 11:56:42-07
 2001: A Space Odyssey       | Jean       | Owens     | 2001-08-07 11:56:42-07
 2001: A Space Odyssey       | Jenny      | King      | 2001-08-07 11:56:42-07
 2001: A Space Odyssey       | Julie      | Bollman   | 2001-08-07 11:56:42-07
 2001: A Space Odyssey       | Ramon      | Gould     | 2001-08-07 11:56:42-07
 2001: A Space Odyssey       | Royce      | Morrill   | 2001-08-07 11:56:42-07
 2001: A Space Odyssey       | Christine  | Holloway  | 2001-08-07 11:56:42-07
 2001: A Space Odyssey       | Jean       | Black     | 2001-08-07 11:56:42-07
 2001: A Space Odyssey       | Kate       | Gerdes    | 2001-08-07 11:56:42-07
 2001: A Space Odyssey       | James      | Clark     | 2001-08-07 11:56:42-07
 2001: A Space Odyssey       | Tammy      | Robinson  | 2001-08-07 11:56:42-07
 2001: A Space Odyssey       | Trevor     | Young     | 2001-08-07 11:56:42-07
 2001: A Space Odyssey       | Laura      | Bennett   | 2001-08-07 11:56:42-07
 2001: A Space Odyssey       | Tim        | Owens     | 2001-08-07 11:56:42-07
 2001: A Space Odyssey       | Jonathan   | Anderson  | 2001-08-07 11:56:42-07
 2001: A Space Odyssey       | Dave       | Olson     | 2001-08-07 11:56:42-07
 2001: A Space Odyssey       | Wendy      | Black     | 2001-08-07 11:56:42-07
 2001: A Space Odyssey       | Chuck      | Brown     | 2001-08-07 11:56:42-07
 2001: A Space Odyssey       | Don        | Eisele    | 2001-08-07 11:56:42-07
 2001: A Space Odyssey       | Royce      | Robertson | 2001-08-07 11:56:42-07
 2001: A Space Odyssey       | Adam       | Holloway  | 2001-08-07 11:56:42-07
 Little Women                | Richard    | Brown     | 2001-08-07 13:00:48-07
 Little Women                | Shirley    | Gould     | 2001-08-07 13:00:48-07
 Little Women                | Don        | Eisele    | 2001-08-07 13:00:48-07
 Little Women                | Dave       | Olson     | 2001-08-07 13:00:48-07
 Little Women                | Eric       | Morrill   | 2001-08-07 13:00:48-07
 Little Women                | James      | Williams  | 2001-08-07 13:00:48-07
 Little Women                | Julie      | Bollman   | 2001-08-07 13:00:48-07
 Little Women                | Tammy      | Robinson  | 2001-08-07 13:00:48-07
 Little Women                | Wendy      | Black     | 2001-08-07 13:00:48-07
 Little Women                | Ramon      | Gould     | 2001-08-07 13:00:48-07
 Little Women                | Tim        | Owens     | 2001-08-07 13:00:48-07
 Little Women                | Kathy      | Corner    | 2001-08-07 13:00:48-07
 Little Women                | Rich       | Thomas    | 2001-08-07 13:00:48-07
 Little Women                | Jean       | Owens     | 2001-08-07 13:00:48-07
 Little Women                | Owen       | Bollman   | 2001-08-07 13:00:48-07
 Little Women                | Trevor     | Young     | 2001-08-07 13:00:48-07
 Little Women                | Chuck      | Brown     | 2001-08-07 13:00:48-07
 Little Women                | Owen       | Becker    | 2001-08-07 13:00:48-07
 Little Women                | Adam       | Holloway  | 2001-08-07 13:00:48-07
 Little Women                | Jonathan   | Anderson  | 2001-08-07 13:00:48-07
 Little Women                | Royce      | Morrill   | 2001-08-07 13:00:48-07
 Little Women                | Ed         | Gould     | 2001-08-07 13:00:48-07
 Little Women                | Laura      | Bennett   | 2001-08-07 13:00:48-07
 Little Women                | James      | Clark     | 2001-08-07 13:00:48-07
 Little Women                | Royce      | Robertson | 2001-08-07 13:00:48-07
 Little Women                | Jenny      | King      | 2001-08-07 13:00:48-07
 Little Women                | Christine  | Holloway  | 2001-08-07 13:00:48-07
 Little Women                | Jean       | Black     | 2001-08-07 13:00:48-07
 Little Women                | Chad       | Allen     | 2001-08-07 13:00:48-07
 Little Women                | Annie      | Jackson   | 2001-08-07 13:00:48-07
 Little Women                | Kate       | Gerdes    | 2001-08-07 13:00:48-07
 The Shining                 | Owen       | Bollman   | 2001-08-08 08:36:44-07
 The Shining                 | Chad       | Allen     | 2001-08-08 08:36:44-07
 The Shining                 | Trevor     | Young     | 2001-08-08 08:36:44-07
 The Shining                 | James      | Williams  | 2001-08-08 08:36:44-07
 The Shining                 | Laura      | Bennett   | 2001-08-08 08:36:44-07
 The Shining                 | Richard    | Brown     | 2001-08-08 08:36:44-07
 The Shining                 | Christine  | Holloway  | 2001-08-08 08:36:44-07
 The Shining                 | Royce      | Robertson | 2001-08-08 08:36:44-07
 The Shining                 | Wendy      | Black     | 2001-08-08 08:36:44-07
 The Shining                 | Ramon      | Gould     | 2001-08-08 08:36:44-07
 The Shining                 | Adam       | Holloway  | 2001-08-08 08:36:44-07
 The Shining                 | Annie      | Jackson   | 2001-08-08 08:36:44-07
 The Shining                 | James      | Clark     | 2001-08-08 08:36:44-07
 The Shining                 | Shirley    | Gould     | 2001-08-08 08:36:44-07
 The Shining                 | Eric       | Morrill   | 2001-08-08 08:36:44-07
 The Shining                 | Julie      | Bollman   | 2001-08-08 08:36:44-07
 The Shining                 | Don        | Eisele    | 2001-08-08 08:36:44-07
 The Shining                 | Rich       | Thomas    | 2001-08-08 08:36:44-07
 The Shining                 | Ed         | Gould     | 2001-08-08 08:36:44-07
 The Shining                 | Tim        | Owens     | 2001-08-08 08:36:44-07
 The Shining                 | Chuck      | Brown     | 2001-08-08 08:36:44-07
 The Shining                 | Jean       | Black     | 2001-08-08 08:36:44-07
 The Shining                 | Dave       | Olson     | 2001-08-08 08:36:44-07
 The Shining                 | Jenny      | King      | 2001-08-08 08:36:44-07
 The Shining                 | Royce      | Morrill   | 2001-08-08 08:36:44-07
 The Shining                 | Jean       | Owens     | 2001-08-08 08:36:44-07
 The Shining                 | Owen       | Becker    | 2001-08-08 08:36:44-07
 The Shining                 | Kathy      | Corner    | 2001-08-08 08:36:44-07
 The Shining                 | Jonathan   | Anderson  | 2001-08-08 08:36:44-07
 The Shining                 | Tammy      | Robinson  | 2001-08-08 08:36:44-07
 The Shining                 | Kate       | Gerdes    | 2001-08-08 08:36:44-07
 The Shining                 | Julie      | Bollman   | 2001-08-08 09:53:46-07
 The Shining                 | Ed         | Gould     | 2001-08-08 09:53:46-07
 The Shining                 | Dave       | Olson     | 2001-08-08 09:53:46-07
 The Shining                 | Shirley    | Gould     | 2001-08-08 09:53:46-07
 The Shining                 | Don        | Eisele    | 2001-08-08 09:53:46-07
 The Shining                 | Rich       | Thomas    | 2001-08-08 09:53:46-07
 The Shining                 | Jenny      | King      | 2001-08-08 09:53:46-07
 The Shining                 | Tammy      | Robinson  | 2001-08-08 09:53:46-07
 The Shining                 | Ramon      | Gould     | 2001-08-08 09:53:46-07
 The Shining                 | Royce      | Robertson | 2001-08-08 09:53:46-07
 The Shining                 | Chad       | Allen     | 2001-08-08 09:53:46-07
 The Shining                 | Trevor     | Young     | 2001-08-08 09:53:46-07
 The Shining                 | Laura      | Bennett   | 2001-08-08 09:53:46-07
 The Shining                 | Royce      | Morrill   | 2001-08-08 09:53:46-07
 The Shining                 | Adam       | Holloway  | 2001-08-08 09:53:46-07
 The Shining                 | Owen       | Becker    | 2001-08-08 09:53:46-07
 The Shining                 | Tim        | Owens     | 2001-08-08 09:53:46-07
 The Shining                 | Kathy      | Corner    | 2001-08-08 09:53:46-07
 The Shining                 | Chuck      | Brown     | 2001-08-08 09:53:46-07
 The Shining                 | Wendy      | Black     | 2001-08-08 09:53:46-07
 The Shining                 | Richard    | Brown     | 2001-08-08 09:53:46-07
 The Shining                 | Jean       | Black     | 2001-08-08 09:53:46-07
 The Shining                 | Christine  | Holloway  | 2001-08-08 09:53:46-07
 The Shining                 | James      | Clark     | 2001-08-08 09:53:46-07
 The Shining                 | Eric       | Morrill   | 2001-08-08 09:53:46-07
 The Shining                 | Owen       | Bollman   | 2001-08-08 09:53:46-07
 The Shining                 | Kate       | Gerdes    | 2001-08-08 09:53:46-07
 The Shining                 | Annie      | Jackson   | 2001-08-08 09:53:46-07
 The Shining                 | James      | Williams  | 2001-08-08 09:53:46-07
 The Shining                 | Jonathan   | Anderson  | 2001-08-08 09:53:46-07
 The Shining                 | Jean       | Owens     | 2001-08-08 09:53:46-07
 Bartholomew and the Oobleck | Chuck      | Brown     | 2001-08-08 10:46:13-07
 Bartholomew and the Oobleck | Shirley    | Gould     | 2001-08-08 10:46:13-07
 Bartholomew and the Oobleck | Ramon      | Gould     | 2001-08-08 10:46:13-07
 Bartholomew and the Oobleck | Jenny      | King      | 2001-08-08 10:46:13-07
 Bartholomew and the Oobleck | Adam       | Holloway  | 2001-08-08 10:46:13-07
 Bartholomew and the Oobleck | Wendy      | Black     | 2001-08-08 10:46:13-07
 Bartholomew and the Oobleck | Royce      | Robertson | 2001-08-08 10:46:13-07
 Bartholomew and the Oobleck | Don        | Eisele    | 2001-08-08 10:46:13-07
 Bartholomew and the Oobleck | Julie      | Bollman   | 2001-08-08 10:46:13-07
 Bartholomew and the Oobleck | Eric       | Morrill   | 2001-08-08 10:46:13-07
 Bartholomew and the Oobleck | Ed         | Gould     | 2001-08-08 10:46:13-07
 Bartholomew and the Oobleck | Tim        | Owens     | 2001-08-08 10:46:13-07
 Bartholomew and the Oobleck | Dave       | Olson     | 2001-08-08 10:46:13-07
 Bartholomew and the Oobleck | Jean       | Owens     | 2001-08-08 10:46:13-07
 Bartholomew and the Oobleck | Royce      | Morrill   | 2001-08-08 10:46:13-07
 Bartholomew and the Oobleck | Kathy      | Corner    | 2001-08-08 10:46:13-07
 Bartholomew and the Oobleck | Jonathan   | Anderson  | 2001-08-08 10:46:13-07
 Bartholomew and the Oobleck | Owen       | Bollman   | 2001-08-08 10:46:13-07
 Bartholomew and the Oobleck | Richard    | Brown     | 2001-08-08 10:46:13-07
 Bartholomew and the Oobleck | Tammy      | Robinson  | 2001-08-08 10:46:13-07
 Bartholomew and the Oobleck | Chad       | Allen     | 2001-08-08 10:46:13-07
 Bartholomew and the Oobleck | Laura      | Bennett   | 2001-08-08 10:46:13-07
 Bartholomew and the Oobleck | Christine  | Holloway  | 2001-08-08 10:46:13-07
 Bartholomew and the Oobleck | Trevor     | Young     | 2001-08-08 10:46:13-07
 Bartholomew and the Oobleck | Kate       | Gerdes    | 2001-08-08 10:46:13-07
 Bartholomew and the Oobleck | Owen       | Becker    | 2001-08-08 10:46:13-07
 Bartholomew and the Oobleck | Rich       | Thomas    | 2001-08-08 10:46:13-07
 Bartholomew and the Oobleck | Annie      | Jackson   | 2001-08-08 10:46:13-07
 Bartholomew and the Oobleck | James      | Williams  | 2001-08-08 10:46:13-07
 Bartholomew and the Oobleck | James      | Clark     | 2001-08-08 10:46:13-07
 Bartholomew and the Oobleck | Jean       | Black     | 2001-08-08 10:46:13-07
 The Velveteen Rabbit        | Royce      | Robertson | 2001-08-09 07:30:07-07
 The Velveteen Rabbit        | James      | Clark     | 2001-08-09 07:30:07-07
 The Velveteen Rabbit        | Tim        | Owens     | 2001-08-09 07:30:07-07
 The Velveteen Rabbit        | Richard    | Brown     | 2001-08-09 07:30:07-07
 The Velveteen Rabbit        | Christine  | Holloway  | 2001-08-09 07:30:07-07
 The Velveteen Rabbit        | Ed         | Gould     | 2001-08-09 07:30:07-07
 The Velveteen Rabbit        | Dave       | Olson     | 2001-08-09 07:30:07-07
 The Velveteen Rabbit        | Julie      | Bollman   | 2001-08-09 07:30:07-07
 The Velveteen Rabbit        | Rich       | Thomas    | 2001-08-09 07:30:07-07
 The Velveteen Rabbit        | Jean       | Black     | 2001-08-09 07:30:07-07
 The Velveteen Rabbit        | Chuck      | Brown     | 2001-08-09 07:30:07-07
 The Velveteen Rabbit        | Jean       | Owens     | 2001-08-09 07:30:07-07
 The Velveteen Rabbit        | Ramon      | Gould     | 2001-08-09 07:30:07-07
 The Velveteen Rabbit        | Kathy      | Corner    | 2001-08-09 07:30:07-07
 The Velveteen Rabbit        | Wendy      | Black     | 2001-08-09 07:30:07-07
 The Velveteen Rabbit        | Kate       | Gerdes    | 2001-08-09 07:30:07-07
 The Velveteen Rabbit        | Don        | Eisele    | 2001-08-09 07:30:07-07
 The Velveteen Rabbit        | Shirley    | Gould     | 2001-08-09 07:30:07-07
 The Velveteen Rabbit        | James      | Williams  | 2001-08-09 07:30:07-07
 The Velveteen Rabbit        | Jenny      | King      | 2001-08-09 07:30:07-07
 The Velveteen Rabbit        | Owen       | Becker    | 2001-08-09 07:30:07-07
 The Velveteen Rabbit        | Owen       | Bollman   | 2001-08-09 07:30:07-07
 The Velveteen Rabbit        | Trevor     | Young     | 2001-08-09 07:30:07-07
 The Velveteen Rabbit        | Chad       | Allen     | 2001-08-09 07:30:07-07
 The Velveteen Rabbit        | Adam       | Holloway  | 2001-08-09 07:30:07-07
 The Velveteen Rabbit        | Tammy      | Robinson  | 2001-08-09 07:30:07-07
 The Velveteen Rabbit        | Annie      | Jackson   | 2001-08-09 07:30:07-07
 The Velveteen Rabbit        | Laura      | Bennett   | 2001-08-09 07:30:07-07
 The Velveteen Rabbit        | Royce      | Morrill   | 2001-08-09 07:30:07-07
 The Velveteen Rabbit        | Jonathan   | Anderson  | 2001-08-09 07:30:07-07
 The Velveteen Rabbit        | Eric       | Morrill   | 2001-08-09 07:30:07-07
 The Velveteen Rabbit        | Owen       | Bollman   | 2001-08-09 09:30:46-07
 The Velveteen Rabbit        | Jenny      | King      | 2001-08-09 09:30:46-07
 The Velveteen Rabbit        | Jean       | Owens     | 2001-08-09 09:30:46-07
 The Velveteen Rabbit        | Julie      | Bollman   | 2001-08-09 09:30:46-07
 The Velveteen Rabbit        | Richard    | Brown     | 2001-08-09 09:30:46-07
 The Velveteen Rabbit        | Royce      | Morrill   | 2001-08-09 09:30:46-07
 The Velveteen Rabbit        | Christine  | Holloway  | 2001-08-09 09:30:46-07
 The Velveteen Rabbit        | Ramon      | Gould     | 2001-08-09 09:30:46-07
 The Velveteen Rabbit        | Jean       | Black     | 2001-08-09 09:30:46-07
 The Velveteen Rabbit        | James      | Williams  | 2001-08-09 09:30:46-07
 The Velveteen Rabbit        | Royce      | Robertson | 2001-08-09 09:30:46-07
 The Velveteen Rabbit        | James      | Clark     | 2001-08-09 09:30:46-07
 The Velveteen Rabbit        | Owen       | Becker    | 2001-08-09 09:30:46-07
 The Velveteen Rabbit        | Kate       | Gerdes    | 2001-08-09 09:30:46-07
 The Velveteen Rabbit        | Rich       | Thomas    | 2001-08-09 09:30:46-07
 The Velveteen Rabbit        | Chad       | Allen     | 2001-08-09 09:30:46-07
 The Velveteen Rabbit        | Trevor     | Young     | 2001-08-09 09:30:46-07
 The Velveteen Rabbit        | Tammy      | Robinson  | 2001-08-09 09:30:46-07
 The Velveteen Rabbit        | Laura      | Bennett   | 2001-08-09 09:30:46-07
 The Velveteen Rabbit        | Jonathan   | Anderson  | 2001-08-09 09:30:46-07
 The Velveteen Rabbit        | Tim        | Owens     | 2001-08-09 09:30:46-07
 The Velveteen Rabbit        | Ed         | Gould     | 2001-08-09 09:30:46-07
 The Velveteen Rabbit        | Dave       | Olson     | 2001-08-09 09:30:46-07
 The Velveteen Rabbit        | Chuck      | Brown     | 2001-08-09 09:30:46-07
 The Velveteen Rabbit        | Kathy      | Corner    | 2001-08-09 09:30:46-07
 The Velveteen Rabbit        | Shirley    | Gould     | 2001-08-09 09:30:46-07
 The Velveteen Rabbit        | Wendy      | Black     | 2001-08-09 09:30:46-07
 The Velveteen Rabbit        | Don        | Eisele    | 2001-08-09 09:30:46-07
 The Velveteen Rabbit        | Adam       | Holloway  | 2001-08-09 09:30:46-07
 The Velveteen Rabbit        | Annie      | Jackson   | 2001-08-09 09:30:46-07
 The Velveteen Rabbit        | Eric       | Morrill   | 2001-08-09 09:30:46-07
 Franklin in the Dark        | Jean       | Owens     | 2001-08-10 07:29:52-07
 Franklin in the Dark        | Dave       | Olson     | 2001-08-10 07:29:52-07
 Franklin in the Dark        | Don        | Eisele    | 2001-08-10 07:29:52-07
 Franklin in the Dark        | Jenny      | King      | 2001-08-10 07:29:52-07
 Franklin in the Dark        | Ramon      | Gould     | 2001-08-10 07:29:52-07
 Franklin in the Dark        | Richard    | Brown     | 2001-08-10 07:29:52-07
 Franklin in the Dark        | Kate       | Gerdes    | 2001-08-10 07:29:52-07
 Franklin in the Dark        | Christine  | Holloway  | 2001-08-10 07:29:52-07
 Franklin in the Dark        | Tim        | Owens     | 2001-08-10 07:29:52-07
 Franklin in the Dark        | Ed         | Gould     | 2001-08-10 07:29:52-07
 Franklin in the Dark        | Kathy      | Corner    | 2001-08-10 07:29:52-07
 Franklin in the Dark        | James      | Williams  | 2001-08-10 07:29:52-07
 Franklin in the Dark        | Rich       | Thomas    | 2001-08-10 07:29:52-07
 Franklin in the Dark        | Eric       | Morrill   | 2001-08-10 07:29:52-07
 Franklin in the Dark        | Owen       | Bollman   | 2001-08-10 07:29:52-07
 Franklin in the Dark        | Royce      | Robertson | 2001-08-10 07:29:52-07
 Franklin in the Dark        | Trevor     | Young     | 2001-08-10 07:29:52-07
 Franklin in the Dark        | Adam       | Holloway  | 2001-08-10 07:29:52-07
 Franklin in the Dark        | Owen       | Becker    | 2001-08-10 07:29:52-07
 Franklin in the Dark        | Julie      | Bollman   | 2001-08-10 07:29:52-07
 Franklin in the Dark        | Chuck      | Brown     | 2001-08-10 07:29:52-07
 Franklin in the Dark        | Royce      | Morrill   | 2001-08-10 07:29:52-07
 Franklin in the Dark        | Chad       | Allen     | 2001-08-10 07:29:52-07
 Franklin in the Dark        | Annie      | Jackson   | 2001-08-10 07:29:52-07
 Franklin in the Dark        | Laura      | Bennett   | 2001-08-10 07:29:52-07
 Franklin in the Dark        | Wendy      | Black     | 2001-08-10 07:29:52-07
 Franklin in the Dark        | Jonathan   | Anderson  | 2001-08-10 07:29:52-07
 Franklin in the Dark        | Jean       | Black     | 2001-08-10 07:29:52-07
 Franklin in the Dark        | James      | Clark     | 2001-08-10 07:29:52-07
 Franklin in the Dark        | Tammy      | Robinson  | 2001-08-10 07:29:52-07
 Franklin in the Dark        | Shirley    | Gould     | 2001-08-10 07:29:52-07
 The Tell-Tale Heart         | Dave       | Olson     | 2001-08-10 08:29:42-07
 The Tell-Tale Heart         | Trevor     | Young     | 2001-08-10 08:29:42-07
 The Tell-Tale Heart         | Owen       | Becker    | 2001-08-10 08:29:42-07
 The Tell-Tale Heart         | Ramon      | Gould     | 2001-08-10 08:29:42-07
 The Tell-Tale Heart         | Royce      | Robertson | 2001-08-10 08:29:42-07
 The Tell-Tale Heart         | Adam       | Holloway  | 2001-08-10 08:29:42-07
 The Tell-Tale Heart         | Kate       | Gerdes    | 2001-08-10 08:29:42-07
 The Tell-Tale Heart         | James      | Clark     | 2001-08-10 08:29:42-07
 The Tell-Tale Heart         | Jenny      | King      | 2001-08-10 08:29:42-07
 The Tell-Tale Heart         | Shirley    | Gould     | 2001-08-10 08:29:42-07
 The Tell-Tale Heart         | Jean       | Owens     | 2001-08-10 08:29:42-07
 The Tell-Tale Heart         | Don        | Eisele    | 2001-08-10 08:29:42-07
 The Tell-Tale Heart         | Kathy      | Corner    | 2001-08-10 08:29:42-07
 The Tell-Tale Heart         | Christine  | Holloway  | 2001-08-10 08:29:42-07
 The Tell-Tale Heart         | James      | Williams  | 2001-08-10 08:29:42-07
 The Tell-Tale Heart         | Annie      | Jackson   | 2001-08-10 08:29:42-07
 The Tell-Tale Heart         | Richard    | Brown     | 2001-08-10 08:29:42-07
 The Tell-Tale Heart         | Eric       | Morrill   | 2001-08-10 08:29:42-07
 The Tell-Tale Heart         | Chad       | Allen     | 2001-08-10 08:29:42-07
 The Tell-Tale Heart         | Chuck      | Brown     | 2001-08-10 08:29:42-07
 The Tell-Tale Heart         | Wendy      | Black     | 2001-08-10 08:29:42-07
 The Tell-Tale Heart         | Rich       | Thomas    | 2001-08-10 08:29:42-07
 The Tell-Tale Heart         | Julie      | Bollman   | 2001-08-10 08:29:42-07
 The Tell-Tale Heart         | Jean       | Black     | 2001-08-10 08:29:42-07
 The Tell-Tale Heart         | Tammy      | Robinson  | 2001-08-10 08:29:42-07
 The Tell-Tale Heart         | Jonathan   | Anderson  | 2001-08-10 08:29:42-07
 The Tell-Tale Heart         | Owen       | Bollman   | 2001-08-10 08:29:42-07
 The Tell-Tale Heart         | Ed         | Gould     | 2001-08-10 08:29:42-07
 The Tell-Tale Heart         | Tim        | Owens     | 2001-08-10 08:29:42-07
 The Tell-Tale Heart         | Laura      | Bennett   | 2001-08-10 08:29:42-07
 The Tell-Tale Heart         | Royce      | Morrill   | 2001-08-10 08:29:42-07
 The Cat in the Hat          | Jenny      | King      | 2001-08-10 13:47:52-07
 The Cat in the Hat          | Owen       | Bollman   | 2001-08-10 13:47:52-07
 The Cat in the Hat          | Ramon      | Gould     | 2001-08-10 13:47:52-07
 The Cat in the Hat          | Kate       | Gerdes    | 2001-08-10 13:47:52-07
 The Cat in the Hat          | Rich       | Thomas    | 2001-08-10 13:47:52-07
 The Cat in the Hat          | Shirley    | Gould     | 2001-08-10 13:47:52-07
 The Cat in the Hat          | Trevor     | Young     | 2001-08-10 13:47:52-07
 The Cat in the Hat          | Royce      | Morrill   | 2001-08-10 13:47:52-07
 The Cat in the Hat          | James      | Williams  | 2001-08-10 13:47:52-07
 The Cat in the Hat          | Eric       | Morrill   | 2001-08-10 13:47:52-07
 The Cat in the Hat          | Dave       | Olson     | 2001-08-10 13:47:52-07
 The Cat in the Hat          | Tammy      | Robinson  | 2001-08-10 13:47:52-07
 The Cat in the Hat          | Christine  | Holloway  | 2001-08-10 13:47:52-07
 The Cat in the Hat          | Jonathan   | Anderson  | 2001-08-10 13:47:52-07
 The Cat in the Hat          | Richard    | Brown     | 2001-08-10 13:47:52-07
 The Cat in the Hat          | Adam       | Holloway  | 2001-08-10 13:47:52-07
 The Cat in the Hat          | Royce      | Robertson | 2001-08-10 13:47:52-07
 The Cat in the Hat          | Wendy      | Black     | 2001-08-10 13:47:52-07
 The Cat in the Hat          | Kathy      | Corner    | 2001-08-10 13:47:52-07
 The Cat in the Hat          | Jean       | Black     | 2001-08-10 13:47:52-07
 The Cat in the Hat          | Chad       | Allen     | 2001-08-10 13:47:52-07
 The Cat in the Hat          | Ed         | Gould     | 2001-08-10 13:47:52-07
 The Cat in the Hat          | Tim        | Owens     | 2001-08-10 13:47:52-07
 The Cat in the Hat          | Don        | Eisele    | 2001-08-10 13:47:52-07
 The Cat in the Hat          | Chuck      | Brown     | 2001-08-10 13:47:52-07
 The Cat in the Hat          | Annie      | Jackson   | 2001-08-10 13:47:52-07
 The Cat in the Hat          | Owen       | Becker    | 2001-08-10 13:47:52-07
 The Cat in the Hat          | Julie      | Bollman   | 2001-08-10 13:47:52-07
 The Cat in the Hat          | Laura      | Bennett   | 2001-08-10 13:47:52-07
 The Cat in the Hat          | James      | Clark     | 2001-08-10 13:47:52-07
 The Cat in the Hat          | Jean       | Owens     | 2001-08-10 13:47:52-07
 Bartholomew and the Oobleck | Rich       | Thomas    | 2001-08-11 09:55:05-07
 Bartholomew and the Oobleck | James      | Williams  | 2001-08-11 09:55:05-07
 Bartholomew and the Oobleck | Ramon      | Gould     | 2001-08-11 09:55:05-07
 Bartholomew and the Oobleck | James      | Clark     | 2001-08-11 09:55:05-07
 Bartholomew and the Oobleck | Owen       | Becker    | 2001-08-11 09:55:05-07
 Bartholomew and the Oobleck | Kate       | Gerdes    | 2001-08-11 09:55:05-07
 Bartholomew and the Oobleck | Annie      | Jackson   | 2001-08-11 09:55:05-07
 Bartholomew and the Oobleck | Christine  | Holloway  | 2001-08-11 09:55:05-07
 Bartholomew and the Oobleck | Shirley    | Gould     | 2001-08-11 09:55:05-07
 Bartholomew and the Oobleck | Trevor     | Young     | 2001-08-11 09:55:05-07
 Bartholomew and the Oobleck | Eric       | Morrill   | 2001-08-11 09:55:05-07
 Bartholomew and the Oobleck | Chad       | Allen     | 2001-08-11 09:55:05-07
 Bartholomew and the Oobleck | Laura      | Bennett   | 2001-08-11 09:55:05-07
 Bartholomew and the Oobleck | Tammy      | Robinson  | 2001-08-11 09:55:05-07
 Bartholomew and the Oobleck | Richard    | Brown     | 2001-08-11 09:55:05-07
 Bartholomew and the Oobleck | Jonathan   | Anderson  | 2001-08-11 09:55:05-07
 Bartholomew and the Oobleck | Royce      | Morrill   | 2001-08-11 09:55:05-07
 Bartholomew and the Oobleck | Jean       | Owens     | 2001-08-11 09:55:05-07
 Bartholomew and the Oobleck | Dave       | Olson     | 2001-08-11 09:55:05-07
 Bartholomew and the Oobleck | Kathy      | Corner    | 2001-08-11 09:55:05-07
 Bartholomew and the Oobleck | Tim        | Owens     | 2001-08-11 09:55:05-07
 Bartholomew and the Oobleck | Ed         | Gould     | 2001-08-11 09:55:05-07
 Bartholomew and the Oobleck | Chuck      | Brown     | 2001-08-11 09:55:05-07
 Bartholomew and the Oobleck | Julie      | Bollman   | 2001-08-11 09:55:05-07
 Bartholomew and the Oobleck | Don        | Eisele    | 2001-08-11 09:55:05-07
 Bartholomew and the Oobleck | Wendy      | Black     | 2001-08-11 09:55:05-07
 Bartholomew and the Oobleck | Royce      | Robertson | 2001-08-11 09:55:05-07
 Bartholomew and the Oobleck | Adam       | Holloway  | 2001-08-11 09:55:05-07
 Bartholomew and the Oobleck | Owen       | Bollman   | 2001-08-11 09:55:05-07
 Bartholomew and the Oobleck | Jenny      | King      | 2001-08-11 09:55:05-07
 Bartholomew and the Oobleck | Jean       | Black     | 2001-08-11 09:55:05-07
 Goodnight Moon              | Jean       | Owens     | 2001-08-11 10:52:34-07
 Goodnight Moon              | Jonathan   | Anderson  | 2001-08-11 10:52:34-07
 Goodnight Moon              | James      | Clark     | 2001-08-11 10:52:34-07
 Goodnight Moon              | Kate       | Gerdes    | 2001-08-11 10:52:34-07
 Goodnight Moon              | James      | Williams  | 2001-08-11 10:52:34-07
 Goodnight Moon              | Owen       | Bollman   | 2001-08-11 10:52:34-07
 Goodnight Moon              | Annie      | Jackson   | 2001-08-11 10:52:34-07
 Goodnight Moon              | Don        | Eisele    | 2001-08-11 10:52:34-07
 Goodnight Moon              | Tammy      | Robinson  | 2001-08-11 10:52:34-07
 Goodnight Moon              | Wendy      | Black     | 2001-08-11 10:52:34-07
 Goodnight Moon              | Chuck      | Brown     | 2001-08-11 10:52:34-07
 Goodnight Moon              | Eric       | Morrill   | 2001-08-11 10:52:34-07
 Goodnight Moon              | Jenny      | King      | 2001-08-11 10:52:34-07
 Goodnight Moon              | Julie      | Bollman   | 2001-08-11 10:52:34-07
 Goodnight Moon              | Adam       | Holloway  | 2001-08-11 10:52:34-07
 Goodnight Moon              | Richard    | Brown     | 2001-08-11 10:52:34-07
 Goodnight Moon              | Trevor     | Young     | 2001-08-11 10:52:34-07
 Goodnight Moon              | Shirley    | Gould     | 2001-08-11 10:52:34-07
 Goodnight Moon              | Ramon      | Gould     | 2001-08-11 10:52:34-07
 Goodnight Moon              | Ed         | Gould     | 2001-08-11 10:52:34-07
 Goodnight Moon              | Royce      | Robertson | 2001-08-11 10:52:34-07
 Goodnight Moon              | Owen       | Becker    | 2001-08-11 10:52:34-07
 Goodnight Moon              | Laura      | Bennett   | 2001-08-11 10:52:34-07
 Goodnight Moon              | Christine  | Holloway  | 2001-08-11 10:52:34-07
 Goodnight Moon              | Dave       | Olson     | 2001-08-11 10:52:34-07
 Goodnight Moon              | Kathy      | Corner    | 2001-08-11 10:52:34-07
 Goodnight Moon              | Rich       | Thomas    | 2001-08-11 10:52:34-07
 Goodnight Moon              | Tim        | Owens     | 2001-08-11 10:52:34-07
 Goodnight Moon              | Chad       | Allen     | 2001-08-11 10:52:34-07
 Goodnight Moon              | Royce      | Morrill   | 2001-08-11 10:52:34-07
 Goodnight Moon              | Jean       | Black     | 2001-08-11 10:52:34-07
 The Cat in the Hat          | Chad       | Allen     | 2001-08-11 13:34:08-07
 The Cat in the Hat          | Owen       | Bollman   | 2001-08-11 13:34:08-07
 The Cat in the Hat          | Rich       | Thomas    | 2001-08-11 13:34:08-07
 The Cat in the Hat          | Julie      | Bollman   | 2001-08-11 13:34:08-07
 The Cat in the Hat          | James      | Williams  | 2001-08-11 13:34:08-07
 The Cat in the Hat          | Kathy      | Corner    | 2001-08-11 13:34:08-07
 The Cat in the Hat          | Dave       | Olson     | 2001-08-11 13:34:08-07
 The Cat in the Hat          | James      | Clark     | 2001-08-11 13:34:08-07
 The Cat in the Hat          | Jean       | Owens     | 2001-08-11 13:34:08-07
 The Cat in the Hat          | Shirley    | Gould     | 2001-08-11 13:34:08-07
 The Cat in the Hat          | Adam       | Holloway  | 2001-08-11 13:34:08-07
 The Cat in the Hat          | Wendy      | Black     | 2001-08-11 13:34:08-07
 The Cat in the Hat          | Owen       | Becker    | 2001-08-11 13:34:08-07
 The Cat in the Hat          | Ramon      | Gould     | 2001-08-11 13:34:08-07
 The Cat in the Hat          | Eric       | Morrill   | 2001-08-11 13:34:08-07
 The Cat in the Hat          | Tammy      | Robinson  | 2001-08-11 13:34:08-07
 The Cat in the Hat          | Jonathan   | Anderson  | 2001-08-11 13:34:08-07
 The Cat in the Hat          | Christine  | Holloway  | 2001-08-11 13:34:08-07
 The Cat in the Hat          | Chuck      | Brown     | 2001-08-11 13:34:08-07
 The Cat in the Hat          | Trevor     | Young     | 2001-08-11 13:34:08-07
 The Cat in the Hat          | Royce      | Robertson | 2001-08-11 13:34:08-07
 The Cat in the Hat          | Annie      | Jackson   | 2001-08-11 13:34:08-07
 The Cat in the Hat          | Tim        | Owens     | 2001-08-11 13:34:08-07
 The Cat in the Hat          | Ed         | Gould     | 2001-08-11 13:34:08-07
 The Cat in the Hat          | Laura      | Bennett   | 2001-08-11 13:34:08-07
 The Cat in the Hat          | Jenny      | King      | 2001-08-11 13:34:08-07
 The Cat in the Hat          | Jean       | Black     | 2001-08-11 13:34:08-07
 The Cat in the Hat          | Kate       | Gerdes    | 2001-08-11 13:34:08-07
 The Cat in the Hat          | Don        | Eisele    | 2001-08-11 13:34:08-07
 The Cat in the Hat          | Richard    | Brown     | 2001-08-11 13:34:08-07
 The Cat in the Hat          | Royce      | Morrill   | 2001-08-11 13:34:08-07
 Dune                        | Ed         | Gould     | 2001-08-12 08:46:35-07
 Dune                        | Kate       | Gerdes    | 2001-08-12 08:46:35-07
 Dune                        | Jean       | Owens     | 2001-08-12 08:46:35-07
 Dune                        | Tim        | Owens     | 2001-08-12 08:46:35-07
 Dune                        | James      | Clark     | 2001-08-12 08:46:35-07
 Dune                        | Owen       | Bollman   | 2001-08-12 08:46:35-07
 Dune                        | Trevor     | Young     | 2001-08-12 08:46:35-07
 Dune                        | Jonathan   | Anderson  | 2001-08-12 08:46:35-07
 Dune                        | Royce      | Morrill   | 2001-08-12 08:46:35-07
 Dune                        | Tammy      | Robinson  | 2001-08-12 08:46:35-07
 Dune                        | Laura      | Bennett   | 2001-08-12 08:46:35-07
 Dune                        | Owen       | Becker    | 2001-08-12 08:46:35-07
 Dune                        | Julie      | Bollman   | 2001-08-12 08:46:35-07
 Dune                        | Rich       | Thomas    | 2001-08-12 08:46:35-07
 Dune                        | Jean       | Black     | 2001-08-12 08:46:35-07
 Dune                        | Dave       | Olson     | 2001-08-12 08:46:35-07
 Dune                        | James      | Williams  | 2001-08-12 08:46:35-07
 Dune                        | Ramon      | Gould     | 2001-08-12 08:46:35-07
 Dune                        | Wendy      | Black     | 2001-08-12 08:46:35-07
 Dune                        | Shirley    | Gould     | 2001-08-12 08:46:35-07
 Dune                        | Kathy      | Corner    | 2001-08-12 08:46:35-07
 Dune                        | Chuck      | Brown     | 2001-08-12 08:46:35-07
 Dune                        | Chad       | Allen     | 2001-08-12 08:46:35-07
 Dune                        | Adam       | Holloway  | 2001-08-12 08:46:35-07
 Dune                        | Annie      | Jackson   | 2001-08-12 08:46:35-07
 Dune                        | Richard    | Brown     | 2001-08-12 08:46:35-07
 Dune                        | Royce      | Robertson | 2001-08-12 08:46:35-07
 Dune                        | Eric       | Morrill   | 2001-08-12 08:46:35-07
 Dune                        | Jenny      | King      | 2001-08-12 08:46:35-07
 Dune                        | Don        | Eisele    | 2001-08-12 08:46:35-07
 Dune                        | Christine  | Holloway  | 2001-08-12 08:46:35-07
 Franklin in the Dark        | Christine  | Holloway  | 2001-08-12 12:09:47-07
 Franklin in the Dark        | Jean       | Owens     | 2001-08-12 12:09:47-07
 Franklin in the Dark        | Kathy      | Corner    | 2001-08-12 12:09:47-07
 Franklin in the Dark        | James      | Clark     | 2001-08-12 12:09:47-07
 Franklin in the Dark        | Tammy      | Robinson  | 2001-08-12 12:09:47-07
 Franklin in the Dark        | Annie      | Jackson   | 2001-08-12 12:09:47-07
 Franklin in the Dark        | Chuck      | Brown     | 2001-08-12 12:09:47-07
 Franklin in the Dark        | Owen       | Bollman   | 2001-08-12 12:09:47-07
 Franklin in the Dark        | Julie      | Bollman   | 2001-08-12 12:09:47-07
 Franklin in the Dark        | Richard    | Brown     | 2001-08-12 12:09:47-07
 Franklin in the Dark        | Trevor     | Young     | 2001-08-12 12:09:47-07
 Franklin in the Dark        | Jonathan   | Anderson  | 2001-08-12 12:09:47-07
 Franklin in the Dark        | Royce      | Morrill   | 2001-08-12 12:09:47-07
 Franklin in the Dark        | Rich       | Thomas    | 2001-08-12 12:09:47-07
 Franklin in the Dark        | James      | Williams  | 2001-08-12 12:09:47-07
 Franklin in the Dark        | Jenny      | King      | 2001-08-12 12:09:47-07
 Franklin in the Dark        | Laura      | Bennett   | 2001-08-12 12:09:47-07
 Franklin in the Dark        | Royce      | Robertson | 2001-08-12 12:09:47-07
 Franklin in the Dark        | Owen       | Becker    | 2001-08-12 12:09:47-07
 Franklin in the Dark        | Wendy      | Black     | 2001-08-12 12:09:47-07
 Franklin in the Dark        | Kate       | Gerdes    | 2001-08-12 12:09:47-07
 Franklin in the Dark        | Ramon      | Gould     | 2001-08-12 12:09:47-07
 Franklin in the Dark        | Eric       | Morrill   | 2001-08-12 12:09:47-07
 Franklin in the Dark        | Shirley    | Gould     | 2001-08-12 12:09:47-07
 Franklin in the Dark        | Don        | Eisele    | 2001-08-12 12:09:47-07
 Franklin in the Dark        | Jean       | Black     | 2001-08-12 12:09:47-07
 Franklin in the Dark        | Adam       | Holloway  | 2001-08-12 12:09:47-07
 Franklin in the Dark        | Ed         | Gould     | 2001-08-12 12:09:47-07
 Franklin in the Dark        | Tim        | Owens     | 2001-08-12 12:09:47-07
 Franklin in the Dark        | Chad       | Allen     | 2001-08-12 12:09:47-07
 Franklin in the Dark        | Dave       | Olson     | 2001-08-12 12:09:47-07
 The Shining                 | Kathy      | Corner    | 2001-08-12 13:39:22-07
 The Shining                 | Rich       | Thomas    | 2001-08-12 13:39:22-07
 The Shining                 | Eric       | Morrill   | 2001-08-12 13:39:22-07
 The Shining                 | Adam       | Holloway  | 2001-08-12 13:39:22-07
 The Shining                 | Don        | Eisele    | 2001-08-12 13:39:22-07
 The Shining                 | Jean       | Owens     | 2001-08-12 13:39:22-07
 The Shining                 | Owen       | Becker    | 2001-08-12 13:39:22-07
 The Shining                 | Jenny      | King      | 2001-08-12 13:39:22-07
 The Shining                 | Christine  | Holloway  | 2001-08-12 13:39:22-07
 The Shining                 | Kate       | Gerdes    | 2001-08-12 13:39:22-07
 The Shining                 | Tim        | Owens     | 2001-08-12 13:39:22-07
 The Shining                 | Ed         | Gould     | 2001-08-12 13:39:22-07
 The Shining                 | Jean       | Black     | 2001-08-12 13:39:22-07
 The Shining                 | Richard    | Brown     | 2001-08-12 13:39:22-07
 The Shining                 | Shirley    | Gould     | 2001-08-12 13:39:22-07
 The Shining                 | Owen       | Bollman   | 2001-08-12 13:39:22-07
 The Shining                 | Annie      | Jackson   | 2001-08-12 13:39:22-07
 The Shining                 | James      | Clark     | 2001-08-12 13:39:22-07
 The Shining                 | Chuck      | Brown     | 2001-08-12 13:39:22-07
 The Shining                 | Jonathan   | Anderson  | 2001-08-12 13:39:22-07
 The Shining                 | Laura      | Bennett   | 2001-08-12 13:39:22-07
 The Shining                 | Julie      | Bollman   | 2001-08-12 13:39:22-07
 The Shining                 | Ramon      | Gould     | 2001-08-12 13:39:22-07
 The Shining                 | Tammy      | Robinson  | 2001-08-12 13:39:22-07
 The Shining                 | Chad       | Allen     | 2001-08-12 13:39:22-07
 The Shining                 | Royce      | Morrill   | 2001-08-12 13:39:22-07
 The Shining                 | Dave       | Olson     | 2001-08-12 13:39:22-07
 The Shining                 | James      | Williams  | 2001-08-12 13:39:22-07
 The Shining                 | Wendy      | Black     | 2001-08-12 13:39:22-07
 The Shining                 | Trevor     | Young     | 2001-08-12 13:39:22-07
 The Shining                 | Royce      | Robertson | 2001-08-12 13:39:22-07
 The Cat in the Hat          | James      | Williams  | 2001-08-13 09:42:10-07
 The Cat in the Hat          | Owen       | Becker    | 2001-08-13 09:42:10-07
 The Cat in the Hat          | Chad       | Allen     | 2001-08-13 09:42:10-07
 The Cat in the Hat          | Jonathan   | Anderson  | 2001-08-13 09:42:10-07
 The Cat in the Hat          | Annie      | Jackson   | 2001-08-13 09:42:10-07
 The Cat in the Hat          | Tammy      | Robinson  | 2001-08-13 09:42:10-07
 The Cat in the Hat          | Eric       | Morrill   | 2001-08-13 09:42:10-07
 The Cat in the Hat          | Richard    | Brown     | 2001-08-13 09:42:10-07
 The Cat in the Hat          | Dave       | Olson     | 2001-08-13 09:42:10-07
 The Cat in the Hat          | Royce      | Morrill   | 2001-08-13 09:42:10-07
 The Cat in the Hat          | Trevor     | Young     | 2001-08-13 09:42:10-07
 The Cat in the Hat          | Kate       | Gerdes    | 2001-08-13 09:42:10-07
 The Cat in the Hat          | Chuck      | Brown     | 2001-08-13 09:42:10-07
 The Cat in the Hat          | Tim        | Owens     | 2001-08-13 09:42:10-07
 The Cat in the Hat          | Ramon      | Gould     | 2001-08-13 09:42:10-07
 The Cat in the Hat          | Ed         | Gould     | 2001-08-13 09:42:10-07
 The Cat in the Hat          | Jenny      | King      | 2001-08-13 09:42:10-07
 The Cat in the Hat          | Don        | Eisele    | 2001-08-13 09:42:10-07
 The Cat in the Hat          | Julie      | Bollman   | 2001-08-13 09:42:10-07
 The Cat in the Hat          | Kathy      | Corner    | 2001-08-13 09:42:10-07
 The Cat in the Hat          | Rich       | Thomas    | 2001-08-13 09:42:10-07
 The Cat in the Hat          | Adam       | Holloway  | 2001-08-13 09:42:10-07
 The Cat in the Hat          | James      | Clark     | 2001-08-13 09:42:10-07
 The Cat in the Hat          | Jean       | Black     | 2001-08-13 09:42:10-07
 The Cat in the Hat          | Royce      | Robertson | 2001-08-13 09:42:10-07
 The Cat in the Hat          | Wendy      | Black     | 2001-08-13 09:42:10-07
 The Cat in the Hat          | Owen       | Bollman   | 2001-08-13 09:42:10-07
 The Cat in the Hat          | Laura      | Bennett   | 2001-08-13 09:42:10-07
 The Cat in the Hat          | Shirley    | Gould     | 2001-08-13 09:42:10-07
 The Cat in the Hat          | Christine  | Holloway  | 2001-08-13 09:42:10-07
 The Cat in the Hat          | Jean       | Owens     | 2001-08-13 09:42:10-07
 The Cat in the Hat          | Annie      | Jackson   | 2001-08-13 09:47:04-07
 The Cat in the Hat          | Don        | Eisele    | 2001-08-13 09:47:04-07
 The Cat in the Hat          | Kathy      | Corner    | 2001-08-13 09:47:04-07
 The Cat in the Hat          | Wendy      | Black     | 2001-08-13 09:47:04-07
 The Cat in the Hat          | Jean       | Owens     | 2001-08-13 09:47:04-07
 The Cat in the Hat          | Owen       | Becker    | 2001-08-13 09:47:04-07
 The Cat in the Hat          | Chuck      | Brown     | 2001-08-13 09:47:04-07
 The Cat in the Hat          | Christine  | Holloway  | 2001-08-13 09:47:04-07
 The Cat in the Hat          | James      | Williams  | 2001-08-13 09:47:04-07
 The Cat in the Hat          | Rich       | Thomas    | 2001-08-13 09:47:04-07
 The Cat in the Hat          | Laura      | Bennett   | 2001-08-13 09:47:04-07
 The Cat in the Hat          | Julie      | Bollman   | 2001-08-13 09:47:04-07
 The Cat in the Hat          | Richard    | Brown     | 2001-08-13 09:47:04-07
 The Cat in the Hat          | Royce      | Robertson | 2001-08-13 09:47:04-07
 The Cat in the Hat          | Dave       | Olson     | 2001-08-13 09:47:04-07
 The Cat in the Hat          | Shirley    | Gould     | 2001-08-13 09:47:04-07
 The Cat in the Hat          | Eric       | Morrill   | 2001-08-13 09:47:04-07
 The Cat in the Hat          | Ed         | Gould     | 2001-08-13 09:47:04-07
 The Cat in the Hat          | Tim        | Owens     | 2001-08-13 09:47:04-07
 The Cat in the Hat          | Chad       | Allen     | 2001-08-13 09:47:04-07
 The Cat in the Hat          | Jonathan   | Anderson  | 2001-08-13 09:47:04-07
 The Cat in the Hat          | Jean       | Black     | 2001-08-13 09:47:04-07
 The Cat in the Hat          | Tammy      | Robinson  | 2001-08-13 09:47:04-07
 The Cat in the Hat          | Ramon      | Gould     | 2001-08-13 09:47:04-07
 The Cat in the Hat          | Kate       | Gerdes    | 2001-08-13 09:47:04-07
 The Cat in the Hat          | Trevor     | Young     | 2001-08-13 09:47:04-07
 The Cat in the Hat          | Adam       | Holloway  | 2001-08-13 09:47:04-07
 The Cat in the Hat          | Owen       | Bollman   | 2001-08-13 09:47:04-07
 The Cat in the Hat          | James      | Clark     | 2001-08-13 09:47:04-07
 The Cat in the Hat          | Jenny      | King      | 2001-08-13 09:47:04-07
 The Cat in the Hat          | Royce      | Morrill   | 2001-08-13 09:47:04-07
 Dynamic Anatomy             | Kathy      | Corner    | 2001-08-14 07:33:47-07
 Dynamic Anatomy             | Annie      | Jackson   | 2001-08-14 07:33:47-07
 Dynamic Anatomy             | Ed         | Gould     | 2001-08-14 07:33:47-07
 Dynamic Anatomy             | Chad       | Allen     | 2001-08-14 07:33:47-07
 Dynamic Anatomy             | James      | Williams  | 2001-08-14 07:33:47-07
 Dynamic Anatomy             | Richard    | Brown     | 2001-08-14 07:33:47-07
 Dynamic Anatomy             | Eric       | Morrill   | 2001-08-14 07:33:47-07
 Dynamic Anatomy             | Jenny      | King      | 2001-08-14 07:33:47-07
 Dynamic Anatomy             | Julie      | Bollman   | 2001-08-14 07:33:47-07
 Dynamic Anatomy             | Royce      | Morrill   | 2001-08-14 07:33:47-07
 Dynamic Anatomy             | Christine  | Holloway  | 2001-08-14 07:33:47-07
 Dynamic Anatomy             | Jean       | Black     | 2001-08-14 07:33:47-07
 Dynamic Anatomy             | James      | Clark     | 2001-08-14 07:33:47-07
 Dynamic Anatomy             | Rich       | Thomas    | 2001-08-14 07:33:47-07
 Dynamic Anatomy             | Trevor     | Young     | 2001-08-14 07:33:47-07
 Dynamic Anatomy             | Laura      | Bennett   | 2001-08-14 07:33:47-07
 Dynamic Anatomy             | Jonathan   | Anderson  | 2001-08-14 07:33:47-07
 Dynamic Anatomy             | Dave       | Olson     | 2001-08-14 07:33:47-07
 Dynamic Anatomy             | Chuck      | Brown     | 2001-08-14 07:33:47-07
 Dynamic Anatomy             | Don        | Eisele    | 2001-08-14 07:33:47-07
 Dynamic Anatomy             | Adam       | Holloway  | 2001-08-14 07:33:47-07
 Dynamic Anatomy             | Shirley    | Gould     | 2001-08-14 07:33:47-07
 Dynamic Anatomy             | Royce      | Robertson | 2001-08-14 07:33:47-07
 Dynamic Anatomy             | Wendy      | Black     | 2001-08-14 07:33:47-07
 Dynamic Anatomy             | Tim        | Owens     | 2001-08-14 07:33:47-07
 Dynamic Anatomy             | Tammy      | Robinson  | 2001-08-14 07:33:47-07
 Dynamic Anatomy             | Kate       | Gerdes    | 2001-08-14 07:33:47-07
 Dynamic Anatomy             | Ramon      | Gould     | 2001-08-14 07:33:47-07
 Dynamic Anatomy             | Jean       | Owens     | 2001-08-14 07:33:47-07
 Dynamic Anatomy             | Owen       | Bollman   | 2001-08-14 07:33:47-07
 Dynamic Anatomy             | Owen       | Becker    | 2001-08-14 07:33:47-07
 Dune                        | Owen       | Becker    | 2001-08-14 08:42:58-07
 Dune                        | Dave       | Olson     | 2001-08-14 08:42:58-07
 Dune                        | James      | Williams  | 2001-08-14 08:42:58-07
 Dune                        | Christine  | Holloway  | 2001-08-14 08:42:58-07
 Dune                        | Jean       | Black     | 2001-08-14 08:42:58-07
 Dune                        | Kathy      | Corner    | 2001-08-14 08:42:58-07
 Dune                        | Kate       | Gerdes    | 2001-08-14 08:42:58-07
 Dune                        | Jonathan   | Anderson  | 2001-08-14 08:42:58-07
 Dune                        | James      | Clark     | 2001-08-14 08:42:58-07
 Dune                        | Tim        | Owens     | 2001-08-14 08:42:58-07
 Dune                        | Owen       | Bollman   | 2001-08-14 08:42:58-07
 Dune                        | Tammy      | Robinson  | 2001-08-14 08:42:58-07
 Dune                        | Rich       | Thomas    | 2001-08-14 08:42:58-07
 Dune                        | Richard    | Brown     | 2001-08-14 08:42:58-07
 Dune                        | Don        | Eisele    | 2001-08-14 08:42:58-07
 Dune                        | Shirley    | Gould     | 2001-08-14 08:42:58-07
 Dune                        | Royce      | Robertson | 2001-08-14 08:42:58-07
 Dune                        | Adam       | Holloway  | 2001-08-14 08:42:58-07
 Dune                        | Eric       | Morrill   | 2001-08-14 08:42:58-07
 Dune                        | Annie      | Jackson   | 2001-08-14 08:42:58-07
 Dune                        | Ed         | Gould     | 2001-08-14 08:42:58-07
 Dune                        | Jean       | Owens     | 2001-08-14 08:42:58-07
 Dune                        | Chuck      | Brown     | 2001-08-14 08:42:58-07
 Dune                        | Ramon      | Gould     | 2001-08-14 08:42:58-07
 Dune                        | Wendy      | Black     | 2001-08-14 08:42:58-07
 Dune                        | Jenny      | King      | 2001-08-14 08:42:58-07
 Dune                        | Trevor     | Young     | 2001-08-14 08:42:58-07
 Dune                        | Laura      | Bennett   | 2001-08-14 08:42:58-07
 Dune                        | Julie      | Bollman   | 2001-08-14 08:42:58-07
 Dune                        | Chad       | Allen     | 2001-08-14 08:42:58-07
 Dune                        | Royce      | Morrill   | 2001-08-14 08:42:58-07
 The Shining                 | Kathy      | Corner    | 2001-08-14 10:36:41-07
 The Shining                 | James      | Williams  | 2001-08-14 10:36:41-07
 The Shining                 | Christine  | Holloway  | 2001-08-14 10:36:41-07
 The Shining                 | Tammy      | Robinson  | 2001-08-14 10:36:41-07
 The Shining                 | Ed         | Gould     | 2001-08-14 10:36:41-07
 The Shining                 | Shirley    | Gould     | 2001-08-14 10:36:41-07
 The Shining                 | Chad       | Allen     | 2001-08-14 10:36:41-07
 The Shining                 | Jean       | Black     | 2001-08-14 10:36:41-07
 The Shining                 | Ramon      | Gould     | 2001-08-14 10:36:41-07
 The Shining                 | Royce      | Robertson | 2001-08-14 10:36:41-07
 The Shining                 | Royce      | Morrill   | 2001-08-14 10:36:41-07
 The Shining                 | Eric       | Morrill   | 2001-08-14 10:36:41-07
 The Shining                 | Dave       | Olson     | 2001-08-14 10:36:41-07
 The Shining                 | Wendy      | Black     | 2001-08-14 10:36:41-07
 The Shining                 | Jean       | Owens     | 2001-08-14 10:36:41-07
 The Shining                 | Owen       | Becker    | 2001-08-14 10:36:41-07
 The Shining                 | James      | Clark     | 2001-08-14 10:36:41-07
 The Shining                 | Tim        | Owens     | 2001-08-14 10:36:41-07
 The Shining                 | Richard    | Brown     | 2001-08-14 10:36:41-07
 The Shining                 | Adam       | Holloway  | 2001-08-14 10:36:41-07
 The Shining                 | Laura      | Bennett   | 2001-08-14 10:36:41-07
 The Shining                 | Owen       | Bollman   | 2001-08-14 10:36:41-07
 The Shining                 | Don        | Eisele    | 2001-08-14 10:36:41-07
 The Shining                 | Rich       | Thomas    | 2001-08-14 10:36:41-07
 The Shining                 | Chuck      | Brown     | 2001-08-14 10:36:41-07
 The Shining                 | Kate       | Gerdes    | 2001-08-14 10:36:41-07
 The Shining                 | Jenny      | King      | 2001-08-14 10:36:41-07
 The Shining                 | Julie      | Bollman   | 2001-08-14 10:36:41-07
 The Shining                 | Annie      | Jackson   | 2001-08-14 10:36:41-07
 The Shining                 | Jonathan   | Anderson  | 2001-08-14 10:36:41-07
 The Shining                 | Trevor     | Young     | 2001-08-14 10:36:41-07
 The Tell-Tale Heart         | Ed         | Gould     | 2001-08-14 13:41:39-07
 The Tell-Tale Heart         | Tammy      | Robinson  | 2001-08-14 13:41:39-07
 The Tell-Tale Heart         | Trevor     | Young     | 2001-08-14 13:41:39-07
 The Tell-Tale Heart         | Laura      | Bennett   | 2001-08-14 13:41:39-07
 The Tell-Tale Heart         | Royce      | Robertson | 2001-08-14 13:41:39-07
 The Tell-Tale Heart         | Adam       | Holloway  | 2001-08-14 13:41:39-07
 The Tell-Tale Heart         | Owen       | Becker    | 2001-08-14 13:41:39-07
 The Tell-Tale Heart         | Chad       | Allen     | 2001-08-14 13:41:39-07
 The Tell-Tale Heart         | James      | Williams  | 2001-08-14 13:41:39-07
 The Tell-Tale Heart         | Annie      | Jackson   | 2001-08-14 13:41:39-07
 The Tell-Tale Heart         | Owen       | Bollman   | 2001-08-14 13:41:39-07
 The Tell-Tale Heart         | Richard    | Brown     | 2001-08-14 13:41:39-07
 The Tell-Tale Heart         | Don        | Eisele    | 2001-08-14 13:41:39-07
 The Tell-Tale Heart         | Eric       | Morrill   | 2001-08-14 13:41:39-07
 The Tell-Tale Heart         | Jenny      | King      | 2001-08-14 13:41:39-07
 The Tell-Tale Heart         | Wendy      | Black     | 2001-08-14 13:41:39-07
 The Tell-Tale Heart         | Chuck      | Brown     | 2001-08-14 13:41:39-07
 The Tell-Tale Heart         | Jean       | Owens     | 2001-08-14 13:41:39-07
 The Tell-Tale Heart         | Julie      | Bollman   | 2001-08-14 13:41:39-07
 The Tell-Tale Heart         | Royce      | Morrill   | 2001-08-14 13:41:39-07
 The Tell-Tale Heart         | Ramon      | Gould     | 2001-08-14 13:41:39-07
 The Tell-Tale Heart         | Christine  | Holloway  | 2001-08-14 13:41:39-07
 The Tell-Tale Heart         | Dave       | Olson     | 2001-08-14 13:41:39-07
 The Tell-Tale Heart         | Jean       | Black     | 2001-08-14 13:41:39-07
 The Tell-Tale Heart         | Shirley    | Gould     | 2001-08-14 13:41:39-07
 The Tell-Tale Heart         | Kate       | Gerdes    | 2001-08-14 13:41:39-07
 The Tell-Tale Heart         | Jonathan   | Anderson  | 2001-08-14 13:41:39-07
 The Tell-Tale Heart         | James      | Clark     | 2001-08-14 13:41:39-07
 The Tell-Tale Heart         | Tim        | Owens     | 2001-08-14 13:41:39-07
 The Tell-Tale Heart         | Rich       | Thomas    | 2001-08-14 13:41:39-07
 The Tell-Tale Heart         | Kathy      | Corner    | 2001-08-14 13:41:39-07
 The Shining                 | Eric       | Morrill   | 2001-08-14 13:45:51-07
 The Shining                 | Shirley    | Gould     | 2001-08-14 13:45:51-07
 The Shining                 | Wendy      | Black     | 2001-08-14 13:45:51-07
 The Shining                 | Adam       | Holloway  | 2001-08-14 13:45:51-07
 The Shining                 | Don        | Eisele    | 2001-08-14 13:45:51-07
 The Shining                 | Chuck      | Brown     | 2001-08-14 13:45:51-07
 The Shining                 | Tim        | Owens     | 2001-08-14 13:45:51-07
 The Shining                 | Dave       | Olson     | 2001-08-14 13:45:51-07
 The Shining                 | Jonathan   | Anderson  | 2001-08-14 13:45:51-07
 The Shining                 | Tammy      | Robinson  | 2001-08-14 13:45:51-07
 The Shining                 | Laura      | Bennett   | 2001-08-14 13:45:51-07
 The Shining                 | Trevor     | Young     | 2001-08-14 13:45:51-07
 The Shining                 | Kate       | Gerdes    | 2001-08-14 13:45:51-07
 The Shining                 | Rich       | Thomas    | 2001-08-14 13:45:51-07
 The Shining                 | James      | Clark     | 2001-08-14 13:45:51-07
 The Shining                 | Ramon      | Gould     | 2001-08-14 13:45:51-07
 The Shining                 | Jean       | Black     | 2001-08-14 13:45:51-07
 The Shining                 | Christine  | Holloway  | 2001-08-14 13:45:51-07
 The Shining                 | Annie      | Jackson   | 2001-08-14 13:45:51-07
 The Shining                 | Jean       | Owens     | 2001-08-14 13:45:51-07
 The Shining                 | Royce      | Morrill   | 2001-08-14 13:45:51-07
 The Shining                 | Julie      | Bollman   | 2001-08-14 13:45:51-07
 The Shining                 | Owen       | Bollman   | 2001-08-14 13:45:51-07
 The Shining                 | Jenny      | King      | 2001-08-14 13:45:51-07
 The Shining                 | Richard    | Brown     | 2001-08-14 13:45:51-07
 The Shining                 | Owen       | Becker    | 2001-08-14 13:45:51-07
 The Shining                 | James      | Williams  | 2001-08-14 13:45:51-07
 The Shining                 | Chad       | Allen     | 2001-08-14 13:45:51-07
 The Shining                 | Kathy      | Corner    | 2001-08-14 13:45:51-07
 The Shining                 | Ed         | Gould     | 2001-08-14 13:45:51-07
 The Shining                 | Royce      | Robertson | 2001-08-14 13:45:51-07
 Franklin in the Dark        | Shirley    | Gould     | 2001-08-14 13:49:00-07
 Franklin in the Dark        | Trevor     | Young     | 2001-08-14 13:49:00-07
 Franklin in the Dark        | Julie      | Bollman   | 2001-08-14 13:49:00-07
 Franklin in the Dark        | Royce      | Robertson | 2001-08-14 13:49:00-07
 Franklin in the Dark        | Jenny      | King      | 2001-08-14 13:49:00-07
 Franklin in the Dark        | Wendy      | Black     | 2001-08-14 13:49:00-07
 Franklin in the Dark        | Annie      | Jackson   | 2001-08-14 13:49:00-07
 Franklin in the Dark        | James      | Clark     | 2001-08-14 13:49:00-07
 Franklin in the Dark        | Ed         | Gould     | 2001-08-14 13:49:00-07
 Franklin in the Dark        | Chad       | Allen     | 2001-08-14 13:49:00-07
 Franklin in the Dark        | Dave       | Olson     | 2001-08-14 13:49:00-07
 Franklin in the Dark        | Owen       | Bollman   | 2001-08-14 13:49:00-07
 Franklin in the Dark        | Richard    | Brown     | 2001-08-14 13:49:00-07
 Franklin in the Dark        | Kathy      | Corner    | 2001-08-14 13:49:00-07
 Franklin in the Dark        | Rich       | Thomas    | 2001-08-14 13:49:00-07
 Franklin in the Dark        | Eric       | Morrill   | 2001-08-14 13:49:00-07
 Franklin in the Dark        | Jean       | Black     | 2001-08-14 13:49:00-07
 Franklin in the Dark        | Kate       | Gerdes    | 2001-08-14 13:49:00-07
 Franklin in the Dark        | Adam       | Holloway  | 2001-08-14 13:49:00-07
 Franklin in the Dark        | Jean       | Owens     | 2001-08-14 13:49:00-07
 Franklin in the Dark        | Don        | Eisele    | 2001-08-14 13:49:00-07
 Franklin in the Dark        | Ramon      | Gould     | 2001-08-14 13:49:00-07
 Franklin in the Dark        | Tammy      | Robinson  | 2001-08-14 13:49:00-07
 Franklin in the Dark        | Jonathan   | Anderson  | 2001-08-14 13:49:00-07
 Franklin in the Dark        | James      | Williams  | 2001-08-14 13:49:00-07
 Franklin in the Dark        | Royce      | Morrill   | 2001-08-14 13:49:00-07
 Franklin in the Dark        | Tim        | Owens     | 2001-08-14 13:49:00-07
 Franklin in the Dark        | Laura      | Bennett   | 2001-08-14 13:49:00-07
 Franklin in the Dark        | Chuck      | Brown     | 2001-08-14 13:49:00-07
 Franklin in the Dark        | Christine  | Holloway  | 2001-08-14 13:49:00-07
 Franklin in the Dark        | Owen       | Becker    | 2001-08-14 13:49:00-07
 Goodnight Moon              | Trevor     | Young     | 2001-08-15 11:57:40-07
 Goodnight Moon              | Laura      | Bennett   | 2001-08-15 11:57:40-07
 Goodnight Moon              | Jonathan   | Anderson  | 2001-08-15 11:57:40-07
 Goodnight Moon              | Shirley    | Gould     | 2001-08-15 11:57:40-07
 Goodnight Moon              | James      | Clark     | 2001-08-15 11:57:40-07
 Goodnight Moon              | Ed         | Gould     | 2001-08-15 11:57:40-07
 Goodnight Moon              | Richard    | Brown     | 2001-08-15 11:57:40-07
 Goodnight Moon              | Royce      | Morrill   | 2001-08-15 11:57:40-07
 Goodnight Moon              | Julie      | Bollman   | 2001-08-15 11:57:40-07
 Goodnight Moon              | Wendy      | Black     | 2001-08-15 11:57:40-07
 Goodnight Moon              | Don        | Eisele    | 2001-08-15 11:57:40-07
 Goodnight Moon              | Rich       | Thomas    | 2001-08-15 11:57:40-07
 Goodnight Moon              | Annie      | Jackson   | 2001-08-15 11:57:40-07
 Goodnight Moon              | Chuck      | Brown     | 2001-08-15 11:57:40-07
 Goodnight Moon              | Jean       | Owens     | 2001-08-15 11:57:40-07
 Goodnight Moon              | Eric       | Morrill   | 2001-08-15 11:57:40-07
 Goodnight Moon              | Owen       | Bollman   | 2001-08-15 11:57:40-07
 Goodnight Moon              | Royce      | Robertson | 2001-08-15 11:57:40-07
 Goodnight Moon              | Jenny      | King      | 2001-08-15 11:57:40-07
 Goodnight Moon              | James      | Williams  | 2001-08-15 11:57:40-07
 Goodnight Moon              | Tammy      | Robinson  | 2001-08-15 11:57:40-07
 Goodnight Moon              | Jean       | Black     | 2001-08-15 11:57:40-07
 Goodnight Moon              | Kathy      | Corner    | 2001-08-15 11:57:40-07
 Goodnight Moon              | Tim        | Owens     | 2001-08-15 11:57:40-07
 Goodnight Moon              | Chad       | Allen     | 2001-08-15 11:57:40-07
 Goodnight Moon              | Adam       | Holloway  | 2001-08-15 11:57:40-07
 Goodnight Moon              | Dave       | Olson     | 2001-08-15 11:57:40-07
 Goodnight Moon              | Owen       | Becker    | 2001-08-15 11:57:40-07
 Goodnight Moon              | Ramon      | Gould     | 2001-08-15 11:57:40-07
 Goodnight Moon              | Kate       | Gerdes    | 2001-08-15 11:57:40-07
 Goodnight Moon              | Christine  | Holloway  | 2001-08-15 11:57:40-07
 2001: A Space Odyssey       | Richard    | Brown     | 2001-08-15 14:02:01-07
 2001: A Space Odyssey       | Wendy      | Black     | 2001-08-15 14:02:01-07
 2001: A Space Odyssey       | Eric       | Morrill   | 2001-08-15 14:02:01-07
 2001: A Space Odyssey       | Jenny      | King      | 2001-08-15 14:02:01-07
 2001: A Space Odyssey       | Chuck      | Brown     | 2001-08-15 14:02:01-07
 2001: A Space Odyssey       | Jean       | Owens     | 2001-08-15 14:02:01-07
 2001: A Space Odyssey       | Tammy      | Robinson  | 2001-08-15 14:02:01-07
 2001: A Space Odyssey       | James      | Clark     | 2001-08-15 14:02:01-07
 2001: A Space Odyssey       | Adam       | Holloway  | 2001-08-15 14:02:01-07
 2001: A Space Odyssey       | Jonathan   | Anderson  | 2001-08-15 14:02:01-07
 2001: A Space Odyssey       | Ed         | Gould     | 2001-08-15 14:02:01-07
 2001: A Space Odyssey       | Rich       | Thomas    | 2001-08-15 14:02:01-07
 2001: A Space Odyssey       | Kate       | Gerdes    | 2001-08-15 14:02:01-07
 2001: A Space Odyssey       | Owen       | Becker    | 2001-08-15 14:02:01-07
 2001: A Space Odyssey       | Royce      | Robertson | 2001-08-15 14:02:01-07
 2001: A Space Odyssey       | Jean       | Black     | 2001-08-15 14:02:01-07
 2001: A Space Odyssey       | Chad       | Allen     | 2001-08-15 14:02:01-07
 2001: A Space Odyssey       | Tim        | Owens     | 2001-08-15 14:02:01-07
 2001: A Space Odyssey       | Christine  | Holloway  | 2001-08-15 14:02:01-07
 2001: A Space Odyssey       | Dave       | Olson     | 2001-08-15 14:02:01-07
 2001: A Space Odyssey       | James      | Williams  | 2001-08-15 14:02:01-07
 2001: A Space Odyssey       | Annie      | Jackson   | 2001-08-15 14:02:01-07
 2001: A Space Odyssey       | Laura      | Bennett   | 2001-08-15 14:02:01-07
 2001: A Space Odyssey       | Trevor     | Young     | 2001-08-15 14:02:01-07
 2001: A Space Odyssey       | Shirley    | Gould     | 2001-08-15 14:02:01-07
 2001: A Space Odyssey       | Royce      | Morrill   | 2001-08-15 14:02:01-07
 2001: A Space Odyssey       | Kathy      | Corner    | 2001-08-15 14:02:01-07
 2001: A Space Odyssey       | Ramon      | Gould     | 2001-08-15 14:02:01-07
 2001: A Space Odyssey       | Owen       | Bollman   | 2001-08-15 14:02:01-07
 2001: A Space Odyssey       | Don        | Eisele    | 2001-08-15 14:02:01-07
 2001: A Space Odyssey       | Julie      | Bollman   | 2001-08-15 14:02:01-07
 The Cat in the Hat          | Annie      | Jackson   | 2001-09-14 16:46:32-07
 The Cat in the Hat          | Kate       | Gerdes    | 2001-09-14 16:46:32-07
 The Cat in the Hat          | Trevor     | Young     | 2001-09-14 16:46:32-07
 The Cat in the Hat          | Rich       | Thomas    | 2001-09-14 16:46:32-07
 The Cat in the Hat          | Dave       | Olson     | 2001-09-14 16:46:32-07
 The Cat in the Hat          | James      | Clark     | 2001-09-14 16:46:32-07
 The Cat in the Hat          | Ramon      | Gould     | 2001-09-14 16:46:32-07
 The Cat in the Hat          | Ed         | Gould     | 2001-09-14 16:46:32-07
 The Cat in the Hat          | Jean       | Black     | 2001-09-14 16:46:32-07
 The Cat in the Hat          | Christine  | Holloway  | 2001-09-14 16:46:32-07
 The Cat in the Hat          | Chuck      | Brown     | 2001-09-14 16:46:32-07
 The Cat in the Hat          | Jean       | Owens     | 2001-09-14 16:46:32-07
 The Cat in the Hat          | Tim        | Owens     | 2001-09-14 16:46:32-07
 The Cat in the Hat          | Royce      | Morrill   | 2001-09-14 16:46:32-07
 The Cat in the Hat          | Julie      | Bollman   | 2001-09-14 16:46:32-07
 The Cat in the Hat          | Tammy      | Robinson  | 2001-09-14 16:46:32-07
 The Cat in the Hat          | Owen       | Bollman   | 2001-09-14 16:46:32-07
 The Cat in the Hat          | Don        | Eisele    | 2001-09-14 16:46:32-07
 The Cat in the Hat          | Jenny      | King      | 2001-09-14 16:46:32-07
 The Cat in the Hat          | Eric       | Morrill   | 2001-09-14 16:46:32-07
 The Cat in the Hat          | Adam       | Holloway  | 2001-09-14 16:46:32-07
 The Cat in the Hat          | Owen       | Becker    | 2001-09-14 16:46:32-07
 The Cat in the Hat          | Richard    | Brown     | 2001-09-14 16:46:32-07
 The Cat in the Hat          | Royce      | Robertson | 2001-09-14 16:46:32-07
 The Cat in the Hat          | James      | Williams  | 2001-09-14 16:46:32-07
 The Cat in the Hat          | Wendy      | Black     | 2001-09-14 16:46:32-07
 The Cat in the Hat          | Kathy      | Corner    | 2001-09-14 16:46:32-07
 The Cat in the Hat          | Chad       | Allen     | 2001-09-14 16:46:32-07
 The Cat in the Hat          | Shirley    | Gould     | 2001-09-14 16:46:32-07
 The Cat in the Hat          | Laura      | Bennett   | 2001-09-14 16:46:32-07
 The Cat in the Hat          | Jonathan   | Anderson  | 2001-09-14 16:46:32-07
 The Cat in the Hat          | Richard    | Brown     | 2001-09-14 17:42:22-07
 The Cat in the Hat          | Chuck      | Brown     | 2001-09-14 17:42:22-07
 The Cat in the Hat          | Chad       | Allen     | 2001-09-14 17:42:22-07
 The Cat in the Hat          | Jenny      | King      | 2001-09-14 17:42:22-07
 The Cat in the Hat          | Jonathan   | Anderson  | 2001-09-14 17:42:22-07
 The Cat in the Hat          | Adam       | Holloway  | 2001-09-14 17:42:22-07
 The Cat in the Hat          | Jean       | Black     | 2001-09-14 17:42:22-07
 The Cat in the Hat          | Ed         | Gould     | 2001-09-14 17:42:22-07
 The Cat in the Hat          | Owen       | Bollman   | 2001-09-14 17:42:22-07
 The Cat in the Hat          | James      | Clark     | 2001-09-14 17:42:22-07
 The Cat in the Hat          | Kathy      | Corner    | 2001-09-14 17:42:22-07
 The Cat in the Hat          | Trevor     | Young     | 2001-09-14 17:42:22-07
 The Cat in the Hat          | Rich       | Thomas    | 2001-09-14 17:42:22-07
 The Cat in the Hat          | James      | Williams  | 2001-09-14 17:42:22-07
 The Cat in the Hat          | Jean       | Owens     | 2001-09-14 17:42:22-07
 The Cat in the Hat          | Laura      | Bennett   | 2001-09-14 17:42:22-07
 The Cat in the Hat          | Annie      | Jackson   | 2001-09-14 17:42:22-07
 The Cat in the Hat          | Ramon      | Gould     | 2001-09-14 17:42:22-07
 The Cat in the Hat          | Tim        | Owens     | 2001-09-14 17:42:22-07
 The Cat in the Hat          | Wendy      | Black     | 2001-09-14 17:42:22-07
 The Cat in the Hat          | Kate       | Gerdes    | 2001-09-14 17:42:22-07
 The Cat in the Hat          | Owen       | Becker    | 2001-09-14 17:42:22-07
 The Cat in the Hat          | Royce      | Morrill   | 2001-09-14 17:42:22-07
 The Cat in the Hat          | Shirley    | Gould     | 2001-09-14 17:42:22-07
 The Cat in the Hat          | Eric       | Morrill   | 2001-09-14 17:42:22-07
 The Cat in the Hat          | Don        | Eisele    | 2001-09-14 17:42:22-07
 The Cat in the Hat          | Tammy      | Robinson  | 2001-09-14 17:42:22-07
 The Cat in the Hat          | Christine  | Holloway  | 2001-09-14 17:42:22-07
 The Cat in the Hat          | Royce      | Robertson | 2001-09-14 17:42:22-07
 The Cat in the Hat          | Dave       | Olson     | 2001-09-14 17:42:22-07
 The Cat in the Hat          | Julie      | Bollman   | 2001-09-14 17:42:22-07
 Bartholomew and the Oobleck | Don        | Eisele    | 2001-09-22 11:23:28-07
 Bartholomew and the Oobleck | Julie      | Bollman   | 2001-09-22 11:23:28-07
 Bartholomew and the Oobleck | Eric       | Morrill   | 2001-09-22 11:23:28-07
 Bartholomew and the Oobleck | Jean       | Owens     | 2001-09-22 11:23:28-07
 Bartholomew and the Oobleck | Kate       | Gerdes    | 2001-09-22 11:23:28-07
 Bartholomew and the Oobleck | Chuck      | Brown     | 2001-09-22 11:23:28-07
 Bartholomew and the Oobleck | Royce      | Morrill   | 2001-09-22 11:23:28-07
 Bartholomew and the Oobleck | Richard    | Brown     | 2001-09-22 11:23:28-07
 Bartholomew and the Oobleck | Shirley    | Gould     | 2001-09-22 11:23:28-07
 Bartholomew and the Oobleck | Tammy      | Robinson  | 2001-09-22 11:23:28-07
 Bartholomew and the Oobleck | Wendy      | Black     | 2001-09-22 11:23:28-07
 Bartholomew and the Oobleck | Tim        | Owens     | 2001-09-22 11:23:28-07
 Bartholomew and the Oobleck | Owen       | Becker    | 2001-09-22 11:23:28-07
 Bartholomew and the Oobleck | Adam       | Holloway  | 2001-09-22 11:23:28-07
 Bartholomew and the Oobleck | Christine  | Holloway  | 2001-09-22 11:23:28-07
 Bartholomew and the Oobleck | James      | Williams  | 2001-09-22 11:23:28-07
 Bartholomew and the Oobleck | Trevor     | Young     | 2001-09-22 11:23:28-07
 Bartholomew and the Oobleck | Jean       | Black     | 2001-09-22 11:23:28-07
 Bartholomew and the Oobleck | Ramon      | Gould     | 2001-09-22 11:23:28-07
 Bartholomew and the Oobleck | Dave       | Olson     | 2001-09-22 11:23:28-07
 Bartholomew and the Oobleck | Chad       | Allen     | 2001-09-22 11:23:28-07
 Bartholomew and the Oobleck | Annie      | Jackson   | 2001-09-22 11:23:28-07
 Bartholomew and the Oobleck | Kathy      | Corner    | 2001-09-22 11:23:28-07
 Bartholomew and the Oobleck | James      | Clark     | 2001-09-22 11:23:28-07
 Bartholomew and the Oobleck | Ed         | Gould     | 2001-09-22 11:23:28-07
 Bartholomew and the Oobleck | Jonathan   | Anderson  | 2001-09-22 11:23:28-07
 Bartholomew and the Oobleck | Laura      | Bennett   | 2001-09-22 11:23:28-07
 Bartholomew and the Oobleck | Rich       | Thomas    | 2001-09-22 11:23:28-07
 Bartholomew and the Oobleck | Jenny      | King      | 2001-09-22 11:23:28-07
 Bartholomew and the Oobleck | Royce      | Robertson | 2001-09-22 11:23:28-07
 Bartholomew and the Oobleck | Owen       | Bollman   | 2001-09-22 11:23:28-07
 Bartholomew and the Oobleck | Owen       | Becker    | 2001-09-22 20:58:56-07
 Bartholomew and the Oobleck | Wendy      | Black     | 2001-09-22 20:58:56-07
 Bartholomew and the Oobleck | James      | Clark     | 2001-09-22 20:58:56-07
 Bartholomew and the Oobleck | Kathy      | Corner    | 2001-09-22 20:58:56-07
 Bartholomew and the Oobleck | Annie      | Jackson   | 2001-09-22 20:58:56-07
 Bartholomew and the Oobleck | Richard    | Brown     | 2001-09-22 20:58:56-07
 Bartholomew and the Oobleck | Tim        | Owens     | 2001-09-22 20:58:56-07
 Bartholomew and the Oobleck | Don        | Eisele    | 2001-09-22 20:58:56-07
 Bartholomew and the Oobleck | Kate       | Gerdes    | 2001-09-22 20:58:56-07
 Bartholomew and the Oobleck | Owen       | Bollman   | 2001-09-22 20:58:56-07
 Bartholomew and the Oobleck | Shirley    | Gould     | 2001-09-22 20:58:56-07
 Bartholomew and the Oobleck | Julie      | Bollman   | 2001-09-22 20:58:56-07
 Bartholomew and the Oobleck | Royce      | Robertson | 2001-09-22 20:58:56-07
 Bartholomew and the Oobleck | Rich       | Thomas    | 2001-09-22 20:58:56-07
 Bartholomew and the Oobleck | Laura      | Bennett   | 2001-09-22 20:58:56-07
 Bartholomew and the Oobleck | Royce      | Morrill   | 2001-09-22 20:58:56-07
 Bartholomew and the Oobleck | Chuck      | Brown     | 2001-09-22 20:58:56-07
 Bartholomew and the Oobleck | Jonathan   | Anderson  | 2001-09-22 20:58:56-07
 Bartholomew and the Oobleck | Jean       | Owens     | 2001-09-22 20:58:56-07
 Bartholomew and the Oobleck | Eric       | Morrill   | 2001-09-22 20:58:56-07
 Bartholomew and the Oobleck | Jenny      | King      | 2001-09-22 20:58:56-07
 Bartholomew and the Oobleck | Ed         | Gould     | 2001-09-22 20:58:56-07
 Bartholomew and the Oobleck | Chad       | Allen     | 2001-09-22 20:58:56-07
 Bartholomew and the Oobleck | Ramon      | Gould     | 2001-09-22 20:58:56-07
 Bartholomew and the Oobleck | Dave       | Olson     | 2001-09-22 20:58:56-07
 Bartholomew and the Oobleck | Tammy      | Robinson  | 2001-09-22 20:58:56-07
 Bartholomew and the Oobleck | Jean       | Black     | 2001-09-22 20:58:56-07
 Bartholomew and the Oobleck | Trevor     | Young     | 2001-09-22 20:58:56-07
 Bartholomew and the Oobleck | James      | Williams  | 2001-09-22 20:58:56-07
 Bartholomew and the Oobleck | Christine  | Holloway  | 2001-09-22 20:58:56-07
 Bartholomew and the Oobleck | Adam       | Holloway  | 2001-09-22 20:58:56-07
(1116 rows)


11. Get the COUNT of all books

booktown=# select count(*) from books;
 count
-------
    15
(1 row)


12. Get the COUNT of all Locations


booktown=# select count(*) from locations;
ERROR:  relation "locations" does not exist
LINE 1: select count(*) from locations;
                             ^
booktown=#


          WHY YOU NOT WORK???!



13. Get the COUNT of each unique location in the subjects table. Display the count and the location name. (hint: requires GROUP BY).


booktown=# select count(location), location from subjects group by location;
 count |     location
-------+------------------
     0 |
     1 | Sunset Dr
     1 | Kids Ct
     2 | Black Raven Dr
     2 | Creativity St
     2 | Academic Rd
     4 | Main St
     3 | Productivity Ave
(8 rows)
























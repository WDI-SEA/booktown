booktown=# SELECT * FROM authors;
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

booktown=# SELECT * FROM subjects;
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
(16 rows)

booktown=# SELECT * FROM books;
  id   |            title            | author_id | subject_id 
-------+-----------------------------+-----------+------------
  7808 | The Shining                 |      4156 |          9
  4513 | Dune                        |      1866 |         15
  4267 | 2001: A Space Odyssey       |      2001 |         15
  1608 | The Cat in the Hat          |      1809 |          2
  1590 | Bartholomew and the Oobleck |      1809 |          2
 25908 | Franklin in the Dark        |     15990 |          2
  1501 | Goodnight Moon              |      2031 |          2
   190 | Little Women                |        16 |          6
  1234 | The Velveteen Rabbit        |     25041 |          3
  2038 | Dynamic Anatomy             |      1644 |          0
   156 | The Tell-Tale Heart         |       115 |          9
 41473 | Programming Python          |      7805 |          4
 41477 | Learning Python             |      7805 |          4
 41478 | Perl Cookbook               |      7806 |          4
 41472 | Practical PostgreSQL        |      1212 |          4
(15 rows)
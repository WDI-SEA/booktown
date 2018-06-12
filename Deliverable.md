## Queries
Complete the following exercises to practice using SQL.

## Order
Find all subjects sorted by subject

Find all subjects sorted by location
Where

Find the book "Little Women"

Find all books containing the word "Python"

Find all subjects with the location "Main St" sort them by subject

Joins
Find all books about Computers and list ONLY the book titles

Find all books and display a result table with ONLY the following columns
Book title
Author's first name
Author's last name
Book subject

booktown=# select books.title AS booktitle, authors.first_name AS firstname, authors.last_name AS lastname, subjects.subject
booktown-# from
booktown-# books join authors on books.author_id = authors.id join subjects on books.subject_id = subjects.id;
          booktitle          |    firstname     |   lastname   |     subject
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

Find all books that are listed in the stock table

Sort them by retail price (most expensive first)

Display ONLY: title and price

Find the book "Dune" and display ONLY the following columns
Book title
ISBN number
Publisher name
Retail price

Find all shipments sorted by ship date display a result table with ONLY the following columns:
Customer first name
Customer last name
ship date
book title

Grouping and Counting
Get the COUNT of all books

Get the COUNT of all Locations

Get the COUNT of each unique location in the subjects table. 

Display the count and the location name. (hint: requires GROUP BY).

List all books. Display the book_id, title, and a count of how many editions each book has. (hint: requires GROUP BY and JOIN)
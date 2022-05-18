# Booktown, USA

For each question below, find the approriate SQL query to obtain the information requested. Put all your answers in the `solutions.txt` file.
## Getting Started

To get started we'll need to import the booktown.sql file.

1. Fork and clone this repository
2. `cd` into the repository
3. use the command `psql -f booktown.sql`
4. type `psql` to open your psql console
5. type `\list` to ensure the booktown database was successfully completed
6. type `\c booktown` to connect to the booktown database
7. type `\d` to see a list of all the tables in the booktown database
8. type `\d [TABLE_NAME]` to see information about columns and their types for a specific table. You should see output like below:

```
booktown=# \d books
       Table "public.books"
   Column   |  Type   | Modifiers 
------------+---------+-----------
 id         | integer | not null
 title      | text    | not null
 author_id  | integer | 
 subject_id | integer | 
Indexes:
    "books_id_pkey" PRIMARY KEY, btree (id)
    "books_title_idx" btree (title)
```

## Queries

Complete the following exercises to practice using SQL.

### Order
1. Find all subjects sorted by subject
2. Find all subjects sorted by location

### Where
3. Find the book "Little Women"
4. Find all books containing the word "Python"

SELECT * FROM books
where title like '%Py%';
  id   |       title        | author_id | subject_id 
-------+--------------------+-----------+------------
 41473 | Programming Python |      7805 |          4
 41477 | Learning Python    |      7805 |          4

5. Find all subjects with the location "Main St" sort them by subject

SELECT * FROM subjects
where location='Main St';
 id |     subject     | location 
----+-----------------+----------
  6 | Drama           | Main St
  7 | Entertainment   | Main St
 13 | Romance         | Main St
 15 | Science Fiction | Main St
(4 rows)

### Joins

6. Find all books about Computers and list ONLY the book titles

SELECT * FROM subjects;
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


SELECT * FROM books
booktown-# WHERE subject_id='4';
  id   |        title         | author_id | subject_id 
-------+----------------------+-----------+------------
 41473 | Programming Python   |      7805 |          4
 41477 | Learning Python      |      7805 |          4
 41478 | Perl Cookbook        |      7806 |          4
 41472 | Practical PostgreSQL |      1212 |          4

7. Find all books and display a result table with ONLY the following columns
	* Book title
	* Author's first name
	* Author's last name
	* Book subject

	SELECT * FROM books
	JOIN authors ON books.author_id=authors.id;
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

8. Find all books that are listed in the stock table
	* Sort them by retail price (most expensive first)
	* Display ONLY: title and price
9. Find the book "Dune" and display ONLY the following columns
	* Book title
	* ISBN number
	* Publisher name
	* Retail price
10. Find all shipments sorted by ship date display a result table with ONLY the following columns:
	* Customer first name
	* Customer last name
	* ship date
	* book title

### Grouping and Counting

11. Get the COUNT of all books
12. Get the COUNT of all Locations
13. Get the COUNT of each unique location in the subjects table. Display the count and the location name. (hint: requires GROUP BY).
14. List all books. Display the book_id, title, and a count of how many editions each book has. (hint: requires GROUP BY and JOIN)

#### YAY! You're done!!

---

## Licensing
1. All content is licensed under a CC-BY-NC-SA 4.0 license.
2. All software code is licensed under GNU GPLv3. For commercial use or alternative licensing, please contact legal@ga.co.

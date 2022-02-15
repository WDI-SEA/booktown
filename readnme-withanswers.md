# Booktown, USA

For each question below, find the approriate SQL query to obtain the information requested. Put all your answers in the `solutions.txt` file.
## Getting Started

To get started we'll need to import the booktown.sql file.

1. Fork and clone this repository
2. `cd` into the repository
3. use the command `psql \i booktown.sql`
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
1. Find all subjects sorted by subject.
<!-- A: Select * FROM subjects; -->
2. Find all subjects sorted by location
<!-- A: Select * FROM subjects ORDER BY location; -->

### Where
3. Find the book "Little Women"
<!-- A: SELECT * FROM books WHERE title = 'Little Women'; -->
4. Find all books containing the word "Python"
<!-- A: SELECT * FROM books WHERE title LIKE '%Python%'; -->
5. Find all subjects with the location "Main St" sort them by subject
<!-- A: SELECT * FROM subjects WHERE location = 'Main St' ORDER BY subject; -->



### Joins

6. Find all books about Computers and list ONLY the book titles
<!-- A:  Select title FROM books WHERE subject_id = (SELECT id FROM subjects WHERE subject = 'Computers'); -->

7. Find all books and display a result table with ONLY the following columns
	* Book title
	* Author's first name
	* Author's last name
	* Book subject
<!-- A: Select title, first_name, last_name, subject FROM books JOIN authors ON books.author_id = authors.id JOIN subjects ON books.subject_id = subjects.id; -->

8. Find all books that are listed in the stock table
	* Sort them by retail price (most expensive first)
	* Display ONLY: title and price
<!-- A: select title, cost from editions JOIN books ON editions.book_id = books.id JOIN stock ON editions.isbn = stock.isbn ORDER BY cost DESC; -->

9. Find the book "Dune" and display ONLY the following columns
	* Book title
	* ISBN number
	* Publisher name
	* Retail price
<!-- A: select title, editions.isbn, name, cost from editions JOIN books ON editions.book_id = books.id JOIN stock ON editions.isbn = stock.isbn JOIN publishers ON editions.publisher_id = publishers.id  WHERE title = 'Dune'; -->


10. Find all shipments sorted by ship date display a result table with ONLY the following columns:
	* Customer first name
	* Customer last name
	* ship date
	* book title
<!-- A: SELECT first_name, last_name, ship_date, title FROM shipments JOIN customers ON shipments.customer_id = customers.id JOIN editions ON shipments.isbn = editions.isbn JOIN books ON editions.book_id = books.id; -->

### Grouping and Counting

11. Get the COUNT of all books
<!-- A: SELECT COUNT(*) FROM books; -->
12. Get the COUNT of all Locations
<!-- A: select count(location) from subjects; -->
13. Get the COUNT of each unique location in the subjects table. Display the count and the location name. (hint: requires GROUP BY).
<!-- A: select count(location), location from subjects GROUP BY location; -->
14. List all books. Display the book_id, title, and a count of how many editions each book has. (hint: requires GROUP BY and JOIN)
<!-- A: select book_id, title, count(edition) from books JOIN editions ON books.id = editions.book_id GROUP BY books.title AND editions.book_id; -->

#### YAY! You're done!!

---

## Licensing
1. All content is licensed under a CC-BY-NC-SA 4.0 license.
2. All software code is licensed under GNU GPLv3. For commercial use or alternative licensing, please contact legal@ga.co.

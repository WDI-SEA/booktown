# Booktown, USA

For each question below, find the appropriate SQL query to obtain the information requested. Put all your answers in the `solutions.txt` file.
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
5. Find all subjects with the location "Main St" sort them by subject


### Joins

6. Find all books about Computers and list ONLY the book titles
7. Find all books and display a result table with ONLY the following columns
	* Book title
	* Author's first name
	* Author's last name
	* Book subject
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

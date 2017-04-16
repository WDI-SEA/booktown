# Booktown, USA

For each question below, find the approriate SQL query to obtain the information requested. Create a `.sql` file that contains all of your answers.

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

### Additionally...

Your life will be made easier with a GUI PostgreSQL client. We downloaded these during the installfest. Open up **Postico** if you have a Mac, or **pgAdmin** if you have Linux.

If you're missing the PostgreSQL client, download [Postico here](https://eggerapps.at/postico/) if you have a Mac, or [pgAdmin here](http://www.pgadmin.org/) if you have Linux.

1. Postico asks for a lot of information to begin with. The defaults are fine. Leave everything alone and just press connect.
2. If you don't see the booktown database after connecting you may need to move up a directory. Press the "localhost" under the back and forward buttons.
3. Double click on the `booktown` database to connect.
4. See the list of tables in the database (alternate_stock, authors, book_backup...)
5. Double click a table to see it's contents
6. Double click SQL Terminal to get to a text box where you can write and execute some queries.

![Postico new localhost connection](images/postico/00-postico-localhost-connection.jpg)
![Postico databases](images/postico/01-postico-databases.jpg)

## Queries

Complete the following exercises to practice using SQL.

### Order
* Find all subjects sorted by subject
* Find all subjects sorted by location

### Where
* Find the book "Little Women"
* Find all books containing the word "Python"
* Find all subjects with the location "Main St" sort them by subject


### Joins

* Find all books about Computers and list ONLY the book titles
* Find all books and display a result table with ONLY the following columns
	* Book title
	* Author's first name
	* Author's last name
	* Book subject
* Find all books that are listed in the stock table
	* Sort them by retail price (most expensive first)
	* Display ONLY: title and price
* Find the book "Dune" and display ONLY the following columns
	* Book title
	* ISBN number
	* Publisher name
	* Retail price
* Find all shipments sorted by ship date display a result table with ONLY the following columns:
	* Customer first name
	* Customer last name
	* ship date
	* book title

### Grouping and Counting

* Get the COUNT of all books
* Get the COUNT of all Locations
* Get the COUNT of each unique location in the subjects table. Display the count and the location name. (hint: requires GROUP BY).
* List all books. Display the book_id, title, and a count of how many editions each book has. (hint: requires GROUP BY and JOIN)

#### YAY! You're done!!

---

## Licensing
1. All content is licensed under a CC-BY-NC-SA 4.0 license.
2. All software code is licensed under GNU GPLv3. For commercial use or alternative licensing, please contact legal@ga.co.

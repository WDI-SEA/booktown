
###Queries

Complete the following exercises to practice using SQL.

###Order

1. Find all subjects sorted by subject
* SELECT * FROM subjects ORDER BY subjects DESC;


2. Find all subjects sorted by location
* SELECT * FROM subjects ORDER BY location DESC;

###Where

1. Find the book "Little Women"
* select title from books where title = 'Little Women';

2. Find all books containing the word "Python"
* select * from books where title   
where title ilike '%python%';

3. Find all subjects with the location "Main St" sort them by subject
* select * from subjects 
where location = 'Main St'



###Joins

* Find all books about Computers list ONLY book title
* Find all books and display ONLY
  * Book title
  * Author's first name
  * Author's last name
  * Book subject
* Find all books that are listed in the stock table
  * Sort them by retail price (most expensive first)
  * Display ONLY: title and price
* Find the book "Dune" and display ONLY
  * Book title
  * ISBN number
  * Publisher name
  * Retail price
* Find all shipments sorted by ship date display ONLY:
  * Customer first name
  * Customer last name
  * ship date
  * book title

###Grouping and Counting

1. Get the COUNT of all books
* Get the COUNT of all Locations
* Get the COUNT of each unique location in the subjects table. Display the count and the location name. (hint: requires GROUP BY).
* List all books. Display the book_id, title, and a count of how many editions each book has. (hint: requires GROUP BY and JOIN)

####YAY! You're done!!

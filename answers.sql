ORDER
Find all subjects sorted by subject:
SELECT *
FROM subjects
ORDER BY subject

Find all subjects sorted by location:
SELECT *
FROM subjects
ORDER BY location


WHERE
Find the book "Little Women"
SELECT *
FROM books
WHERE title = "Little Women"

Find all books containing the word "Python"
SELECT *
FROM books
WHERE title like "%Python%"

Find all subjects with the location "Main St" sort them by subject
SELECT *
FROM subjects
WHERE location = "Main St"
ORDER BY subject



JOINS
Find all books about Computers and list ONLY the book titles
SELECT *
FROM books
JOIN subjects 
ON books.subject_id = subjects.id
WHERE subjects.subject = "Computers"

Find all books and display a result table with ONLY Book title, Author's first name, Author's last name, Book subject
 SELECT title,
  first_name,
  last_name,
  subject
FROM books
JOIN subjects
ON books.subject_id = subjects.id
JOIN authors
ON books.author_id = authors.id

Find all books that are listed in the stock table. Sort them by retail price (most expensive first). Display ONLY: title and price
SELECT title,
  cost
FROM books
JOIN editions
ON books.id = editions.book_id
JOIN stock
ON editions.isbn = stock.isbn
ORDER BY cost DESC

Find the book "Dune" and display ONLY the following columns: Book title, ISBN number, Publisher name, Retail price.
SELECT title,
  editions.isbn,
  publishers.name,
  cost
FROM books
JOIN editions
ON books.id = editions.book_id
JOIN stock
ON editions.isbn = stock.isbn
JOIN publishers
ON editions.publisher_id = publishers.id
WHERE title = "Dune"
ORDER BY cost DESC

Find all shipments sorted by ship date display a result table with ONLY the following columns: Customer first name, Customer last name, ship date, book title
SELECT customers.first_name,
  customers.last_name,
  shipments.ship_date,
  books.title
FROM shipments 
JOIN editions
ON editions.isbn = shipments.isbn
JOIN customers
ON customers.id = shipments.customer_id
JOIN books
ON books.id = editions.book_id
ORDER BY ship_date

GROUPING AND COUNTING
Get the COUNT of all books
SELECT count(id)
FROM books

Get the COUNT of all Locations
SELECT count(location)
FROM subjects

Get the COUNT of each unique location in the subjects table. Display the count and the location name. (hint: requires GROUP BY).
SELECT location,
  COUNT(subject)
FROM subjects
GROUP BY 1

List all books. Display the book_id, title, and a count of how many editions each book has. (hint: requires GROUP BY and JOIN)
SELECT title,
    book_id,
    COUNT(edition)
FROM books
JOIN editions
ON books.id = editions.book_id
GROUP BY 1,2











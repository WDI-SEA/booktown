# Order

Find all subjects sorted by subject
`SELECT * FROM subjects ORDER BY subject;`

Find all subjects sorted by location
`SELECT * FROM subjects ORDER BY location;`

# Where

Find the book "Little Women"
`SELECT * FROM books WHERE title = 'Little Women';`

Find all books containing the word "Python"
`SELECT * FROM books WHERE title like '%Python%';`

Find all subjects with the location "Main St" sort them by subject
`SELECT * FROM subjects WHERE location = 'Main St';`

# Joins

Find all books about Computers list ONLY book title
`SELECT b.title FROM books b JOIN subjects s ON s.id = b.subject_id WHERE s.subject = 'Computers';
`

Find all books and display a result table with ONLY the following columns

* Book title
* Author's first name
* Author's last name
* Book subject
`SELECT b.title, a.first_name, a.last_name, s.subject
FROM books b
JOIN subjects s on s.id = b.subject_id
JOIN authors a on a.id = b.author_id;
`

Find all books that are listed in the stock table
Sort them by retail price (most expensive first)
Display ONLY: title and price
`SELECT b.title, s.cost FROM stock s
JOIN editions e on e.isbn = s.isbn
JOIN books b on b.id = e.book_id
ORDER BY retail DESC;`


Find the book "Dune" and display ONLY the following columns
Book title
ISBN number
Publisher name
Retail price
`SELECT b.title, e.isbn, p.name, s.retail FROM books b
JOIN editions e on e.book_id  = b.id
JOIN publishers p on p.id = e.publisher_id
JOIN stock s on s.isbn = e.isbn
WHERE b.title = 'Dune';`


Find all shipments sorted by ship date display a result table with ONLY the following columns:
Customer first name
Customer last name
ship date
book title
`SELECT c.first_name, c.last_name, s.ship_date, b.title from shipments s
JOIN customers c on c.id = s.customer_id
JOIN editions e on e.isbn = s.isbn
JOIN books b on b.id = e.book_id
ORDER BY s.ship_date;
`

# Grouping and Counting

Get the COUNT of all books
`SELECT COUNT(*) FROM books;`

Get the COUNT of all Locations
`SELECT COUNT(location) FROM subjects;`

Get the COUNT of each unique location in the subjects table. Display the count and the location name. (hint: requires GROUP BY).
`SELECT COUNT(*), location FROM subjects GROUP BY location;`

List all books. Display the book_id, title, and a count of how many editions each book has. (hint: requires GROUP BY and JOIN)
`SELECT b.id, b.title, COUNT(DISTINCT e.edition) FROM books b
JOIN editions e on e.book_id = b.id
GROUP BY b.id;
`

Order:

1. SELECT * FROM subjects ORDER BY subject ASC;
2. SELECT * FROM subjects ORDER BY location ASC;


Where

1. Find the book "Little Women"
A: SELECT * FROM books WHERE title='Little Women';

2. Find all books containing the word "Python"
A:SELECT * FROM book_backup WHERE title LIKE '%Python%';

3. Find all subjects with the location "Main St" sort them by subject
A:SELECT * FROM subjects WHERE location ='Main St' ORDER BY subject ASC;

Joins

1.Find all books about Computers list ONLY book title

A: SELECT title FROM book_backup JOIN subjects ON subject_id = subjects.id WHERE subject = 'Computers';

2.Find all books and display ONLY
Book title, Author's first name, Author's last name, Book subject

A: SELECT books.title, authors.first_name, authors.last_name, subjects.subject FROM books LEFT JOIN authors ON authors.id = books.author_id LEFT JOIN subjects ON subjects.id = books.subject_id

3.Find all books that are listed in the stock table
Sort them by retail price (most expensive first)
Display ONLY: title and price

SELECT books.title, stock.cost FROM stock JOIN editions ON editions.isbn = stock.isbn JOIN books on books.id = editions.book_id ORDER BY cost DESC

4.Find the book "Dune" and display ONLY
Book title books book id edtions publisher id
ISBN number stocks isbn
Publisher name publishers
Retail price stocks cost

SELECT books.title, stocks.isbn, publishers.name, stocks.cost FROM books JOIN editions ON editions.book_id = books.id LEFT JOIN publishers ON publishers.id = editions.publisher_id LEFT JOIN stock ON stock.isbn = editions.isbn WHERE book.title = 'Dune';

5.Find all shipments sorted by ship date display ONLY:
Customer first name customers
Customer last name customers
ship date customer id
book title

A: SELECT customers.first_name, customers.last_name, ship_date, books.title FROM shipments JOIN customers ON customers.id = shipments.customer_id JOIN editions ON editions.isbn = shipments.isbn LEFT JOIN books ON books.id = editions.book_id ORDER BY ship_date ASC

Grouping and Counting

1.Get the COUNT of all books
A:SELECT COUNT(*) FROM books;

2.Get the COUNT of all Locations
A:SELECT COUNT(subjects.location) FROM subjects;

3.Get the COUNT of each unique location in the subjects table. Display the count and the location name. (hint: requires GROUP BY).
A: SELECT COUNT(DISTINCT location), location FROM subjects GROUP BY location;
** not revealing count correctly use having

4.List all books. Display the book_id, title, and a count of how many editions each book has. (hint: requires GROUP BY and JOIN)
A: SELECT books.id, title, COUNT(edition) from books LEFT JOIN editions ON editions.book_id = books.id GROUP BY books.id
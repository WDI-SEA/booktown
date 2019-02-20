Order
Find all subjects sorted by subject
    SELECT * FROM subjects;
Find all subjects sorted by location
    SELECT * FROM subjects ORDER BY location;



Where
Find the book "Little Women"
    SELECT * FROM books WHERE title='Little Women';
Find all books containing the word "Python"
    SELECT * FROM books WHERE title LIKE 'Python%' OR title LIKE '%Python' OR title LIKE '%Python%';
Find all subjects with the location "Main St" sort them by subject
    SELECT * FROM subjects WHERE location='Main St' ORDER BY subject;



Joins
Find all books about Computers and list ONLY the book titles
    SELECT title FROM subjects JOIN books ON subjects.id = books.subject_id WHERE subjects.id = 4;
Find all books and display a result table with ONLY the following columns
    Book title
    Author's first name
    Author's last name
    Book subject
    SELECT books.title, subjects.subject, authors.last_name, authors.first_name FROM subjects JOIN books ON subjects.id = books.subject_id JOIN authors ON books.author_id = authors.id;
Find all books that are listed in the stock table
    Sort them by retail price (most expensive first)
    Display ONLY: title and price
    SELECT books.title, stock.retail FROM books JOIN editions ON editions.book_id = books.id JOIN stock ON stock.isbn = editions.isbn ORDER BY stock.retail DESC;
Find the book "Dune" and display ONLY the following columns
    Book title
    ISBN number
    Publisher name
    Retail price
    SELECT books.title, stock.isbn, stock.retail, publishers.name FROM books JOIN editions ON books.id = editions.book_id JOIN stock ON editions.isbn = stock.isbn JOIN publishers ON publishers.id = editions.publisher_id WHERE books.title='Dune';
Find all shipments sorted by ship date display a result table with ONLY the following columns:
    Customer first name
    Customer last name
    ship date
    book title
    SELECT books.title, shipments.ship_date, customers.last_name, customers.first_name FROM books JOIN editions ON books.id = editions.book_id JOIN shipments ON shipments.isbn = editions.isbn JOIN customers ON shipments.customer_id = customers.id ORDER BY shipments.ship_date;



Grouping and Counting
Get the COUNT of all books
    SELECT COUNT(*) FROM books;
Get the COUNT of all Locations
    SELECT COUNT(subjects.location) FROM subjects;
Get the COUNT of each unique location in the subjects table. Display the count and the location name. (hint: requires GROUP BY).
    SELECT location, COUNT(location) FROM subjects GROUP BY location;
List all books. Display the book_id, title, and a count of how many editions each book has. (hint: requires GROUP BY and JOIN)
    SELECT location, COUNT(location) FROM subjects GROUP BY location;
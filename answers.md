## Order

1. Find all subjects sorted by subject

    `SELECT * 
    FROM subjects 
    ORDER BY subjects;`

2. Find all subjects sorted by location

    `SELECT * 
    FROM subjects 
    ORDER BY location;`

## Where

1. Find the book "Little Women"

    `SELECT * 
    FROM books 
    WHERE title = 'Little Women';`

2. Find all books containing the word "Python"

    `SELECT * 
    FROM books 
    WHERE title 
    LIKE '%Python%';`

3. Find all subjects with the location "Main St" sort them by subject

    `SELECT * 
    FROM subjects 
    WHERE location = 'Main St' 
    ORDER BY location DESC;`

## Joins

1. Find all books about Computers list ONLY book title

    `SELECT books.title 
    FROM books 
    INNER JOIN subjects 
    ON subjects.subject='Computers';`

2. Find all books and display ONLY
    - Book title
    - Author's first name
    - Author's last name
    - Book subject

    `SELECT books.title, authors.first_name, authors.last_name, subjects.subject
    FROM books
    JOIN authors
    ON authors.id = books.author_id
    JOIN subjects
    ON books.subject_id = subjects.id`

3. Find all books that are listed in the stock table
    - Sort them by retail price (most expensive first)
    - Display ONLY: title and price
    `SELECT books.title, stock.retail
    FROM stock
    JOIN editions
    ON stock.isbn = editions.isbn
    JOIN books
    ON editions.book_id = books.id
    ORDER BY stock.retail DESC;`

4. Find the book "Dune" and display ONLY
    - Book title
    - ISBN number
    - Publisher name
    - Retail price

    `SELECT DISTINCT books.title, editions.isbn, publishers.name, stock.retail
    FROM books
    JOIN editions
    ON books.id = editions.book_id
    JOIN publishers
    ON publishers.id = editions.publisher_id
    JOIN stock
    ON editions.isbn = stock.isbn
    WHERE books.title = 'Dune'
    -- note: this returns two distict 'Dune' editions`

5. Find all shipments sorted by ship date display ONLY:
    - Customer first name
    - Customer last name
    - ship date
    - book title

    `SELECT customers.first_name, customers.last_name, shipments.ship_date, books.title
    FROM shipments
    JOIN editions
    ON shipments.isbn = editions.isbn
    JOIN customers
    ON customers.id = shipments.customer_id
    JOIN books
    ON editions.book_id = books.id`


## Grouping and Counting

1. Get the COUNT of all books

    `SELECT COUNT(*) FROM books;`

2. Get the COUNT of all Locations

    `SELECT COUNT(location) FROM subjects;`

3. Get the COUNT of each unique location in the subjects table. Display the count and the location name. (hint: requires GROUP BY).
4. List all books. Display the book_id, title, and a count of how many editions each book has. (hint: requires GROUP BY and JOIN)
-- -- ANSWERS
-- ## Queries

-- Complete the following exercises to practice using SQL.

-- ### Order
-- * Find all subjects sorted by subject

SELECT * FROM subjects ORDER BY subject;

-- * Find all subjects sorted by location

SELECT * FROM subjects ORDER BY location;

-- ### Where
-- * Find the book "Little Women"

SELECT * FROM books WHERE title = 'Little Women';

-- * Find all books containing the word "Python"
SELECT * FROM books WHERE title LIKE '%Python%';

-- * Find all subjects with the location "Main St" sort them by subject

SELECT * FROM subjects WHERE location = 'Main St' ORDER BY subject;


-- ### Joins

-- * Find all books about Computers and list ONLY the book titles

SELECT title FROM books, subjects WHERE subject = 'Computers' AND books.subject_id = subjects.id;

-- * Find all books and display a result table with ONLY the following columns
    --   * Book title
    --   * Author's first name
    --   * Author's last name
    --   * Book subject

SELECT
  books.title, authors.first_name, authors.last_name, subjects.subject
FROM
  books, authors, subjects
WHERE
  books.author_id = authors.id
  AND books.subject_id = subjects.id;

-- * Find all books that are listed in the stock table
    --   * Sort them by retail price (most expensive first)
    --   * Display ONLY: title and price
SELECT
      books.title, stock.retail
FROM
      books, editions, stock
WHERE
      books.id = editions.book_id
      AND editions.isbn = stock.isbn
ORDER BY
      retail DESC;


-- * Find the book "Dune" and display ONLY the following columns
      --   * Book title
      --   * ISBN number
      --   * Publisher name
      --   * Retail price
SELECT
  books.title, editions.isbn, publishers.name, stock.retail
FROM
  books, editions, publishers, stock
WHERE
  books.title = 'Dune'
  AND books.id=editions.book_id
  AND editions.isbn = stock.isbn
  AND editions.publisher_id = publishers.id;

-- * Find all shipments sorted by ship date display a result table with ONLY the following columns:
      --   * Customer first name
      --   * Customer last name
      --   * ship date
      --   * book title

SELECT
  customers.first_name, customers.last_name, shipments.ship_date, books.title
FROM
  customers, shipments, books, editions
WHERE
  books.id = editions.book_id
  AND editions.isbn = shipments.isbn
  AND shipments.customer_id = customers.id
ORDER BY
  shipments.ship_date;

-- ### Grouping and Counting

-- * Get the COUNT of all books

SELECT
  COUNT(DISTINCT books)
FROM
  books;



-- * Get the COUNT of all Locations
SELECT
  COUNT(DISTINCT location)
FROM
  subjects;


-- * Get the COUNT of each unique location in the subjects table. Display the count and the location name. (hint: requires GROUP BY).

SELECT
  location, COUNT(location)
FROM
  subjects
GROUP BY
  location;

-- * List all books. Display the book_id, title, and a count of how many editions each book has. (hint: requires GROUP BY and JOIN)


SELECT
  books.id, books.title, COUNT(editions.book_id)
FROM
  books, editions
WHERE
  books.id = editions.book_id
GROUP BY
  books.id;
-- #### YAY! You're done!!

######### Booktown deliverable answers #########


######### ######### Order ######### #########


1. Find all subjects sorted by subject 

  SELECT subject FROM subjects
  ORDER BY subject ASC;


2. Find all subjects sorted by location

  SELECT subject FROM subjects
  ORDER BY location ASC;


######### ######### Where ######### #########


1. Find the book "Little Women"


  SELECT title FROM books
  WHERE title = 'Little Women';


2. Find all books containing the word "Python"


  SELECT title FROM books
  WHERE title ILIKE '%python%';


3. Find all subjects with the location "Main St" sort them by subject


  SELECT subject FROM subjects
  WHERE location = 'Main St'
  ORDER BY subject ASC;


######### ######### Joins ######### #########


1. Find all books about Computers list ONLY book title


  SELECT books.title FROM books
  INNER JOIN subjects 
  ON books.subject_id = subjects.id
  WHERE subjects.id = 4;


2. Find all books and display ONLY:

  * Book title
  * Author's first name
  * Author's last name
  * Book subject


  SELECT books.title, authors.first_name, authors.last_name, subjects.subject FROM books
  INNER JOIN authors
  ON books.author_id = authors.id
  INNER JOIN subjects
  ON books.subject_id = subjects.id;


3. Find all books that are listed in the stock table:
 
  * Sort them by retail price (most expensive first)
  * Display ONLY: title and price


  SELECT books.title, stock.retail FROM books
  INNER JOIN editions
  ON books.id = editions.book_id
  INNER JOIN stock
  ON editions.isbn = stock.isbn
  ORDER BY stock.retail DESC;


4. Find the book "Dune" and display ONLY:

  * Book title
  * ISBN number
  * Publisher name
  * Retail price

  
  SELECT books.title, editions.isbn, publishers.name, stock.retail FROM books                    
  INNER JOIN editions
  ON books.id = editions.book_id
  INNER JOIN publishers
  ON editions.publisher_id = publishers.id
  INNER JOIN stock
  ON editions.isbn = stock.isbn
  WHERE books.title ILIKE 'Dune';


5. Find all shipments sorted by ship date display ONLY:

  * Customer first name
  * Customer last name
  * Ship date
  * Book title

  
  SELECT customers.first_name, customers.last_name, shipments.ship_date, books.title FROM customers
  INNER JOIN shipments
  ON customers.id = shipments.customer_id
  INNER JOIN editions
  ON shipments.isbn = editions.isbn
  INNER JOIN books
  ON editions.book_id = books.id
  ORDER BY shipments.ship_date;



######### ######### Grouping and Counting #########


1. Get the COUNT of all books

  SELECT COUNT(*) FROM books;


2. Get the COUNT of all Locations

  SELECT COUNT(DISTINCT subjects.location) FROM subjects;


3. Get the COUNT of each unique location in the subjects table. Display the count and the location name. (hint: requires GROUP BY).

  SELECT COUNT(subjects.location), subjects.location FROM subjects
  GROUP BY subjects.location
  HAVING count(subjects.location) > 0;


4. List all books. Display the book_id, title, and a count of how many editions each book has. (hint: requires GROUP BY and JOIN)

  SELECT books.id, books.title, COUNT(editions.edition) FROM books
  INNER JOIN editions
  ON books.id = editions.book_id
  GROUP BY books.id, books.title
  ORDER BY books.id ASC;
ORDER:

select subject from subjects ORDER BY subject;

select location from subjects;

WHERE:

select title from books where title='Little Women';

select title from books where title like '%Python%';

select location from subjects where location like 'Main St' ORDER BY subject;

JOIN:

select title from public.books join subjects on subjects.id = public.books.subject_id where subjects.subject = 'Computers';

select title, first_name, last_name, subject from books join authors on books.author_id = authors.id join subjects on books.subject_id = subjects.id;

select title, retail from books join editions on books.id = editions.book_id join stock on editions.isbn = stock.isbn order by retail desc;

select title, editions.isbn, name, retail from books
  join editions on books.id = editions.book_id join publishers on editions.publisher_id = publishers.id
  join stock on editions.isbn = stock.isbn where title like 'Dune';

select first_name, last_name, ship_date, title from customers
  join shipments on customers.id = shipments.customer_id
  join editions on editions.isbn = shipments.isbn

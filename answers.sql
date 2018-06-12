
-- Order
select subject from subjects order by subject;
select subject, location  from subjects order by location;

-- Where
select * from books where title='Little Women';
select * from books where title like '%Python%';
select subject from subjects where location='Main St' order by subject;

-- Joins
select title from books join subjects on books.subject_id = subjects.id where subjects.id=4;
select title, first_name, last_name, subject from books join authors on books.author_id = authors.id join subjects on  books.subject_id = subjects.id;
select title, retail from books join editions on books.id = editions.book_id join stock on editions.isbn = stock.isbn order by retail desc;

select title, editions.isbn, name, retail from books 
    join editions on books.id = editions.book_id 
    join stock on editions.isbn = stock.isbn 
    join publishers on editions.publisher_id = publishers.id
where title = 'Dune';

select first_name, last_name, ship_date, title from shipments
    join editions on shipments.isbn = editions.isbn
    join customers on shipments.customer_id = customers.id
    join books on editions.book_id = books.id
order by ship_date;

-- Grouping & Counting
select count(*) from books;
select count(location) from subjects;
select distinct location, count(location) from subjects group by location order by count(location) desc; --added the 'order by' to push the null count of 0 to the end

select books.id, title, count(editions.edition) from books 
    join editions on books.id = editions.book_id 
group by books.id; 
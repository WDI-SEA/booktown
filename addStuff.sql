select subject from subjects;
select location from subjects;
select * from books where title= 'Little Women';
select * from books where title like '%Python%';
select * from subjects where location like '%Main St%' order by subject asc;
select * from books b join subjects s on b.subject_id = s.id where subject = 'Computers';
select title from books;
select * from books b join authors a on b.author_id = a.id;
select first_name from authors; haha oops not what you wanted
select last_name from authors; haha oops not what you wanted
select title, last_name, first_name, subject from books b join authors a on b.author_id = a.id join subjects s on b.subject_id = s.id;
select title, retail from books b join editions e on b.id = e.book_id join stock s on e.isbn = s.isbn;
select title, e.isbn, name, retail from books b join editions e on b.id = e.book_id join stock s on s.isbn = e.isbn join publishers p on p.id = e.publisher_id;

select title, e.isbn, name, retail from books b join editions e on b.id = e.book_id 
join stock s on s.isbn = e.isbn 
join publishers p on p.id = e.publisher_id where title= 'Dune';

select first_name, last_name, s.ship_date, title from customers c join shipments s on c.id = s.customer_id join editions e on e.isbn = s.isbn join books b on b.id = e.book_id order by ship_date asc;
select count(*) from books;
select count(location) from subjects;
select count(distinct location) from subjects;
select location,  count(distinct location) from subjects group by location;
select title, book_id, count(edition) from books b join editions e on b.id = e.book_id group by title, book_id;

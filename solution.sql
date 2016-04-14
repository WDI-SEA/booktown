--ORDER
select * from subjects order by subject asc;

select * from subjects order by location asc;

--WHERE
select * from books where title = 'Little Women';

select * from books where title like '%Python%';

select * from subjects where location = 'Main St' order by subject asc;

--JOIN
select title from books b 
join subjects s on b.subject_id = s.id 
where subject = 'Computers';

select title, first_name, last_name, subject from books b 
join subjects s on b.subject_id = s.id 
join authors a on b.author_id = a.id;

select title, retail from books b 
join editions e on b.id = e.book_id 
join stock s on e.isbn = s.isbn 
order by retail desc;

select title, e.isbn, name, retail from books b
join editions e on b.id = e.book_id
join publishers p on e.publisher_id = p.id
join stock s on e.isbn = s.isbn
where title = 'Dune';

select first_name, last_name, ship_date, title from shipments s
join customers c on s.customer_id = c.id
join editions e on s.isbn = e.isbn
join books b on e.book_id = b.id;

--COUNT
select count(*) from books;

select count(location) from subjects;

select location, count(location) from subjects group by location;

select book_id, title, count(book_id) from editions e
join books b on e.book_id = b.id
group by book_id, title;
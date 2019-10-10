Orders
select * from subjects order by subjects;

select * from subjects order by location;

Where
select * from books where title= 'Little Women';

select title from books where title like '%Python%';

select * from subjects where location ='Main St';



Joins 
#1
SELECT subject, title FROM subjects JOIN books ON subjects.id = books.subject_id where books.subject_id = 4;

#2
SELECT b.title, a.first_name, a.last_name, s.subject FROM books b JOIN authors a ON b.author_id = a.id JOIN subjects s ON s.id = b.subject_id;

#3
select s.retail, b.title from stock s JOIN editions e ON s.isbn = e.isbn JOIN books b ON b.id = e.book_id;

select s.retail, b.title from stock s JOIN editions e ON s.isbn = e.isbn JOIN books b ON b.id = e.book_id ORDER BY retail;

#4
select b.title, s.isbn, s.retail, p.name from books b join editions e on b.id = e.book_id  join stock s on e.isbn = s.isbn join publishers p on e.publisher_id = p.id where b.id = 4513;

#5
select c.first_name, c.last_name, s.ship_date, b.title from shipments s join customers c on s.customer_id = c.id join editions e on e.isbn = s.isbn join books b on b.id = e.book_id;


Count:

select count(*) from books;

select count(location) from subjects;

select location, count(location) from subjects group by location;

select b.id, b.title, count(edition) from books b JOIN editions e on b.id = e.book_id group by b.id;
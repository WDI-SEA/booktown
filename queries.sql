-- Order --
select *
from subjects
order by subject


select *
from subjects
order by location


-- Where --
select * 
from books
where title = 'Little Women'


select * 
from books
where title like '%Python%'


select * 
from subjects
where location = "Main St"
order by subject


-- Joins --
select b.title 
from books as b
join subjects as s
  on b.subject_id = s.id
where s.subject = 'Computers'
order by title


select title
, a.first_name
, a.last_name
, s.subject
from books as b
join authors as a
  on a.id = b.author_id
join subjects as s
  on s.id = b.subject_id
order by title


select title
, a.first_name
, a.last_name
, s.subject
from books as b
join authors as a
  on a.id = b.author_id
join subjects as s
  on s.id = b.subject_id
order by title


select b.title
, s.retail
from books as b
join editions as e
  on e.book_id = b.id
join stock as s
  on s.isbn = e.isbn
order by retail desc 


select b.title
, e.isbn
, p.name
from books as b
join editions as e
  on e.book_id = b.id
join publishers as p
  on p.id = e.publisher_id


select c.first_name
, c.last_name
, cast(s.ship_date as date)
, b.title
from shipments as s
join customers as c
  on c.id = s.customer_id
join editions as e
  on e.isbn = s.isbn
join books as b
  on b.id = e.book_id
order by first_name


-- Grouping & Counting --

select count(*)
from books


select count( distinct location)
from subjects


select location
, count(subject) as subjectCount
from subjects
group by location


select b.id
, b.title
, count(e.edition) as editions
from books as b
join editions as e
  on e.book_id = b.id
group by id, title

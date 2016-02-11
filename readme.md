
##Order
1. Find all subjects sorted by subject
	select subject from subjects order by subject;

2. Find all subjects sorted by location
	select subject from subjects order by location;  

##Where
1. Find the book "Little Women"
	select * from books where title in ('Little Women’);

2. Find all books containing the word "Python"
	select * from books where title ilike '%Python%’;

3. Find all subjects with the location "Main St" sort them by subject
	select subject from subjects where location='Main St' order by subject;


##Joins

* Find all books about Computers list ONLY book title
	select title from subjects s 
	join books b on b.subject_id= s.id where subject ='Computers’;

* Find all books and display ONLY
	* Book title
	* Author's first name
	* Author's last name
	* Book subject

		select b.title, a.first_name, a.last_name, s.subject from books b 
		join subjects s on b.subject_id = s.id 
		join authors a on a.id = b.author_id;

* Find all books that are listed in the stock table
	* Sort them by retail price (most expensive first)
	* Display ONLY: title and price

		select books.title, stock.retail from stock
		join editions on editions.isbn = stock.isbn
		join books on editions.book_id = books.id
	 	order by stock.retail desc;

* Find the book "Dune" and display ONLY
	* Book title
	* ISBN number
	* Publisher name
	* Retail price

		select b.title, e.isbn, p.name, s.retail from books b 
		join editions e on b.id = e.book_id 
		join stock s on s.isbn = e.isbn 
		join publishers p on p.id = e.publisher_id where b.title = 'Dune';

* Find all shipments sorted by ship date display ONLY:
	* Customer first name
	* Customer last name
	* ship date
	* book title

		select c.first_name, c.last_name, s.ship_date, b.title from books b 
		join editions e on b.id = e.book_id 
		join shipments s on s.isbn = e.isbn 
		join customers c on c.id = s.customer_id order by s.ship_date;

##Grouping and Counting

1. Get the COUNT of all books
	select count(*) from books;

* Get the COUNT of all Locations
	select count(location) from subjects;

* Get the COUNT of each unique location in the subjects table. Display the count and the location name. (hint: requires GROUP BY).
		select location, count(location) from subjects group by location;

* List all books. Display the book_id, title, and a count of how many editions each book has. (hint: requires GROUP BY and JOIN)
		select b.id, b.title, count(e.edition) from books b 
		join editions e on e.book_id = b.id group by b.id;



####YAY! You're done!!

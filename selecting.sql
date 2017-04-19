Selecting specific data
Not equal - <>
-- - LIKE -
SELECT * FROM students WHERE name LIKE '%';

-- - DISTINCT -
SELECT DISTINCT name FROM students;

-- - ORDER BY -
SELECT * FROM students ORDER BY name DESC;

-- - COUNT -
SELECT count(*) FROM students;

-- - MAX -
SELECT max(age) FROM students;


-- - MIN -
SELECT min(age) FROM students;

-- - AND -
SELECT * from students WHERE name = 'Elie' AND age = 26;

-- - OR -
SELECT * from students WHERE name = 'Elie' OR name ='Mary';

-- - IN -
SELECT * FROM students WHERE name IN ('Bob', 'Tom');

-- - NOT IN -
SELECT * FROM students WHERE name NOT IN ('Bob', 'Tom');

-- - LIMIT -
SELECT * FROM students LIMIT 2;
-- ex:) SELECT * movie_name FROM movie ORDER BY rating DESC LIMIT 1;

-- - OFFSET -
SELECT * FROM students OFFSET 1;

-- - LIMIT + OFFSET -
SELECT * FROM students LIMIT 2 OFFSET 1;

-- - % -
SELECT * FROM students WHERE name LIKE '%b';


-- ********************GROUP BY*************************************

-- We use an aggregate function to get the total count of movies in a table.
SELECT COUNT(*) FROM movies;

-- What about getting the count of something more specific in movies, such as the count of each rating?
SELECT COUNT(rating) FROM movies;

-- We get the same result. GROUP BY allows you to 'group' the table by a specific attribute, which is then provided to the aggregate function.
SELECT rating, COUNT(rating) FROM movies
GROUP BY rating;


-- ***************************NESTED SQL STATEMENTS****************
SELECT movie_name FROM movie WHERE rating = (
    SELECT MAX (RATING) FROM movie)


-- ******Alter Table Command***********


ALTER TABLE books ADD CONSTRAINT author_id
FOREIGN KEY (author_id) REFERENCES authors (author_id)
ON DELETE NO ACTION;

ALTER TABLE books ADD COLUMN year_released INTEGER;

ALTER TABLE books ALTER COLUMN name SET NOT NULL;
;

-- *********** Easier to add Constraints when creating a table**************
DROP TABLE books;
CREATE TABLE books (
   book_id SERIAL PRIMARY KEY,
   name VARCHAR(100) NOT NULL,
   author_id INTEGER REFERENCES authors(author_id)
);

-- ********Nested queries*************
-- What if I want to do something very specific, but I need to get groups of results? For example:
-- 1.Get titles of movies with the highest ratings.
-- 2.Get titles of movies with the lowest ratings.
-- Let's try it using WHERE:
SELECT title FROM movies
WHERE rating = MAX(rating);
-- That will give us an error, because MAX is an aggregate function and can't be used in WHERE.
-- Solution: Nested queries.
SELECT MAX(rating) FROM movies;

-- This will return the maximum rating, which we need to feed into WHERE.

SELECT title FROM movies
WHERE rating = (
   SELECT MAX(rating) FROM movies
);


-- *******ALIAS*******
-- Aliases are a piece of a SQL query that allows you to temporarily rename a table or column for the current query. This is useful for creating shorthand names for tables when using table prefixes, renaming columns, or differentiating tables when you join the same table more than once in a query (eliminating ambiguity).

#

SELECT
   users.userID AS 'change_to_new_id_name',
   users.username AS 'name'
FROM users;

----
SELECT * FROM authors a
   INNER JOIN books b
       ON a.author_id = b.author_id
ORDER BY a.author_id ASC;

--

SELECT * FROM crew
   LEFT JOIN users photographer
       ON crew.fk_photographer = photographer.userID
   LEFT JOIN users director
       ON crew.fk_director = director.userID
   LEFT JOIN users model
       ON crew.fk_model = model.userID
ORDER BY crew.crewID ASC;

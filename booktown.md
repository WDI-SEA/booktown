booktown=# \d
booktown=# SELECT * FROM title;
ERROR:  relation "title" does not exist
LINE 1: SELECT * FROM title;
                      ^
LINE 1: SELECT * FROM books WHERE name = 'Little Women';

booktown=# SELECT * FROM books WHERE title = 'Python';


booktown=# \d subjects

Indexes:
    "subjects_pkey" PRIMARY KEY, btree (id)

booktown-# SELECT * FROM subjects WHERE location = 'Main St';

booktown=# SELECT * FROM subjects WHERE location = 'Main St';

ERROR:  relation "subject" does not exist
LINE 1: SELECT * FROM subject ORDER BY location DESC\

Indexes:
    "books_id_pkey" PRIMARY KEY, btree (id)
    "books_title_idx" btree (title)

booktown=# SELECT * FROM books;


booktown=# SELECT books.title FROM books 
booktown-# ;

booktown=# SELECT books.title FROM books
booktown-# INNER JOIN subjects on books.subjects_id = subjects.id;
ERROR:  column books.subjects_id does not exist
LINE 2: INNER JOIN subjects on books.subjects_id = subjects.id;
                               ^
HINT:  Perhaps you meant to reference the column "books.subject_id".
booktown=# SELECT books.title FROM books                                                                                                                                                                    INNER JOIN subjects on books.subject_id = subjects.id;
            title            



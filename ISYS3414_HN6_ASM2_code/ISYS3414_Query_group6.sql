/* select students who are from different major */
SELECT * FROM Renter WHERE role = 'student' AND major = 'IT';
SELECT * FROM Renter WHERE role = 'student' AND major = 'Communication';
SELECT * FROM Renter WHERE role = 'student' AND major = 'Business';
SELECT * FROM Renter WHERE role = 'student' AND major = 'Design Studies';

/* select teachers who are from different profession */
SELECT * FROM Renter WHERE role = 'teacher' AND major = 'IT';
SELECT * FROM Renter WHERE role = 'teacher' AND major = 'Communication';
SELECT * FROM Renter WHERE role = 'teacher' AND major = 'Business';
SELECT * FROM Renter WHERE role = 'teacher' AND major = 'Design Studies';

/* select books which is related to IT or coding */
SELECT * 
FROM Book 
WHERE book_id LIKE '%it%';

/* display the most issued book */
SELECT title, count(title) as rent_num
FROM issue
GROUP BY title
HAVING count(title) > 1
ORDER BY rent_num DESC;

/* display number of rented book in each category */
SELECT category, count(category)
FROM book
GROUP BY category;

/* display people with the smallest quantity of books available for rent */
SELECT renter_name, max_books_issued, max_days_issued
FROM renter
WHERE max_books_issued <= 2
ORDER BY max_books_issued, max_days_issued;

/* display percentages of each staff position */
SELECT position, round(count(*) * 100.0 / (select count(*) from staff), 2)
FROM staff
GROUP BY position;

/* display average time for a renter to return a book */
SELECT  title, AVG(duration)
FROM issue
GROUP BY title
ORDER BY AVG(duration);

/* display renter as students */
SELECT * 
FROM Issue
WHERE role LIKE '%stu%';

/* display renter as teacher */
SELECT * 
FROM Issue
WHERE role NOT LIKE '%stu%';

/* display top fast readers */
SELECT * 
FROM Isuue
WHERE duration <= 10;
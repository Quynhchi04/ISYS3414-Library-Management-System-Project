CREATE DATABASE Library;

USE Library;

CREATE TABLE Book(
	book_id varchar(155) PRIMARY KEY,
    title varchar(155),
    author varchar(155),
    category varchar(155),
    book_number_copies int,
    INDEX(book_id),
    INDEX(title)
);

CREATE TABLE Staff(
	ID varchar(30) PRIMARY KEY UNIQUE,
    staff_name varchar(100) NOT NULL,
    position varchar(30) NOT NULL,
    work_day date NOT NULL,
	shift VARCHAR(50) NOT NULL
);

CREATE TABLE Donation(
	donate_id varchar(155) PRIMARY KEY,
    donator varchar(155),
    book_id varchar(155),
    day_number date,
    contact_number int,
    FOREIGN KEY (book_id) REFERENCES Book(book_id)
);

INSERT INTO Book VALUES
	('bs1', 'The Lean Startup', 'Eric Ries', 'Business', 1),
	('bs2', 'Good to Great', 'Jim Collins', 'Business', 1),
    ('cm1', 'Understanding Media: The Extensions of Man', 'Marshall McLuhan', 'Communication', 1),
    ('cm2', 'Media Control: The Spectacular Achievements of Propaganda', 'Noam Chomsky', 'Communication', 1),
    ('cm3', 'Amusing Ourselves to Death', 'Neil Postman', 'Communication', 1),
    ('ds1', 'The Design of Everyday Things', 'Don Norman', 'Design Studies', 1),
    ('ds2', 'Don\'t Make Me Think, Revisited: A Common Sense Approach to Web Usability', 'Steve Krug', 'Design Studies', 1),
    ('it1', 'Code Complete: A Practical Handbook of Software Construction', 'Steve McConnell', 'IT', 1),
    ('it2', 'The Clean Coder: A Code of Conduct for Professional Programmers', 'Robert C. Martin', 'IT', 2),
    ('it3', 'The Clean Coder: A Code of Conduct for Professional Programmers', 'Robert C. Martin', 'IT', 2);

INSERT INTO Staff VALUES 
('sjs1', 'Nicholas Santos', 'Janitor', '2023-05-05', '08:00 - 12:00'),
('sjs2', 'Rosemary Stevenson', 'Janitor', '2023-05-06', '12:00 - 16:00'),
('sjs3', 'Lyla Foster', 'Janitor', '2023-05-07', '08:00 - 16:00'),
('sjs4', 'Stuart Combs', 'Security', '2023-05-05', '08:00 - 12:00'),
('sjs5', 'Delilah Carpenter', 'Security', '2023-05-06', '12:00 - 16:00'),
('sm1', 'Antonia Marshall', 'Manager', '2023-05-05', '08:00 - 12:00'),
('sm2', 'Greta Huff', 'Manager', '2023-05-06', '08:00 - 16:00'),
('sm3', 'Candice Hebert', 'Manager', '2023-05-07', '12:00 - 16:00'),
('sl1', 'Elizabeth Clay', 'Librarian', '2023-05-05', '08:00 - 12:00'),
('sl2', 'Conor Lee', 'Librarian', '2023-05-06', '12:00 - 16:00'),
('sl3', 'Robyn Bean', 'Librarian', '2023-05-07', '12:00 - 16:00'),
('sl4', 'Levi Raymond', 'Librarian', '2023-05-07', '08:00 - 12:00');


INSERT INTO Donation VALUES
    ('d1', 'Kenny Snyder', 'bs2', '2023-04-27', '0838297210'),
    ('d2', 'Flora Mckee', 'bs2', '2023-04-20', '0838220178'),
    ('d3', 'Chad Sims', 'cm1', '2023-01-12', '0437345515'),
    ('d4', 'Ria Wood', 'cm2', '2023-03-30', '0438282609'),
    ('d5', 'Annie Phillips', 'cm3', '2023-4-1', '0838479180');
    
    
CREATE TABLE Renter(
	renter_id VARCHAR(30) PRIMARY KEY UNIQUE,
    renter_name VARCHAR(100) NOT NULL,
    major VARCHAR(50),
    max_books_issued int,
    max_days_issued int,
    role VARCHAR(50),
    INDEX(renter_id),
    INDEX(renter_name)
);

INSERT INTO Renter VALUES
	('t1','Spencer Paul','IT',6,240,'teacher'),
	('t2','Freddie Hahn','IT',5,200,'teacher'),
	('t3','Jaden Jordan','Business',1,40,'teacher'),
	('t4','Lester Gordon','Design Studies',3,120,'teacher'),
	('t5','Linda Nguyen','Communication',4,160,'teacher'),
	('t6','Spencer Sam','IT',2,80,'teacher'),
	('t7','Davidson','IT',6,240,'teacher'),
	('t8','Kyle','Business',4,160,'teacher'),
	('t9','Aaron Gordon','Design Studies',0,0,'teacher'),
	('t10','Chi linda','Communication',1,40,'teacher'),
	('t11','Raphael','IT',3,120,'teacher'),
	('t12','Hanna','IT',2,80,'teacher'),
	('t13','Scotty','Business',5,200,'teacher'),
	('t14','Jame madison','Design Studies',2,80,'teacher'),
	('t15','Huynh Anna','Communication',6,240,'teacher'),
	('stu1','Marshall Moran','IT',5,150,'student'),
	('stu2','Danny Gilmore','Communication',2,60,'student'),
	('stu3','Stephanie Olson','Business',3,90,'student'),
	('stu4','Riley Mathis','Design Studies',4,120,'student'),
	('stu5','Jenna Davies','Communication',1,30,'student'),
	('stu6','Jack Arrow','IT',2,60,'student'),
	('stu7','Danny Jackson','Communication',5,150,'student'),
	('stu8','Stephanie Mandy','Business',4,120,'student'),
	('stu9','Jenny','Design Studies',1,30,'student'),
	('stu10','Jenna Tris','Communication',5,150,'student'),
	('stu11','Max Morgan','IT',2,60,'student'),
	('stu12','Danny Faker','Communication',4,120,'student'),
	('stu13','Stephanie Lulu','Business',3,90,'student'),
	('stu14','Riley Ahri','Design Studies',5,150,'student'),
	('stu15','Jenna Darius','Communication',1,30,'student');

CREATE TABLE Issue(
	issue_id VARCHAR(50) PRIMARY KEY UNIQUE NOT NULL,
    renter_id VARCHAR(50) NOT NULL,
    FOREIGN KEY (renter_id) REFERENCES Renter(renter_id),
    renter_name VARCHAR(55) NOT NULL,
	FOREIGN KEY (renter_name) REFERENCES Renter(renter_name),   
    book_id VARCHAR(55) NOT NULL,
    FOREIGN KEY (book_id) REFERENCES Book(book_id),
    title VARCHAR(150),
    FOREIGN KEY (title) REFERENCES Book(title),
    issue_date DATE NOT NULL,
    duration int NOT NULL,
    INDEX(issue_id),
    INDEX(renter_id),
    INDEX(renter_name),
    INDEX(book_id),
    INDEX(title),
    INDEX(issue_date)
);

INSERT INTO Issue VALUES
	('i1', 'stu1', 'Marshall Moran', 'it1', 'Code Complete: A Practical Handbook of Software Construction', '2023-04-01', 8),
	('i2', 'stu2', 'Danny Gilmore', 'cm1', 'Understanding Media: The Extensions of Man', '2023-02-23', 38),
	('i3', 'stu3', 'Stephanie Olson', 'bs2', 'Good to Great', '2023-04-14', 10),
	('i4', 'stu4', 'Riley Mathis', 'ds2', "Don't Make Me Think, Revisited: A Common Sense Approach to Web Usability", '2023-02-14', 25),
	('i5', 'stu5', 'Jenna Davies', 'cm2', 'Media Control: The Spectacular Achievements of Propaganda', '2023-01-26', 20),
	('i6', 't1', 'Spencer Paul', 'it2', 'The Clean Coder: A Code of Conduct for Professional Programmers', '2023-02-15', 33),
	('i7', 't2', 'Freddie Hahn', 'it3', 'The Clean Coder: A Code of Conduct for Professional Programmers', '2023-04-24', 7),
	('i8', 't3', 'Jaden Jordan', 'bs1', 'The Lean Startup', '2023-01-11', 31),
	('i9', 't4', 'Lester Gordon', 'ds2', "Don't Make Me Think, Revisited: A Common Sense Approach to Web Usability", '2023-03-29', 29),
	('i10', 't5', 'Linda Nguyen', 'cm3', 'Amusing Ourselves to Death', '2023-03-30', 13),
	('i11', 't1', 'Spencer Paul', 'it1', 'Code Complete: A Practical Handbook of Software Construction', '2023-04-17', 4),
	('i12', 'stu6', 'Jack Arrow', 'cm3', 'Amusing Ourselves to Death', '2023-03-22', 47),
	('i13', 't6', 'Spencer Sam', 'bs2', 'Good to Great', '2023-04-28', 5),
	('i14', 't7', 'Davidson', 'it1', 'Code Complete: A Practical Handbook of Software Construction', '2023-01-03', 51),
	('i15', 'stu7', 'Danny Jackson', 'cm2', 'Media Control: The Spectacular Achievements of Propaganda', '2023-03-23', 18);

CREATE TABLE Fine(
    issue_id VARCHAR(155) PRIMARY KEY ,
	renter_id VARCHAR(155),
    FOREIGN KEY (renter_id) REFERENCES Issue(renter_id),
    renter_name VARCHAR(55),
    FOREIGN KEY (renter_name) REFERENCES Issue(renter_name),
	book_id VARCHAR(55),
    FOREIGN KEY(book_id) REFERENCES Issue(book_id),
    title VARCHAR(150),
    FOREIGN KEY(title) REFERENCES Issue(title),
	issue_date DATE,
    FOREIGN KEY (issue_date) REFERENCES Issue(issue_date),
    day_late INT,
    fee INT
);

INSERT INTO Fine VALUES
  ('i2','stu2','Danny Gilmore','cm1','Understanding Media: The Extensions of Man','2023-02-23',8,40),
  ('i6','t1','Spencer Paul','it2','The Clean Coder: A Code of Conduct for Professional Programmers','2023-02-15',3,15),
  ('i8','t3','Jaden Jordan','bs1','The Lean Startup','2023-01-11',1,5),
  ('i12','stu6','Jack Arrow','cm3','Amusing Ourselves to Death','2023-03-22',17,85),
  ('i14','t7','Davidson','it1','Code Complete: A Practical Handbook of Software Construction','2023-01-03',21,105);
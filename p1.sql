create database VP21MC005_college;  /*CREATION OF DATABASE*/
use VP21MC005_college;              /*SELECTION OF DATABASE*/

-----------------------  /*CREATION OF TABLEs*/  -------------------------

CREATE TABLE branch(
    -> branch_id INT(5) PRIMARY KEY,  
    -> b_name VARCHAR(25) NOT NULL,
    -> hod VARCHAR(50) NOT NULL);
mysql> desc branch;
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| branch_id | int         | NO   | PRI | NULL    |       |
| name      | varchar(25) | NO   |     | NULL    |       |
| hod       | varchar(50) | YES  | UNI | NULL    |       |
+-----------+-------------+------+-----+---------+-------+

create table student(
    -> usn CHAR(10) PRIMARY KEY,
    -> name VARCHAR(50) NOT NULL,
    -> address VARCHAR(100) NOT NULL,
    -> branch_id INT(5),
    -> sem INT(5),
    foreign key (branch_id) references branch (branch_id)
    );
mysql> desc student;
+-----------+--------------+------+-----+---------+-------+
| Field     | Type         | Null | Key | Default | Extra |
+-----------+--------------+------+-----+---------+-------+
| usn       | char(10)     | NO   | PRI | NULL    |       |
| name      | varchar(50)  | NO   |     | NULL    |       |
| address   | varchar(100) | YES  |     | NULL    |       |
| branch_id | int          | YES  | MUL | NULL    |       |
| sem       | int          | YES  |     | NULL    |       |
+-----------+--------------+------+-----+---------+-------+

CREATE TABLE author(
    -> author_id INT(10) PRIMARY KEY,
    -> aname VARCHAR(50) NOT NULL,
    -> country VARCHAR(15),
    -> age int(3));
mysql> desc author;
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| author_id | int         | NO   | PRI | NULL    |       |
| aname     | varchar(50) | NO   |     | NULL    |       |
| country   | varchar(15) | YES  |     | NULL    |       |
| age       | int         | YES  |     | NULL    |       |
+-----------+-------------+------+-----+---------+-------+

CREATE TABLE book(
    bookid int(10) PRIMARY KEY,
    bookname VARCHAR(15) NOT NULL UNIQUE,
    author_id INT(10),
    publisher VARCHAR(50) NOT NULL,
    branch_id INT(5),
    foreign key (branch_id) references branch (branch_id),
    foreign key (author_id) references author (author_id)
);
mysql> desc book;
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| bookid    | int         | NO   | PRI | NULL    |       |
| bookname  | varchar(15) | NO   | UNI | NULL    |       |
| author_id | int         | YES  | MUL | NULL    |       |
| publisher | varchar(50) | NO   |     | NULL    |       |
| branch_id | int         | YES  | MUL | NULL    |       |
+-----------+-------------+------+-----+---------+-------+

CREATE TABLE borrow(
    usn CHAR(10),
    bookid int(10),
    borrowed_date date,
    PRIMARY key(usn,bookid),
    foreign KEY (usn) references student (usn),
    foreign key (bookid) references book (bookid)
);
mysql> desc borrow;
+---------------+----------+------+-----+---------+-------+
| Field         | Type     | Null | Key | Default | Extra |
+---------------+----------+------+-----+---------+-------+
| usn           | char(10) | NO   | PRI | NULL    |       |
| bookid        | int      | NO   | PRI | NULL    |       |
| borrowed_date | date     | YES  |     | NULL    |       |
+---------------+----------+------+-----+---------+-------+

-----------------------  /*INSERTION*/  -------------------------

insert into branch values(101,'MCA','Dr. Vandana BS');
insert into branch values(102,'MBA','Mr. Iyer');
insert into branch values(103,'EC','Dr. Mayuri');
insert into branch values(104,'CS','Mr. Balasubramanyan');
insert into branch values(105,'Civil','Mr. Murali Prakash');
mysql> select * from branch;
+-----------+-------+---------------------+
| branch_id | name  | hod                 |
+-----------+-------+---------------------+
|       101 | MCA   | Dr. Vandana BS      |
|       102 | MBA   | Mr. Iyer            |
|       103 | EC    | Dr. Mayuri          |
|       104 | CS    | Mr. Balasubramanyan |
|       105 | Civil | Mr. Murali Prakash  |
+-----------+-------+---------------------+

insert into student values('4vp21MC003','Akasha','Kokkada',101,2);
insert into student values('4vp21MC022','Mayura','Perla',101,2);
insert into student values('4vp21MB001','Ajaya','Puttur',102,2);
insert into student values('4vp21EC001','Akhil','Sampaje',103,4);
insert into student values('4vp21CS001','Amala','KAshi',104,6);
insert into student values('4vp21CV053','Sonakshi','Kolkotta',105,8);
insert into student values('4vp21MB053','Subramanya','Kadaba',102,2);
insert into student values('4vp21CS053','Mahodaya','Kollur',103,4);
mysql> select * from student;
+------------+------------+----------+-----------+------+
| usn        | name       | address  | branch_id | sem  |
+------------+------------+----------+-----------+------+
| 4vp21CS001 | Amala      | KAshi    |       104 |    6 |
| 4vp21CS053 | Mahodaya   | Kollur   |       103 |    4 |
| 4vp21CV053 | Sonakshi   | Kolkotta |       105 |    8 |
| 4vp21EC001 | Akhil      | Sampaje  |       103 |    4 |
| 4vp21MB001 | Ajaya      | Puttur   |       102 |    2 |
| 4vp21MB053 | Subramanya | Kadaba   |       102 |    2 |
| 4vp21MC003 | Akasha     | Kokkada  |       101 |    2 |
| 4vp21MC022 | Mayura     | Perla    |       101 |    2 |
+------------+------------+----------+-----------+------+

insert into author values(45632,'Navathe','USA',65);
insert into author values(54614,'Abdul Razak','Dubai',89);
insert into author values(96734,'Keshavan Subrananyan','India',55);
insert into author values(9655,'Deepak Kulkarni','India',39);
insert into author values(11522,'Yunus','Japan',34);
mysql> select * from author;
+-----------+----------------------+---------+------+
| author_id | aname                | country | age  |
+-----------+----------------------+---------+------+
|      9655 | Deepak Kulkarni      | India   |   39 |
|     11522 | Yunus                | Japan   |   34 |
|     45632 | Navathe              | USA     |   65 |
|     54614 | Abdul Razak          | Dubai   |   89 |
|     96734 | Keshavan Subrananyan | India   |   55 |
+-----------+----------------------+---------+------+

insert into book values(1,'DBMS',45632,'Pearson',101);
insert into book values(2,'Research Meth',54614,'Ismail Printers',102);
insert into book values(3,'Data Structures',96734,'MGH',103);
insert into book values(4,'AI',9655,'MGH',104);
insert into book values(5,'Thermo Dynamics',11522,'taylor',105);
mysql> select * from book;
+--------+-----------------+-----------+-----------------+-----------+
| bookid | bookname        | author_id | publisher       | branch_id |
+--------+-----------------+-----------+-----------------+-----------+
|      1 | DBMS            |     45632 | Pearson         |       101 |
|      2 | Research Meth   |     54614 | Ismail Printers |       102 |
|      3 | Data Structures |     96734 | MGH             |       103 |
|      4 | AI              |      9655 | MGH             |       104 |
|      5 | Thermo Dynamics |     11522 | taylor          |       105 |
+--------+-----------------+-----------+-----------------+-----------+

insert into borrow values('4vp21MC003',1,'2022-06-13');
insert into borrow values('4vp21MC022',2,'2022-06-15');
insert into borrow values('4vp21CS053',3,'2022-05-31');
insert into borrow values('4vp21CS001',4,'2022-04-22');
insert into borrow values('4vp21CV053',5,'2022-06-30');
insert into borrow values('4vp21CV053',4,'2022-06-30');
mysql> select * from borrow;
+------------+--------+---------------+
| usn        | bookid | borrowed_date |
+------------+--------+---------------+
| 4vp21CS001 |      4 | 2022-04-22    |
| 4vp21CS053 |      3 | 2022-05-31    |
| 4vp21CV053 |      4 | 2022-06-30    |
| 4vp21CV053 |      5 | 2022-06-30    |
| 4vp21MC003 |      1 | 2022-06-13    |
| 4vp21MC022 |      2 | 2022-06-15    |
+------------+--------+---------------+

----------------------  /*WORKOUTS*/  -------------------------

select usn,s.name from student s,branch b where s.branch_id=b.branch_id and b.name="MCA";
+------------+--------+
| usn        | name   |
+------------+--------+
| 4vp21MC003 | Akasha |
| 4vp21MC022 | Mayura |
+------------+--------+

select all branch_id from student;
+-----------+
| branch_id |
+-----------+
|       101 |
|       101 |
|       102 |
|       102 |
|       103 |
|       103 |
|       104 |
|       105 |
+-----------+

select distinct branch_id from student;
+-----------+
| branch_id |
+-----------+
|       101 |
|       102 |
|       103 |
|       104 |
|       105 |
+-----------+

select * from author where country like "%nd%";
+-----------+----------------------+---------+------+
| author_id | aname                | country | age  |
+-----------+----------------------+---------+------+
|      9655 | Deepak Kulkarni      | India   |   39 |
|     96734 | Keshavan Subrananyan | India   |   55 |
+-----------+----------------------+---------+------+

select * from author where country like "_nd__";
+-----------+----------------------+---------+------+
| author_id | aname                | country | age  |
+-----------+----------------------+---------+------+
|      9655 | Deepak Kulkarni      | India   |   39 |
|     96734 | Keshavan Subrananyan | India   |   55 |
+-----------+----------------------+---------+------+

select * from author where age between 10 and 50;
+-----------+-----------------+---------+------+
| author_id | aname           | country | age  |
+-----------+-----------------+---------+------+
|      9655 | Deepak Kulkarni | India   |   39 |
|     11522 | Yunus           | Japan   |   34 |
+-----------+-----------------+---------+------+

delete from borrow where usn="4vp21MC003";
delete from borrow where usn="4vp21MC022";
mysql> select * from borrow;
+------------+--------+---------------+
| usn        | bookid | borrowed_date |
+------------+--------+---------------+
| 4vp21CS001 |      4 | 2022-04-22    |
| 4vp21CS053 |      3 | 2022-05-31    |
| 4vp21CV053 |      4 | 2022-06-30    |
| 4vp21CV053 |      5 | 2022-06-30    |
+------------+--------+---------------+
delete from student where branch_id=101;
insert into student values("4vp21mc05","Akash","Kokkada",101,1);
insert into student values("4vp21mc22","Mayura","Perla",101,1);
insert into student values("4vp21mc66","Moksit","Darbe",101,2);
insert into student values("4vp21mc69","Kartik","Bandady",101,2);
mysql> select * from student;
+------------+------------+----------+-----------+------+
| usn        | name       | address  | branch_id | sem  |
+------------+------------+----------+-----------+------+
| 4vp21CS001 | Amala      | KAshi    |       104 |    6 |
| 4vp21CS053 | Mahodaya   | Kollur   |       103 |    4 |
| 4vp21CV053 | Sonakshi   | Kolkotta |       105 |    8 |
| 4vp21EC001 | Akhil      | Sampaje  |       103 |    4 |
| 4vp21MB001 | Ajaya      | Puttur   |       102 |    2 |
| 4vp21MB053 | Subramanya | Kadaba   |       102 |    2 |
| 4vp21mc05  | Akash      | Kokkada  |       101 |    1 |
| 4vp21mc22  | Mayura     | Perla    |       101 |    1 |
| 4vp21mc66  | Moksit     | Darbe    |       101 |    2 |
| 4vp21mc69  | Kartik     | Bandady  |       101 |    2 |
+------------+------------+----------+-----------+------+

select usn,s.name  from student s,branch b  where s.branch_id=b.branch_id  and b.name="MCA"  AND s.sem="2" order by name;
+-----------+--------+
| usn       | name   |
+-----------+--------+
| 4vp21mc69 | Kartik |
| 4vp21mc66 | Moksit |
+-----------+--------+

select usn,s.name  from student s,branch b  where s.branch_id=b.branch_id  and b.name="MCA"  AND s.sem="2" order by name desc;
+-----------+--------+
| usn       | name   |
+-----------+--------+
| 4vp21mc66 | Moksit |
| 4vp21mc69 | Kartik |
+-----------+--------+

insert into borrow values("4vp21mc05",4,"2022-05-22");
insert into borrow values("4vp21mc05",3,"2022-05-22");
mysql> select * from borrow;
+------------+--------+---------------+
| usn        | bookid | borrowed_date |
+------------+--------+---------------+
| 4vp21CS001 |      4 | 2022-04-22    |
| 4vp21CS053 |      3 | 2022-05-31    |
| 4vp21CV053 |      4 | 2022-06-30    |
| 4vp21CV053 |      5 | 2022-06-30    |
| 4vp21mc05  |      3 | 2022-05-22    |
| 4vp21mc05  |      4 | 2022-05-22    |
+------------+--------+---------------+


select distinct name from student,borrow where student.usn=borrow.usn;
+----------+
| name     |
+----------+
| Mahodaya |
| Akash    |
| Amala    |
| Sonakshi |
+----------+

select distinct name from student,borrow where student.usn in (select usn from borrow);
+----------+
| name     |
+----------+
| Amala    |
| Mahodaya |
| Sonakshi |
| Akash    |
+----------+


insert into book values(6,'Cloud Tech',9655,'MGH',101);
mysql> select * from book;
+--------+-----------------+-----------+-----------------+-----------+
| bookid | bookname        | author_id | publisher       | branch_id |
+--------+-----------------+-----------+-----------------+-----------+
|      1 | DBMS            |     45632 | Pearson         |       101 |
|      2 | Research Meth   |     54614 | Ismail Printers |       102 |
|      3 | Data Structures |     96734 | MGH             |       103 |
|      4 | AI              |      9655 | MGH             |       104 |
|      5 | Thermo Dynamics |     11522 | taylor          |       105 |
|      6 | Cloud Tech      |      9655 | MGH             |       101 |
+--------+-----------------+-----------+-----------------+-----------+

insert into borrow values('4vp21mc69',4,'2022-06-30');
mysql> select * from borrow;
+------------+--------+---------------+
| usn        | bookid | borrowed_date |
+------------+--------+---------------+
| 4vp21CS001 |      4 | 2022-04-22    |
| 4vp21CS053 |      3 | 2022-05-31    |
| 4vp21CV053 |      4 | 2022-06-30    |
| 4vp21CV053 |      5 | 2022-06-30    |
| 4vp21mc05  |      3 | 2022-05-22    |
| 4vp21mc05  |      4 | 2022-05-22    |
| 4vp21mc69  |      4 | 2022-06-30    |
+------------+--------+---------------+

select distinct name from student
where usn not in (select usn from borrow);

----------------------  /*QUERIES*/  -------------------------

1. List the details of Students who are all studying in 2nd sem MCA.
select usn,s.name 
from student s,branch b 
where s.branch_id=b.branch_id 
and b.name="MCA" 
AND s.sem="2";

+-----------+--------+
| usn       | name   |
+-----------+--------+
| 4vp21mc66 | Moksit |
| 4vp21mc69 | Kartik |
+-----------+--------+

2. List the students who are not borrowed any books.
select distinct name from student
where usn not in (select usn from borrow);
+------------+
| name       |
+------------+
| Akhil      |
| Ajaya      |
| Subramanya |
| Mayura     |
| Moksit     |
+------------+

3. Display the USN, Student name, Branch_name, Author_name, Book_name,Books_Borrowed_Date of 2nd sem MCA Students who borrowed books.
select student.usn,student.name,branch.name,bookname,aname,borrowed_date
from student,book,branch,borrow,author
where student.usn=borrow.usn
and student.branch_id=branch.branch_id
and borrow.bookid=book.bookid
and book.author_id=author.author_id
and sem=2
and branch.name="MCA";
+-----------+--------+------+----------+-----------------+---------------+
| usn       | name   | name | bookname | aname           | borrowed_date |
+-----------+--------+------+----------+-----------------+---------------+
| 4vp21mc69 | Kartik | MCA  | AI       | Deepak Kulkarni | 2022-06-30    |
+-----------+--------+------+----------+-----------------+---------------+

4. Display the number of books written by each Author.
select book.author_id,aname,count(*) "Number of Books" from book,author where book.author_id=author.author_id group by book.author_id;
+-----------+----------------------+-----------------+
| author_id | aname                | Number of Books |
+-----------+----------------------+-----------------+
|      9655 | Deepak Kulkarni      |               2 |
|     11522 | Yunus                |               1 |
|     45632 | Navathe              |               1 |
|     54614 | Abdul Razak          |               1 |
|     96734 | Keshavan Subrananyan |               1 |
+-----------+----------------------+-----------------+

5. Display the student details who borrowed more than two books.
select * 
from student
where usn in 
(select usn 
from borrow 
group by usn 
having count(usn)>=2);
+------------+----------+----------+-----------+------+
| usn        | name     | address  | branch_id | sem  |
+------------+----------+----------+-----------+------+
| 4vp21CV053 | Sonakshi | Kolkotta |       105 |    8 |
| 4vp21mc05  | Akash    | Kokkada  |       101 |    1 |
+------------+----------+----------+-----------+------+

7. Display the Book names in descending order of their names
select bookname from book 
order by bookname desc;

+-----------------+
| bookname        |
+-----------------+
| Thermo Dynamics |
| Research Meth   |
| DBMS            |
| Data Structures |
| Cloud Tech      |
| AI              |
+-----------------+

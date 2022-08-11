create database VP21MC005_student;
use VP21MC005_student;

create table student(usn char(10) PRIMARY KEY,
dob date,
branch char(20) NOT NULL,
mark1 float(5,2) NOT NULL,
mark2 float(5,2) NOT NULL,
mark3 float(5,2) NOT NULL,
total float(5,2),
GPA float(5,2),
name varchar(25)
);

mysql> desc student;
+--------+-------------+------+-----+---------+-------+
| Field  | Type        | Null | Key | Default | Extra |
+--------+-------------+------+-----+---------+-------+
| usn    | char(10)    | NO   | PRI | NULL    |       |
| dob    | date        | YES  |     | NULL    |       |
| branch | char(20)    | NO   |     | NULL    |       |
| mark1  | float(5,2)  | NO   |     | NULL    |       |
| mark2  | float(5,2)  | NO   |     | NULL    |       |
| mark3  | float(5,2)  | NO   |     | NULL    |       |
| total  | float(5,2)  | YES  |     | NULL    |       |
| GPA    | float(5,2)  | YES  |     | NULL    |       |
| name   | varchar(25) | YES  |     | NULL    |       |
+--------+-------------+------+-----+---------+-------+


insert into student values("4vp21mc022","2001-04-18","MCA",50,60,70,NULL,NULL);
insert into student values("4vp21mc003","2000-05-20","MCA",60,70,80,NULL,NULL);
INSERT INTO student(usn,dob,branch,mark1,mark2,mark3,name) values ("4vp21mc009","2000-05-21","MCA",50,60,70,"Dhananjay");

INSERT INTO student(usn,dob,branch,mark1,mark2,mark3,name) values ("4vp21mb050","2000-04-30","MBA",90,60,70,"Shvetha");

INSERT INTO student(usn,dob,branch,mark1,mark2,mark3,name) values ("4vp21mb035","2001-09-06","MBA",90,60,70,"Nayana");
INSERT INTO student(usn,dob,branch,mark1,mark2,mark3,name) values ("4vp21mb065","2000-06-16","MBA",90,60,70,"Vanshika");
INSERT INTO student(usn,dob,branch,mark1,mark2,mark3,name) values ("4vp21cv025","2000-11-09","CS",66,97,50,"Akhil");

INSERT INTO student(usn,dob,branch,mark1,mark2,mark3,name) values ("4vp21cv026","2001-5-29","CS",95,55,90,"Akshan");
iNSERT INTO student(usn,dob,branch,mark1,mark2,mark3,name) values ("1001","2001-5-29","CS",95,55,90,"SAGAR");

+------------+------------+--------+-------+-------+-------+--------+-------+-----------+
| usn        | dob        | branch | mark1 | mark2 | mark3 | total  | gpa   | name      |
+------------+------------+--------+-------+-------+-------+--------+-------+-----------+
| 1001       | 2001-05-29 | CS     | 95.00 | 55.00 | 90.00 |   NULL |  NULL | SAGAR     |
| 4vp21cv025 | 2000-11-09 | CS     | 66.00 | 97.00 | 50.00 | 213.00 | 71.00 | Akhil     |
| 4vp21cv026 | 2001-05-29 | CS     | 95.00 | 55.00 | 90.00 | 240.00 | 80.00 | Akshan    |
| 4vp21mb035 | 2001-09-06 | MBA    | 90.00 | 60.00 | 70.00 | 220.00 | 73.33 | Nayana    |
| 4vp21mb050 | 2000-04-30 | MBA    | 90.00 | 60.00 | 70.00 | 220.00 | 73.33 | Shvetha   |
| 4vp21mb065 | 2000-06-16 | MBA    | 90.00 | 60.00 | 70.00 | 220.00 | 73.33 | Vanshika  |
| 4vp21mc003 | 2000-05-20 | MCA    | 60.00 | 70.00 | 80.00 | 210.00 | 70.00 | akash     |
| 4vp21mc009 | 2000-05-21 | MCA    | 50.00 | 60.00 | 70.00 | 180.00 | 60.00 | Dhananjay |
| 4vp21mc022 | 2001-04-18 | MCA    | 50.00 | 60.00 | 70.00 | 180.00 | 60.00 | mayura    |
+------------+------------+--------+-------+-------+-------+--------+-------+-----------+


1. Update the column total by adding the columns mark1, mark2, mark3.
update student set total=mark1+mark2+mark3;
mysql> select * from student;
+------------+------------+--------+-------+-------+-------+--------+-------+-----------+
| usn        | dob        | branch | mark1 | mark2 | mark3 | total  | gpa   | name      |
+------------+------------+--------+-------+-------+-------+--------+-------+-----------+
| 1001       | 2001-05-29 | CS     | 95.00 | 55.00 | 90.00 | 240.00 | NULL  | SAGAR     |
| 4vp21cv025 | 2000-11-09 | CS     | 66.00 | 97.00 | 50.00 | 213.00 | NULL  | Akhil     |
| 4vp21cv026 | 2001-05-29 | CS     | 95.00 | 55.00 | 90.00 | 240.00 | NULL  | Akshan    |
| 4vp21mb035 | 2001-09-06 | MBA    | 90.00 | 60.00 | 70.00 | 220.00 | NULL  | Nayana    |
| 4vp21mb050 | 2000-04-30 | MBA    | 90.00 | 60.00 | 70.00 | 220.00 | NULL  | Shvetha   |
| 4vp21mb065 | 2000-06-16 | MBA    | 90.00 | 60.00 | 70.00 | 220.00 | NULL  | Vanshika  |
| 4vp21mc003 | 2000-05-20 | MCA    | 60.00 | 70.00 | 80.00 | 210.00 | NULL  | akash     |
| 4vp21mc009 | 2000-05-21 | MCA    | 50.00 | 60.00 | 70.00 | 180.00 | NULL  | Dhananjay |
| 4vp21mc022 | 2001-04-18 | MCA    | 50.00 | 60.00 | 70.00 | 180.00 | NULL  | mayura    |
+------------+------------+--------+-------+-------+-------+--------+-------+-----------+


2.Find the GPA score of all the students.
update student set gpa=(total/3);

+------------+------------+--------+-------+-------+-------+--------+-------+-----------+
| usn        | dob        | branch | mark1 | mark2 | mark3 | total  | gpa   | name      |
+------------+------------+--------+-------+-------+-------+--------+-------+-----------+
| 1001       | 2001-05-29 | CS     | 95.00 | 55.00 | 90.00 | 240.00 | 80.00 | SAGAR     |
| 4vp21cv025 | 2000-11-09 | CS     | 66.00 | 97.00 | 50.00 | 213.00 | 71.00 | Akhil     |
| 4vp21cv026 | 2001-05-29 | CS     | 95.00 | 55.00 | 90.00 | 240.00 | 80.00 | Akshan    |
| 4vp21mb035 | 2001-09-06 | MBA    | 90.00 | 60.00 | 70.00 | 220.00 | 73.33 | Nayana    |
| 4vp21mb050 | 2000-04-30 | MBA    | 90.00 | 60.00 | 70.00 | 220.00 | 73.33 | Shvetha   |
| 4vp21mb065 | 2000-06-16 | MBA    | 90.00 | 60.00 | 70.00 | 220.00 | 73.33 | Vanshika  |
| 4vp21mc003 | 2000-05-20 | MCA    | 60.00 | 70.00 | 80.00 | 210.00 | 70.00 | akash     |
| 4vp21mc009 | 2000-05-21 | MCA    | 50.00 | 60.00 | 70.00 | 180.00 | 60.00 | Dhananjay |
| 4vp21mc022 | 2001-04-18 | MCA    | 50.00 | 60.00 | 70.00 | 180.00 | 60.00 | mayura    |
+------------+------------+--------+-------+-------+-------+--------+-------+-----------+


3.Find the students who born on a particular year of birth from the date_of_birth column.
select name,dob from student where dob between "2000-01-01" and "2000-12-31";

+-----------+------------+
| name      | dob        |
+-----------+------------+
| Akhil     | 2000-11-09 |
| Shvetha   | 2000-04-30 |
| Vanshika  | 2000-06-16 |
| akash     | 2000-05-20 |
| Dhananjay | 2000-05-21 |
+-----------+------------+

4.List the students who are studying in a particular branch of study.
select * from student where branch="MCA";

+------------+------------+--------+-------+-------+-------+--------+-------+-----------+
| usn        | dob        | branch | mark1 | mark2 | mark3 | total  | gpa   | name      |
+------------+------------+--------+-------+-------+-------+--------+-------+-----------+
| 4vp21mc003 | 2000-05-20 | MCA    | 60.00 | 70.00 | 80.00 | 210.00 | 70.00 | akash     |
| 4vp21mc009 | 2000-05-21 | MCA    | 50.00 | 60.00 | 70.00 | 180.00 | 60.00 | Dhananjay |
| 4vp21mc022 | 2001-04-18 | MCA    | 50.00 | 60.00 | 70.00 | 180.00 | 60.00 | mayura    |
+------------+------------+--------+-------+-------+-------+--------+-------+-----------+

5.Find the maximum GPA score of the student branch-wise.
select branch,max(gpa) from student group by branch;
+--------+----------+
| branch | max(gpa) |
+--------+----------+
| CS     |    80.00 |
| MBA    |    73.33 |
| MCA    |    70.00 |
+--------+----------+

6.Find the students whose name starts with the alphabet “S”.
select name,branch from student where name like "S%";
+---------+--------+
| name    | branch |
+---------+--------+
| Shvetha | MBA    |
+---------+--------+

7.Find the students whose name ends with the alphabets “AR”.
select name,branch from student where name like "%AR";
+-------+--------+
| name  | branch |
+-------+--------+
| SAGAR | CS     |
+-------+--------+


8.Delete the student details whose USN is given as 1001.

delete from student where usn="1001";
+------------+------------+--------+-------+-------+-------+--------+-------+-----------+
| usn        | dob        | branch | mark1 | mark2 | mark3 | total  | gpa   | name      |
+------------+------------+--------+-------+-------+-------+--------+-------+-----------+
| 4vp21cv025 | 2000-11-09 | CS     | 66.00 | 97.00 | 50.00 | 213.00 | 71.00 | Akhil     |
| 4vp21cv026 | 2001-05-29 | CS     | 95.00 | 55.00 | 90.00 | 240.00 | 80.00 | Akshan    |
| 4vp21mb035 | 2001-09-06 | MBA    | 90.00 | 60.00 | 70.00 | 220.00 | 73.33 | Nayana    |
| 4vp21mb050 | 2000-04-30 | MBA    | 90.00 | 60.00 | 70.00 | 220.00 | 73.33 | Shvetha   |
| 4vp21mb065 | 2000-06-16 | MBA    | 90.00 | 60.00 | 70.00 | 220.00 | 73.33 | Vanshika  |
| 4vp21mc003 | 2000-05-20 | MCA    | 60.00 | 70.00 | 80.00 | 210.00 | 70.00 | akash     |
| 4vp21mc009 | 2000-05-21 | MCA    | 50.00 | 60.00 | 70.00 | 180.00 | 60.00 | Dhananjay |
| 4vp21mc022 | 2001-04-18 | MCA    | 50.00 | 60.00 | 70.00 | 180.00 | 60.00 | mayura    |
+------------+------------+--------+-------+-------+-------+--------+-------+-----------+

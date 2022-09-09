create database VP21MC005_parliment;
USE VP21MC005_parliment;

create table CONSTITUENCY(
    CONST_ID char(10) PRIMARY KEY,
    NAME varchar(25) NOT NULL,
    STATE (3)STATE VARCHAR(25) NOT NULL,
    NO_OF_VOTES INT(5)
);

ALTER TABLE CONSTITUENCY MODIFY STATE VARCHAR(25) NOT NULL;

+-------------+-------------+------+-----+---------+-------+
| Field       | Type        | Null | Key | Default | Extra |
+-------------+-------------+------+-----+---------+-------+
| CONST_ID    | char(10)    | NO   | PRI | NULL    |       |
| NAME        | varchar(25) | NO   |     | NULL    |       |
| STATE       | varchar(25) | NO   |     | NULL    |       |
| NO_OF_VOTES | int         | YES  |     | NULL    |       |
+-------------+-------------+------+-----+---------+-------+

CREATE TABLE PARTY(
    PARTY_ID char(10) PRIMARY KEY,
    PNAME VARCHAR(25) UNIQUE,
    SYMBOL VARCHAR(25) NOT NULL
);

+----------+-------------+------+-----+---------+-------+
| Field    | Type        | Null | Key | Default | Extra |
+----------+-------------+------+-----+---------+-------+
| PARTY_ID | char(10)    | NO   | PRI | NULL    |       |
| PNAME    | varchar(25) | YES  | UNI | NULL    |       |
| SYMBOL   | varchar(25) | NO   |     | NULL    |       |
+----------+-------------+------+-----+---------+-------+

create table CANDIDATE(
    CAND_ID char(10) PRIMARY KEY,
    NAME varchar(25) NOT NULL,
    PHONE INT(10) NOT NULL,
    AGE INT(3),
    PID  CHAR(10) REFERENCES PARTY(PARTY_ID)
);

+---------+-------------+------+-----+---------+-------+
| Field   | Type        | Null | Key | Default | Extra |
+---------+-------------+------+-----+---------+-------+
| CAND_ID | char(10)    | NO   | PRI | NULL    |       |
| NAME    | varchar(25) | NO   |     | NULL    |       |
| PHONE   | int         | NO   |     | NULL    |       |
| AGE     | int         | YES  |     | NULL    |       |
| PID     | char(10)    | YES  |     | NULL    |       |
+---------+-------------+------+-----+---------+-------+

create table VOTER(
    VOTER_ID char(10) PRIMARY KEY,
    NAME varchar(25) NOT NULL,
    AGE INT(3),
    ADDR VARCHAR(50),
    CONST_ID CHAR(10) REFERENCES CONSTITUENCY(CONST_ID),
    CAND_ID  CHAR(10) REFERENCES CANDIDATE(CAND_ID)
);

+----------+-------------+------+-----+---------+-------+
| Field    | Type        | Null | Key | Default | Extra |
+----------+-------------+------+-----+---------+-------+
| VOTER_ID | char(10)    | NO   | PRI | NULL    |       |
| NAME     | varchar(25) | NO   |     | NULL    |       |
| AGE      | int         | YES  |     | NULL    |       |
| ADDR     | varchar(50) | YES  |     | NULL    |       |
| CONST_ID | char(10)    | YES  |     | NULL    |       |
| CAND_ID  | char(10)    | YES  |     | NULL    |       |
+----------+-------------+------+-----+---------+-------+

CREATE TABLE CONTEST(
    CONST_ID char(10) REFERENCES CONTEST(CONST_ID),
    CAND_ID CHAR(10) REFERENCES CANDIDATE(CAND_ID),
    PRIMARY KEY(CONST_ID,CAND_ID)
);
+----------+----------+------+-----+---------+-------+
| Field    | Type     | Null | Key | Default | Extra |
+----------+----------+------+-----+---------+-------+
| CONST_ID | char(10) | NO   | PRI | NULL    |       |
| CAND_ID  | char(10) | NO   | PRI | NULL    |       |
+----------+----------+------+-----+---------+-------+

insert into CONSTITUENCY
(CONST_ID,NAME,STATE,NO_OF_VOTES) 
values
('CT1','PUTTUR','KARNATAKA','500');

insert into CONSTITUENCY
(CONST_ID,NAME,STATE,NO_OF_VOTES) 
values
('CT2','BANTWALA','KARNATAKA','600');

insert into CONSTITUENCY
(CONST_ID,NAME,STATE,NO_OF_VOTES) 
values
('CT3','MANJESHWARA','KERALA','700');

+----------+-------------+-----------+-------------+
| CONST_ID | NAME        | STATE     | NO_OF_VOTES |
+----------+-------------+-----------+-------------+
| CT1      | PUTTUR      | KARNATAKA |         500 |
| CT2      | BANTWALA    | KARNATAKA |         600 |
| CT3      | MANJESHWARA | KERALA    |         700 |
+----------+-------------+-----------+-------------+

insert into PARTY
(PARTY_ID,PNAME,SYMBOL) 
values
('P1','KARMEPALA PAKSHA','CHAKRA');

insert into PARTY
(PARTY_ID,PNAME,SYMBOL) 
values
('P2','SAMAJIKA ANTARA PAKSHA','6FT');

+----------+------------------------+--------+
| PARTY_ID | PNAME                  | SYMBOL |
+----------+------------------------+--------+
| P1       | KARMEPALA PAKSHA       | CHAKRA |
| P2       | SAMAJIKA ANTARA PAKSHA | 6FT    |
+----------+------------------------+--------+

insert into CANDIDATE
(CAND_ID,NAME,PHONE,AGE,PID) 
values
('NC1','MAYURA','9888998','75','P1');

insert into CANDIDATE
(CAND_ID,NAME,PHONE,AGE,PID) 
values
('NC2','AKASHA','9888978','65','P2');

insert into VOTER
(VOTER_ID,NAME,AGE,ADDR,CONST_ID,CAND_ID) 
values
('V1','GEETHA','25','VITTAL','CT2','NC2');

insert into VOTER
(VOTER_ID,NAME,AGE,ADDR,CONST_ID,CAND_ID) 
values
('V2','JAHNSI','29','UPPALA','CT3','NC1');


insert into VOTER
(VOTER_ID,NAME,AGE,ADDR,CONST_ID,CAND_ID) 
values
('V4','DEEPTHI','19','PERLA','CT3','NC1');

insert into VOTER
(VOTER_ID,NAME,AGE,ADDR,CONST_ID,CAND_ID) 
values
('V4','DEEPTHI','19','PERLA','CT3','NC1');

insert into VOTER
(VOTER_ID,NAME,AGE,ADDR,CONST_ID,CAND_ID) 
values
('V5','ANAGHA','22','VITTAL','CT2','NC2');

insert into VOTER
(VOTER_ID,NAME,AGE,ADDR,CONST_ID,CAND_ID) 
values
('V6','DHANYA','23','KALLEGA','CT1','NC1');

insert into VOTER
(VOTER_ID,NAME,AGE,ADDR,CONST_ID,CAND_ID) 
values
('V7','KAVYA','25','PERLA','CT2','NC1');



+----------+---------+------+---------+----------+---------+
| VOTER_ID | NAME    | AGE  | ADDR    | CONST_ID | CAND_ID |
+----------+---------+------+---------+----------+---------+
| V1       | GEETHA  |   25 | VITTAL  | CT2      | NC2     |
| V2       | JAHNSI  |   29 | UPPALA  | CT3      | NC1     |
| V3       | DEEKSHA |   26 | NAGARA  | CT1      | NC1     |
| V4       | DEEPTHI |   19 | PERLA   | CT3      | NC1     |
| V5       | ANAGHA  |   22 | VITTAL  | CT2      | NC2     |
| V6       | DHANYA  |   23 | KALLEGA | CT1      | NC1     |
| V7       | KAVYA   |   25 | PERLA   | CT2      | NC1     |
+----------+---------+------+---------+----------+---------+

insert into CONTEST
(CONST_ID,CAND_ID)
values
('CT1','NC1');

insert into CONTEST
(CONST_ID,CAND_ID)
values
('CT2','NC1');

insert into CONTEST
(CONST_ID,CAND_ID)
values
('CT3','NC1');

+----------+---------+
| CONST_ID | CAND_ID |
+----------+---------+
| CT1      | NC1     |
| CT2      | NC1     |
| CT3      | NC1     |
+----------+---------+


------------QUERIES----------------------

i. List the details of the candidates who are contesting from more than one constituencies
which are belongs to different states.


ii. Display the state name having maximum number of constituencies.


iii. Create a stored procedure to insert the tuple into the voter table by checking the voter
age. If voters age is at least 18 years old, then insert the tuple into the voter else display the
“Not an eligible voter msg” .


iv. Create a stored procedure to display the number_of_voters in the specified constituency.
Where the constituency name is passed as an argument to the stored procedure


v. Create a TRIGGER to UPDATE the count of “ Number_of_voters” of the respective
constituency in “CONSTITUENCY” table , AFTER inserting a tuple into the “VOTERS” table.

DELIMITER $$
create trigger tname
after insert on VOTER 
for each row
begin 
update CONSTITUENCY set CONSTITUENCY.NO_OF_VOTES=CONSTITUENCY.NO_OF_VOTES+3 
where CONSTITUENCY.CONST_ID=new.CONST_ID;
end$$

insert into VOTER
(VOTER_ID,NAME,AGE,ADDR,CONST_ID,CAND_ID) 
values
('V8','MANISHA','25','PUTTUR','CT1','NC1');

+----------+-------------+-----------+-------------+
| CONST_ID | NAME        | STATE     | NO_OF_VOTES |
+----------+-------------+-----------+-------------+
| CT1      | PUTTUR      | KARNATAKA |         503 |
| CT2      | BANTWALA    | KARNATAKA |         600 |
| CT3      | MANJESHWARA | KERALA    |         700 |
+----------+-------------+-----------+-------------+
create database VP21MC005_cricket
USE VP21MC005_cricket

create table team(
    team_id char(10) PRIMARY KEY,
    team_name varchar(25) NOT NULL,
    city varchar(25),
    coach VARCHAR(25) NOT NULL,
    captian char(10)
);

create table player(
    player_id char(10) PRIMARY KEY,
    name varchar(25) NOT NULL,
    phone int(10),
    age int(3),
    team_id char(10),
    foreign key (team_id) references team (team_id)
);

alter table team
add foreign key (captian) 
references player (player_id);

mysql> desc team;
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| team_id   | char(10)    | NO   | PRI | NULL    |       |
| team_name | varchar(25) | NO   |     | NULL    |       |
| city      | varchar(25) | YES  |     | NULL    |       |
| coach     | varchar(25) | NO   |     | NULL    |       |
| captian   | char(10)    | YES  | MUL | NULL    |       |
+-----------+-------------+------+-----+---------+-------+

mysql> desc player;
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| player_id | char(10)    | NO   | PRI | NULL    |       |
| name      | varchar(25) | NO   |     | NULL    |       |
| phone     | int         | YES  |     | NULL    |       |
| age       | int         | YES  |     | NULL    |       |
| team_id   | char(10)    | YES  | MUL | NULL    |       |
+-----------+-------------+------+-----+---------+-------+

create table STADIUM(
    stadium_id char(10) PRIMARY KEY,
    sname varchar(25) NOT NULL,
    city varchar(25) NOT NULL,
    area_name varchar(25) NOT NULL,
    pincode int(6)
);

mysql> desc STADIUM;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| stadium_id | char(10)    | NO   | PRI | NULL    |       |
| sname      | varchar(25) | NO   |     | NULL    |       |
| city       | varchar(25) | NO   |     | NULL    |       |
| area_name  | varchar(25) | NO   |     | NULL    |       |
| pincode    | int         | YES  |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+


create table maatch(
    match_id char(10) PRIMARY KEY,
    team_id1 char(10) NOT NULL,
    team_id2 char(10) NOT NULL,
    sdate date,
    stime time,
    stadium_id char(10),
    wteam_id char(10),
        FOREIGN KEY (stadium_id) references STADIUM (stadium_id),
    FOREIGN KEY (team_id1) references team (team_id),
    FOREIGN KEY (team_id2) references team (team_id),
    FOREIGN KEY (wteam_id) references team (team_id)
);

mysql> desc maatch;
+------------+----------+------+-----+---------+-------+
| Field      | Type     | Null | Key | Default | Extra |
+------------+----------+------+-----+---------+-------+
| match_id   | char(10) | NO   | PRI | NULL    |       |
| team_id1   | char(10) | NO   | MUL | NULL    |       |
| team_id2   | char(10) | NO   | MUL | NULL    |       |
| sdate      | date     | YES  |     | NULL    |       |
| stime      | time     | YES  |     | NULL    |       |
| stadium_id | char(10) | YES  | MUL | NULL    |       |
| wteam_id   | char(10) | YES  | MUL | NULL    |       |
+------------+----------+------+-----+---------+-------+
7 rows in set (0.00 sec)

create table mom(
    player_id char(10),
    match_id char(10),
    PRIMARY KEY(player_id,match_id)
);
mysql> desc mom;
+-----------+----------+------+-----+---------+-------+
| Field     | Type     | Null | Key | Default | Extra |
+-----------+----------+------+-----+---------+-------+
| player_id | char(10) | NO   | PRI | NULL    |       |
| match_id  | char(10) | NO   | PRI | NULL    |       |
+-----------+----------+------+-----+---------+-------+


insert into player 
(player_id,name,phone,age) 
values
(101,'Keshava','988988998','25');

insert into player 
(player_id,name,phone,age) 
values
(102,'Kumara','988001889','23');

insert into player 
(player_id,name,phone,age) 
values
(103,'Kodanda','98855522','21');


insert into player 
(player_id,name,phone,age) 
values
(104,'Karthikeya','98511551','29');

insert into player 
(player_id,name,phone,age) 
values
(105,'Kushalappa','75586623','30');

mysql> select * from player;
+-----------+------------+-----------+------+---------+
| player_id | name       | phone     | age  | team_id |
+-----------+------------+-----------+------+---------+
| 101       | Keshava    | 988988998 |   25 | NULL    |
| 102       | Kumara     | 988001889 |   23 | NULL    |
| 103       | Kodanda    |  98855522 |   21 | NULL    |
| 104       | Karthikeya |  98511551 |   29 | NULL    |
| 105       | Kushalappa |  75586623 |   30 | NULL    |
| 106       | Kodiyappa  |  87987865 |   27 | NULL    |
+-----------+------------+-----------+------+---------+

insert into team
(team_id,team_name,city,coach,captian) 
values
('500','Wakra Rockers','Perla','Mayura','102');

insert into team
(team_id,team_name,city,coach,captian) 
values
('501','Shyama Warriors','Kokkada','Akash','101');

insert into team
(team_id,team_name,city,coach,captian) 
values
('502','Akrura Aprameyas','Patte','Kavya','104');

mysql> select * from team;
+---------+------------------+---------+--------+---------+
| team_id | team_name        | city    | coach  | captian |
+---------+------------------+---------+--------+---------+
| 500     | Wakra Rockers    | Perla   | Mayura | 102     |
| 501     | Shyama Warriors  | Kokkada | Akash  | 101     |
| 502     | Akrura Aprameyas | Patte   | Kavya  | 104     |
+---------+------------------+---------+--------+---------+

update player set team_id='500' where player_id in (102,103);

update player set team_id='501' where player_id in (101,106);

update player set team_id='502' where player_id in (104,105);

+-----------+------------+-----------+------+---------+
| player_id | name       | phone     | age  | team_id |
+-----------+------------+-----------+------+---------+
| 101       | Keshava    | 988988998 |   25 | 501     |
| 102       | Kumara     | 988001889 |   23 | 500     |
| 103       | Kodanda    |  98855522 |   21 | 500     |
| 104       | Karthikeya |  98511551 |   29 | 502     |
| 105       | Kushalappa |  75586623 |   30 | 502     |
| 106       | Kodiyappa  |  87987865 |   27 | 501     |
+-----------+------------+-----------+------+---------+

INSERT INTO STADIUM 
(stadium_id,sname,city,area_name,pincode)
values
('sd1','KeshavaKrupa','Puttur','Nagara',574203);

INSERT INTO STADIUM 
(stadium_id,sname,city,area_name,pincode)
values
('sd2','KumaraKrupa','Uppinangady','Nettibail',574241);

mysql> select * from STADIUM;
+------------+--------------+-------------+-----------+---------+
| stadium_id | sname        | city        | area_name | pincode |
+------------+--------------+-------------+-----------+---------+
| sd1        | KeshavaKrupa | Puttur      | Nagara    |  574203 |
| sd2        | KumaraKrupa  | Uppinangady | Nettibail |  574241 |
+------------+--------------+-------------+-----------+---------+
2 rows in set (0.00 sec)

mysql> desc maatch;
+------------+----------+------+-----+---------+-------+
| Field      | Type     | Null | Key | Default | Extra |
+------------+----------+------+-----+---------+-------+
| match_id   | char(10) | NO   | PRI | NULL    |       |
| team_id1   | char(10) | NO   | MUL | NULL    |       |
| team_id2   | char(10) | NO   | MUL | NULL    |       |
| sdate      | date     | YES  |     | NULL    |       |
| stime      | time     | YES  |     | NULL    |       |
| stadium_id | char(10) | YES  | MUL | NULL    |       |
| wteam_id   | char(10) | YES  | MUL | NULL    |       |
+------------+----------+------+-----+---------+-------+

INSERT INTO maatch
(match_id,team_id1,team_id2,sdate,stime,stadium_id,wteam_id)
values
('m1','500','501','2022-06-22','2022-06-22 15:30:00','sd1','500');

INSERT INTO maatch
(match_id,team_id1,team_id2,sdate,stime,stadium_id,wteam_id)
values
('m2','501','502','2022-06-24','2022-06-24 15:30:00','sd2','502');

INSERT INTO maatch
(match_id,team_id1,team_id2,sdate,stime,stadium_id,wteam_id)
values
('m3','500','502','2022-06-26','2022-06-26 15:30:00','sd1','500');

mysql> select * from maatch;
+----------+----------+----------+------------+----------+------------+----------+
| match_id | team_id1 | team_id2 | sdate      | stime    | stadium_id | wteam_id |
+----------+----------+----------+------------+----------+------------+----------+
| m1       | 500      | 501      | 2022-06-22 | 15:30:00 | sd1        | 500      |
| m2       | 501      | 502      | 2022-06-24 | 15:30:00 | sd2        | 502      |
| m3       | 500      | 502      | 2022-06-26 | 15:30:00 | sd1        | 500      |
+----------+----------+----------+------------+----------+------------+----------+

insert into mom
(player_id,match_id)
values
(102,'m1');

insert into mom
(player_id,match_id)
values
(101,'m2');

insert into mom
(player_id,match_id)
values
(104,'m3');

mysql> select * from mom;
+-----------+----------+
| player_id | match_id |
+-----------+----------+
| 101       | m2       |
| 102       | m1       |
| 104       | m3       |
+-----------+----------+

--------------------   QUERIES --------------------

select name,player_id,min(age)
from player
group by age
order by age;

select min(p.age) from 
player p, team t
where p.team_id=t.team_id
group by(p.age)
order y p.age;

select team_name,name 
from team,player
where 
player.team_id=team.team_id
and team.team_id in(
select team_id
from player
group by(team_id)
order by min(age));
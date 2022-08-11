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
(106,'m3');

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

mysql> select stadium_id from maatch group by stadium_id order by max(stadium_id);

select * from STADIUM where stadium_id in (select stadium_id from maatch GROUP BY stadium_id);
select m.stadium_id,count(m.match_id) FROM maatch m group by m.stadium_id order by count(match_id) desc;
select stadium_id,count(match_id) from maatch group by stadium_id;
select stadium_id,count(match_id) from maatch group by stadium_id;
--------------------   QUERIES --------------------

1. Display the youngest player (in terms of age) Name, Team name, age in which he belongs of
the tournament.

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

select name,team_name,age from player p,team t where p.team_id=t.team_id and age=(select min(age) from player);
+---------+---------------+------+
| name    | team_name     | age  |
+---------+---------------+------+
| Kodanda | Wakra Rockers |   21 |
+---------+---------------+------+


ii. List the details of the stadium where the maximum number of matches were played.

select * from STADIUM where stadium_id =(select stadium_id from maatch group by stadium_id order by count(match_id)desc limit 1);
+------------+--------------+--------+-----------+---------+
| stadium_id | sname        | city   | area_name | pincode |
+------------+--------------+--------+-----------+---------+
| sd1        | KeshavaKrupa | Puttur | Nagara    |  574203 |
+------------+--------------+--------+-----------+---------+



iii. List the details of the player who is not a captain but got the man_of _match award at least
in two matches.

mysql> select * from player where player_id in(select player_id from mom 
 where player_id not in(select captian from team)
 group by player_id having count(player_id)>=2  );

+-----------+-----------+----------+------+---------+
| player_id | name      | phone    | age  | team_id |
+-----------+-----------+----------+------+---------+
| 106       | Kodiyappa | 87987865 |   27 | 501     |
+-----------+-----------+----------+------+---------+

iv. Display the Team details who won the maximum matches.

select * from team where team_id=(select wteam_id from maatch group by wteam_id order by count(wteam_id)desc limit 1);
+---------+---------------+-------+--------+---------+
| team_id | team_name     | city  | coach  | captian |
+---------+---------------+-------+--------+---------+
| 500     | Wakra Rockers | Perla | Mayura | 102     |
+---------+---------------+-------+--------+---------+


v. Display the team name where all its won matches played in the same stadium.
select stadium_id,wteam_id from maatch group by(stadium_id);

select team_name from team 
where team_id in(
    select wteam_id from maatch group by stadium_id,wteam_id
    having count(*) in (select count (wteam_id) from maatch group by wteam_id)
);

select team_name from team where team_id in (
    select wteam_id from maatch 
    group by wteam_id having count(stadium_id)>=2
);
+---------------+
| team_name     |
+---------------+
| Wakra Rockers |
+---------------+


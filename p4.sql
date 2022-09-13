create database VP21MC005_TOURISM;
use VP21MC005_TOURISM;

create table TPLACE(
    PLACE_ID char(10) PRIMARY KEY,
    PNAME varchar(25) NOT NULL,
    STATE varchar(25) NOT NULL,
    KM INT(5) NOT NULL,
    HISTORY VARCHAR(2000)
);

+----------+---------------+------+-----+---------+-------+
| Field    | Type          | Null | Key | Default | Extra |
+----------+---------------+------+-----+---------+-------+
| PLACE_ID | char(10)      | NO   | PRI | NULL    |       |
| PNAME    | varchar(25)   | NO   |     | NULL    |       |
| STATE    | varchar(25)   | NO   |     | NULL    |       |
| KM       | int           | NO   |     | NULL    |       |
| HISTORY  | varchar(2000) | YES  |     | NULL    |       |
+----------+---------------+------+-----+---------+-------+

create table TOURIST(
    TOURIST_ID char(10) PRIMARY KEY,
    TNAME varchar(25) NOT NULL,
    AGE INT(3) NOT NULL,
    COUNTRY VARCHAR(25)
);

+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| TOURIST_ID | char(10)    | NO   | PRI | NULL    |       |
| TNAME      | varchar(25) | NO   |     | NULL    |       |
| AGE        | int         | NO   |     | NULL    |       |
| COUNTRY    | varchar(25) | YES  |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+

create table VISIT(
    TOURIST_ID char(10) references TOURIST(TOURIST_ID),
    PLACE_ID char(10) REFERENCES TPLACE(PLACE_ID),
    VDATE DATE,
    PRIMARY KEY(TOURIST_ID,PLACE_ID)
);

+------------+----------+------+-----+---------+-------+
| Field      | Type     | Null | Key | Default | Extra |
+------------+----------+------+-----+---------+-------+
| TOURIST_ID | char(10) | NO   | PRI | NULL    |       |
| PLACE_ID   | char(10) | NO   | PRI | NULL    |       |
| VDATE      | date     | YES  |     | NULL    |       |
+------------+----------+------+-----+---------+-------+

create table MAIL(
    TOURIST_ID char(10) references TOURIST(TOURIST_ID),
    EMAIL VARCHAR(40) NOT NULL,
    PRIMARY KEY(TOURIST_ID,EMAIL)
);

+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| TOURIST_ID | char(10)    | NO   | PRI | NULL    |       |
| EMAIL      | varchar(40) | NO   | PRI | NULL    |       |
+------------+-------------+------+-----+---------+-------+

insert into TPLACE
(PLACE_ID,PNAME,STATE,KM,HISTORY) 
values
('TP1','BEKALA','KERALA','500','KINGS FORT');

insert into TPLACE
(PLACE_ID,PNAME,STATE,KM,HISTORY) 
values
('TP2','MANZARABAD','KARNATAKA','400','KINGS FORT');

insert into TPLACE
(PLACE_ID,PNAME,STATE,KM,HISTORY) 
values
('TP3','TANNIRBHAVI','KARNATAKA','500','BEACH');

insert into TPLACE
(PLACE_ID,PNAME,STATE,KM,HISTORY) 
values
('TP4','MIRIJAN FORT','KARNATAKA','700','ROYAL FORT');

insert into TPLACE
(PLACE_ID,PNAME,STATE,KM,HISTORY) 
values
('TP5','ABBEY FALLS','KARNATAKA','300','FALLS');

insert into TPLACE
(PLACE_ID,PNAME,STATE,KM,HISTORY) 
values
('TP6','SHARAVATHI BACKWATER','KARNATAKA','700','FALLS');

mysql> SELECT * FROM TPLACE;
+----------+----------------------+-----------+-----+------------+
| PLACE_ID | PNAME                | STATE     | KM  | HISTORY    |
+----------+----------------------+-----------+-----+------------+
| TP1      | BEKALA               | KERALA    | 500 | KINGS FORT |
| TP2      | MANZARABAD           | KARNATAKA | 400 | KINGS FORT |
| TP3      | TANNIRBHAVI          | KARNATAKA | 500 | BEACH      |
| TP4      | MIRIJAN FORT         | KARNATAKA | 700 | ROYAL FORT |
| TP5      | ABBEY FALLS          | KARNATAKA | 300 | FALLS      |
| TP6      | SHARAVATHI BACKWATER | KARNATAKA | 700 | FALLS      |
+----------+----------------------+-----------+-----+------------+

insert into TOURIST
(TOURIST_ID,TNAME,AGE,COUNTRY) 
values
('T1','MAYURA',21,'INDIA');

insert into TOURIST
(TOURIST_ID,TNAME,AGE,COUNTRY) 
values
('T2','AKASHA',22,'INDIA');

insert into TOURIST
(TOURIST_ID,TNAME,AGE,COUNTRY) 
values
('T3','GEETHA',22,'SRI LANKA');

mysql> SELECT * FROM TOURIST;
+------------+--------+-----+-----------+
| TOURIST_ID | TNAME  | AGE | COUNTRY   |
+------------+--------+-----+-----------+
| T1         | MAYURA |  21 | INDIA     |
| T2         | AKASHA |  22 | INDIA     |
| T3         | GEETHA |  22 | SRI LANKA |
+------------+--------+-----+-----------+


INSERT INTO TOURIST VALUES('&TOURIST_ID','&TNAME',&AGE,'&COUNTRY');

insert into VISIT
(TOURIST_ID,PLACE_ID,VDATE) 
values
('T1','TP1','2022-05-12');

insert into VISIT
(TOURIST_ID,PLACE_ID,VDATE) 
values
('T2','TP1','2022-05-15');

insert into VISIT
(TOURIST_ID,PLACE_ID,VDATE) 
values
('T1','TP2','2022-05-14');

insert into VISIT
(TOURIST_ID,PLACE_ID,VDATE) 
values
('T1','TP3','2022-05-20');

insert into VISIT
(TOURIST_ID,PLACE_ID,VDATE) 
values
('T2','TP2','2022-05-18');

insert into VISIT
(TOURIST_ID,PLACE_ID,VDATE) 
values
('T3','TP2','2022-05-25');

insert into VISIT
(TOURIST_ID,PLACE_ID,VDATE) 
values
('T3','TP2','2022-05-26');

insert into VISIT
(TOURIST_ID,PLACE_ID,VDATE) 
values
('T3','TP5','2022-05-30');

insert into VISIT
(TOURIST_ID,PLACE_ID,VDATE) 
values
('T3','TP6','2022-06-05');

ALTER TABLE VISIT DROP PRIMARY KEY;
ALTER TABLE VISIT ADD PRIMARY KEY(TOURIST_ID,PLACE_ID,VDATE);
mysql> SELECT * FROM VISIT;
+------------+----------+------------+
| TOURIST_ID | PLACE_ID | VDATE      |
+------------+----------+------------+
| T1         | TP1      | 2022-05-12 |
| T1         | TP2      | 2022-05-14 |
| T1         | TP3      | 2022-05-20 |
| T2         | TP1      | 2022-05-15 |
| T2         | TP2      | 2022-05-18 |
| T3         | TP2      | 2022-05-25 |
| T3         | TP2      | 2022-05-26 |
| T3         | TP5      | 2022-05-30 |
| T3         | TP6      | 2022-06-05 |
+------------+----------+------------+


insert into MAIL
(TOURIST_ID,EMAIL) 
values
('T1','mayurap1002@gmail.com');

insert into MAIL
(TOURIST_ID,EMAIL) 
values
('T2','akashkrishna918gmail.com');

insert into MAIL
(TOURIST_ID,EMAIL) 
values
('T3','geethagovinda@gmail.com');

insert into MAIL
(TOURIST_ID,EMAIL) 
values
('T3','geethaBHARATHI@gmail.com');

mysql> SELECT * FROM MAIL;
+------------+--------------------------+
| TOURIST_ID | EMAIL                    |
+------------+--------------------------+
| T1         | mayurap1002@gmail.com    |
| T2         | akashkrishna918gmail.com |
| T3         | geethaBHARATHI@gmail.com |
| T3         | geethagovinda@gmail.com  |
+------------+--------------------------+


Queries:
i. List the state name which is having maximum number of tourist places.

SELECT STATE,COUNT(PLACE_ID) 
FROM TPLACE 
GROUP BY STATE 
ORDER BY COUNT(PLACE_ID)DESC 
LIMIT 1;
+-----------+-----------------+
| STATE     | COUNT(PLACE_ID) |
+-----------+-----------------+
| KARNATAKA |               5 |
+-----------+-----------------+

ii. List details of Tourist place where maximum number of tourists visited.

SELECT TP.PLACE_ID, TP.PNAME, TP.STATE, COUNT(V.TOURIST_ID) 
FROM TPLACE TP,VISIT V
WHERE V.PLACE_ID=TP.PLACE_ID 
GROUP BY V.PLACE_ID 
ORDER BY COUNT(V.PLACE_ID)DESC 
LIMIT 1;

+----------+------------+-----------+---------------------+
| PLACE_ID | PNAME      | STATE     | COUNT(V.TOURIST_ID) |
+----------+------------+-----------+---------------------+
| TP2      | MANZARABAD | KARNATAKA |                   4 |
+----------+------------+-----------+---------------------+

iii. List the details of tourists visited all tourist places of the state “KARNATAKA”.

SELECT * FROM TOURIST
WHERE TOURIST_ID IN(
    SELECT TOURIST_ID FROM VISIT 
    WHERE PLACE_ID IN(
        SELECT PLACE_ID 
        FROM TPLACE 
        WHERE STATE='KARNATAKA'
    )
);

+------------+--------+-----+-----------+
| TOURIST_ID | TNAME  | AGE | COUNTRY   |
+------------+--------+-----+-----------+
| T1         | MAYURA |  21 | INDIA     |
| T2         | AKASHA |  22 | INDIA     |
| T3         | GEETHA |  22 | SRI LANKA |
+------------+--------+-----+-----------+

iv. Display the details of the tourists visited at least one tourist place of the state, but visited
all states tourist places.
/*
select DISTINCT STATE,TOURIST.TOURIST_ID
from TPLACE, VISIT, TOURIST
where VISIT.TOURIST_ID=TOURIST.TOURIST_ID 
AND VISIT.PLACE_ID=TPLACE.PLACE_ID;
*/


SELECT * FROM TOURIST WHERE TOURIST_ID IN(
SELECT TOURIST_ID 
FROM VISIT, TPLACE 
WHERE VISIT.PLACE_ID=TPLACE.PLACE_ID
GROUP BY(TOURIST_ID)
havinG COUNT(DISTINCT STATE)
IN (SELECT COUNT(DISTINCT STATE) FROM TPLACE)
);

+------------+--------+-----+---------+
| TOURIST_ID | TNAME  | AGE | COUNTRY |
+------------+--------+-----+---------+
| T1         | MAYURA |  21 | INDIA   |
| T2         | AKASHA |  22 | INDIA   |
+------------+--------+-----+---------+

SELECT * FROM TPLACE 
WHERE PLACE_ID IN( SELECT PLACE_ID FROM VISIT,TOURIST
WHERE VISIT.TOURIST_ID=TOURIST.TOURIST_ID
GROUP BY PLACE_ID
havinG COUNT(DISTINCT COUNTRY)=(
SELECT COUNT(DISTINCT COUNTRY) 
FROM TOURIST)
);

+----------+------------+-----------+-----+------------+
| PLACE_ID | PNAME      | STATE     | KM  | HISTORY    |
+----------+------------+-----------+-----+------------+
| TP2      | MANZARABAD | KARNATAKA | 400 | KINGS FORT |
+----------+------------+-----------+-----+------------+


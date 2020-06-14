/* fisrt we are creating tables we discussed in the ER diagram 
and we are specigying the primary and foreign keys */

CREATE TABLE [prisoner] (
  [prisoner_ID] bigint,
  [prisoner_name] varchar(50),
  [prisoner_age] int,
  PRIMARY KEY ([prisoner_ID])
);
CREATE TABLE [prison] (
  [prison_name] varchar(50),
  [prisoner_ID] bigint,
  [case_number] int,
  [cell_number] int,
  [prison_adress] varchar(50),
  PRIMARY KEY ([prison_name])
);
CREATE INDEX [FK] ON  [prison] ([prisoner_ID], [case_number]);
CREATE TABLE [case_] (
  [case_number] int,
  [accusation] varchar(50),
  [beginning] date,
  [duration] varchar(50),
  PRIMARY KEY ([case_number])
);



/* Here we are inserting some data to each table to try select fonctions on
i added three objects to each table */

-- insrting data to prisoner table
insert into prisoner
(prisoner_ID,prisoner_name,prisoner_age)
values
(098567,'Hady',19);
insert into prisoner
(prisoner_ID,prisoner_name,prisoner_age)
values
(123654,'Eithar',20);
insert into prisoner
(prisoner_ID,prisoner_name,prisoner_age)
values
(567432,'Mohamed',19);

-- inserting data to prison table
insert into prison
(prison_name,prisoner_ID,case_number,cell_number,prison_adress)
values
('Zenda',098567,45,30,'california');
insert into prison
(prison_name,prisoner_ID,case_number,cell_number,prison_adress)
values
('Abo zabal',123654,60,12,'Cairo');
insert into prison
(prison_name,prisoner_ID,case_number,cell_number,prison_adress)
values
('Abaadia',567432,90,120,'New York');

-- inserting data to case table
insert into case_
(case_number,accusation,beginning,duration)
values
(45,'robbery','18 jan 2020','3 years');
insert into case_
(case_number,accusation,beginning,duration)
values
(60,'raiping','25 mar 2020','12 years');
insert into case_
(case_number,accusation,beginning,duration)
values
(90,'drugs','5 dec 2020','25 years');



/* here we are testing Select Statements using Different Functions 
we are using 20 functions on our data we have inserted before*/

-- 1) How to convert string using select statement?
select LOWER (prisoner_name) As Lowercaseprisoner_name
from dbo.prisoner
where prisoner_ID = 098567;
-- 2) How to concatinate two strings using select statement?
select CONCAT_WS ('&' , prisoner_Name , 'Mask')
from dbo.prisoner
where prisoner_ID = 567432;
-- 3) How to caculate the lenght of string using select statement?
select LEN (prison_adress)
from dbo.prison
where prison_name = 'Zenda';
-- 4) How to reverse string using select statement?
select REVERSE (prison_adress)
from dbo.prison
where prison_name = 'Abo zabal';
-- 5) How to extract number of characters from the right out of string?
select RIGHT(prisoner_name, 2) as ExtractString
from dbo.prisoner
where prisoner_ID = 567432;
-- 6) How to convert a number to string using select statement?
select STR (prisoner_age)
from dbo.prisoner
where prisoner_ID =123654;
-- 7) How to replace number of characters in string using select statement?
select STUFF (beginning, 1, 3, '31')
from dbo.case_
where case_number = 45;
-- 8) How to  convert string to uppercase using select statement?
select UPPER (prisoner_Name) AS Uppercaseprisoner_Name
from dbo.prisoner;
-- 9) How to extract number of characters out of string using select statement?
select SUBSTRING (prisoner_Name, 1, 3) AS ExtractString
from dbo.prisoner
where prisoner_ID = 123654;
-- 10) How to calculate cos of number using select statement?
select COS (cell_number)
from dbo.prison
where prison_name = 'Abaadia';
-- 11) how to return the cotangent of number using select statement?
select COT (prisoner_ID)
from dbo.prison
where prison_name = 'Zenda';
-- 12) How to return e raised to the power of number using select statement?
select EXP(cell_number)
from dbo.prison
where prison_name = 'Abo zabal';
-- 13) How to get log10 of number using select statement?
select LOG10 (prisoner_ID)
from dbo.prison
where prison_name = 'Abaadia';
-- 14) How to get the maximum number of column using select statement?
select MAX (cell_number) AS Largestcell_number
from dbo.prison;
-- 15) How get the minimum number of column using select statement?
select MIN (cell_number) AS Smallestcell_number
from dbo.prison;
-- 16) How to get a random number using select statement?
select RAND (prisoner_age)
from dbo.prisoner
where prisoner_ID = 567432;
-- 17) How to return the sin of number using select statement?
select SIN (case_number)
from dbo.prison;
-- 18) How to return the SQRT of number using select statement?
select SQRT (prisoner_ID)
from dbo.prisoner
where prisoner_age = 20;
-- 19) How to return the square of number using select statement?
select SQUARE (prisoner_age)
from dbo.prisoner;
-- 20) How to return the tan of number using select statement?
select TAN (case_number)
from dbo.prison;



/* here we are testing select statements using different joins, Sub Query and Count and Group Functions
on the data we have inserted and here we finish select statements task*/

-- Sub Query
-- 1)
select prisoner_Name from prisoner where prisoner_ID in (select prisoner_ID from prison where prison_name = 'Abo zabal');
-- 2)
select accusation from case_ where case_number in (select case_number from prison where prisoner_ID = 098567);
-- 3)
select prison_adress from prison where case_number in (select case_number from case_ where accusation = 'robbery');
-- Count an Group
select COUNT (prisoner_Name)
from prisoner;
-- 1)
select prisoner_Name , COUNT(prisoner_ID)
from prisoner
group by prisoner_Name;
-- 2)
select prison_name , COUNT(prisoner_ID)
from prison
group by prison_name
-- Different Joins
-- 1)
select prisoner_Name , prison_name
from prisoner , prison
where prison.prisoner_ID = prisoner.prisoner_ID;
-- 2)
select prison_name , accusation
from case_ , prison
where prison.case_Number = case_.case_Number;
-- 3)
select prisoner_age , prison_adress
from prisoner , prison
where prison.prisoner_ID = prisoner.prisoner_ID;
-- 4)
select prisoner_ID , duration
from prison , case_
where prison.case_Number = case_.case_Number;
-- 5)
select prisoner_name , prison_adress
from prisoner , prison
where prison.prisoner_ID = prisoner.prisoner_ID;



/* here we show some examples of updating data 
in case we need to change information about anything */
-- 1)
update dbo.prisoner
set prisoner_Name = 'Ziad'
where prisoner_Name = 'Mohamed';
-- 2)
update dbo.prison
set cell_number = 30
where prison_name = 'Abo zabal';
-- 3)
update dbo.case_
set accusation = 'fraud'
where case_Number = 45;
-- 4)
update dbo.prisoner
set prisoner_age = 21
where prisoner_ID = 123654;
-- 5)
update dbo.prison
set prison_adress = 'San Fransisko'
where prison_name = 'Abaadia';



/* here we show some examples of deleting data
in case a prisoner finished his duration or some data become out of date */
-- 1)
delete dbo.prisoner
where prisoner_ID = 123654;
-- 2)
delete dbo.prison
where prison_name = 'Abo zabal';
-- 3)
delete dbo.case_
where case_Number = 45;
-- 4)
delete dbo.case_
-- 5)
where duration = '12 years';
delete dbo.prison
where prisoner_ID = 567432;
create database Cricket;
use Cricket;
create table Players(
Name char(10),
JersyNO int,
NumOfMatches int
);

insert into Players 
values( "Dhoni", 7, 100),
( "Rohit", 12, 70),
( "Kohli", 11, 150),
( "Kohli", 15, 130)
;

delete from Players
where JersyNO =7;

select * from Players;

update Players 
set Name = "Hardik"
where JersyNO = 15;

drop table Players;

alter table Players
add TotalYears int;

-- to check table Structure
describe Players;

alter table Players
drop TotalYears;

describe Players;

alter table Players
modify Name varchar(30);

alter table Players
rename column JersyNO to JerseyNo;

alter table Players
rename to PLayers_Info;

describe Players_Info;
select * from Players_Info;

truncate table Players_Info;

insert into Players_Info 
values( "Dhoni", 7, 100),
( "Rohit", 12, 70),
( "Kohli", 11, 150),
( "Kohli", 15, 130)
;

update Players_Info 
set Name = "Hardik"
where JerseyNo = 15;

select * from Players_Info;


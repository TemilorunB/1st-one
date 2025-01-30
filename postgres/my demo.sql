create table weather (
	city	varchar (70),
	temp_lo int,
	temp_hi int,
	prcp	real,
	date	date
);
create table cities (
	name	varchar(50),
	location point
);

insert into weather values ('San Francisco', 46,50,0.25, '1994-11-27');
insert into cities values ('San Francisco', '(-194.0, 53.0)');
insert into weather values ('San Francisco', 43,57,0, '1994-11-29');
insert into weather values ('Hayward', 37,54,0, '1994-8-27');
insert into weather values ('New York', 59,20,0.25, '1993-11-27');
insert into cities values ('San Francisco', '(-192.5, 33.0)');
insert into cities values ('Hayward', '(-129.0, 79.0)');
insert into cities values ('New York', '(-192.0, 43.0)');

select * from weather

select city, (temp_hi+temp_lo)/2 as temp_avg, date from weather

select * from weather where temp_lo<100 and prcp> 0.2

select * from weather order by date asc

select distinct city from weather order by city

select * from cities 
select * from weather

select * from weather join cities on city=name

select city, temp_lo, temp_hi, prcp, date, location from weather
join cities on city= name

insert into cities values ('Miami', '(120.5, 67)')
insert into weather values ('Miami', 23,-34,0.5, '1983-4-27');

select *
from weather, cities
where city=name


create view mypov as
	select name, temp_lo, temp_hi, prcp, date, location
	from weather, cities
	
select * from mypov

create table cities (
	name varchar (99) primary key
	location point
	);

create table weathersss (
cities varchar (77) references cities (name),
temp_lo int,
temp_hi int,
prcp real,
date date);

insert into weathersss values ('Berkeley', 45,53,0.0, '1994-11-28' )

select * from weathersss


create table capitals(
name text,
population real,
elevation int, --(in ft)
state char (2)
);
create table non_capiatls(
name text,
population real,
elevation int --(in ft)
);

)
)
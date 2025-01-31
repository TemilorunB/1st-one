1. who is the senior most employee based on job title?

select * from employee
order by levels desc
limit 1

2. which country has the most invoices?
select * from invoice
order by billing_country

select count (*)as c, billing_country
from invoice
group by billing_country
order by c desc
limit 1

select count (*)as Ground_test, levels
from employee
group by levels
order by Ground_test desc
limit 1



3. what are the top 3 values of total invoices
select * from invoice
order by total desc
limit 3

select total from invoice
order by total desc
limit 3

4. which city has the best customers? we would like to throw a promotional music festival
in the city we made the most money. wite a query that returns one city that has the highest 
sum of invoice total. return both the city name and sum of all invoice total

select * from invoice
order by total desc (order by billing_city)

select sum(total) as invoice_total, billing_city 
from invoice
group by billing_city
order by invoice_total desc

5. who is the best customer? the customer who has spent the most money will be declared the best
customer. write a query that returns the person who has spent the most money.

select * from customer

select customer_id, total from invoice
order by customer_id
group by customer_id


select count (*) as testing, customer_id, total, first_name, last_name
from customer
group by total


select customer.customer_id, customer.first_name, customer.last_name, sum(invoice.total) as total
from customer
join invoice on customer.customer_id = invoice.customer_id
group by customer.customer_id
order by total desc
limit 1


--moderate questions
1. write a querry to return the email, firstname, last name and genre of all rock music listners
return your list order alphabetically by email starting with A

select email, first_name,last_name from customer

select distinct email, first_name, last_name
from customer
join invoice on customer.customer_id = invoice.customer_id
join invoice_line on invoice.invoice_id = invoice_line.invoice_id
where track_id in (
	select * from track
	join genre on track.genre_id = genre.genre_id
	where genre.name like 'Rock'
)
order by email;

2. lets invite th artist who have written the most rock music in our dataset
write a querythat returns the artist and total track count of the top 10 rock bands

select artist.artist_id, artist.name, count (artist.artist_id) as number_of_songs
from track
join album on album.album_id = track.album_id
join artist on artist.artist_id = album.artist_id
join genre on genre.genre_id = track.genre_id
where genre.name like 'Rock'
group by artist.artist_id
order by number_of_songs desc
limit 10

select * from track

3. return all the track names that have a song length longer than the average song length
return the name and millisecond for each track, order by the songs withe the longest song listed first

select name, milliseconds
from track
where milliseconds>(
	select avg (milliseconds) as avg_track_length
	from track)
	order by milliseconds desc;

--- advance question
1. find how much amount spent by each customer on artist write a query to return customer name, artist name and total spent

nahhhh

create table pgtest(
testval varchar(10)
);


insert into pgtest (testval)
values ('hello');

select testval
from pgtest

3.5 fro psql textbok
select * from invoice
select invoice_id, customer_id, billing_state, avg(total) over (partition by billing_state) from invoice


select invoice_id, customer_id, billing_postal, total, rank() over (partition by billing_postal order by total desc) from invoice


select invoice_id, total,billing_state, sum(total) over (order by total) from invoice

select * from album
select * from artist


select * from album
join artist
on (album.artist_id=artist.artist_id)

select * from artist join album on album.artist_id=artist.artist_id limit 50

select c.artist_id as category_name
from album
join artist
on (album.artist_id=artist.artist_id)

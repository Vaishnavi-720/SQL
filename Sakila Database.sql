use Sakila;

select * from actor;

-- 1a. Display the first and last names of all actors from the table `actor`. 
select first_name, last_name
from actor;

-- 1b. Display the first and last name of each actor in a single column in upper case letters. Name the column `Actor Name`.
select upper(concat(first_name, ' ',  last_name))
from actor;

-- 2a. You need to find the ID number, first name, and last name of an actor, of whom you know only the first name, "Joe." What is one query would you use to obtain this information?
  select actor_id, first_name, last_name
  from actor 
  where first_name = 'Joe';
  
  -- 2b.  Find all actors whose last name contain the letters `GEN`.
  
  select * from actor 
  where last_name like '%GEN%';
  
-- Which actors have the first name ‘Scarlett’
select * from actor
where first_name = 'Scarlett';

-- Which actors have the last name ‘Johansson’
select * from actor
where last_name = 'Johansson'; 

-- How many distinct actors last names are there?
select count(distinct last_name)
from actor;

-- Which last names are not repeated?
select distinct last_name
from actor;

select last_name
from actor
where last_name != (select count(last_name)
from actor
group by last_name
having count(last_name) > 1);

select last_name from actor group by last_name having count(last_name) = 1;

-- Which last names appear more than once?
select last_name
from actor
group by last_name
having count(last_name) > 1;

-- Which actor has appeared in the most films?
select * from film;
select * from film_actor;
select * from actor;

select actor.actor_id, actor.first_name, actor.last_name,
       count(actor_id) as film_count
from actor join film_actor using (actor_id)
group by actor_id
order by film_count desc
limit 1;

-- Is ‘Academy Dinosaur’ available for rent from Store 1?

-- Insert a record to represent Mary Smith renting ‘Academy Dinosaur’ from Mike Hillyer at Store 1 today .
-- When is ‘Academy Dinosaur’ due?
-- What is that average running time of all the films in the sakila DB?
-- What is the average running time of films by category?
-- Why does this query return the empty set?
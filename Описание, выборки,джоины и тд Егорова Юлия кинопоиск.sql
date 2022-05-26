/*
 ********* Описание базы данных***********
 *База данных онлайн кинотеатра Кинопоиск, про фильмы, сериалы, актеров. 
 *Пользователь может добавить фильм или сериал в избранное или в подборку "Посмотреть позже"
 * */

use kinopoisk;

/*****Группировка******
**№1 посчитать фильмы по количеству жанров, сгруппировть жанры*/
select genre_type_id, count(*) as genre_count 
from films 
where id<=10
group by genre_type_id  ;

-- №2 сгруппировать пользователей по именам
select firstname from users 
group by firstname; 

/********Join'ы*********
 * №1 вывести названия сериалов и количество сезонов
 */ 
select f.name, count(*) as season_count 
from films f 
join serials_seasons s on s.serial_id =f.id 
group by s.serial_id;

/*№2 Вывести имена пользователей и назваия фильмов, которые они добавили в посмотреть позже*/
select u.firstname, f.name from users u 
join look_later ll on  ll.user_id =u.id 
join films f on f.id =ll.film_id ;



/*********Вложенные запросы*******
№1 Посчитать кто больше поставил лайков фильмам мужчины или женщины*/
select count(*) as total, 
(select gender from profiles where user_id=likes.user_id) as gender 
from likes
group by gender;


/*********Представления************
 *№1 Вывести фильмы и актеров, которые в них играют
 * */

create or replace  view view_films_actors
as 
select f.id, f.name,   a.name_surname
from films f
join films_actors fa on fa.film_id=f.id 
join actors a on a.id=fa.actor_id ;

select * from view_films_actors
where id<11 ;

/*№2 вывести данные пользователей и сериалы которые им понравились
 * */
create or replace view view_like_serials
as 
select f.name, u.firstname, u.lastname
from films f
join likes l on l.film_id = f.id 
join users u on u.id =l.user_id 
where f.genre_type_id =8;

select * from view_like_serials ;

/***********Тригеры************/

/*проверка обновления профиля, дата рождения должна быть в прошлом*/
delimiter //

create trigger check_user_age before update on profiles
for each row
begin
   if new.birthday >= current_date()  then 
       signal sqlstate '45000' set message = 'Update Canceled. Birthday must be in the past!';
    end if;
end//

delimiter ;

/****************Процедуры********************/
/*Процедура, предлагающая пользователю фильм по критерию жанра, уже имеющегося в у него в лайках*/

drop procedure if exists films_offer;

delimiter //
create procedure films_offer (in for_user_id INT)
  begin
	  select name 
	  from films 
	 where genre_type_id in (select genre_type_id where id in (select film_id from likes where user_id=for_user_id)) ; 
  end//
delimiter ;
 
call films_offer(5);




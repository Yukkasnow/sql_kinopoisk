drop database if exists kinopoisk;
create database kinopoisk ;
use kinopoisk ;

drop table if exists users;
create table users (
	id serial primary key,
	firstname varchar(50),
	lastname varchar(50),-- фамилия
	email varchar (100),
	phone bigint
	);
insert users (firstname, lastname, email, phone)
values
	('Иван','Петров','ivanp@ya.ru','9634452827'),
   ('Федор','Иванов','fedori@mail.ru','9852647513'),
   ('Артем','Яковлев','artya@mail.ru','9857649552'),
   ('Ирина','Антонова','iraa@gmail.com','9786845520'),
   ('Алина','Олешко','alol@ya.ru','9353697845'),
   ('Мария','Кузнецова','makuz@ya.ru','9632587414'),
   ('Антон','Ненахов','annen@mail.ru','9854563625'),
   ('Иван','Петров','ivp@ya.ru','9414522741'),
   ('Николай','Данилков','nikd@mail.ru','9785886542'),
   ('Жанна','Рогова','janr@gmai.com','9885694523'),
  ('Александр','Семенов','alexsem56@ya.ru','9658545522'),
('Людмила','Шишкина','ludochka224@gmail.com','9874566522'),
('Антон','Мещеряков','antony23@yandex.ru','9638524569'),
('Михаил','Андреев','mishkaand@yandex.ru','9754865231'),
('Анастасия','Лукьянова','lukanastas@gmail.com','9545869523'),
('София','Малютина','sofa98@ya.ru','9364562312'),
('Петер','Петров','petrpetrov@ya.ru','9868567885'),
('Дмитрий','Иванов','dimon556@yandex.ru','9785462563'),
('Ростислав','Шейнов','roshe01@gmail.com', '9455877952'),
('Алексей','Груздев','alexg@gmail.com','9633487582'),
('Анна','Романова','anutarom@gmail.com','9215899874'),
('Ольга','Анискика','olgaan76@ya.ru','9315697846'),
('Татьяна','Ермакова','taalika@mail.ru','9128599637'),
('Николай','Захаров','nikolazah@mail.ru','9128569428'),
('Семен','Сидоров','sema756@yandex.ru','9426507999'),
('Елизавета','Стародубченко','lizok00@yandex.ru','9236575828'),
('Роза','Гладиулусова','rosaflower23@yandex.ru','9318754526'),
('Егор','Хромушкин','egorka228@gmail.com','9632455689'),
('Ольга','Волобуева','vololga@mail.ru','9369874526'),
('Михаил','Дорофеев','mihador89@yandex.ru','9785694652')
;
create index user_email_idx on users(email);
create index user_name_lastname_idx on users(firstname, lastname);

drop table if exists photos;
create table photos(
id serial primary key,
 `size` bigint 
);
insert photos ( `size`)
values 
(58),(152),(36),(78),(89),(55),(69),(85),(96),(85),
(130),(75),(86),(89),(155),(78),(63),(98),(75),(96),
(57),(52),(136),(87),(81),(45),(49),(81),(106),(48),
(110),(85),(96),(81),(55),(25),(39),(83),(58),(99),
(77),(54),(113),(75),(119),(58),(99),(125),(68),(88),
(116),(96),(73),(121),(86),(57),(79),(113),(82),(93);

drop table if exists profiles;
create table profiles (
	user_id serial primary key,
	birthday date,
	gender char(1),
	created_at datetime default now(),
	photo_id bigint unsigned not null,
 	foreign key (user_id) references users(id) on update cascade on delete cascade, 
 	foreign key (photo_id) references photos(id) on update cascade on delete cascade
);
insert profiles  (birthday , gender , photo_id)
values
	('1998-02-20','m',1),
   ('1985-02-15','m',2),
   ('2000-07-15','m',3),
   ('2000-09-20','f',4),
   ('2000-04-01','f',5),
   ('2000-04-01','f',6),
   ('1982-09-22','m',7),
   ('1974-06-07','m',27),
   ('2001-06-24','m',8),
   ('1970-08-15','f',9),
  ('1983-02-03','m',10),
('1992-01-09','f',11),
('1996-06-03','m',12),
('2010-05-07','m',27),
('1993-11-14','f',13),
('2001-06-03','f',14),
('2003-10-10','m',15),
('2012-06-14','m',16),
('2002-11-18','m',17),
('2000-04-25','m',18),
('1962-06-13','f',28),
('1964-12-06','f',19),
('1975-05-09','f',20),
('2000-04-26','m',21),
('1989-07-14','m',22),
('2000-08-29','f',23),
('1963-10-30','f',29),
('2010-02-10','m',24),
('1978-05-13','f',25),
('2015-09-15','m',26)
;



drop table if exists genres;
create table genres (
	id serial primary key,
	name varchar(100)
);
insert genres (name)
values 
('Драма'),
('Комедия'),
('Мелодрома'),
('Ужасы'),
('Документальный'),
('Семейный'),
('Детский'),
('Сериал');

drop table if exists films;
create table films(
	id serial primary key,
	name varchar (150),
	relise_date date,
	genre_type_id bigint unsigned,-- жанр
	is_serial varchar default null
	foreign key (genre_type_id) references genres(id)
);
create index film_name_idx on films(name);
insert films (name,relise_date, genre_type_id)
values
('Гарри Поттер','2002-03-21',6),
('Пираты Карибскогоо моря','2003-08-22',6),
('Сумерки','2008-11-28',3),
('Король Лев','1995-01-20',7),
('Время','2011-09-30',3),
('Круэлла','2021-06-18',6),
('Зверопой 2','2021-12-23',7),
('Пила','2004-12-16',4),
('Дом Gucci','2021-06-12',5),
('Побег из Шоушенка','1994-09-18',1);
('Во все тяжкие','2008-01-03',8),
('Кости','2005-09-23',8),
('Касл','2009-03-09',8),
('Обмани меня','2009-01-21',8),
('Сверхъестественное','2005-09-13',8),
('Бесстыжие','2011-01-09',8),
('Симпсоны','1989-12-17',8),
('Рик и Морти','2013-12-02',8),
('Ивановы Ивановы','2017-10-16',8),
('Полицейский с рублевки','2016-03-17',8);

select name from films 
where genre_type_id =8;

drop table if exists seasons;
create table seasons(
id serial primary key,
`number` bigint unsigned);
insert seasons  (`number`)
values (1),(2),(3),(4),(5),(6),(7),(8),(9),(10),(11),(12),(13),(14),(15);

drop table if exists serials_seasons;
create table serials_seasons (
serial_id bigint unsigned not null ,
season_id  bigint unsigned not null,
primary key (serial_id,season_id),
foreign key (serial_id) references films(id),
foreign key (season_id) references seasons(id)
);

insert serials_seasons (serial_id, season_id)
values 
(11,1),(11,2),(11,3),(11,4),(11,5),(11,6),
(12,1),(12,2),(12,3),(12,4),(12,5),(12,6),(12,7),(12,8),(12,9),(12,10),
(13,1),(13,2),(13,3),(13,4),(13,5),
(14,1),(14,2),(14,3),
(15,1),(15,2),(15,3),(15,4),(15,5),(15,6),(15,7),(15,8),(15,9),(15,10),(15,11),(15,12),
(16,1),(16,2),(16,3),(16,4),(16,5),(16,6),(16,7),(16,8),(16,9),(16,10),(16,11),(16,12),(16,13),
(17,1),(17,2),(17,3),(17,4),(17,5),(17,6),(17,7),(17,8),(17,9),(17,10),
(18,1),(18,2),(18,3),(18,4),(18,5),(18,6),(18,7),(18,8),(18,9),(18,10),(18,11),(18,12),
(19,1),(19,2),
(20,1),(20,2),(20,3);

drop table if exists actors;
create table actors(
	id serial primary key,
	name_surname varchar(150),
	photo_id bigint unsigned not null,
	foreign key (photo_id) references photos(id)
);
create index actor_name_idx on actors(name_surname);
insert actors (name_surname,photo_id)
values
('Эмма Уотсон',30),-- Гарри
('Дэниэл Редклиф',31), -- Гарри
('Джонни Дэп',32), -- Пираты
('Орландо Блум',33), -- Пираты
('Кристен Стюарт',34), -- Сумерки
('Роберт Паттисон',35), -- Сумерки
('Джереми Айронс',36), -- Король 
('Мэттью Броддерик',37),
('Джастин Тимберлейк',38), -- Время
('Оливия Уайлд',39), -- Время
('Эмма Стоун',40), -- Круэлла
('Эмма Томпсон',41), -- Круэлла
('Скарлет Йохансен',42), -- Зверопой
('Джаред Летто',43), -- Гуччи
('Тобин Белл',44), -- Пила
('Морган Фриман',45), -- Шоушенк
('Брайан Кренстнон',46), -- Во все тяжкие
('Аарон Пол',47), -- Во все тяжкие
('Эмили Дешанель',48), -- Кости
('Дэвид Борианаз',49), -- Кости
('Стана Катич',50), -- Касл
('Натан Филлион',51), -- Касл
('Келли Вильямс',52), -- Обмани меня
('Тим Рот',53), -- Обмани меня
('Сергей Борунов',54), -- Полицейский Ивановы
('Дженсен Эклс',55), -- Сверхи
('Россум Эмми',56), -- Бесстыжие
('Грэнинг Мэтт',57), -- Симпсоны
('Дэн Хармон',58); -- Симпсоны, Рик и Морти

drop table if exists films_actors;
create table films_actors (
	actor_id bigint unsigned not null ,
	film_id bigint unsigned not null,
	primary key (actor_id, film_id),
	foreign key (actor_id) references actors(id),
	foreign key (film_id) references films(id)
);
insert films_actors (film_id,actor_id)
values 
(1,1),(1,2),(2,3),(2,4),(3,5),(3,6),(4,7),(4,8),(5,9),(5,10),(6,11),(6,12),
(7,13),(8,14),(9,15),(10,16), 
(11,17),(11,18),(12,19),(12,20),(13,21),(13,22),(14,23),(14,24),(19,25),(20,25),(15,26),(16,27),
(17,28),(17,29),(18,29);
drop table if exists likes;
create table likes(
	id serial primary key ,
	film_id bigint UNSIGNED NOT NULL ,
	user_id bigint UNSIGNED NOT NULL, 
	foreign key (user_id) references users(id) on update cascade on delete cascade,
	foreign key (film_id) references films(id) on update cascade on delete cascade
);

insert likes (film_id,user_id)
values 
(1,5),(2,3),(2,9),(3,15),(8,15),
(5,10),(2,12),(6,7),(8,10),(10,3),
(11,12),(12,18),(15,26),(18,2),(17,6),
(13,23),(17,21),(16,15),(16,8),(20,2),
(20,22),(19,6),(12,5),(11,5),(18,25)
;

drop table if exists look_later;
create table look_later (
id serial primary key,
film_id bigint unsigned not null,
user_id bigint unsigned not null,
foreign key (film_id) references films(id),
foreign key (user_id) references profiles (user_id)
);

insert look_later (film_id,user_id)
values
(1,3),(2,24),(3,14),(3,18),(4,6),
(7,1),(9,30),(10,28),(2,24),(8,24),
(11,2),(16,8),(15,9),(20,23),(15,18),
(12,9),(14,28),(13,26),(16,24),(14,28),
(13,14),(17,27),(18,8),(19,1),(20,20)
;





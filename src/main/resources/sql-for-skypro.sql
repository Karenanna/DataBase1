select * from employ;
INSERT INTO employ (first_name, last_name, gender, age) VALUES ('Anna', 'Popova', 'female', 25);
INSERT INTO employ (first_name, last_name, gender, age) VALUES ('Oleg', 'Petrov', 'male', 30);
INSERT INTO employ (first_name, last_name, gender, age)	VALUES ('Igor', 'Ivonov', 'male', 28);
INSERT INTO employ (first_name, last_name, gender, age)	VALUES ('Ivan', 'Golunov', 'male', 35);
INSERT INTO employ (first_name, last_name, gender, age)	VALUES ('Yana', 'Ivanova', 'female', 31);


select first_name as Имя, last_name Фамилия from employ;

select * from employ where age < 30 or age>50
order by first_name desc, last_name;

select * from employ
order by last_name desc ;

select * from employ
where length(first_name) >  4;

update employ set first_name = 'Anna',
                  gender = 'female',
                  last_name = 'Popova'
where last_name = 'Ivanova';

select first_name as  имя,
       sum(age) as сумма_всех_возрастов
from employ group by имя;

select first_name as имя, age as возраст
from employ where age=(select  min(age) from employ);

select first_name as имя, max(age) as максимальный_возраст
from employ group by имя having count(first_name) >1;

select * from employ
where age between 30 and 50
order by first_name desc,
         last_name

CREATE TABLE city (
    city_id BIGSERIAL NOT NULL PRIMARY KEY,
    city_name VARCHAR(30) NOT NULL);

ALTER TABLE employ ADD city_id INT;
ALTER TABLE employ ADD CONSTRAINT city_id FOREIGN KEY(city_id) REFERENCES city(city_id);

INSERT INTO city (city_name) VALUES ('Moscow');
INSERT INTO city (city_name) VALUES ('Saint-Petersburg');
INSERT INTO city (city_name) VALUES ('Sochi');
INSERT INTO city (city_name) VALUES ('Novgorod');
INSERT INTO city (city_name) VALUES ('Kazan');

UPDATE employ SET city_id=1 WHERE id=1;
UPDATE employ SET city_id=2 WHERE id=2;
UPDATE employ SET city_id=4 WHERE id=4;
UPDATE employ SET city_id=5 WHERE id=5;
UPDATE employ SET city_id=5 WHERE id=7;
UPDATE employ SET city_id=5 WHERE id=8;

SELECT first_name, last_name, city_name FROM employe
    INNER JOIN city ON employ.city_id=city.city_id;

SELECT first_name, last_name, city_name FROM city
   LEFT JOIN employ ON city.city_id=employ.city_id;

SELECT first_name, city_name FROM employ FULL JOIN city ON employ.city_id=city.city_id;

SELECT first_name, city_name FROM employ CROSS JOIN city;

SELECT  city_name FROM city LEFT JOIN employ ON city.city_id=employ.city_id WHERE employ.first_name IS NULL;



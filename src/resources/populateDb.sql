CREATE TABLE IF NOT EXISTS employee
(
    id         BIGSERIAL   NOT NULL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name  VARCHAR(50) NOT NULL,
    gender     VARCHAR(6)  NOT NULL,
    age        INT         NOT NULL
);

INSERT INTO employee
VALUES (1, 'Ivan', 'Ivanovich', 'man', 20),
       (2, 'Ivanchik', 'Ivanov', 'man', 25),
       (3, 'Ivona', 'Ivanova', 'woman', 30);

SELECT *
FROM employee;

UPDATE employee
SET id=1,
    first_name='Evgen'
where id = 1;

SELECT *
FROM employee;

DELETE
FROM employee
WHERE id = 1;

SELECT *
FROM employee;

/*Задание 1*/
INSERT INTO employee
VALUES (4, 'Jin', 'Jin', 'men', 15),
       (5, 'Fill', 'Fill', 'some', 45);
INSERT INTO employee
VALUES (1, 'Ivan', 'Ivanovich', 'man', 20);
SELECT first_name AS Имя,
       last_name  AS Фамилия
FROM employee;

SELECT *
FROM employee
WHERE age < 30
   OR age > 50;

SELECT *
FROM employee
WHERE age BETWEEN 30 AND 50;

SELECT first_name AS Имя,
       last_name  AS Фамилия
FROM employee
ORDER BY last_name DESC;

SELECT first_name AS Имя,
       last_name  AS Фамилия
FROM employee
WHERE length(last_name) > 4;

/*Задание 2*/
UPDATE employee
SET first_name='Fill'
WHERE id = 4;

UPDATE employee
SET first_name='Ivan'
WHERE id = 2;

SELECT first_name AS Имя,
       sum(age)   AS Фамилия
FROM employee
GROUP BY Имя;

SELECT first_name AS Имя,
       age        AS Возраст
FROM employee
WHERE age = (SELECT min(age) FROM employee);


UPDATE employee
SET age=80
WHERE id = 3;


SELECT first_name AS Имя,
       age        AS Максимальный_возраст
FROM employee
WHERE age = (SELECT MAX(Возраст)
             FROM (SELECT MAX(age) AS Возраст
                   FROM employee
                   GROUP BY first_name
                   HAVING count(first_name) > 1) as eM);

/*Задание 1.1*/
CREATE TABLE IF NOT EXISTS city
(
    city_id   SERIAL PRIMARY KEY,
    city_name VARCHAR(50) NOT NULL
);


/*Задание 1.2*/
ALTER TABLE employee
    ADD COLUMN city_id varchar(50);

ALTER TABLE employee
    ALTER COLUMN city_id TYPE INTEGER USING city_id::integer;

/*Задание 1.3*/
ALTER TABLE employee
    ADD FOREIGN KEY (city_id) REFERENCES city (city_id);

/*Задание 1.4*/
INSERT INTO city
VALUES (1, 'Moscow'),
       (2, 'Novosibirsk'),
       (3, 'Pavlodar');

UPDATE employee
SET city_id=1
WHERE id = 1;
UPDATE employee
SET city_id=2
WHERE id = 2;
UPDATE employee
SET city_id=3
WHERE id = 3;
UPDATE employee
SET city_id=1
WHERE id = 4;
UPDATE employee
SET city_id=2
WHERE id = 5;

SELECT *
FROM employee;

/*Задание 2.1*/
SELECT first_name AS Имя,
       last_name  AS Фамилия,
       city_name

FROM employee
         INNER JOIN city ON employee.city_id = city.city_id
ORDER BY Имя;

INSERT INTO city
VALUES (4, 'NullCity');

/*Задание 2.2*/
SELECT city_name  AS Город,
       first_name AS Имя,
       last_name  AS Фамилия
FROM employee
         RIGHT JOIN city ON employee.city_id = city.city_id
ORDER BY Город;

/*Задание 2.3*/
SELECT city_name  AS Город,
       first_name AS Имя,
       last_name  AS Фамилия
FROM employee
         FULL OUTER JOIN city ON employee.city_id = city.city_id
ORDER BY Город;

/*Задание 2.4*/
SELECT first_name AS Имя,
       city_name  AS Город
FROM employee
         LEFT JOIN city ON employee.city_id = city.city_id
ORDER BY Город;

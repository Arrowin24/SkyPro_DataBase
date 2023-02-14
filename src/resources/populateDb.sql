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

SELECT MAX(age)
FROM employee
GROUP BY first_name
HAVING count(first_name) > 1;

SELECT first_name AS Имя,
       age        AS Максимальный_возраст
FROM employee
WHERE age = (SELECT MAX(Возраст)
             FROM (SELECT MAX(age) AS Возраст
                   FROM employee
                   GROUP BY first_name
                   HAVING count(first_name) > 1) as eM);
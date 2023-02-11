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
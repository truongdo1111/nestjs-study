create database test;
use test;

CREATE TABLE books
(
    id int primary key auto_increment,
    name varchar(255),
    author_name varchar(255),
    release_date date
);

CREATE PROCEDURE DummyDataForBook()
BEGIN
    DECLARE i INT DEFAULT 1;
    WHILE i < 2000000 DO
        INSERT INTO books (name, author_name, release_date)
        VALUES (
                concat('book_name_', i),
                concat('author_name_', i),
                DATE(DATE_SUB(NOW(), INTERVAL ROUND(RAND(1)*1000) DAY))
        );
        SET i := i + 1;
    END WHILE;
END;


CALL DummyDataForBook();

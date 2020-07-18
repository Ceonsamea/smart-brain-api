BEGIN TRANSACTION;

INSERT into users (name, email, entries, joined) values ('Test', 'test@gmail.com', 5, '2018-01-01');
INSERT into login (hash, email) values ('$2a$10$joqwWutyIxfucntraGDg8OujeyT3lIbro9PF9N6o6vXX.gxXKdaTu', 'test@gmail.com');


COMMIT
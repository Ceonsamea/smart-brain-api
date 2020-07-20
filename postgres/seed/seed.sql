BEGIN TRANSACTION;

INSERT into users (name, email, entries, joined) values ('a', 'a@a.com', 5, '2018-01-01');
-- pw is 123
INSERT into login (hash, email) values ('$2a$10$WjIpIT81pIANJrO4lHEhveldTWsxNvnuMvKB9ln4Hftm8M.jE/eB2', 'a@a.com');


COMMIT
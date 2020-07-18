-- Deploy fresh database tables

-- \i executes scripts
-- These scripts were copied to the docker container using ADD in the Dockerfile
\i '/docker-entrypoint-initdb.d/tables/users.sql'
\i '/docker-entrypoint-initdb.d/tables/login.sql'

\i '/docker-entrypoint-initdb.d/seed/seed.sql'
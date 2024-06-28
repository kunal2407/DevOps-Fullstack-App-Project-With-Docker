#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$DB_USER" --dbname "$DB_NAME" <<-EOSQL
CREATE DATABASE employees;                             
CREATE USER test WITH PASSWORD '1234';
GRANT ALL PRIVILEGES ON DATABASE employees TO test;
\c employees
GRANT USAGE ON SCHEMA public TO test;
GRANT CREATE ON SCHEMA public TO test;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO test;
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public TO test;
\q
EOSQL

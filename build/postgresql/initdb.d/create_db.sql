CREATE
OR REPLACE FUNCTION create_dwhexample_db() RETURNS void AS
$$
BEGIN
    CREATE
EXTENSION dblink;
   IF
NOT EXISTS (
      SELECT
      FROM   pg_catalog.pg_roles
      WHERE  rolname = 'dwhexample') THEN

CREATE ROLE dwhexample WITH SUPERUSER LOGIN PASSWORD 'dwhexample';
END IF;
   IF
EXISTS (SELECT FROM pg_database WHERE datname = 'dwhexample') THEN
      RAISE NOTICE 'Database already exists';
ELSE
      PERFORM dblink_exec('dbname=' || current_database()
                        , 'CREATE DATABASE dwhexample');
END IF;
   GRANT ALL PRIVILEGES ON DATABASE
dwhexample TO dwhexample;
END
$$
LANGUAGE plpgsql VOLATILE;

SELECT create_dwhexample_db();

DROP FUNCTION create_dwhexample_db();
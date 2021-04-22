-- здесь происходит загрузка голых данных в таблицы, которые в дальнейшнем
-- будут использоваться для ETL, данные из них будут трансформированы и загружены в
-- core (следующий этап построения DWH)

CREATE TABLE crimes_staging
(
    incident_number    VARCHAR(15),
    offense_code       VARCHAR(10),
    offense_code_group VARCHAR(50),
    offense_desciption VARCHAR(100),
    district           VARCHAR(3),
    reporting_area     VARCHAR(50),
    shooting           VARCHAR(50), --convert to bool
    occurred_on_date   VARCHAR(50), --convert to datetime
    year               INTEGER,
    month              INTEGER,
    day_of_week        VARCHAR(10), --convert to integer
    hour               INTEGER,
    ucr_part           VARCHAR(50),
    street             VARCHAR(50),
    lat                VARCHAR(50),
    lng                VARCHAR(50),
    location           VARCHAR(50)
);

CREATE TABLE offense_codes_staging
(
    offense_code VARCHAR(10),
    offense_name VARCHAR(100)
);

COPY crimes_staging (
                     incident_number,
                     offense_code,
                     offense_code_group,
                     offense_desciption,
                     district,
                     reporting_area,
                     shooting,
                     occurred_on_date,
                     year,
                     month,
                     day_of_week,
                     hour,
                     ucr_part,
                     street,
                     lat,
                     lng,
                     location
    )
    FROM '/dist/crime.csv'
    DELIMITER ','
    CSV HEADER;

COPY offense_codes_staging (
                            offense_code,
                            offense_name
    )
    FROM '/dist/offense_codes.csv'
    DELIMITER ','
    CSV HEADER;
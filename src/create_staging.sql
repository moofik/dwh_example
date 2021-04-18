CREATE TABLE crimes_staging
(
    incident_number    VARCHAR(10),
    offense_code       VARCHAR(5),
    offense_code_group VARCHAR(50),
    offense_desciption VARCHAR(50),
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
    location           VARCHAR(50),
    PRIMARY KEY (incident_number)
);

CREATE TABLE offense_codes_staging
(
    code         VARCHAR(10),
    offense_code VARCHAR(5),
    PRIMARY KEY (code)
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
    FROM '/home/alexander/go/src/awesomeProject/dist/crime.csv'
    DELIMITER ','
    CSV HEADER;

COPY offense_codes_staging (
                            code,
                            offense_code
    )
    FROM '/home/alexander/go/src/awesomeProject/dist/offense_codes.csv'
    DELIMITER ','
    CSV HEADER;
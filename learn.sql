CREATE TABLE aircrafts
(aircrafts_code CHAR(3) NOT NULL,
model TEXT NOT NULL,
range INTEGER NOT NULL,
CHECK (range > 0),
PRIMARY KEY ( aircrafts_code )
);

INSERT INTO aircrafts (range, model, aircrafts_code) 
VALUES (3400, 'test_5', 'SD9');

SELECT model,range 
FROM aircrafts;

INSERT INTO aircrafts (aircrafts_code, model, range)
VALUES ('770', 'boeing 777-300', 11000),
('771', 'boeing 767-300', 7900),
('733', 'boeing 737-300', 4200);

SELECT model, aircrafts_code, range 
FROM aircrafts
ORDER BY range;

SELECT model, aircrafts_code, range
FROM aircrafts
WHERE range>=4000 AND range<=6000;

UPDATE aircrafts 
SET range = 3500
WHERE aircrafts_code = '733';

DELETE FROM aircrafts
WHERE range<=3000 OR range>=15000;

CREATE TABLE seats
(aircrafts_code CHAR(3) NOT NULL,
seat_on VARCHAR(4) NOT NULL,
fare_conditions VARCHAR(10) NOT NULL,
CHECK
(fare_conditions IN ('Economy', 'Comfort', 'Buisness')),
PRIMARY KEY (aircrafts_code, seat_on),
FOREIGN KEY (aircrafts_code)
    REFERENCES aircrafts (aircrafts_code)
    ON DELETE CASCADE
);


INSERT INTO seats (aircrafts_code, seat_on, fare_conditions)
VALUES
('SA3', '1A', 'Buisness'),
('SA3', '1B', 'Buisness'),
('SA3', '10A', 'Economy'),
('SA3', '10B', 'Economy'),
('SA3', '10F', 'Economy'),
('SA3', '20F', 'Economy');


SELECT aircrafts_code, fare_conditions, count(*) FROM seats
GROUP BY aircrafts_code, fare_conditions
ORDER BY aircrafts_code, fare_conditions;


INSERT INTO aircrafts (model, range, aircrafts_code)
VALUES ('testing model', 8900, 'SA8');

DELETE FROM aircrafts 
WHERE aircrafts_code = 'SA8';


UPDATE aircrafts
SET range = 5000
WHERE aircrafts_code = 'SU9';

SELECT 0.1::NUMERIC * 10 = 1.0::NUMERIC;

SELECT $$'test' 17$$;

SELECT E'\'test\'\n17';

SELECT '2026-09-12'::date;

SELECT to_char(CURRENT_DATE, 'dd-mm-yyyy');

SELECT '21:15'::timetz;

SELECT '10:15:12 am'::timetz;

SELECT '2016-9-06 22:25:35'::TIMESTAMPTZ;

SELECT '1 year 2 months 3 minute ago'::INTERVAL;

SELECT (date_trunc('hour', current_timestamp));

SELECT 'testing', TRUE;

SELECT 'true'::BOOLEAN;

{INTEGER, SMALLINT, BIGINT, NUMERIC, REAL, DOUBLE PRECISION, SERIA, SMALLSERIAL, BIGSERIAL,
TEXT, CHAR, VARCHAR, DATE, TIMETZ, TIME, TIMESTAMP, TIMESTAMPTZ, INTERVAL, BOOLEAN, INTEGER[], JSONB}

CREATE TABLE pilo(
    pilot_name TEXT,
    schedule INTEGER[]
);

INSERT INTO pilots (pilot_name, schedule)
VALUES ('Ivan', '{1,3,5,6,7}'),
('Petr', '{1,2,5,7}');

UPDATE pilots
SET schedule = array_append(schedule, 12)
WHERE pilot_name = 'Ivan';

UPDATE pilots
SET schedule = array_prepend(3, schedule)
WHERE pilot_name = 'Petr';

UPDATE pilots
SET schedule = array_remove(schedule, 3)
WHERE pilot_name = 'Ivan';


UPDATE pilots
SET schedule[1] = 2, schedule[2] = 3
WHERE pilot_name = 'Petr'

UPDATE pilots
SET schedule[3:4] = ARRAY[6,7]
WHERE pilot_name = 'Petr';

SELECT * FROM pilots
WHERE array_position(schedule, 3) IS NOT NULL;

SELECT * FROM pilots
WHERE schedule @> '{1,7}'::integer[];

SELECT * FROM pilots
WHERE schedule && ARRAY[2,5];

SELECT unnest(schedule) AS days_of_weeks
FROM pilots
WHERE pilot_name = 'Ivan';

SELECT (ARRAY[1,2] || 99 || ARRAY[3,4]);

CREATE TABLE pilot_hobbies(
name TEXT,
hobbies JSONB
);

INSERT INTO pilot_hobbies (name, hobbies)
VALUES ('Boris', 
'{"sports": ["футболл", "плавание"],
"home_lib": true, "trips": 3
}'
);


UPDATE pilot_hobbies
SET hobbies = hobbies || '{"sports": ["хоккей"]}'
WHERE name = 'Boris';

UPDATE pilot_hobbies
SET hobbies = jsonb_set(hobbies, '{sports, 1}', '"футболл"')
WHERE name = 'Boris';
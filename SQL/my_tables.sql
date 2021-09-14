DROP TABLE animals;
DROP TABLE countries;

CREATE TABLE countries(
    id serial PRIMARY KEY,     -- serial is integer that increases automatically with each new row
    name VARCHAR(50) NOT NULL, 
    population FLOAT NOT NULL
);

CREATE TABLE animals(
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    country_id INT NOT NULL,

    FOREIGN KEY (country_id) REFERENCES countries(id)
);

INSERT INTO 
    countries
    (name, population) 
VALUES
    ('Egypt', 102000000)
;

INSERT INTO
    animals
    (name, country_id)
VALUES
    ('Bald Eagle', 
    (SELECT id 
    FROM countries
    WHERE name = 'Egypt')),

    ('Nile Crocodile', 
    (SELECT id 
    FROM countries
    WHERE name = 'Egypt')),

    ('Cobra', 
    (SELECT id 
    FROM countries 
    WHERE name = 'Egypt'))
; 


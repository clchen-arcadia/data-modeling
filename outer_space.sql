CREATE TABLE stars (
    name VARCHAR(50) PRIMARY KEY,
    temp_kelvin INT NOT NULL);

CREATE TABLE planets (
    name VARCHAR(50) PRIMARY KEY,
    orbital_period_yrs FLOAT NOT NULL,
    star_name VARCHAR(50) NOT NULL REFERENCES stars);


CREATE TABLE moons (
    name VARCHAR(50) PRIMARY KEY,
    planet_name VARCHAR(50) REFERENCES planets);


INSERT INTO stars (name, temp_kelvin) VALUES
('The Sun', 5800),
('Proxima Centauri', 3042),
('Gliese 876', 3192);

INSERT INTO planets (name, orbital_period_yrs, star_name) VALUES
('Earth', 1.00, 'The Sun'),
('Mars', 1.882, 'The Sun'),
('Venus', 0.62, 'The Sun'),
('Proxima Centauri b', 0.03, 'Proxima Centauri'),
('Gliese 876 b', 0.236, 'Gliese 876');

INSERT INTO moons (name, planet_name) VALUES
('The Moon', 'Earth'),
('Phobos', 'Mars'),
('Deimos', 'Mars');

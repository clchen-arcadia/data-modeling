
SELECT planets.name AS planet, stars.name AS star, COUNT(*) AS moon_count
    FROM planets
        LEFT JOIN stars ON planets.star_id = stars.name
        LEFT JOIN moons ON planets.name = moons.planet_id
    GROUP BY planets.name

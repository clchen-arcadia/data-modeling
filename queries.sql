
-- SELECT planets.name AS planet, stars.name AS star, COUNT(*) AS moon_count
--     FROM planets
--         LEFT JOIN stars ON planets.star_id = stars.name
--         LEFT JOIN moons ON planets.name = moons.planet_id
--     GROUP BY planets.name



SELECT planets.name AS planet, stars.name AS star, COUNT(*) as count_star
    FROM planets
        LEFT JOIN stars ON planets.star_id = stars.name
        LEFT JOIN moons ON moons.planet_id = planets.name
    GROUP BY planets.name, stars.name
    ORDER BY planets.name;



-- , CASE WHEN moons.name IS NULL THEN 1 ELSE 0 END AS test

-- , stars.name

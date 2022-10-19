
SELECT
    planets.name AS planet,
    stars.name AS star,
    SUM(CASE WHEN moons.name IS NULL THEN 0 ELSE 1 END)
FROM planets
    LEFT JOIN stars ON planets.star_id = stars.name
    LEFT JOIN moons ON moons.planet_id = planets.name
GROUP BY planets.name, stars.name
ORDER BY planets.name;


SELECT
    planets.name AS planet,
    stars.name AS star,
    COUNT(moons.name)
FROM
    planets
    LEFT JOIN stars ON planets.star_id = stars.name
    LEFT JOIN moons ON moons.planet_id = planets.name
GROUP BY planets.name, stars.name
ORDER BY planets.name;

--COUNT of expression counts non null things. COUNT * is everything

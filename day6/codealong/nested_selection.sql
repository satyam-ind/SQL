-- Nested Selection --
-- What if we had to combine information from different tables?

-- Adding commands to format the output
.headers on
.mode column

-- 1. Which players are taller than the average height?
SELECT first_name, last_name, height
FROM players
WHERE height > (
    SELECT AVG(height)
    FROM players
)
ORDER BY height ASC
LIMIT 5;

-- 2. Which players were born in the most common birthplace? (city)
SELECT first_name, last_name
FROM players
WHERE birth_city = (
    SELECT birth_city
    FROM players
    GROUP BY birth_city
    ORDER BY COUNT(*) DESC
    LIMIT 1
);

-- 3. Which players have played for the team Atlanta Braves?
SELECT first_name, last_name
FROM players
WHERE id IN (
    SELECT player_id
    FROM performances
    WHERE team_id = (
        SELECT id
        FROM teams
        WHERE name = 'Atlanta Braves'
    )
);

-- 4. Which players are likely to have played at Olympics Grounds?
SELECT first_name, last_name
FROM players
WHERE id IN (
    SELECT player_id
    FROM performances
    WHERE team_id = (
        SELECT id
        FROM teams
        WHERE park = 'Olympics Grounds'
    )
);
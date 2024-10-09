-- Joins --

-- Adding commands to format the output
.headers ON
.mode column

-- Question 0. Name the players who got paid salaries in 1999.
-- Process
-- Step 1: Which tables do we want to join? salaries, players -- FROM...
-- Step 2: What is common between the tables? -- ON...
-- Step 3: What do I need to display? -- SELECT...
-- Step 4: Any other filters needed? -- WHERE...
SELECT first_name, last_name
FROM players JOIN salaries
ON players.id = salaries.player_id
WHERE year = 1999;

-- Question 1a. Retrieve the names of players along with the number of games they played in 1920.
SELECT COUNT(*), players.first_name, players.last_name
FROM players JOIN performances
ON players.id = performances.player_id
WHERE performances.year = 1920
GROUP BY performances.player_id;

-- Question 1b. Retrieve the names of players along with the names of the parks where their teams played in 1915.

-- Question 2. Retrieve all player names, along with their performance records in 1920, including those players who have no performances in 1920.
-- Question 3. Retrieve the names of players, their team names, and the salary they earned in 1945.
-- Question 4. List the names of players who hit more than 20 home runs in a single year, along with the year and the team they played for.
-- Question 5. List the first & last name of the top 5 players with most home runs across their career.


-- Set Operations --
-- UNION, INTERSECT, EXCEPT

-- 1. Find the names of players who batted OR threw left-handed (use UNION).
-- 2. Find the names of players who both batted and threw left-handed (use INTERSECT).
-- 3. Retrieve the names of players who were born in the USA but not in California (use EXCEPT).
-- 4. Find the names of players who played in 1900 but did not play in 1901 (use EXCEPT).

-- Do we need set operations to answer these questions?
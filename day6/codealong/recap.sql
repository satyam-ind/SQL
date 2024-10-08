-- Recap Exercises --
-- Single Table Selection
-- Here, we will focus on the players & teams tables.

-- 1. List all distinct team names from the Teams table.
SELECT DISTINCT name
FROM teams;

-- 2. List the names of all players in alphabetical order.
SELECT first_name, last_name
FROM players
ORDER BY first_name ASC, last_name ASC;

-- 3. Select the top 5 players based on batting averages.
-- batting average is RBI
SELECT RBI
FROM performances
ORDER BY RBI DESC
LIMIT 5;

-- 4. Count the number of players in each team.
SELECT team_id, COUNT(DISTINCT player_id)
FROM performances
GROUP BY team_id;

-- 5. Which teams have more than 10 players?
SELECT team_id, COUNT(DISTINCT player_id)
FROM performances
GROUP BY team_id
HAVING COUNT(DISTINCT player_id) > 100;

-- Questions for Additional Practice
-- LIMIT
-- 6. Select the top 10 players with the highest number of RBIs (Runs Batted In).
-- 7. Find the top 5 teams with the most championships won.

-- Aggregate Functions
-- 8. Calculate the total number of home runs hit by all players.
-- 9. Find the average number of wins for all teams.
-- 10. Calculate the maximum number of strikeouts by any player.

-- GROUP BY
-- 11. Group players by their position and count the number of players in each position.
-- 12. Group teams by their league and calculate the average number of wins for each league.

-- HAVING
-- 13. Find teams with an average player age greater than 30.
-- 14. Find positions with more than 5 players.





-- Question 2: "Acousticness" is an interesting quality. Which songs have less than 1% acousticness?
-- Provide track names and acousticness.

SELECT track_name, acousticness
FROM spotify_tracks 
WHERE acousticness < 0.01;
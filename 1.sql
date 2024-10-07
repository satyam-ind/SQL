-- Question 1: What are the names of the tracks with danceability between 30% and 50%?
SELECT track_name 
FROM spotify_tracks 
WHERE danceability BETWEEN 0.3 AND 0.5;

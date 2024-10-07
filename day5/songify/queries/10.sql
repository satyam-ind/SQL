-- Question 10: Which of these song names contain the word "love"?

SELECT track_name
From spotify_tracks
WHERE track_name LIKE '%love%'
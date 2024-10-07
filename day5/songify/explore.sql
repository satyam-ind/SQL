-- explore.sql ("interview the data")
-- The intent here is to understand the structure of the database, and the columns within the table.
-- To answer these questions, you might have to use commands in the SQLite3 shell (Terminal), SQL queries
-- or observe the data using the SQLite Viewer extension.

.headers on
.mode column

Select track_name, popularity, genres
From spotify_tracks;


-- Question 1: What tables are in this database?

-- Question 2: What columns of data does the table contain?

-- Question 3: List all the song and album names.

-- Question 4: What numerical data exists in this table? What is the range of numbers for each column?

-- Add your own questions!

-- SQL File for Collaborative Crossword activity
-- Outcome: to practice advanced single-table selection concepts 📋

-- Enable column headers for better readability
.headers on
.mode column

-- The crossword has a total of 16 words! (10 Across, 6 Down)
-- As mentioned, we lost the clues to the words, but we do have some hints that should help you find the clues.

-- Across
-- 2: The most recent clue ending with the word Cain! (4)
-- 3: This clue was the first alphabetical one for 6-letter words. (6)
-- 7: A clue to a 3-letter word, appeared in NYT crosswords twice and ends with the word flush. (3)
-- 8: The most frequently repeated clue containing the word Purple. (5)
-- 10: The longest clue to a 6-letter word! (6)
-- 11: This clue involves the word clicked and has appeared in NYT crosswords twice! (4)
-- 12: The 5th most common clue to a 5-letter word! (4)
-- 13: A clue to a 5-letter word. 80% features in this clue. (5)
-- 14: A Grammy-related clue to a 7-letter word published in an October NYT crossword. (7)
-- 15: Alphabetically second last 5-word clue published on Oct 26, 2021. (5)

-- Down
-- 1. The single-word clue that is 6 letters long and has appeared more than 60 but less than 65 times! (1, 3)
-- 2. The oldest clue to repeat 105 times in NYT crosswords! (5)
-- 4. A clue about a scavenger that appeared in the crossword on Oct 27, 2021. (5)
-- 5. 'Tis Navratri season, but this clue is related to something that's eighth. It appeared
-- in 2001. (7)
-- 6. This clue contains the word hitched. It has, on average, a word length just higher than 5. (7)
-- 9. A single-word clue that has appeared in 10 past NYT crosswords. On average, the word length
-- for this clue is greater than 8! (2, 5, 4)
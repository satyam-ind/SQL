# Collaborative Crossword
We’ve put together a **crossword puzzle** for you, but in the process, we lost the list of clues! Fortunately, the clues are still in a **database** of past New York Times crossword puzzles, and we have some **hints** that should help you track them down.

Your task is to:
1. **Write Queries:** For each hint, write an SQL query to retrieve the correct clue from the database.
3. **Solve Clue:** Solve the clues retrieved from the database to get the answer words for the crossword!

### Assignment Files:
* `crossword_clues.db`: The SQLite3 database containing clues from past NYT crosswords.
* `queries.sql`: Write SQL queries to retrieve clues here.
* `crossword_image.png`: A picture of the crossword puzzle for reference.

### How To Run:
To execute your queries:
* `sqlite3 crossword_clues.db < queries.sql`

### How to Submit:
* Submit the downloaded `queries.sql` file to Xcelerator!

### Credits
The database was created using the [New York Times Crossword Clues & Answers 1993-2021](https://www.kaggle.com/datasets/darinhawley/new-york-times-crossword-clues-answers-19932021/data) Kaggle dataset, which is in the public domain under a Creative Commons license.
ChatGPT-4o mini was used to help organise some thoughts and ideas, but it turned out not to be the best crossword-helper, so a good old non-AI solution [Crossword Labs](https://crosswordlabs.com/) filled the gap!
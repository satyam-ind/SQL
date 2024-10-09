-- Step 0: Checking the database structure
-- .schema Used to inspect table schema.

-- Step 1: Investigating the crime scene on July 28, 2023, at Humphrey Street.
SELECT * FROM crime_scene_reports 
WHERE year = 2023 AND month = 7 AND day = 28 AND street = 'Humphrey Street';
-- Confirms the theft took place at 10:15 AM at the bakery.

-- Step 2: Analyzing witness interviews from the same day.
SELECT * FROM interviews 
WHERE year = 2023 AND month = 7 AND day >= 28;
-- Witnesses provide insights into the thief’s actions after the crime:
-- - Witness 161: Thief exited via car from the bakery.
-- - Witness 162: Thief was seen at an ATM.
-- - Witness 163: Thief made a short call after leaving.

-- Step 3: Investigating bakery parking logs (matches Witness 161’s observation).
SELECT * FROM bakery_security_logs 
WHERE year = 2023 AND month = 7 AND day = 28 AND activity LIKE '%exit%';
-- Fetches the list of cars that exited around the time of the theft.

-- Step 3.5: Mapping exiting cars to their owners using license plates.
SELECT name, phone_number, passport_number 
FROM people
WHERE license_plate IN (
    SELECT license_plate 
    FROM bakery_security_logs
    WHERE year = 2023 AND month = 7 AND day = 28 AND activity = 'exit'
);
-- Retrieves owners of cars that left the scene during the specified time.

-- Step 4: Checking ATM withdrawals on Leggett Street (matches Witness 162).
SELECT * FROM atm_transactions 
WHERE year = 2023 AND month = 7 AND day = 28 AND atm_location LIKE '%Leggett Street%';
-- Investigates suspicious ATM transactions made on the same day as the theft.

-- Step 4.5: Mapping ATM transactions to account holders.
SELECT name 
FROM people
WHERE id IN (
    SELECT person_id 
    FROM bank_accounts 
    WHERE account_number IN (
        SELECT account_number 
        FROM atm_transactions 
        WHERE year = 2023 AND month = 7 AND day = 28 AND atm_location LIKE '%Leggett Street%'
    )
);
-- Identifies individuals who made the withdrawals on the day of the crime.

-- Step 5: Checking phone call records for calls under 60 seconds (matches Witness 163).
SELECT * FROM phone_calls 
WHERE year = 2023 AND month = 7 AND day = 28 AND duration <= 60;
-- Fetches calls made for less than a minute shortly after the crime.

-- Step 5.5: Mapping callers to their identities for short-duration calls.
SELECT name 
FROM people 
WHERE phone_number IN (
    SELECT caller 
    FROM phone_calls 
    WHERE year = 2023 AND month = 7 AND day = 28 AND duration <= 60
)
ORDER BY name;
-- Identifies suspects who made brief phone calls on the day of the crime.

-- Step 6: Identifying suspects by combining ATM, phone call, and car exit data.
SELECT name 
FROM people 
WHERE phone_number IN (
    SELECT caller 
    FROM phone_calls 
    WHERE year = 2023 AND month = 7 AND day = 28 AND duration <= 60
)
INTERSECT
SELECT name 
FROM people
WHERE id IN (
    SELECT person_id 
    FROM bank_accounts 
    WHERE account_number IN (
        SELECT account_number 
        FROM atm_transactions 
        WHERE year = 2023 AND month = 7 AND day = 28 
        AND atm_location LIKE '%Leggett Street%'
    )
)
INTERSECT
SELECT name 
FROM people 
WHERE license_plate IN (
    SELECT license_plate 
    FROM bakery_security_logs 
    WHERE year = 2023 AND month = 7 AND day = 28 
    AND activity = 'exit'
);
-- Narrows down the list of suspects based on all the gathered evidence.

-- Final Suspects: Bruce, Diana, Taylor.

-- Step 7: Narrowing down the thief by matching car exits and earliest flights.
SELECT name 
FROM people
WHERE license_plate IN (
    SELECT license_plate 
    FROM bakery_security_logs 
    WHERE year = 2023 
    AND month = 7 
    AND day = 28 
    AND activity = 'exit' 
    AND hour = 10 AND minute BETWEEN 15 AND 25
)
AND passport_number IN (
    SELECT passport_number 
    FROM passengers 
    WHERE flight_id = (
        SELECT id 
        FROM flights 
        WHERE year = 2023 AND month = 7 AND day = 29 
        ORDER BY hour, minute ASC 
        LIMIT 1
    )
)
AND phone_number IN (
    SELECT caller 
    FROM phone_calls 
    WHERE year = 2023 AND month = 7 AND day = 28 
    AND duration <= 60
)
AND id IN (
    SELECT person_id 
    FROM bank_accounts 
    WHERE account_number IN (
        SELECT account_number 
        FROM atm_transactions 
        WHERE year = 2023 AND month = 7 AND day = 28 
        AND atm_location LIKE '%Leggett Street%'
    )
);
-- Confirms that Bruce is the thief based on evidence of car exits, phone calls, ATM use, and the flight he took.

-- Step 8: Identifying who Bruce called after the theft.
SELECT name 
FROM people 
WHERE phone_number IN (
    SELECT receiver 
    FROM phone_calls 
    WHERE caller = (
        SELECT phone_number 
        FROM people 
        WHERE name = 'Bruce'
    )
    AND duration <= 60
);
-- Determines who Bruce contacted to help arrange his escape.

-- Step 9: Determining which city Bruce flew to.
SELECT city 
FROM airports 
WHERE id = (
    SELECT destination_airport_id 
    FROM flights 
    WHERE id = (
        SELECT flight_id 
        FROM passengers 
        WHERE passport_number = (
            SELECT passport_number 
            FROM people 
            WHERE name = 'Bruce'
        )
    )
);
-- Confirms that Bruce flew to New York City.

-- Step 10: Finding out who helped Bruce by checking who did not take the flight.
SELECT name 
FROM people 
WHERE name IN ('Charlotte', 'Robin')
AND passport_number NOT IN (
    SELECT passport_number 
    FROM passengers 
    WHERE flight_id = (
        SELECT flight_id 
        FROM passengers 
        WHERE passport_number = (
            SELECT passport_number 
            FROM people 
            WHERE name = 'Bruce'
        )
    )
);
-- Charlotte is identified as the accomplice who helped Bruce but did not travel with him.
-- Step 0: Inspect the database schema
-- .schema  

-- Step 1: Investigating the crime scene on July 28, 2023, at Humphrey Street.
SELECT * FROM crime_scene_reports 
WHERE year = 2023 AND month = 7 AND day = 28 AND street = 'Humphrey Street';

-- Step 2: Analyzing witness interviews from the same day.
SELECT * FROM interviews 
WHERE year = 2023 AND month = 7 AND day >= 28;

-- Witness reports:
-- Witness 161: Thief left the bakery in a car.
-- Witness 162: Thief seen withdrawing money at Leggett Street.
-- Witness 163: Thief made a call under 1 minute after leaving.

-- Step 3: Investigating car exits from the bakery parking lot (matching Witness 161).
SELECT * FROM bakery_security_logs 
WHERE year = 2023 AND month = 7 AND day = 28 AND activity LIKE '%exit%';

-- Step 3.5: Mapping license plates to their owners.
SELECT name, phone_number, passport_number 
FROM people
WHERE license_plate IN (
    SELECT license_plate 
    FROM bakery_security_logs
    WHERE year = 2023 AND month = 7 AND day = 28 AND activity = 'exit'
);

-- Step 4: Checking ATM withdrawals near Leggett Street (matching Witness 162).
SELECT * FROM atm_transactions 
WHERE year = 2023 AND month = 7 AND day = 28 AND atm_location LIKE '%Leggett Street%';

-- Step 4.5: Mapping ATM transactions to people.
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

-- Step 5: Checking phone call records for calls under 60 seconds (matching Witness 163).
SELECT * FROM phone_calls 
WHERE year = 2023 AND month = 7 AND day = 28 AND duration <= 60;

-- Step 5.5: Mapping short phone calls to the caller.
SELECT name 
FROM people 
WHERE phone_number IN (
    SELECT caller 
    FROM phone_calls 
    WHERE year = 2023 AND month = 7 AND day = 28 AND duration <= 60
)
ORDER BY name;

-- Step 6: Identifying suspects by combining ATM transactions, phone calls, and car exits.
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
        WHERE year = 2023 AND month = 7 AND day = 28 AND atm_location LIKE '%Leggett Street%'
    )
)
INTERSECT
SELECT name 
FROM people 
WHERE license_plate IN (
    SELECT license_plate 
    FROM bakery_security_logs 
    WHERE year = 2023 AND month = 7 AND day = 28 AND activity = 'exit'
);

-- Final Suspect List: Bruce, Diana, Taylor.

-- Step 7: Narrowing down the culprit by checking flight records and car exits between 10:15 and 10:25 AM.
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

-- Bruce is confirmed as the thief.

-- Step 8: Identifying who Bruce called for less than a minute.
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
-- Bruce flew to New York City.

-- Step 10: Finding out who helped Bruce escape by checking who didn't take the flight.
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

-- Charlotte is identified as the accomplice.
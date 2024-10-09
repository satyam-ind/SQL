-- Keep a log of any SQL queries you execute as you solve the mystery.
--.schema   
--To find out the database schema 

--Step 1: Investigating the crime scene
--SELECT * FROM crime_scene_reports 
--WHERE year = 2023 AND month = 7 AND day = 28 AND street = 'Humphrey Street';
--295|2023|7|28|Humphrey Street|Theft of the CS50 duck took place at 10:15am at the Humphrey Street bakery. 
--Interviews were conducted today with three witnesses who were present at the time – each of their interview transcripts mentions the bakery.

--Step 2: Interviews with witnesses: To findany interviews mentioning the thief, their appearance, or suspicious behavior. 
--SELECT * FROM interviews 
--WHERE year = 2023 AND month = 7 AND day >= 28;
--158|Jose|2023|7|28|“Ah,” said he, “I forgot that I had not seen you for some weeks. It is a little souvenir from the King of Bohemia in return for my assistance in the case of the Irene Adler papers.”
--159|Eugene|2023|7|28|“I suppose,” said Holmes, “that when Mr. Windibank came back from France he was very annoyed at your having gone to the ball.”
--160|Barbara|2023|7|28|“You had my note?” he asked with a deep harsh voice and a strongly marked German accent. “I told you that I would call.” He looked from one to the other of us, as if uncertain which to address.
--*161|Ruth|2023|7|28|Sometime within ten minutes of the theft, I saw the thief get into a car in the bakery parking lot and drive away. If you have security footage from the bakery parking lot, you might want to look for cars that left the parking lot in that time frame.
--*162|Eugene|2023|7|28|I don't know the thief's name, but it was someone I recognized. Earlier this morning, before I arrived at Emma's bakery, I was walking by the ATM on Leggett Street and saw the thief there withdrawing some money.
--*163|Raymond|2023|7|28|As the thief was leaving the bakery, they called someone who talked to them for less than a minute. In the call, I heard the thief say that they were planning to take the earliest flight out of Fiftyville tomorrow. The thief then asked the person on the other end of the phone to purchase the flight ticket.
--191|Lily|2023|7|28|Our neighboring courthouse has a very annoying rooster that crows loudly at 6am every day. My sons Robert and Patrick took the rooster to a city far, far away, so it may never bother us again. My sons have successfully arrived in Paris.

--Step 3: Investigating Witness 161, the bakery security logs for cars in the parking lot
--SELECT * FROM bakery_security_logs 
--WHERE year = 2023 AND month = 7 AND day = 28 
--AND activity LIKE '%exit%' 
-- 21|2023|7|28|8|2|exit|1M92998
-- 222|2023|7|28|8|2|exit|N507616
-- 224|2023|7|28|8|7|exit|7Z8B130
-- 226|2023|7|28|8|13|exit|47MEFVA
-- 229|2023|7|28|8|15|exit|D965M59
-- 230|2023|7|28|8|15|exit|HW0488P
-- 235|2023|7|28|8|25|exit|HOD8639
-- 236|2023|7|28|8|34|exit|L68E5I0
-- 239|2023|7|28|8|34|exit|W2CT78U
-- 242|2023|7|28|8|38|exit|3933NUH
-- 245|2023|7|28|8|44|exit|1FBL6TH
-- 247|2023|7|28|8|49|exit|P14PE2Q
-- 249|2023|7|28|8|50|exit|4V16VO0
-- 251|2023|7|28|8|57|exit|8LLB02B
-- 253|2023|7|28|8|59|exit|O784M2U
-- 260|2023|7|28|10|16|exit|5P2BI95
-- 261|2023|7|28|10|18|exit|94KL13X
-- 262|2023|7|28|10|18|exit|6P58WS2
-- 263|2023|7|28|10|19|exit|4328GD8
-- 264|2023|7|28|10|20|exit|G412CB7
-- 265|2023|7|28|10|21|exit|L93JTIZ
-- 266|2023|7|28|10|23|exit|322W7JE
-- 267|2023|7|28|10|23|exit|0NTHK55
-- 268|2023|7|28|10|35|exit|1106N58
-- 280|2023|7|28|14|18|exit|NAW9653
-- 281|2023|7|28|15|6|exit|RS7I6A0
-- 282|2023|7|28|15|16|exit|94MV71O
-- 283|2023|7|28|16|6|exit|WD5M8I6
-- 284|2023|7|28|16|38|exit|4468KVT
-- 285|2023|7|28|16|42|exit|207W38T
-- 286|2023|7|28|16|47|exit|C194752
-- 287|2023|7|28|17|11|exit|NRYN856
-- 288|2023|7|28|17|15|exit|13FNH73
-- 289|2023|7|28|17|16|exit|V47T75I
-- 290|2023|7|28|17|18|exit|R3G7486
-- 291|2023|7|28|17|36|exit|FLFN3W0
-- 292|2023|7|28|17|47|exit|4963D92

--Step 3.5: Nested Query mapping license plates of the exiting cars with the owner
-- SELECT name,phone_number,passport_number,id 
-- FROM people
-- WHERE license_plate IN (
--  SELECT license_plate 
--  FROM bakery_security_logs
--    WHERE year = 2023 
--     AND month = 7 
--     AND day = 28 
--     AND activity = 'exit');
-- Jordan|(328) 555-9658|7951366683
-- Vanessa|(725) 555-4692|2963008352
-- Barry|(301) 555-4174|7526138472
-- Martha|(007) 555-2874|
-- Brandon|(771) 555-6667|7874488539
-- Carolyn|(234) 555-1294|3925120216
-- Joshua|(267) 555-2761|3761239013
-- Debra||2750542732
-- Iman|(829) 555-5269|7049073643
-- Sofia|(130) 555-0289|1695452385
-- Taylor|(286) 555-6063|1988161715
-- Luca|(389) 555-5198|8496433585
-- Wayne|(056) 555-0309|
-- Diana|(770) 555-1861|3592750733
-- Michael|(529) 555-7276|6117294637
-- Kelsey|(499) 555-9472|8294398571
-- Vincent||3011089587
-- Mary|(188) 555-4719|
-- Ralph|(771) 555-7880|6464352048
-- Peter|(751) 555-6567|9224308981
-- Amanda|(821) 555-5262|1618186613
-- Denise|(994) 555-3373|4001449165
-- Thomas|(286) 555-0131|6034823042
-- John|(016) 555-9166|8174538026
-- Ethan|(594) 555-6254|2996517496
-- Bruce|(367) 555-5533|5773159633
-- Rachel|(006) 555-0505|
-- Donna||
-- Sophia|(027) 555-1068|3642612721
-- Judith||8284363264
-- Jeremy|(194) 555-5027|1207566299
-- Daniel|(971) 555-6468|7597790505
-- George||4977790793
-- Alice|(031) 555-9915|1679711307
-- Andrew|(579) 555-5030|
-- Robin|(375) 555-8161|
-- Frank|(356) 555-6641|8336437534



--Step 4: Suspicious ATM transactions near Humphrey Lane on the day of the theft (Investigating Witness 162)
--SELECT * FROM atm_transactions 
--WHERE year = 2023 AND month = 7 AND day = 28 AND atm_location LIKE '%Leggett Street%';
-- 46|28500762|2023|7|28|Leggett Street|withdraw|48
-- 264|28296815|2023|7|28|Leggett Street|withdraw|20
-- 266|76054385|2023|7|28|Leggett Street|withdraw|60
-- 267|49610011|2023|7|28|Leggett Street|withdraw|50
-- 269|16153065|2023|7|28|Leggett Street|withdraw|80
-- 275|86363979|2023|7|28|Leggett Street|deposit|10
-- 288|25506511|2023|7|28|Leggett Street|withdraw|20
-- 313|81061156|2023|7|28|Leggett Street|withdraw|30
-- 336|26013199|2023|7|28|Leggett Street|withdraw|35
--Step 4.5: SELECT * 
-- SELECT * 
-- FROM people
-- WHERE id IN (
--    SELECT person_id 
--     FROM bank_accounts
--     WHERE account_number IN (
--       SELECT account_number
--       FROM atm_transactions
--        WHERE year = 2023 AND month = 7 AND day = 28 AND atm_location LIKE '%Leggett Street%'
-- ));
-- 95717|Kenny|(826) 555-1652|9878712108|30G67EN
-- 396669|Iman|(829) 555-5269|7049073643|L93JTIZ
-- 438727|Benista|(338) 555-6650|9586786673|8X428L0
-- 449774|Taylor|(286) 555-6063|1988161715|1106N58
-- 458378|Brooke|(122) 555-4581|4408372428|QX4YZN3
-- 467400|Luca|(389) 555-5198|8496433585|4328GD8
-- 514354|Diana|(770) 555-1861|3592750733|322W7JE
-- 686048|Bruce|(367) 555-5533|5773159633|94KL13X

-- Step 5: Investigating Witness 163, Checking the phone call records for less than a minute
-- SELECT * 
-- FROM phone_calls
-- WHERE year = 2023 AND month = 7 AND day = 28 
-- AND duration <= 60;
-- 221|(130) 555-0289|(996) 555-8899|2023|7|28|51
-- 224|(499) 555-9472|(892) 555-8872|2023|7|28|36
-- 233|(367) 555-5533|(375) 555-8161|2023|7|28|45
-- 234|(609) 555-5876|(389) 555-5198|2023|7|28|60
-- 251|(499) 555-9472|(717) 555-1342|2023|7|28|50
-- 254|(286) 555-6063|(676) 555-6554|2023|7|28|43
-- 255|(770) 555-1861|(725) 555-3243|2023|7|28|49
-- 261|(031) 555-6622|(910) 555-3251|2023|7|28|38
-- 279|(826) 555-1652|(066) 555-9701|2023|7|28|55
-- 281|(338) 555-6650|(704) 555-2131|2023|7|28|54
--Step 5.5: Mapping Caller ID to People Table
-- SELECT name
-- FROM people 
-- WHERE phone_number IN (
--     SELECT caller 
--     FROM phone_calls
--     WHERE year = 2023 
--     AND month = 7 
--     AND day = 28
--     AND duration <= 60
--     )
--     ORDER BY name ASC;
-- 438727|Benista|(338) 555-6650|9586786673|8X428L0
-- 686048|Bruce|(367) 555-5533|5773159633|94KL13X
-- 907148|Carina|(031) 555-6622|9628244268|Q12B3Z3
-- 514354|Diana|(770) 555-1861|3592750733|322W7JE
-- 561160|Kathryn|(609) 555-5876|6121106406|4ZY7I8T
-- 560886|Kelsey|(499) 555-9472|8294398571|0NTHK55
-- 395717|Kenny|(826) 555-1652|9878712108|30G67EN
-- 398010|Sofia|(130) 555-0289|1695452385|G412CB7
-- 449774|Taylor|(286) 555-6063|1988161715|1106N58


SELECT name
FROM people 
WHERE phone_number IN (
      SELECT caller 
      FROM phone_calls
      WHERE year = 2023 
      AND month = 7 
      AND day = 28
      AND duration <= 60
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
      ))

INTERSECT

SELECT name
FROM people
WHERE license_plate IN (
 SELECT license_plate 
 FROM bakery_security_logs
   WHERE year = 2023 
    AND month = 7 
    AND day = 28 
    AND activity = 'exit');

-- Final List of suspects:
--Bruce
--Diana
--Taylor
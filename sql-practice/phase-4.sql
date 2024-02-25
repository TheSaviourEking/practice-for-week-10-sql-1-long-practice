-- Your code here
DROP TABLE IF EXISTS employees;

DROP TABLE IF EXISTS reviews;

DROP TABLE IF EXISTS parties;

-- step 1: Database Schema
-- --- Done
--- step 2: create database
-- -- Done
CREATE TABLE
  employees (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    first_name VARCHAR(20),
    last_name VARCHAR(20),
    department VARCHAR(20),
    role VARCHAR(20),
    relationship_with VARCHAR(20) DEFAULT NULL
  );

CREATE TABLE
  reviews (
    employee_id INTEGER,
    score integer NOT NULL --CHECK (score BETWEEN 1 AND 10)
  );

CREATE TABLE
  parties (budget DECIMAL(12, 3) NOT NULL, onsite NUMERIC);

-- Step 3: Read and Manipulate the Database
INSERT INTO
  employees (first_name, last_name, department, role)
VALUES
  (
    'Michael',
    'Scott',
    'Management',
    'Regional Manager'
  ),
  (
    'Dwight',
    'Schrute',
    'Sales',
    'Assistant Regional Manager'
  ),
  ('Jim', 'Halpert', 'Sales', 'Sales Representative'),
  ('Pam', 'Beesly', 'Reception', 'Receptionist'),
  (
    'Kelly',
    'Kapoor',
    'Product Oversight',
    'Customer Service Representative'
  ),
  (
    'Angela',
    'Martin',
    'Accounting',
    'Head of Accounting'
  ),
  ('Roy', 'Anderson', 'Warehouse', 'Warehouse Staff');

-- 8:
UPDATE employees
SET
  relationship_with = (
    SELECT
      id
    FROM
      employees
    WHERE
      first_name = 'Pam'
  )
WHERE
  first_name = 'Roy';

UPDATE employees
SET
  relationship_with = (
    SELECT
      id
    FROM
      employees
    WHERE
      first_name = 'Roy'
  )
WHERE
  first_name = 'Pam';

-- 9
INSERT INTO
  employees (first_name, last_name, department, role)
VALUES
  ('Ryan', 'Howard', 'Reception', 'Temp');

-- 10
INSERT INTO
  parties
VALUES
  (100.00, 1);

-- 11
INSERT INTO
  reviews
SELECT
  id,
  3.3
FROM
  employees
WHERE
  first_name = 'Dwight'
  AND last_name = 'Schrute';

-- 12
-- INSERT INTO
--   reviews
-- SELECT
--   id,
--   4.2
-- FROM
--   employees
-- WHERE
--   first_name = 'Jim' and last_name = 'Halpert';
INSERT INTO
  reviews (employee_id, score)
VALUES
  (
    (
      SELECT
        id
      FROM
        employees
      WHERE
        first_name = 'Jim'
    ),
    4.2
  );

-- 13
UPDATE reviews
SET
  score = 9.0
WHERE
  employee_id = (
    SELECT
      id
    FROM
      employees
    WHERE
      first_name = 'Dwight'
      AND last_name = 'Schrute'
  );

-- 14
UPDATE reviews
SET
  score = 9.3
WHERE
  employee_id = (
    SELECT
      id
    FROM
      employees
    WHERE
      first_name = 'Jim'
      AND last_name = 'Halpert'
  );

-- 15
UPDATE employees
SET
  role = 'Assistant Regional Manager'
WHERE
  first_name = 'Jim'
  AND last_name = 'Halpert';

-- 16
UPDATE employees
SET
  department = 'Sales',
  role = 'Sales Representative'
WHERE
  first_name = 'Ryan'
  AND last_name = 'Howard';

-- 17
INSERT INTO
  parties
VALUES
  (200, 1);

-- 18
UPDATE employees
SET
  relationship_with = (
    SELECT
      id
    FROM
      employees
    WHERE
      first_name = 'Dwight'
      AND last_name = 'Schrute'
  )
WHERE
  first_name = 'Angela'
  AND last_name = 'Martin';

UPDATE employees
SET
  relationship_with = (
    SELECT
      id
    FROM
      employees
    WHERE
      first_name = 'Angela'
      AND last_name = 'Martin'
  )
WHERE
  first_name = 'Dwight'
  AND last_name = 'Schrute';

-- 19
INSERT INTO
  reviews
SELECT
  id,
  6.2
FROM
  employees
WHERE
  first_name = 'Angela'
  AND last_name = 'Martin';

-- 20
UPDATE employees
SET
  relationship_with = (
    SELECT
      id
    FROM
      employees
    WHERE
      first_name = 'Ryan'
      AND last_name = 'Howard'
  )
WHERE
  first_name = 'Kelly'
  AND last_name = 'Kapoor';

UPDATE employees
SET
  relationship_with = (
    SELECT
      id
    FROM
      employees
    WHERE
      first_name = 'Kelly'
      AND last_name = 'Kapoor'
  )
WHERE
  first_name = 'Ryan'
  AND last_name = 'Howard';

-- 21
INSERT INTO
  parties
VALUES
  (50, 1);

--22
-- Jim moves to another office, i'll just set his department and all else to null;
UPDATE employees
SET
  department = NULL,
  role = NULL,
  relationship_with = NULL
WHERE
  first_name = 'Jim'
  AND last_name = 'Halpert';

-- 23
UPDATE employees
SET
  relationship_with = NULL
WHERE
  first_name = 'Roy'
  AND last_name = 'Anderson';

UPDATE employees
SET
  relationship_with = NULL
WHERE
  first_name = 'Pam'
  AND last_name = 'Beesly';

-- 24
INSERT INTO
  reviews
SELECT
  id,
  7.6
FROM
  employees
WHERE
  first_name = 'Pam'
  AND last_name = 'Beesly';

-- 25
INSERT INTO
  reviews
SELECT
  id,
  8.7
FROM
  employees
WHERE
  first_name = 'Dwight';

-- 26
-- UPDATE employees
-- set department = NULL, role = NULL, relationship_with = NULL
-- where first_name = 'Ryan';
DELETE FROM employees
WHERE
  first_name = 'Ryan';

-- 27
UPDATE employees
SET
  department = 'Sales',
  role = 'Sales Representative'
WHERE
  first_name = 'Jim'
  AND last_name = 'Halpert';

-- 28
INSERT INTO
  employees (first_name, last_name, department, role)
VALUES
  (
    'Karen',
    'Filippelli',
    'Sales',
    'Sales Representative'
  );

-- 29
UPDATE employees
SET
  relationship_with = (
    SELECT
      id
    FROM
      employees
    WHERE
      first_name = 'Jim'
      AND last_name = 'Halpert'
  )
WHERE
  first_name = 'Karen';

UPDATE employees
SET
  relationship_with = (
    SELECT
      id
    FROM
      employees
    WHERE
      first_name = 'Karen'
      AND last_name = 'Filippelli'
  )
WHERE
  first_name = 'Jim';

-- 30
INSERT INTO
  parties
VALUES
  (120, 1);

-- 31
-- 32
UPDATE employees
SET
  relationship_with = NULL
WHERE
  first_name = 'Karen';

UPDATE employees
SET
  relationship_with = NULL
WHERE
  first_name = 'Jim';

-- 33
UPDATE employees
SET
  relationship_with = (
    SELECT
      id
    FROM
      employees
    WHERE
      first_name = 'Pam'
  )
WHERE
  first_name = 'Jim';

UPDATE employees
SET
  relationship_with = (
    SELECT
      id
    FROM
      employees
    WHERE
      first_name = 'Jim'
  )
WHERE
  first_name = 'Pam';

-- Debugging
SELECT
  *
FROM
  employees;

SELECT
  *
FROM
  reviews;

SELECT
  *
FROM
  parties;

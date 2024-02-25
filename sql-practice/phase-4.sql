-- Your code here
DROP TABLE IF EXISTS employees;

DROP TABLE IF EXISTS reviews;

DROP TABLE IF EXISTS parties;

.print -- Step 1: Database Schema
.print --- Done
.print --- Step 2: Create Database
CREATE TABLE
  employees (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    first_name VARCHAR(20) UNIQUE,
    last_name VARCHAR(20) UNIQUE,
    department VARCHAR(20),
    role VARCHAR(20),
    relationship_with VARCHAR(20) DEFAULT NULL
  );

CREATE TABLE
  reviews (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    employee_id INTEGER REFERENCES employees (id), -- foreign key
    score integer NOT NULL CHECK (score BETWEEN 1 AND 10)
  );

CREATE TABLE
  parties (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    budget DECIMAL(12, 3) NOT NULL,
    onsite NUMERIC
  );

.print -- Step 3: Read and Manipulate the Database
.print -- Events 3 - 7
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

.print -- Events 8. "Roy Anderson" and "Pam Beesly" are in a romantic relationship.
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

.print -- Event 9. "Ryan Howard" is hired in the "Reception" department as a "Temp" role.
INSERT INTO
  employees (first_name, last_name, department, role)
VALUES
  ('Ryan', 'Howard', 'Reception', 'Temp');

.print -- Event 10. An onsite office party is scheduled with a budget of $100.00.
INSERT INTO
  parties (budget, onsite)
VALUES
  (100.00, 1);

.print -- Event 11. "Dwight Schrute" gets a performance review with a score of 3.3.
INSERT INTO
  reviews (employee_id, score)
SELECT
  id,
  3.3
FROM
  employees
WHERE
  first_name = 'Dwight'
  AND last_name = 'Schrute';

.print -- Event 12. "Jim Halpert" gets a performance review with a score of 4.2.
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

.print -- Event 13. "Dwight Schrute"'s past performance review needs to be changed to a score of 9.0.
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

.print -- Event 14. "Jim Halpert"'s past performance review needs to be changed to a score of 9.3.
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

.print -- Event 15. "Jim Halpert" is promoted to the role of "Assistant Regional Manager".
UPDATE employees
SET
  role = 'Assistant Regional Manager'
WHERE
  first_name = 'Jim'
  AND last_name = 'Halpert';

.print -- Event 16. "Ryan Howard" is promoted to the "Sales" department as the role of "Sales Representative".
UPDATE employees
SET
  department = 'Sales',
  role = 'Sales Representative'
WHERE
  first_name = 'Ryan'
  AND last_name = 'Howard';

.print -- Event 17. An onsite office party is scheduled with a budget of $200.00.
INSERT INTO
  parties (budget, onsite)
VALUES
  (200, 1);

.print -- Event 18. "Angela Martin" and "Dwight Schrute" are in a romantic relationship.
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

-- Event 19. "Angela Martin" gets a performance review score of 6.2.
INSERT INTO
  reviews (employee_id, score)
SELECT
  id,
  6.2
FROM
  employees
WHERE
  first_name = 'Angela'
  AND last_name = 'Martin';

-- Event 20. "Ryan Howard" and "Kelly Kapoor" are in a romantic relationship.
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

-- Event 21. An onsite office party is scheduled with a budget of $50.00.
INSERT INTO
  parties (budget, onsite)
VALUES
  (50, 1);

--Event 22. "Jim Halpert" moves to another office branch (make sure to remove his relationships and
-- Jim moves to another office, i'll just set his department and all else to null;
UPDATE employees
SET
  department = NULL,
  role = NULL,
  relationship_with = NULL
WHERE
  first_name = 'Jim'
  AND last_name = 'Halpert';

-- Event 23. "Roy Anderson" and "Pam Beesly" are NO LONGER in a romantic relationship.
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

-- Event 24. "Pam Beesly" gets a performance review score of 7.6.
INSERT INTO
  reviews (employee_id, score)
SELECT
  id,
  7.6
FROM
  employees
WHERE
  first_name = 'Pam'
  AND last_name = 'Beesly';

-- Event 25. "Dwight Schrute" gets another performance review score of 8.7.
INSERT INTO
  reviews (employee_id, score)
SELECT
  id,
  8.7
FROM
  employees
WHERE
  first_name = 'Dwight';

-- Event 26. "Ryan Howard" quits the office (make sure to remove his relationships and performance reviews if he has any).
-- UPDATE employees
-- set department = NULL, role = NULL, relationship_with = NULL
-- where first_name = 'Ryan';
DELETE FROM employees
WHERE
  first_name = 'Ryan';

.print -- Event 27. "Jim Halpert" moves back to this office branch's "Sales" department in the role of "Sales Representative"
UPDATE employees
SET
  department = 'Sales',
  role = 'Sales Representative'
WHERE
  first_name = 'Jim'
  AND last_name = 'Halpert';

-- Event 28. "Karen Filippelli" moves from a different office into this office's "Sales" department in the role of "Sales Representative"
INSERT INTO
  employees (first_name, last_name, department, role)
VALUES
  (
    'Karen',
    'Filippelli',
    'Sales',
    'Sales Representative'
  );

-- Event 29. "Karen Filippelli" and "Jim Halpert" are in a romantic relationship.
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

-- Event 30. An onsite office party is scheduled with a budget of $120.00.
INSERT INTO
  parties (budget, onsite)
VALUES
  (120, 1);

-- Event 31. The onsite office party scheduled right before this is canceled, and an offsite office party is scheduled instead with a budget of $300.00
-- .print "--- CHHHHHHH-----------------"
-- .shell echo "--- CHHHHHHH-----------------";
DELETE FROM parties
ORDER BY
  id DESC
LIMIT
  1;

INSERT INTO
  parties (budget, onsite)
VALUES
  (300, 0);

-- Event 32. "Karen Filippelli" and "Jim Halpert" are NO LONGER in a romantic relationship.
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

-- Event 33. "Pam Beesly" and "Jim Halpert" are in a romantic relationship.
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

.print ---------------------------------------------- DEBUGGING -----------------------------------------------------------
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

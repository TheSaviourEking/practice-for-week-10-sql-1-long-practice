-- Your code here
.read phase-2.sql
-- .headers on
-- 1: Rachel joined the program
INSERT INTO
  customers (name, phone)
VALUES
  ('Rachel', 1111111111);

--: Rachel purchases a coffee
UPDATE customers
SET
  points = points + 1
WHERE
  phone = 1111111111;

-- Add coffee order
INSERT INTO
  coffee_orders DEFAULT
VALUES;

-- 3:
INSERT INTO
  customers (name, email, phone)
VALUES
  ('Monica', 'monica@friends.show', 2222222222),
  ('Phoebe', 'phoebe@friends.show', 3333333333);

--- 4:
-- phoebe orders 3 coffee
INSERT INTO
  coffee_orders DEFAULT
VALUES;

INSERT INTO
  coffee_orders DEFAULT
VALUES;

INSERT INTO
  coffee_orders DEFAULT
VALUES;

UPDATE customers
SET
  points = points + 3
WHERE
  phone = 3333333333;

-- rachel orders 4 coffees
INSERT INTO
  coffee_orders DEFAULT
VALUES;

INSERT INTO
  coffee_orders DEFAULT
VALUES;

INSERT INTO
  coffee_orders DEFAULT
VALUES;

INSERT INTO
  coffee_orders DEFAULT
VALUES;

UPDATE customers
SET
  points = points + 4
WHERE
  phone = 1111111111;

-- monica orders 4 coffees
INSERT INTO
  coffee_orders DEFAULT
VALUES;

INSERT INTO
  coffee_orders DEFAULT
VALUES;

INSERT INTO
  coffee_orders DEFAULT
VALUES;

INSERT INTO
  coffee_orders DEFAULT
VALUES;

UPDATE customers
SET
  points = points + 4
WHERE
  phone = 2222222222;

--- Monica's new point
-- select points from customers where phone = 2222222222;
-- 7:
SELECT
  points
FROM
  customers
WHERE
  phone = 1111111111;

INSERT INTO
  coffee_orders (is_redeemed)
VALUES
  (
    CASE
      WHEN (
        SELECT
          points
        FROM
          customers
        WHERE
          phone = 1111111111
      ) >= 10 THEN 1
      ELSE 0
    END
  );

UPDATE customers
SET
  points = CASE
    WHEN points >= 10 THEN points - 10
    ELSE points + 1
  END
WHERE
  phone = 1111111111
  AND name = 'Rachel';

-- select * from coffee_orders;
-- select * from customers where phone = 1111111111;
-- 8:
INSERT INTO
  customers (name, email)
VALUES
  ('Joey', 'joey@friends.show'),
  ('Chandler', 'chandler@friends.show'),
  ('Ross', 'ross@friends.show');

-- 9:
INSERT INTO
  coffee_orders DEFAULT
VALUES;

INSERT INTO
  coffee_orders DEFAULT
VALUES;

INSERT INTO
  coffee_orders DEFAULT
VALUES;

INSERT INTO
  coffee_orders DEFAULT
VALUES;

INSERT INTO
  coffee_orders DEFAULT
VALUES;

INSERT INTO
  coffee_orders DEFAULT
VALUES;

UPDATE customers
SET
  points = points + 6
WHERE
  name = 'Ross';

-- 10:
INSERT INTO
  coffee_orders DEFAULT
VALUES;

INSERT INTO
  coffee_orders DEFAULT
VALUES;

INSERT INTO
  coffee_orders DEFAULT
VALUES;

UPDATE customers
SET
  points = points + 3
WHERE
  name = 'Monica';

-- 11:
SELECT
  points
FROM
  customers
WHERE
  name = 'Phoebe';

INSERT INTO
  coffee_orders (is_redeemed)
VALUES
  (
    CASE
      WHEN (
        SELECT
          points
        FROM
          customers
        WHERE
          name = 'Phoebe'
      ) >= 10 THEN 1
      ELSE 0
    END
  );

UPDATE customers
SET
  points = CASE
    WHEN points >= 10 THEN points - 10
    ELSE points + 1
  END
WHERE
  name = 'Phoebe';

-- 12:
DELETE FROM coffee_orders
WHERE
  id = 19
  OR id = 18;

UPDATE customers
SET
  points = points - 2
WHERE
  name = 'Ross';

-- 13:
INSERT INTO
  coffee_orders DEFAULT
VALUES;

INSERT INTO
  coffee_orders DEFAULT
VALUES;

UPDATE customers
SET
  points = points + 2
WHERE
  name = 'Joey';

-- 14:
SELECT
  points
FROM
  customers
WHERE
  name = 'Monica';

INSERT INTO
  coffee_orders (is_redeemed)
VALUES
  (
    CASE
      WHEN (
        SELECT
          points
        FROM
          customers
        WHERE
          name = 'Monica'
      ) >= 10 THEN 1
      ELSE 0
    END
  );

UPDATE customers
SET
  points = CASE
    WHEN (points >= 10) THEN points - 10
    ELSE points + 1
  END
WHERE
  name = 'Monica';

-- 15:
DELETE FROM customers
WHERE
  name = 'Chandler'
  AND email = 'chandler@friends.show';

-- 16:  
SELECT
  points
FROM
  customers
WHERE
  name = 'Ross';

INSERT INTO
  coffee_orders (is_redeemed)
VALUES
  (
    CASE
      WHEN (
        SELECT
          points
        FROM
          customers
        WHERE
          name = 'Ross'
      ) >= 10 THEN 1
      ELSE 0
    END
  );

UPDATE customers
SET
  points = CASE
    WHEN (points >= 10) THEN points - 10
    ELSE points + 1
  END
WHERE
  name = 'Ross';

-- 17:
SELECT
  points
FROM
  customers
WHERE
  name = 'Joey';

INSERT INTO
  coffee_orders (is_redeemed)
VALUES
  (
    CASE
      WHEN (
        SELECT
          points
        FROM
          customers
        WHERE
          name = 'Joey'
      ) >= 10 THEN 1
      ELSE 0
    END
  );

UPDATE customers
SET
  points = CASE
    WHEN (points >= 10) THEN points - 10
    ELSE points + 1
  END
WHERE
  name = 'Joey';

-- 19:
UPDATE customers
SET
  email = 'p_as_in_phoebe@friends.show'
WHERE
  name = 'Phoebe';

SELECT
  *
FROM
  customers;

SELECT
  *
FROM
  coffee_orders
ORDER BY
  id;

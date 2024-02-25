-- Your code here
.read phase-2.sql
-- .headers on

-- Events:

-- 1: A new customer joined the loyalty program
INSERT INTO
  customers (name, phone)
VALUES
  ('Rachel', 1111111111);

-- 2: Rachel purchases a coffee
UPDATE customers
SET
  points = points + 1
WHERE
  phone = 1111111111;

-- Add coffee order
INSERT INTO
  coffee_orders DEFAULT
VALUES;

-- 3: Two new customers joined the loyalty program
INSERT INTO
  customers (name, email, phone)
VALUES
  ('Monica', 'monica@friends.show', 2222222222),
  ('Phoebe', 'phoebe@friends.show', 3333333333);

--- 4: Phoebe purchases three coffees.
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

-- 5: Rachel and Monica each purchase four coffees.
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

--- 6: Monica wants to know her new point total.
select points from customers where phone = 2222222222;

-- 7: Rachel wants to check her total points. Redeem her points for a coffee if she has enough points. 
--    If she doesn't, she wants to purchase a coffee.
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

-- 8: hree new customers joined the loyalty program
INSERT INTO
  customers (name, email)
VALUES
  ('Joey', 'joey@friends.show'),
  ('Chandler', 'chandler@friends.show'),
  ('Ross', 'ross@friends.show');

-- 9: Ross purchases six coffees.
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

-- 10: Monica purchases three coffees.
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

-- 11: Phoebe wants to check her total points. 
--     Redeem her points for a coffee if she has enough points. If she doesn't, she wants to purchase a coffee.
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

-- 12: Ross demands a refund for the last two coffees that he ordered. 
--     (Make sure you delete Ross's coffee orders and not anyone else's. 
--     Update his points to reflect the returned purchases.)
DELETE FROM coffee_orders
WHERE
  id = 19
  OR id = 18;

UPDATE customers
SET
  points = points - 2
WHERE
  name = 'Ross';

-- 13: Joey purchases two coffees.
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

-- 14: Monica wants to check her total points. 
--     Redeem her points for a coffee if she has enough points. If she doesn't, she wants to purchase a coffee.
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

-- 15: Chandler wants to delete his loyalty program account.
DELETE FROM customers
WHERE
  name = 'Chandler'
  AND email = 'chandler@friends.show';

-- 16:  Ross wants to check his total points. 
--      Redeem his points for a coffee if he has enough points. If he doesn't, he wants to purchase a coffee.
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

-- 17: Joey wants to check his total points. Redeem his points for a coffee if he has enough points. 
--     If he doesn't, he wants to purchase a coffee.
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

-- 18: Phoebe wants to change her email to p_as_in_phoebe@friends.show.
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

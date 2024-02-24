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
INSERT into coffee_orders DEFAULT VALUES;

-- 3:
INSERT into customers (name, email, phone)
VALUES ('Monica', 'monica@friends.show', 2222222222),
('Phoebe', 'phoebe@friends.show', 3333333333);

--- 4:
-- phoebe orders 3 coffee
INSERT into coffee_orders DEFAULT VALUES;
INSERT into coffee_orders DEFAULT VALUES;
INSERT into coffee_orders DEFAULT VALUES;

update customers 
set points = points + 3
where phone = 3333333333;

-- rachel orders 4 coffees
INSERT into coffee_orders DEFAULT VALUES;
INSERT into coffee_orders DEFAULT VALUES;
INSERT into coffee_orders DEFAULT VALUES;
INSERT into coffee_orders DEFAULT VALUES;

update customers 
set points = points + 4
where phone = 1111111111;

-- monica orders 4 coffees
INSERT into coffee_orders DEFAULT VALUES;
INSERT into coffee_orders DEFAULT VALUES;
INSERT into coffee_orders DEFAULT VALUES;
INSERT into coffee_orders DEFAULT VALUES;

update customers 
set points = points + 4
where phone = 2222222222;
 
--- Monica's new point
-- select points from customers where phone = 2222222222;

-- 7:
select points from customers where phone = 1111111111;

INSERT INTO coffee_orders (is_redeemed) 
VALUES (
    CASE 
        WHEN (SELECT points FROM customers WHERE phone = 1111111111) >= 10 THEN 1
        ELSE 0
    END
);

update customers set points = 
    case 
        when points >= 10 then  points - 10
        else points + 1
    end
where phone = 1111111111 and name = 'Rachel';


-- select * from coffee_orders;
-- select * from customers where phone = 1111111111;
-- 8:
insert into customers (name, email)
VALUES('Joey', 'joey@friends.show'),
('Chandler', 'chandler@friends.show'),
('Ross', 'ross@friends.show');

-- 9:
insert into coffee_orders DEFAULT VALUES;
insert into coffee_orders DEFAULT VALUES;
insert into coffee_orders DEFAULT VALUES;
insert into coffee_orders DEFAULT VALUES;
insert into coffee_orders DEFAULT VALUES;
insert into coffee_orders DEFAULT VALUES;

UPDATE customers
set points = points + 6
where name = 'Ross';

-- 10:
insert into coffee_orders DEFAULT VALUES;
insert into coffee_orders DEFAULT VALUES;
insert into coffee_orders DEFAULT VALUES;

update customers
set points = points + 3
where name = 'Monica';

-- 11:
select points from customers where name = 'Phoebe';
insert into coffee_orders(is_redeemed)
VALUES (
    case 
        when (select points from customers where name = 'Phoebe' ) >= 10 then 1
        else 0
    end
);

update customers
set points = 
case 
        when points >= 10 then  points - 10
        else  points + 1
    end
where name = 'Phoebe';

-- 12:
delete from coffee_orders where id = 19 or id = 18;

update customers
set points = points - 2
where name = 'Ross';

-- 13:
insert into coffee_orders DEFAULT VALUES;
insert into coffee_orders DEFAULT VALUES;

update customers 
set points = points + 2
where name = 'Joey';

-- 14:
select points from customers where name = 'Monica';
insert into coffee_orders(is_redeemed)
VALUES (
    case
        when (select points from customers where name = 'Monica') >= 10 then 1
        else 0
    end
);

update customers 
set points = case 
    when (points >= 10) then points - 10
    else points + 1
end
where name = 'Monica';

-- 15:
delete from customers where name = 'Chandler' and email = 'chandler@friends.show';

-- 16:  
select points from customers where name = 'Ross';
insert into coffee_orders(is_redeemed)
VALUES (
    case 
        when (select points from customers where name = 'Ross') >= 10 then 1
        else 0
    end
);
update customers
set points = case 
    when (points >= 10) then points - 10
    else points + 1
end
where name = 'Ross';

-- 17:
select points from customers where name = 'Joey';
insert into coffee_orders(is_redeemed)
VALUES (
    case
        when (select points from customers where name = 'Joey') >= 10 then 1
        else 0
    end
);

update customers
set points = 
case 
    when (points >= 10) then points - 10
    else points + 1
end
where name = 'Joey';

-- 19:
update customers
set email = 'p_as_in_phoebe@friends.show'
where name = 'Phoebe';

SELECT * FROM customers;
SELECT * FROM coffee_orders order by id;

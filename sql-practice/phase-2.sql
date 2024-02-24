-- Your code here
DROP TABLE IF EXISTS customers;

DROP TABLE IF EXISTS coffee_orders;

CREATE TABLE
    customers (
        id INTEGER PRIMARY KEY,
        name VARCHAR(40) NOT NULL,
        phone DECIMAL(10, 0) UNIQUE,
        email VARCHAR(255) UNIQUE DEFAULT 'NULL',
        points DEFAULT 5 NOT NULL,
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL
    );

CREATE TABLE
    coffee_orders (
        id INTEGER PRIMARY KEY,
        is_redeemed NUMERIC DEFAULT 0,
        ordered_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
        FOREIGN KEY (id) REFERENCES customers (id)
    )

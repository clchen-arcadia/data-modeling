CREATE TABLE customers (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(25) NOT NULL,
    last_name VARCHAR(25) NOT NULL
);

CREATE TABLE bikes (
    model_code VARCHAR(10) PRIMARY KEY,
    base_price NUMERIC(5, 2) NOT NULL,
    full_name VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    customer INT NOT NULL REFERENCES customers.id,
    -- timestamp
);

CREATE TABLE bikes_orders (
    id SERIAL PRIMARY KEY,
    order_id INT REFERENCES orders.id,
    price NUMERIC(5, 2) NOT NULL,
    model VARCHAR(10) NOT NULL REFERENCES bikes.model_code,
    note VARCHAR(50) NOT NULL DEFAULT ''
);


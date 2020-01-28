CREATE DATABASE makersbnb_test;

CREATE TABLE users(uid SERIAL PRIMARY KEY, name VARCHAR(40), email VARCHAR(60), password VARCHAR(20), phone VARCHAR(10));

CREATE TABLE properties (pid SERIAL PRIMARY KEY, address VARCHAR(300), post_code VARCHAR(8), photo VARCHAR(3000), uid INTEGER references users(uid));

CREATE TABLE bookings (bid SERIAL PRIMARY KEY, start_date DATE, end_date DATE, pid INTEGER references properties(pid));

INSERT INTO users (name, email, password, phone) VALUES


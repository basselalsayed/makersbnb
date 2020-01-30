CREATE DATABASE makersbnb_test;

CREATE TABLE users(uid SERIAL PRIMARY KEY, name VARCHAR(40), email VARCHAR(60), password VARCHAR(60), phone VARCHAR(10));

CREATE TABLE properties (pid SERIAL PRIMARY KEY, address VARCHAR(300), post_code VARCHAR(8), photo VARCHAR(3000), uid INTEGER references users(uid));

CREATE TABLE bookings (bid SERIAL PRIMARY KEY, check_in DATE, check_out DATE, pid INTEGER references properties(pid), owner_uid INTEGER references users(uid), renter_uid INTEGER references users(uid));

CREATE TABLE conversations (cid SERIAL PRIMARY KEY, u1_id INTEGER references users(uid), u2_id INTEGER references users(uid));

CREATE TABLE messages (mid SERIAL PRIMARY KEY, time TIMESTAMPTZ, sender_uid INTEGER references users(uid), receiver_uid INTEGER references users(uid), cid INTEGER references conversations(cid));

INSERT INTO users (name, email, password, phone) VALUES


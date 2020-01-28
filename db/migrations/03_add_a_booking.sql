CREATE TABLE bookings (id SERIAL PRIMARY KEY, start_date DATE, end_date DATE, property_id INTEGER, FOREIGN KEY (property_id) REFERENCES properties(id));

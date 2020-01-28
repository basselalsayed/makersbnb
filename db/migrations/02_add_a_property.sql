CREATE TABLE properties (id SERIAL PRIMARY KEY, address VARCHAR(3000), post_code VARCHAR(8), photo VARCHAR(3000), user_id INTEGER, FOREIGN KEY (user_id) REFERENCES users(id));

def setup_test_database
  DatabaseConnection.setup
  DatabaseConnection.query('TRUNCATE users, properties, bookings')
  DatabaseConnection.query("INSERT INTO users (email, name, password, phone) VALUES ('tommy@gun.com', 'Tommy Gun', '00100', '055555')")
  DatabaseConnection.query("INSERT INTO properties(address, post_code, photo) VALUES('Crescent Road', 'SW20 XXX', 'www.imageshack.com/property');")
  DatabaseConnection.query("INSERT INTO properties(address, post_code, photo) VALUES('Cambridge Road', 'SW18 XXX', 'www.imageshack.com/property2');")
end
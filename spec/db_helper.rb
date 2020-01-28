def setup_test_database
  DatabaseConnection.setup
  DatabaseConnection.query('TRUNCATE users, bookings, properties')
  DatabaseConnection.query("INSERT INTO users (email, name, password, phone) VALUES ('tommy@gun.com', 'Tommy Gun', '00100', '055555')")
end
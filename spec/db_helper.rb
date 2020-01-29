def setup_test_database
  DatabaseConnection.setup
  DatabaseConnection.query('TRUNCATE users, properties, bookings')
  DatabaseConnection.query("INSERT INTO users (email, name, password, phone) VALUES ('tommy@gun.com', 'Tommy Gun', '#{BCrypt::Password.create('00100')}', '055555')")
  DatabaseConnection.query("INSERT INTO users (email, name, password, phone) VALUES ('joe@bloggs.com', 'Joe Bloggs', '#{BCrypt::Password.create('passw')}', '99999')")
  DatabaseConnection.query("INSERT INTO properties(address, post_code, photo) VALUES('Crescent Road', 'SW20 XXX', 'www.imageshack.com/property', '#{User.all.first.uid}'));")
  DatabaseConnection.query("INSERT INTO properties(address, post_code, photo) VALUES('Cambridge Road', 'SW18 XXX', 'www.imageshack.com/property2', '#{User.all.last.uid}'));")
  # DatabaseConnection.query("INSERT INTO properties (address, post_code, photo, uid) VALUES ('1 leicester square', 'sw1x 100', 'www.dropbox.com/img', '#{User.all.first.uid}')")
  # DatabaseConnection.query("INSERT INTO properties (address, post_code, photo, uid) VALUES ('2 leicester square', 'sw1x 100', 'www.dropbox.com/img2', '#{User.all.last.uid}')")
end
def setup_test_database
  # DatabaseConnection.setup
  DatabaseConnection.query('TRUNCATE users, properties, bookings, messages, conversations')
  DatabaseConnection.query("INSERT INTO users (email, name, password, phone) VALUES ('tommy@gun.com', 'Tommy Gun', '#{BCrypt::Password.create('00100')}', '055555')")
  DatabaseConnection.query("INSERT INTO users (email, name, password, phone) VALUES ('joe@bloggs.com', 'Joe Bloggs', '#{BCrypt::Password.create('passw')}', '99999')")
  DatabaseConnection.query("INSERT INTO properties (address, post_code, photo, uid) VALUES ('Crescent Road', 'SW20 XXX', 'www.imageshack.com/property', '#{User.all.first.uid}')")
  DatabaseConnection.query("INSERT INTO properties (address, post_code, photo, uid) VALUES ('Cambridge Road', 'SW18 XXX', 'www.imageshack.com/property2', '#{User.all.last.uid}')")
  DatabaseConnection.query("INSERT INTO bookings (owner_uid, renter_uid, check_in, check_out, pid) VALUES ('#{User.all.first.uid}', '#{User.all.last.uid}', '10/10/2020', '10/20/2020', '#{Property.all.last.pid}')")
  DatabaseConnection.query("INSERT INTO conversations (u1_id, u2_id) VALUES ('#{User.all.first.uid}', '#{User.all.last.uid}')")
  DatabaseConnection.query("INSERT INTO messages (sender_uid, cid, content) VALUES ('#{User.all.first.uid}', '#{Conversation.all(uid: User.all.first.uid).first.cid}', 'Fizz')")
  DatabaseConnection.query("INSERT INTO messages (sender_uid, cid, content) VALUES ('#{User.all.last.uid}', '#{Conversation.all(uid: User.all.last.uid).first.cid}', 'Buzz')")
end
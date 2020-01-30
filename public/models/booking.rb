class Booking

  attr_reader :bid, :owner_uid, :renter_uid, :check_in, :check_out, :pid

  def initialize(db_row)
    @bid = db_row['bid']
    @owner_uid = db_row['owner_uid']
    @renter_uid = db_row['renter_uid']
    @check_in = db_row['check_in']
    @check_out = db_row['check_out']
    @pid = db_row['pid']
  end

  def self.create(renter_uid:, check_in:, check_out:, pid:)
    owner_uid = DatabaseConnection.query("SELECT * FROM properties WHERE pid = '#{pid}'").first['uid']
    DatabaseConnection.query("INSERT INTO bookings (owner_uid, renter_uid, check_in, check_out, pid) VALUES ('#{owner_uid}', '#{renter_uid}', '#{check_in}', '#{check_out}', '#{pid}')")
  end

  def self.return(column, data)
    DatabaseConnection.query("SELECT * FROM bookings WHERE #{column} = '#{data}'").map { |row| Booking.new(row) }
  end

end
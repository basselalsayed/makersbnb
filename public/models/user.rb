require 'bcrypt'
require 'pg'
require_relative 'db_connect'
require_relative 'booking'
# require_relative 'property'

class User

  attr_reader :uid, :name, :email, :password, :phone

  def initialize(db_row)
    @uid = db_row['uid']
    @name = db_row['name']
    @email = db_row['email']
    @password = db_row['password']
    @phone = db_row['phone']
  end

  def self.create(name:, email:, password:, phone:)
    return false unless is_email?(email)
    DatabaseConnection.setup
    DatabaseConnection.query("INSERT INTO users (name, email, password, phone) VALUES ('#{name}', '#{email}', '#{encrypt(password)}', '#{phone}')")
  end

  def new_booking_request(pid:, check_in:, check_out:)
    Booking.create(renter_uid: @uid, pid: pid, check_in: check_in, check_out: check_out)
  end

  def self.all 
    DatabaseConnection.setup
    DatabaseConnection.query("SELECT * FROM users").map { |row| User.new(row) }
  end
  
  def self.login(email, password)
    return false unless is_email?(email)
    user = return_user('email', email)
    return false if user.nu m_tuples.zero?
    check_email_and_password(user, email, password)
  end

  def self.delete(uid:)
    DatabaseConnection.query("DELETE FROM properties WHERE uid = #{uid}")
    DatabaseConnection.query("DELETE FROM users WHERE uid = #{uid}")
  end


  private
  
  def self.encrypt(password)
    BCrypt::Password.create(password)
  end

  def self.return_user(column, data)
    DatabaseConnection.query("SELECT * FROM users WHERE #{column} = '#{data}'")
  end
  
  def self.check_email_and_password(user, email, password)
    User.new(user.first) if user.first['email'] == email && BCrypt::Password.new(user.first['password']) == password
  end

  def self.is_email?(email)
    email =~ URI::MailTo::EMAIL_REGEXP
  end
end
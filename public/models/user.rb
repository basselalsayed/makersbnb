#gems
require 'bcrypt'
require 'pg'
#files
require_relative 'booking'
require_relative 'db_connect'
require_relative 'property'
require_relative 'conversation'
require_relative 'message'

class User

#instance methods
  attr_reader :uid, :name, :email, :password, :phone

  def initialize(db_row)
    @uid = db_row['uid']
    @name = db_row['name']
    @email = db_row['email']
    @password = db_row['password']
    @phone = db_row['phone']
  end
# creates a new property
  def new_listing(address:, post_code:, photo:)
    Property.create(address: address, post_code: post_code, photo: photo, uid: @uid)
  end
# creates a new message
  def message(receiver_uid:, content:)
    new_conversation(receiver_uid) unless conversation_exist?(receiver_uid)
    conversation = Conversation.return(u1_id: @uid, u2_id: receiver_uid)
    conversation.new_message(sender_uid: @uid, content: content)
  end

# creates an unconfirmed booking
  def new_booking_request(pid:, check_in:, check_out:)
    owner_uid = DatabaseConnection.query("SELECT * FROM properties WHERE pid = #{pid}").first['uid']
    message(receiver_uid: owner_uid, content: "New booking request for your space: #{pid} from #{@name}\nCheck In Date: #{check_in}\nCheck In Date: #{check_in}\nClick the link below to confirm")
    Booking.create(renter_uid: @uid, pid: pid, check_in: check_in, check_out: check_out)
  end
# accept a booking
  def accept_booking_request(bid:)
    renter_uid = DatabaseConnection.query("SELECT * FROM bookings WHERE bid = #{bid}").first['renter_uid']
    check_in = DatabaseConnection.query("SELECT * FROM bookings WHERE bid = #{bid}").first['check_in']
    check_out = DatabaseConnection.query("SELECT * FROM bookings WHERE bid = #{bid}").first['check_out']
    message(receiver_uid: renter_uid, content: "Booking: #{bid} Confirmed.\nCheck In Date: #{check_in}\nCheck In Date: #{check_in}\nEnjoy your stay!")
    DatabaseConnection.query("UPDATE bookings SET confirmed = TRUE WHERE bid = #{bid}")
  end
# creates new conversation in the database
  def new_conversation(receiver_uid)
    Conversation.create(u1_id: @uid, u2_id: receiver_uid)
  end

# class methods

# creates a new user in the database
  def self.create(name:, email:, password:, phone:)
    return false unless is_email?(email)
    DatabaseConnection.query("INSERT INTO users (name, email, password, phone) VALUES ('#{name}', '#{email}', '#{encrypt(password)}', '#{phone}')")
  end

# returns all registered users
  def self.all
    DatabaseConnection.query("SELECT * FROM users").map { |row| User.new(row) }
  end
  
# returns an instance of User if login details are present and correcr
  def self.login(email, password)
    return false unless is_email?(email)
    user = return_user('email', email)
    return false if user.num_tuples.zero?
    check_email_and_password(user, email, password)
    # p password
    # p email 
    # p user 
  end

# deletes a user and all associates properties/bookings
  def self.delete(uid:)
    DatabaseConnection.query("DELETE FROM bookings z
                              USING
                              (SELECT pid
                              from properties WHERE uid = #{uid}) a
                              where a.pid = z.pid
                              returning * ")
    DatabaseConnection.query("DELETE FROM properties WHERE uid = #{uid}")
    DatabaseConnection.query("DELETE FROM users WHERE uid = #{uid}")
  end

# private
  private

# return a conversation db entry using the secondary user id as a search parameter
  def conversation_exist?(receiver_uid)
    !DatabaseConnection.query("SELECT * 
                               FROM 
                                (SELECT * FROM conversations 
                                  WHERE
                                    u1_id = #{receiver_uid}
                                    OR u2_id = #{receiver_uid}) AS z
                               WHERE
                                u1_id = #{@uid}
                                OR u2_id = #{@uid}"                             
    ).num_tuples.zero?
  end

# encrypts the password
  def self.encrypt(password)
    BCrypt::Password.create(password)
  end

# return a user db entry based on a search criteria
  def self.return_user(column, data)
    DatabaseConnection.query("SELECT * FROM users WHERE #{column} = '#{data}'")
  end

#returns an instance of User if email & password are valid
  def self.check_email_and_password(user, email, password)
    User.new(user.first) if user.first['email'] == email && BCrypt::Password.new(user.first['password']) == password
  end

# check if email is valid email address
  def self.is_email?(email)
    email =~ URI::MailTo::EMAIL_REGEXP
  end

  
end 
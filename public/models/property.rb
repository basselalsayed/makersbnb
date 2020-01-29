require 'pg'
require_relative 'db_connect'

class Property
  attr_reader :address, :postcode, :photo, :pid, :uid, :data


  def initialize(db_row)
     @address = db_row['address']
     @postcode = db_row['postcode']
     @photo = db_row['photo']
     @pid = db_row['pid']
     @uid = db_row['uid']
    
  end 


  def self.all
    # @data
    #@data = DatabaseConnection.setup.exec("SELECT * FROM properties")
     DatabaseConnection.query("SELECT * FROM properties").map { |row| Property.new(row) }
  end 


  def self.create(address:, postcode:, photo:, uid:)
    DatabaseConnection.setup
    DatabaseConnection.query("INSERT INTO properties(address, postcode, photo) VALUES ('#{address}', '#{postcode}', '#{photo}')")
  end 


  def self.delete(pid:)
    DatabaseConnection.query("DELETE FROM properties WHERE pid = #{pid}")
  end 

end 
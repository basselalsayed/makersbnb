require 'pg'

class User

  attr_reader :uid, :name, :email, :password, :phone

  def initialize(uid:, name:, email:, password:, phone:)
    @uid = uid
    @name = name
    @email = email
    @password = password
    @phone = phone
  end

  def self.all 
    []
  end
end
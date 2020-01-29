require 'pg'

class DatabaseConnection

  attr_accessor :connection

  def self.setup
    @connection = PG.connect :dbname => environment
  end

  def self.query(query_string)
    @connection.exec(query_string)
  end

  private

  def self.environment
    ENV['RACK_ENV'] == 'test' ? 'makersbnb_test' : 'makersbnb'
  end

end
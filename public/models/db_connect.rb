require 'pg'

class DatabaseConnection

  def self.query(query_string)
    begin
      @connection = PG.connect :dbname => environment
      @connection.exec(query_string)
    rescue PG::Error => e
      puts e.message 
    ensure
      @connection.close if @connection
    end
  end

  # def self.query(query_string)
  #   @connection.exec(query_string)
  # end

  private

  def self.environment
    ENV['RACK_ENV'] == 'test' ? 'makersbnb_test' : 'makersbnb'
  end

end
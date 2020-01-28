require 'pg'

class BnBControl

  attr_accessor :connection

  def self.all
    @connection = PG.connect(dbname: 'makers_bnb')

    listings = @connection.exec("SELECT * FROM properties")
  end

  def self.create()
    @connection = PG.connect(dbname: 'makers_bnb')

    @connecto.exec("INSERT INTO makers_bnb (properties) VALUES('#{address}');")
  end

end

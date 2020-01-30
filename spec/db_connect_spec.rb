require_relative '../public/models/db_connect'
require 'pg'

describe DatabaseConnection do
  it 'establishes a connection and executes a query' do
    expect(DatabaseConnection.query("SELECT * FROM users")).to be_a PG::Result
  end
end
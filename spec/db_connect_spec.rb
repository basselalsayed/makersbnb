require_relative '../public/models/db_connect'

describe DatabaseConnection do
  it 'establishes a connection to the database' do
    expect(PG).to receive(:connect).with(dbname: 'makersbnb_test')
    DatabaseConnection.setup
  end

  it 'executes a query' do
    connection = DatabaseConnection.setup
    expect(connection).to receive(:exec).with("SELECT * FROM users")
    DatabaseConnection.query("SELECT * FROM users")
  end
end
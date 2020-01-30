class Message
attr_reader :mid, :sender_uid, :receiver_uid, :content, :time

  def initialize(db_row)
    # option 1
    # @mid = db_row['mid']
    # @cid = db_row['cid']
    # @sender_uid = db_row['sender_uid']
    # @content = db_row['content']
    # @time = Time.parse(row['time'])

    # option 2
    # @mid = db_row['mid']
    # @cid = db_row['cid']
    # @sender_uid = db_row['sender_uid']
    # @receiver_uid = db_row['receiver_uid']
    # @content = db_row['content']
    # @time = Time.parse(row['time'])

    #option 3
    @mid = db_row['mid']
    @sender_uid = db_row['sender_uid']
    @receiver_uid = db_row['receiver_uid']
    @content = db_row['content']
    @time = Time.parse(db_row['time'])
  end

  def self.all(sender_uid:)
    DatabaseConnection.query("SELECT * FROM messages
                              WHERE 
                              sender_uid = #{sender_uid}
                              OR
                              receiver_uid = #{sender_uid}"
    ).map { |row| Message.new(row) }
  end

  def self.create(sender_uid:, receiver_uid:, content:)
    DatabaseConnection.query("INSERT INTO messages (sender_uid, receiver_uid, content) VALUES ('#{sender_uid}', '#{receiver_uid}', '#{content}')")
  end
end

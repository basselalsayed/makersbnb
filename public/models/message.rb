class Message
attr_reader :mid, :sender_uid, :content, :time

  def initialize(db_row)
    @mid = db_row['mid']
    @cid = db_row['cid']
    @sender_uid = db_row['sender_uid']
    @content = db_row['content']
    @time = Time.parse(row['time'])
  end

  def self.all(cid:)
    DatabaseConnection.query("SELECT * FROM messages
                              WHERE 
                              cid = #{@cid}"
    ).map { |row| Message.new(row) }
  end

  def self.create(sender_uid:, cid:, content:)
    DatabaseConnection.query("INSERT INTO messages (sender_uid, cid, content) VALUES ('#{sender_uid}', '#{cid}', '#{content}')")
  end
end

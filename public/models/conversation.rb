class Conversation

  attr_reader :cid, :u1_id, :u2_id

  def initialize(db_row)
    @cid = db_row['cid']
    @u1_id = db_row['u1_id']
    @u2_id = db_row['u2_id']
  end

  def self.all(uid:)
    DatabaseConnection.query("SELECT * FROM 
                              conversations WHERE 
                              u1_id = #{uid} OR u2_id = #{uid}"
    ).map { |row| Conversation.new(row) }
  end
  
  def self.messages
    Message.all(sender_uid: @u1_id, receiver_uid: @u2_id )
  end
  
end
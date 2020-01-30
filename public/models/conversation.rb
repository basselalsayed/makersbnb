class Conversation

  attr_reader :cid, :u1_id, :u2_id

  def initialize(db_row)
    @cid = db_row['cid']
    @u1_id = db_row['u1_id']
    @u2_id = db_row['u2_id']
  end
  
  def new_message(sender_uid:, content:)
    Message.create(sender_uid: sender_uid, cid: @cid, content: content)
  end
  
  def self.all(uid:)
    DatabaseConnection.query("SELECT * FROM 
                              conversations WHERE 
                              u1_id = #{uid} OR u2_id = #{uid}"
    ).map { |row| Conversation.new(row) }
  end
  
  def self.create(u1_id:, u2_id:)
    DatabaseConnection.query("INSERT INTO conversations 
                              (u1_id, u2_id)
                              VALUES ('#{u1_id}', '#{u2_id}')")
  end

  def messages
    Message.all(cid: @cid)
  end
  
  def self.return(u1_id:, u2_id:)
    Conversation.new(
      DatabaseConnection.query(
        "SELECT * 
         FROM 
          (SELECT * FROM conversations 
            WHERE
              u1_id = #{u1_id}
              OR u2_id = #{u1_id}) AS z
         WHERE
          u1_id = #{u2_id}
          OR u2_id = #{u2_id}").first)
  end
end

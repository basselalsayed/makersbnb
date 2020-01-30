require_relative '../public/models/message'

describe Message do 
  let(:sender) { double(:sender, uid: User.all.first.uid, content: 'Hello World') }
  let(:receiver) { double(:receiver, uid: User.all.last.uid, content: 'Hello User') }
  let(:db_row) {{ 'mid' => '1',
                  'cid' => '1',
                  'sender_uid' => User.all.first.uid, 
                  'receiver_uid' => User.all.last.uid,
                  'content' => 'Hello World', 
                  'time' => '20-01-2020 18:00' 
               }}
  let(:instance) { Message.new(db_row) }
  let(:messages) { Message.all(cid: Conversation.all(uid: sender.uid).first.cid) }
  
  describe '#initialization' do
    it 'initializes an instance of a message' do
      expect(instance.sender_uid).to eq User.all.first.uid
      expect(instance.time).to be_a Time
      expect(instance.content).to eq 'Hello World'
    end
  end

  describe '.create' do
    it 'creates a message entry in the database' do
      Message.create(sender_uid: receiver.uid, cid: Conversation.all(uid: receiver.uid).first.cid, content: receiver.content)
      expect(messages.last.content).to eq receiver.content
    end
  end

  describe '.all' do
    it 'returns a list of all peeps' do
      Message.create(sender_uid: sender.uid, cid: Conversation.all(uid: User.all.first.uid).first.cid, content: sender.content)
      expect(messages).to be_a Array
      expect(messages.last.content).to eq 'Hello World'
      expect(messages.last).to be_a Message
    end
  end

end
  
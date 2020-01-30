require_relative '../public/models/message'

describe Message do 
  let(:sender) { double(:sender, uid: User.all.first.uid, content: 'Hello World') }
  let(:receiver) { double(:receiver, uid: User.all.last.uid, content: 'Hello User') }
  let(:db_row) {{ 'mid' => '1', 
                  'sender_uid' => User.all.first.uid, 
                  'receiver_uid' => User.all.last.uid,
                  'content' => 'Hello World', 
                  'time' => '20-01-2020 18:00' 
               }}
  let(:instance) { Message.new(db_row) }
  let(:messages) { Message.all(sender_uid: sender.uid) }
  
  describe '#initialization' do
    it 'initializes an instance of a peep' do
      expect(instance.sender_uid).to eq User.all.first.uid
      expect(instance.time).to be_a Time
      expect(instance.content).to eq 'Hello World'
    end
  end

  describe '.create' do
    it 'creates a peep entry in the database' do
      Message.create(sender_uid: sender.uid, receiver_uid: receiver.uid, content: sender.content)
      Message.create(sender_uid: receiver.uid, receiver_uid: sender.uid, content: receiver.content)
      expect(messages.first.content).to eq sender.content
      expect(messages.last.content).to eq receiver.content
    end
  end

  describe '.all' do
    it 'returns a list of all peeps' do
      Message.create(sender_uid: sender.uid, receiver_uid: receiver.uid, content: sender.content)
      expect(messages).to be_a Array
      expect(messages.last.content).to eq 'Hello World'
      expect(messages.last).to be_a Message
    end
  end

end
  
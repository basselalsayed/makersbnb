require_relative '../public/models/conversation'

describe Conversation do
  
  let(:db_row) {{ 'cid' => '1',
                  'u1_id' => '2', 
                  'u2_id' => '3',
               }}
  let(:db_row_2) {{'cid' => "#{Conversation.all(uid: User.all.first.uid).first.cid}",
                  'u1_id' => "#{User.all.first.uid}", 
                  'u2_id' => "#{User.all.last.uid}",
               }}
  let(:instance) { described_class.new(db_row) }
  let(:instance_2) { described_class.new(db_row_2) }
  let(:conversations) { Conversation.all(uid: User.all.first.uid) }
  
  describe '#initialization' do
    it 'has an id' do
      expect(instance.cid).to eq '1'
    end
    it 'has a participant' do
      expect(instance.u1_id).to eq '2'
    end
  end

  describe '.all' do
    it 'returns an array of conversations' do
      expect(conversations).to be_a Array
      expect(conversations.first).to be_a Conversation
    end
  end

  describe '.messages' do
    it 'returns an array of mesasges' do
      expect(instance_2.messages).to be_a Array
      expect(instance_2.messages.first).to be_a Message
    end
  end

end
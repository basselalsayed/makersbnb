require_relative '../public/models/conversation'

describe Conversation do
  
  let(:db_row) {{ 'cid' => '1',
                  'u1_id' => '2', 
                  'u2_id' => '3',
               }}
  let(:instance) { described_class.new(db_row) }
  
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
      expect(Conversation.all(uid: User.all.first.uid)).to be_a Array
      expect(Conversation.all(uid: User.all.first.uid).first).to be_a Conversation
    end
  end

  describe '.messages' do
    it 'returns an array of mesasges' do
      expect(Conversation.messages).to be_a Array
      expect(Conversation.messages.first).to be_a Message
    end
  end

end
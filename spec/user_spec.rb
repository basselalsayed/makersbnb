require_relative '../public/models/user'

describe User do 
  let(:subject) { described_class.new(uid: '1', 
                                      name: 'tommy gun', 
                                      email: 'tommy@gun.com', 
                                      password: '00100',
                                      phone: '055555') 
  }
  let(:subject_2) { User }

  describe '#initialization' do
    it 'initializes with a uid' do
      expect(subject.uid).to eq '1'
    end
    it 'initializes with a name' do
      expect(subject.name).to eq 'tommy gun'
    end
    it 'initializes with a email' do
      expect(subject.email).to eq 'tommy@gun.com'
    end
    it 'initializes with a password' do
      expect(subject.password).to eq '00100'
    end
    it 'initializes with a phone' do
      expect(subject.phone).to eq '055555'
    end
  end

  describe '.all' do
    it 'returns an array' do
      expect(subject_2.all).to be_a Array
    end
    it 'contains an instance of User' do
      expect(subject_2.all.last).to be_a User
    end
  end
end
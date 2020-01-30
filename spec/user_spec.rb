require_relative '../public/models/user'

describe User do 
  let(:subject) { described_class.new({'uid' => '1', 
                                      'name' => 'tommy gun', 
                                      'email' => 'tommy@gun.com', 
                                      'password' => '00100',
                                      'phone' => '055555'}) 
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
    it 'iinitializez correctly' do
      expect(subject_2.all.first.name).to eq 'Tommy Gun'
    end
  end

  describe '.create' do
    it 'creates a new user' do
      subject_2.create(name: 'Jane Doe',
                       email: 'JD@google.com',
                       password: 'password',
                       phone: '0666666')
      expect(subject_2.all.last.name).to eq 'Jane Doe'
    end
    it 'does not create if the email is invalid' do
      expect(subject_2.create(name: 'Jane Doe',
                              email: 'JD',
                              password: 'password',
                              phone: '0666666')
      ).to eq false
    end
  end
  
  describe '.login' do
    it 'returns false when login details are wrong' do
      expect(subject_2.login('tommy@hdfgun.com', '055555')).to eq false
    end
    it 'returns an instance of user when login details are correct' do
      expect(subject_2.login('tommy@gun.com', '00100')).to be_a User
    end
  end

  xdescribe '.delete' do
    it 'deletes a user' do
      subject_2.delete(uid: subject_2.all.last.uid)
      subject_2.delete(uid: subject_2.all.last.uid)
      expect(subject_2.all).to be_empty
    end
  end
end
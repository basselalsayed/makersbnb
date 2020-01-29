require_relative '../public/models/property'


describe Property do # a new instance of the Property class has an address postcode photo puid uid
  let(:subject) { described_class.new({'address' => 'Crescent Road',
                                     'post_code' => 'SW20 XXX', 
                                     'photo' => 'www.imageshack.com/property',
                                     'pid' => '10',
                                     'uid' => "#{User.all.last.uid}"})
  }
  let(:subject_2) { Property } # the whole class

  describe '#initialization' do
    it'initializes with an id' do
      expect(subject.pid).to eq '10'
    end 
    it 'initializes with an address' do
      expect(subject.address).to eq 'Crescent Road'
    end
    it 'initializes with a postcode' do
      expect(subject.post_code).to eq 'SW20 XXX'
    end
    it 'initializes with a photo' do
      expect(subject.photo).to eq 'www.imageshack.com/property'
    end
  end

  describe '.all' do
    it 'returns  all of the properties' do # array of hashes 
      expect(subject_2.all.last.address).to eq('Cambridge Road')
      expect(subject_2.all.last.post_code).to eq('SW18 XXX')
    end

    it 'contains an instance of property' do
      expect(subject_2.all.last).to be_a Property 
    end 
  end

  describe '.create' do
    it 'creates a new property' do
      subject_2.create(address: 'Worple Road',
                     post_code: 'SW19 PPP',
                     photo: 'www.imageshack.com/property3',
                     uid: "#{User.all.last.uid}"
                     )
      expect(subject_2.all.last.post_code).to eq 'SW19 PPP'
    end    
  end 

  describe '.delete' do
    it 'deletes a property' do
      subject_2.delete(pid: subject_2.all.last.pid)
      subject_2.delete(pid: subject_2.all.last.pid)
      expect(subject_2.all).to be_empty 
    end
  end 
end 

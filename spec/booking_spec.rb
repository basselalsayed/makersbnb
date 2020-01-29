require_relative '../public/models/booking'

describe Booking do 
  let(:subject) { described_class.new({'bid' => '1',
                                       'owner_uid' => '20',
                                       'renter_uid' => '50',
                                       'pid' => '100',
                                       'check_in' => '02/02/2020',
                                       'check_out' => '10/2/2020'
                                      
  })}
  let(:subject_2) { Booking }
  let(:tommy) { User.all.first }
  let(:joe) { User.all.last }

  describe '#initialization' do
    it 'initializes correctly' do
      expect(subject.bid).to eq '1'
      expect(subject.check_in).to eq '02/02/2020'
    end
  end

  describe '.create' do
    it 'adds a booking to the database' do
      subject_2.create(renter_uid: joe.uid, check_in: '03/20/2020', check_out: '03/25/2020', pid: "#{Property.all.first.pid}")
      expect(subject_2.return('renter_uid', joe.uid).first.renter_uid).to eq joe.uid
    end
  end
  
  describe '.return' do
    it 'returns a booking' do
      expect(subject_2.return('renter_uid', joe.uid).first).to be_a Booking
      expect(subject_2.return('renter_uid', joe.uid).first.check_in).to eq '2020-10-10'
    end
  end
end

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
  let(:user) { User.all.first }
  let(:user_2) { User.all.last }

  describe '#initialization' do
    it 'initializes correctly' do
      expect(subject.bid).to eq '1'
      expect(subject.check_in).to eq '02/02/2020'
    end
  end

  describe '.create' do
    it 'adds a booking to the database' do
      subject_2.create(renter_uid: user_2.uid, check_in: '03/20/2020', check_out: '03/25/2020', pid: '20')
      expect(subject_2.all.last.pid).to eq '20'
    end
  end
  
  describe '.return' do
    it 'returns a list of bookings' do
      expect(subject_2.return).to be_a Array
      expect(subject_2.last.check_in).to eq '02/02/2020'
    end
  end
end
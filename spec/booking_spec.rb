require_relative '../public/models/booking'

describe Booking do 
  let(:subject) { described_class.new({'bid' => '1',
                                       'puid' => '20',
                                       'suid' => '50',
                                       'pid' => '100',
                                       'start_date' => '02/02/2020',
                                       'end_date' => '10/2/2020'
                                      
  })}
  let(:subject_2) { Booking }

  describe '#initialization' do
    it 'initializes correctly' do
      expect(subject.bid).to eq '1'
      expect(subject.start_date).to eq '02/02/2020'
    end
  end

  describe '.return' do
    it 'returns a list of bookings' do
      expect(subject_2).to be_a Array
      expect(subject_2.last.start_date).to eq '02/02/2020'
    end
  end
end
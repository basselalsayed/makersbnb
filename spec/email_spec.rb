require_relative '../public/models/email'

describe Email do

  let(:subject) { described_class.new(id: '1',
                                      bid: '1',
                                     from: 'emilyspencer89@hotmail.co.uk',
                                      to: 'imraan91@hotmail.co.uk',
                                      subject: "Testing",
                                      content: "Checking that email has been sent")
  }

  let(:email_2) {Email}
 

  describe '.initialization' do
    it 'initializes correctly' do
      expect(subject.from).to eq 'emilyspencer89@hotmail.co.uk'
      expect(subject.content).to eq 'Checking that email has been sent'
    end
  end

  describe '.send_email' do
    it 'sends an email to the bookee' do
      
    end
  end





end 
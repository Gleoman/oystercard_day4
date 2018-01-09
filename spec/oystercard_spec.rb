require 'oystercard'

describe Oystercard do
  subject(:oystercard) { described_class.new(5.00) }

  describe '#initialize' do

    it 'is initially not in a journey' do
      expect(oystercard.in_journey).to be false
    end
    
  end

  describe '#top_up' do

    it 'checks if the card has been topped-up' do
      expect { oystercard.top_up 1.00 }.to change { oystercard.balance }.by 1.00
    end

    it 'fails to top up beyond maximum balance' do
      oystercard = Oystercard.new(Oystercard::MAXIMUM_BALANCE)
      expect { oystercard.top_up 1.00 }.to raise_error "cannot top-up, #{oystercard.balance + 1.00} is greater than limit of #{Oystercard::MAXIMUM_BALANCE}"
    end

  end

  describe '#touch_in' do

    it 'touches in successfully' do
      expect(oystercard.touch_in).to eq true
    end

    it 'refuses to touch in when balance is below minimum journey charge' do
      oystercard = Oystercard.new(0.99)
      expect{ oystercard.touch_in }.to raise_error 'Not enough money on your card'
    end

  end

  describe '#touch_out' do

    it 'touches out successfully' do
      expect(oystercard.touch_out(1.00)).to eq false
    end

    it 'should deduct the journey charge from the card on touch_out' do
      expect { oystercard.touch_out(1.00) }.to change { oystercard.balance }.by -1.00
    end

  end

end

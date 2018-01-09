require 'oystercard'

describe Oystercard do
  subject(:oystercard) { described_class.new(5.00) }

  describe "#top_up" do

    it 'checks if the card has been topped-up' do
      expect { oystercard.top_up 1.00 }.to change { oystercard.balance }.by 1.00
    end

    it 'fails to top up beyond £90' do
      oystercard = Oystercard.new(Oystercard::MAXIMUM_BALANCE)
      expect { oystercard.top_up 1.00 }.to raise_error "cannot top-up, #{oystercard.balance + 1.00} is greater than limit of #{Oystercard::MAXIMUM_BALANCE}"
    end

  end

  describe '#deduct' do

    it 'checks if the money has been deducted from the card' do
      expect { oystercard.deduct 2.00 }.to change { oystercard.balance }.by -2.00
    end

  end

  it 'is initially not in a journey' do
    expect(oystercard.in_journey).to be false
  end

  describe '#touch_in' do

    it 'touches in successfully' do
      expect(oystercard.touch_in).to eq true
    end

    it 'refuses to touch in when balance below £1' do
      oystercard = Oystercard.new(0.99)
      expect{ oystercard.touch_in }.to raise_error 'Not enough money on your card'
    end

  end

  describe '#touch_out' do

    it 'touches out successfully' do
      expect(oystercard.touch_out).to eq false
    end

  end

end

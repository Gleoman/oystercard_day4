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

  it 'checks if the money has been deducted from the card' do
    expect { oystercard.deduct 2 }.to change { oystercard.balance }.by -2
  end

  it 'is initially not in a journey' do
    expect(oystercard.in_journey?).to be false
  end

  it 'touches in successfully' do
    oystercard.top_up(2)
    oystercard.touch_in
    expect(oystercard).to be_in_journey
  end

  it 'touches out successfully' do
    oystercard.top_up(2)
    oystercard.touch_in
    oystercard.touch_out
    expect(oystercard).not_to be_in_journey
  end

  it 'refuses to touch in when balance below £1' do
    expect{ oystercard.touch_in }.to raise_error 'Not enough money on your card'
  end
end

require 'oystercard'

describe Oystercard do
  subject(:oystercard) { described_class.new(5.00, journey_class) }
  let(:journey) { double :journey, start: entry_station,  finish: exit_station, fare: 1 }
  let(:journey_class) { double :journey_class, new: journey }
  let(:entry_station) { double :entry_station }
  let(:exit_station) { double :exit_station }
  let(:fare) { double :fare }

  it 'responds (oystercard) to journey method' do
    expect(oystercard).to respond_to(:journey)
  end

  it 'should have an empty list of journeys by default' do
    expect(oystercard.journeys).to be_empty
  end

  describe '#top_up' do

    it 'responds (oystercard) to top up method' do
      expect(oystercard).to respond_to(:top_up)
    end

    it 'checks if the card has been topped-up' do
      expect { oystercard.top_up 1.00 }.to change { oystercard.balance }.by 1.00
    end

    it 'fails to top up beyond maximum balance' do
      oystercard = Oystercard.new(Oystercard::MAXIMUM_BALANCE)
      expect { oystercard.top_up 1.00 }.to raise_error "cannot top-up beyond limit of #{Oystercard::MAXIMUM_BALANCE}"
    end
  end

  describe '#touch_in' do

    it 'responds (oystercard) to touch in method' do
      expect(oystercard).to respond_to(:touch_in)
    end

    it 'refuses to touch in when balance is below minimum journey charge' do
      oystercard = Oystercard.new(0.99)
      expect { oystercard.touch_in(entry_station) }.to raise_error 'Not enough money on your card'
    end

    it 'should start a new journey' do
      allow(journey).to receive(:start).and_return(entry_station)
      expect(oystercard.touch_in(entry_station)).to eq entry_station
    end
  end

  describe '#touch_out' do

    it 'responds (oystercard) to touch out method' do
      expect(oystercard).to respond_to(:touch_out)
    end

    it 'should deduct the fare from the card on touch_out' do
      subject.touch_in(entry_station)
      expect { oystercard.touch_out(exit_station) }.to change { oystercard.balance }.by -journey.fare
    end
  end
end

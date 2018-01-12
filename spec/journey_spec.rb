require 'journey'

describe Journey do
  let(:entry_station) { double :entry_station }
  let(:exit_station) { double :exit_station }
  subject(:journey) { described_class.new }

  it 'creates a new journey' do
    expect(journey).to be_a Journey
  end

  describe '#start' do

    it 'responds (journey) to start method' do
      expect(journey).to respond_to(:start)
    end

    it 'starts the journey with an entry station' do
      expect(journey.start(entry_station)).to eq entry_station
    end
  end

  describe '#finish' do

    it 'responds (journey) to finish method' do
      expect(journey).to respond_to(:finish)
    end

    it 'finishes the journey with an exit station' do
      expect(journey.finish(exit_station)).to eq exit_station
    end
  end

  describe '#fare' do

    it 'responds (journey) to fare method' do
      expect(journey).to respond_to(:fare)
    end

    it 'provides for the minimum fare' do
      journey.entry_station = 'Old Street'
      journey.exit_station = 'Haggerston'
      stub_const('Oystercard::MINIMUM_FARE', 1.00)
      expect(journey.fare).to eq Journey::MINIMUM_FARE
    end

    it 'returns penalty fare if no entry station' do
      journey.entry_station = nil
      journey.exit_station = 'Haggerston'
      stub_const('Oystercard::PENALTY_FARE', 6.00)
      expect(journey.fare).to eq Journey::PENALTY_FARE
    end

    it 'returns penalty fare if no exit station' do
      journey.entry_station = 'Old Street'
      stub_const('Oystercard::PENALTY_FARE', 6.00)
      expect(journey.fare).to eq Journey::PENALTY_FARE
    end
  end

  describe '#complete?' do

    it 'responds (journey) to complete? method' do
      expect(journey).to respond_to(:complete?)
    end

    it 'returns true when the journey is complete' do
      journey.entry_station = 'Old Street'
      journey.exit_station = 'Haggerston'
      expect(journey.complete?).to eq true
    end
  end
end

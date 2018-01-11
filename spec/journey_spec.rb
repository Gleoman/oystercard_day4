require 'journey'

describe Journey do
  let(:entry_station) { double :entry_station }
  let(:exit_station) { double :exit_station }
  subject(:journey) { described_class.new }

  it 'creates a new journey' do
    expect(journey).to be_a Journey
  end

  describe '#start' do
    it 'starts the journey with an entry station' do
      expect(journey.start(entry_station)).to eq entry_station
    end
  end

  it 'finishes the journey with an exit station' do
    expect(journey.finish(exit_station)).to eq exit_station
  end

  describe '#fare' do
    it 'provides for the minimum fare' do
      journey.entry_station = 'Old Street'
      journey.exit_station = 'Haggerston'
      expect(journey.fare).to eq Journey::MINIMUM_FARE
    end

    it 'returns penalty fare if no entry station' do
      journey.entry_station = nil
      journey.exit_station = 'Haggerston'
      expect(journey.fare).to eq Journey::PENALTY_FARE
    end

    it 'returns penalty fare if no exit station' do
      journey.entry_station = 'Old Street'
      expect(journey.fare).to eq Journey::PENALTY_FARE
    end
  end

  describe '#complete?' do
    it 'returns true when the journey is complete' do
      journey.entry_station = 'Old Street'
      journey.exit_station = 'Haggerston'
      expect(journey.complete?).to eq true
    end
  end
end

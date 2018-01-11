require 'journey'

describe Journey do

  let (:entry_station) {double :entry_station}
  let (:exit_station) {double :exit_station}
  subject(:journey) { described_class.new(entry_station) }

  it 'creates a new journey' do
    expect(journey).to be_a Journey
  end

  it 'receives an entry station' do
    journey.entry_station = "Old Street"
    expect(journey.entry_station).to eq "Old Street"
  end

  it 'receives an exit station' do
    journey.exit_station = "Haggerston"
    expect(journey.exit_station).to eq "Haggerston"
  end

  describe '#fare' do
    it 'provides for the minimum fare' do
      journey.entry_station = "Old Street"
      journey.exit_station = "Haggerston"
      puts journey.entry_station
      puts journey.exit_station
      expect(journey.fare).to eq Journey::MINIMUM_FARE
    end

    it 'returns penalty fare if no entry station' do
      journey.entry_station = nil
      journey.exit_station = "Haggerston"
      expect(journey.fare).to eq Journey::PENALTY_FARE
    end

    it "returns penalty fare if no exit station" do
      journey.entry_station = "Old Street"
      expect(journey.fare).to eq Journey::PENALTY_FARE
    end
  end

  describe '#complete?' do
    it 'returns true when the journey has been completed with an entry and exit station' do
      journey.entry_station = "Old Street"
      journey.exit_station = 'Haggerston'
      expect(journey.complete?).to eq true
    end
  end


end

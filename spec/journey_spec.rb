require 'journey'

describe Journey do

  subject(:journey) { described_class.new("Old Street") }
  let (:entry_station) {double :entry_station}
  let (:exit_station) {double :exit_station}

  it 'creates a new journey' do
    expect(journey).to be_a Journey
  end

  it 'receives an entry station' do
    expect(journey.entry_station).to eq "Old Street"
  end

  it 'receives an exit station' do
    journey.exit_station = 'Haggerston'
    expect(journey.exit_station).to eq "Haggerston"
  end

  describe '#fare' do
    it 'provides for the minimum fare' do
      journey.exit_station = 'Haggerston'
      puts journey.entry_station
      puts journey.exit_station
      expect(journey.fare).to eq 1.00
    end

    it 'returns penalty fare if no entry station' do
      expect(journey.fare).to eq PENALTY_FARE
    end
  end
end

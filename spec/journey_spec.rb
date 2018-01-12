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

    # it 'starts the journey with an entry station' do
    #   expect { journey.start(entry_station) } .to change { journey.entry_station } .to entry_station
    # end
  end

  describe '#finish' do

    it 'responds (journey) to finish method' do
      expect(journey).to respond_to(:finish)
    end

    it 'finishes the journey with an exit station' do
      expect { journey.finish(exit_station) } .to change { journey.exit_station } .to exit_station
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

    it 'returns false when the journey is incomplete' do
      journey.entry_station = 'Old Street'
      journey.exit_station = nil
      expect(journey.complete?).to eq false
    end
  end

  describe '#started' do

    it 'responds (journey) to started? method' do
      expect(journey).to respond_to(:started?)
    end

    it 'returns true if the journey has been started' do
      journey.entry_station = 'Old Street'
      expect(journey.started?).to eq true
    end

    it 'returns false if the journey has not been started' do
      journey.entry_station = nil
      expect(journey.started?).to eq false
    end
  end

  describe '#finished' do

    it 'responds (journey) to finished? method' do
      expect(journey).to respond_to(:finished?)
    end

    it 'returns true if the journey has been finished' do
      journey.exit_station = 'Haggerston'
      expect(journey.finished?).to eq true
    end

    it 'returns false if the journey has not been finished' do
      journey.exit_station = nil
      expect(journey.finished?).to eq false
    end
  end
end

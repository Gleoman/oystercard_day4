require 'journeylog'

describe Journeylog do
  subject(:journeylog) { described_class.new(journey_class) }
  let(:journey_class) { double :journey_class }
  let(:entry_station) { double :entry_station }
  let(:exit_station) { double :exit_station}


  it 'should initialize with an injected journey class' do
    expect(journeylog.journey_class).to eq journey_class
  end

  # it 'should provide that the journeys array accepts the entry and exit station as a hash when pushed' do
  #   journeylog.entry_station = "Old Street"
  #   journeylog.exit_station = "Haggerston"
  #   journeylog.current_journey
  #   expect(journeylog.journeys).to include({journeylog.entry_station => journeylog.exit_station})
  # end

  describe '#start' do

    it 'responds to the #start method' do
      expect(journeylog).to respond_to(:start)
    end

    it 'should start a new journey with an entry station' do
      expect{ journeylog.start(entry_station) }.to change { journeylog.entry_station }.to entry_station
    end
  end

  describe '#finish' do

    it 'responds to the #finish method' do
      expect(journeylog).to respond_to(:finish)
    end

    it 'should finish a journey with an exit station' do
      expect{ journeylog.finish(exit_station) }.to change { journeylog.exit_station }.to exit_station
    end
  end

  describe '#journeys' do

    it 'responds to the #journeys method' do
      expect(journeylog).to respond_to(:journeys)
    end

    it 'should provide that the journeys array accepts the entry and exit station as a hash when pushed' do
      journeylog.entry_station = "Old Street"
      journeylog.exit_station = "Haggerston"
      journeylog.current_journey
      puts journeylog.journeys
      expect(journeylog.journeys).to include({journeylog.entry_station => journeylog.exit_station})
    end
  end

  describe '#current_journey' do

    it 'responds to the current journey method' do
      expect(journeylog).to respond_to(:current_journey)
    end

    it 'should return incomplete journey if the entry station is nil' do
      journeylog.entry_station = nil
      expect(journeylog.current_journey).to eq 'incomplete journey'
    end

    it 'should return incomplete journey if the exit station is nil' do
      journeylog.exit_station = nil
      expect(journeylog.current_journey).to eq 'incomplete journey'
    end

    it 'should end the current journey when complete' do
      journeylog.entry_station = "Old Street"
      journeylog.exit_station = "Haggerston"
      expect(journeylog.current_journey).to eq journeylog.journeys
    end
  end

  describe '#started' do
    it 'should return true if the entry station is truthy' do
      journeylog.entry_station = "Old Street"
      expect(journeylog.started?).to eq true
    end
  end

  describe '#finished' do
    it 'should return true if the exit station is truthy' do
      journeylog.exit_station = "Haggerston"
      expect(journeylog.finished?).to eq true
    end
  end
end

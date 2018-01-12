require 'journeylog'

describe Journeylog do
  subject(:journeylog) { described_class.new(journey_class) }
  let(:journey_class) { double :journey_class, new: this_journey }
  let(:entry_station) { double :entry_station }
  let(:exit_station) { double :exit_station }
  let(:this_journey) { double :this_journey, entry_station: entry_station, exit_station: exit_station, start: entry_station, finish: exit_station  }

  it 'should initialize with an injected journey class' do
    expect(journeylog.journey_class).to eq journey_class
  end


  it 'should provide that the journey history array accepts the entry and exit station as a hash when pushed' do
    journeylog.this_journey = journey_class.new
    journeylog.start(entry_station)
    journeylog.finish(exit_station)
    journeylog.journeys
    expect(journeylog.journey_history).to include({journeylog.entry_station => journeylog.exit_station})
  end

  describe '#start' do

    it 'responds to the #start method' do
      expect(journeylog).to respond_to(:start)
    end

    it 'should start a new journey with an entry station' do
      journeylog.this_journey = journey_class.new
      expect(journeylog.start(entry_station)).to eq entry_station
    end
  end

  describe '#finish' do

    it 'responds to the #finish method' do
      expect(journeylog).to respond_to(:finish)
    end

    it 'should finish a journey with an exit station' do
      journeylog.this_journey = journey_class.new
      expect(journeylog.finish(exit_station)).to eq exit_station
    end
  end

  describe '#journeys' do

    it 'responds to the #journeys method' do
      expect(journeylog).to respond_to(:journeys)
    end

    it 'should list out the journey_history' do
      expect(journeylog.journeys).to eq journeylog.journey_history
    end
  end

  describe '#current_journey' do

    it 'should return incomplete journey if the entry station is nil' do
      journeylog.entry_station = nil
      expect(journeylog.send(:current_journey)).to eq 'incomplete journey'
    end

    it 'should return incomplete journey if the exit station is nil' do
      journeylog.exit_station = nil
      expect(journeylog.send(:current_journey)).to eq 'incomplete journey'
    end

    it 'should create a new journey if the current journey is complete' do
      journeylog.entry_station = "Old Street"
      journeylog.exit_station = "Haggerston"
      expect(journeylog.send(:current_journey)).to eq journey_class.new
    end
  end

  describe '#started' do
    it 'should return true if the entry station is truthy' do
      journeylog.entry_station = "Old Street"
      expect(journeylog.send(:started?)).to eq true
    end
  end

  describe '#finished' do
    it 'should return true if the exit station is truthy' do
      journeylog.exit_station = "Haggerston"
      expect(journeylog.send(:finished?)).to eq true
    end
  end
end

require_relative 'journey'

class Journeylog

  attr_accessor :journey_class, :entry_station, :exit_station, :this_journey
  attr_reader :journey_history

    def initialize(journey_class = Journey)
      @journey_class = journey_class
      @entry_station = nil
      @exit_station = nil
      @journey_history = []
      @this_journey = nil
    end

    def start(entry_station)
      @this_journey = journey_class.new
      @this_journey.start(entry_station)
    end

    def finish(exit_station)
      @this_journey.finish(exit_station)
    end

    def journeys
      @journey_history.push({@entry_station => @exit_station})
      @journey_history
    end

private

    def current_journey
      if !started? || !finished?
        'incomplete journey'
      else
        journeys
        @this_journey = @journey_class.new
      end
    end

    def started?
      !@entry_station.nil?
    end

    def finished?
      !@exit_station.nil?
    end
  end

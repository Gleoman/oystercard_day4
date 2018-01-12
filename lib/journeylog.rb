
class Journeylog

  attr_accessor :journey_class, :entry_station, :exit_station, :journeys

  def initialize(journey_class = Journey)
    @journey_class = journey_class
    @entry_station = nil
    @exit_station = nil
    @journeys = []
    @journey_hash = nil

  end

  def start(entry_station)
    @entry_station = entry_station
  end

  def finish(exit_station)
    @exit_station = exit_station
  end

  def journeys
    @journeys.push({@entry_station => @exit_station})
  end

  # private

  def current_journey
    if !started? || !finished?
      'incomplete journey'
    else
      journeys
    end
  end

  def started?
    !@entry_station.nil?
  end

  def finished?
    !@exit_station.nil?
  end

end

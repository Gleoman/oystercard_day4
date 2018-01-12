
class Journeylog

  attr_accessor :journey_class, :entry_station, :exit_station

  def initialize(journey_class = Journey)
    @journey_class = journey_class
    @entry_station = nil
    @exit_station = nil

  end

  def start(entry_station)
    @entry_station = entry_station
  end

  def finish
    true
  end

  def journeys
    true
  end

  # private

  def current_journey
    if !started? || !finished?
      'incomplete journey'
    else
      end_journey
    end
  end

  def end_journey

  end

  def started?
    !@entry_station.nil?
  end

  def finished?
    !@exit_station.nil?
  end

end

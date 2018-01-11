
class Journey
  
  PENALTY_FARE = 6.00
  MINIMUM_FARE = 1.00
  attr_accessor :entry_station, :exit_station

  def initialize
    @entry_station = nil
    @exit_station = nil
  end

  def start(entry_station)
    @entry_station = entry_station
  end

  def finish(exit_station)
    @exit_station = exit_station
  end

  def fare
    complete? == true ? MINIMUM_FARE : PENALTY_FARE
  end

  def complete?
    @entry_station.nil? || @exit_station.nil? ? false : true
  end
end

class Journey

  PENALTY_FARE = 6.00
  MINIMUM_FARE = 1.00
  attr_accessor :entry_station, :exit_station

  def initialize(entry_station)
    @entry_station = entry_station
    @exit_station = nil
  end

  def fare
      if @entry_station == nil
        Journey::PENALTY_FARE
      elsif @exit_station == nil
        Journey::PENALTY_FARE
      else
        MINIMUM_FARE
      end
  end

  def complete?
    if @entry_station && @exit_station
      true
    else
      false
    end
  end

end

class Journey

  PENALTY_FARE = 6.00
  attr_accessor :entry_station, :exit_station

  def initialize(entry_station)
    @entry_station = entry_station
    @exit_station = exit_station
  end

  def fare
      if @entry_station || @exit_station == nil
        PENALTY_FARE
      else
        1.00
      end
  end



end

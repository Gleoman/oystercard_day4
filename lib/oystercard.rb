# require 'pry'

class Oystercard

  MINIMUM_FARE = 1.00
  MAXIMUM_BALANCE = 90.00

  attr_reader :balance, :journeys, :entry_station, :exit_station

  def initialize(initial_balance = 0.00)
    @balance = initial_balance
    @journeys = {}
  end

  def top_up(amount)
    raise "cannot top-up beyond limit of #{MAXIMUM_BALANCE}" if @balance + amount > MAXIMUM_BALANCE
    @balance += amount
  end

  def touch_in(entry_station)
    raise 'Not enough money on your card' if @balance < MINIMUM_FARE
    @entry_station = entry_station
  end

  def touch_out(exit_station)
    deduct(MINIMUM_FARE)
    store_journeys(entry_station, exit_station)
    @entry_station = nil
  end

  def in_journey?
    !entry_station.empty?
  end


  private

  def deduct(amount)
    @balance -= amount
  end

  def store_journeys(entry_station, exit_station)
    # binding.pry
    @journeys[:entry_station] = entry_station
    @journeys[:exit_station] =  exit_station
  end

end

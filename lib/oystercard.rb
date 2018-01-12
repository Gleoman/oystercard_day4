require_relative 'journey'
require_relative 'journeylog'
require_relative 'station'

class Oystercard

  MINIMUM_FARE = 1.00
  MAXIMUM_BALANCE = 90.00

  attr_reader :balance, :journeys, :journey

  def initialize(initial_balance = 0.00, journey_class = Journey)
    @balance = initial_balance
    @journeys = {}
    @journey = nil
    @journey_class = journey_class
  end

  def top_up(amount)
    raise "cannot top-up beyond limit of #{MAXIMUM_BALANCE}" if @balance + amount > MAXIMUM_BALANCE
    @balance += amount
  end

  def touch_in(entry_station)
    raise 'Not enough money on your card' if @balance < MINIMUM_FARE
    @journey = @journey_class.new
    @journey.start(entry_station)
  end

  def touch_out(exit_station)
    deduct(exit_station)
  end

  private

  def deduct(exit_station)
    @journey.finish(exit_station)
    @balance -= @journey.fare
  end

  def store_journeys(entry_station, exit_station)
    @journeys[:entry_station] = entry_station
    @journeys[:exit_station] =  exit_station
  end
end

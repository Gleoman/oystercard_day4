class Oystercard

  MINIMUM_FARE = 1.00
  MAXIMUM_BALANCE = 90.00

  attr_reader :balance, :entry_station
  # attr_accessor :in_journey

  def initialize(initial_balance = 0.00)
    @balance = initial_balance
  end

  def top_up(amount)
    fail_message = "cannot top-up beyond limit of #{MAXIMUM_BALANCE}"
    raise fail_message if @balance + amount > MAXIMUM_BALANCE
    @balance += amount
  end

  def touch_in(entry_station)
    raise 'Not enough money on your card' if @balance < MINIMUM_FARE
    @entry_station = entry_station
  end

  def touch_out
    deduct(MINIMUM_FARE)
    @entry_station = nil
  end

  def in_journey?
    !entry_station.empty?
  end


  private

  def deduct(amount)
    @balance -= amount
  end


end

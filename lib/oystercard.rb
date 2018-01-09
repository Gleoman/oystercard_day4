class Oystercard
  #controls the user balance

  MINIMUM_FARE = 1.00
  MAXIMUM_BALANCE = 90.00

  attr_reader :balance
  attr_accessor :in_journey

  def initialize(initial_balance = 0.00)
    @balance = initial_balance
    @in_journey = false
  end

  def top_up(amount)
    fail_message = "cannot top-up, #{@balance + amount} is greater than limit of #{MAXIMUM_BALANCE}"
    raise fail_message if @balance + amount > MAXIMUM_BALANCE
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

  def touch_in
    raise 'Not enough money on your card' if @balance < MINIMUM_FARE
    @in_journey = true
  end

  def touch_out
    @in_journey = false
  end


end

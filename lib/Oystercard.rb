
class Oystercard
  attr_reader :balance
  attr_reader :in_journey
  LIMIT = 90
  def initialize(balance = 0)
    @balance = balance
  end
  def top_up(n)
    exceed = @balance + n - LIMIT
    raise 'Maximum balance exceeded by ' + "#{exceed}" if @balance + n > LIMIT
    @balance += n
  end
  def deduct
    @balance -= 5.35
  end
  def touch_in
    @in_journey = true
  end
  def touch_out
    @in_journey = false
  end
  def in_journey?
    @in_journey
  end
end

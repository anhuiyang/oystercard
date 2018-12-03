
class Oystercard
  attr_reader :balance
  attr_reader :in_journey
  LIMIT = 90
  def initialize
    @balance = 0
    @in_journey = false
  end
  def top_up(n)
    exceed = @balance + n - LIMIT
    raise 'Maximum balance £90 exceeded by ' + "#{exceed}" if @balance + n > LIMIT
    @balance += n
  end
  def deduct(n)
    @balance -= n
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

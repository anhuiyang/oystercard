
class Oystercard
  attr_reader :balance
  attr_reader :in_journey
  MAX = 90
  MIN = 1
  def initialize
    @balance = 0
    @in_journey = false
  end
  def top_up(n)
    exceed = @balance + n - MAX
    raise "Maximum balance £#{MAX} exceeded" if @balance + n > MAX
    @balance += n
  end
  def touch_in
    raise "balance below £1" if @balance < MIN
    @in_journey = true
  end
  def touch_out
    deduct(MIN)
    @in_journey = false
  end
  def in_journey?
    @in_journey
  end
  private
  def deduct(n)
    @balance -= n
  end
end

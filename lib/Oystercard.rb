require_relative './Journey'
class Oystercard
  attr_accessor :balance, :history
  attr_reader :journey
  MAX = 90
  MIN = 1
  def initialize
    @balance = 0
    @history = []
    @journey = Journey.new
  end
  def top_up(v)
    raise "Maximum balance £#{MAX} exceeded" if @balance + v > MAX
    @balance += v
  end
  def touch_in(entry)
    raise "balance below £#{MIN}" if @balance < MIN
      @journey = Journey.new(entry)
  end
  def touch_out(exit)
    @journey.exit = exit
    deduct(@journey.fare)
    add_journey
    @journey = Journey.new
  end
  private
  def deduct(n)
    @balance -= n
  end
  def add_journey
    @history << {@journey.entry => @journey.exit}
  end
end

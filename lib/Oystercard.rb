
class Oystercard
  attr_accessor :balance
  attr_reader :entry_station
  attr_accessor :history
  MAX = 90
  MIN = 1
  def initialize
    @balance = 0
    @entry_station = nil
    @history = {}
  end
  def top_up(v)
    raise "Maximum balance £#{MAX} exceeded" if @balance + v > MAX
    @balance += v
  end
  def touch_in(entry)
    raise "balance below £#{MIN}" if @balance < MIN
    @entry_station = entry
  end
  def touch_out(exit)
    @entry_station.nil? ? @balance : deduct(MIN)
    @history[@entry_station] = exit
    @entry_station = nil
  end
  def in_journey?
    !@entry_station.nil?
  end
  private
  def deduct(n)
    @balance -= n
  end
end


class Oystercard
  attr_reader :balance
  LIMIT = 90
  def initialize(balance = 0)
    @balance = balance
  end
  def top_up(n)
    exceed = @balance + n - LIMIT
    raise 'Maximum balance exceeded by ' + "#{exceed}" if @balance + n > LIMIT
    @balance += n
  end


end

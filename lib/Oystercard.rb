LIMIT = 90

class Oystercard
  attr_reader :balance
  def initialize(balance = 0)
    @balance = balance
  end
  def top_up(n)
    @balance += n
    raise 'Maximum balance reached' if balance > LIMIT
  end


end

class Journey
  attr_accessor :entry, :exit
  MIN = 1
  PENALTY = 6
  def initialize(entry = nil, exit = nil)
    @entry = entry
    @exit = exit
  end
  def fare
    complete? ? MIN : PENALTY
  end
  def complete?
    !@entry.nil? && !@exit.nil?
  end
end

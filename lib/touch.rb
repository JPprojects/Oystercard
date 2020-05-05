class Touch
  attr_reader :balance
  def initialize(card)
    @balance = card.balance
end

def touch_in
  if !@journey
    if @balance < 1
      raise "Insufficient Funds"
    end
  @journey = true
  else
    fail "In use"
  end
end

def touch_out
    @journey = false
end
end

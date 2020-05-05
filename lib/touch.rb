class Touch
  MINIMUM_BALANCE = 1
  attr_reader :balance
  attr_reader :journey
  def initialize(card)
    @card = card
    @balance = @card.balance
end

def touch_in
  if !@journey
    if @balance < MINIMUM_BALANCE
      raise "Insufficient Funds"
    end
  @journey = true
  else
    fail "In use"
  end
end

  def touch_out
    @journey = false
    @card.deduct_money(MINIMUM_BALANCE)
  end
end

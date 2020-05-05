class Touch
  MINIMUM_BALANCE = 1
  attr_reader :balance
  attr_reader :journey
  attr_reader :entry_station
  def initialize(card)
    @card = card
    @balance = @card.balance
end

def touch_in(station)
  @entry_station = station
  if !journey?()
    if @balance < MINIMUM_BALANCE
      raise "Insufficient Funds"
    end

  else
    fail "In use"
  end
end

  def touch_out
      @entry_station = nil
      @card.deduct_money(MINIMUM_BALANCE)
  end

  private 
end

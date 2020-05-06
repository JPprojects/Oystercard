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
    fail "In use" if @active
    fail "Insufficient Funds" if @balance < MINIMUM_BALANCE
    @active = true
  end

  def touch_out
      @entry_station = nil
      @active = false 
      @card.deduct_money(MINIMUM_BALANCE)
  end

  private 

  def journey?
    if @entry_station.nil?
      true
    else
      false
    end 
  end
end

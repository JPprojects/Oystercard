class Touch
  MINIMUM_BALANCE = 1
  attr_reader :balance
  attr_reader :journey
  attr_reader :entry_station
  attr_reader :log
  
  def initialize(card)
    @card = card
    @balance = @card.balance
    @log = JourneyLog.new
  end

  def touch_in(station)
    @entry_station = station
    update_journey_log
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

  def update_journey_log
    @log.update(@entry_station)
  end

  def journey?
    if @entry_station.nil?
      true
    else
      false
    end 
  end
end

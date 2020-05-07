require './lib/journey_log.rb'
require './lib/journey.rb'

class Oystercard
    attr_reader :balance
    attr_reader :log
    LIMIT = 90
    MINIMUM_BALANCE = 1

    def initialize
        @balance = 0
        @log = JourneyLog.new
        @journey = Journey.new(@log)
    end

    def add_money(deposit)
        @balance += deposit
        if @balance >= LIMIT
            fail "£#{LIMIT}limit reached"
        else
            @balance
        end
    end

    def deduct_money(spending)
      @balance -= spending
    end

    def touch_in(station)
      @entry_station = station
      @journey.start_journey(station)
      fail "In use" if @active
      fail "Insufficient Funds" if @balance < MINIMUM_BALANCE
      @active = true
    end

    def touch_out
        @entry_station = nil
        @active = false
        @card.deduct_money(MINIMUM_BALANCE)
    end
end

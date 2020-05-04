class Oystercard
    attr_reader :balance
    attr_accessor :journey
    LIMIT = 90

    def initialize
        @balance = 0
    end

    def touch_in
      # checking_balance()
      fail "Insufficient Funds" if balance < 1
      if !@journey
          @journey = true
      else
        fail "In use"
      end
    end

    def touch_out
        @journey = false
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
end


#     def checking_balance
#       if @balance < 1
#         fail "Insufficient Funds"
#       end
#     end

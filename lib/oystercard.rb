class Oystercard
    attr_reader :balance
    LIMIT = 90

    def initialize
        @balance = 7
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

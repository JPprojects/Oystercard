class Oystercard
    attr_reader :balance
    LIMIT = 90

    def initialize
        @balance = 0
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
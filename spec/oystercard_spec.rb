require "oystercard.rb"

describe Oystercard do
    it "should be able to create a new instance of Oyster card" do
        card = Oystercard.new
        expect(card).to be_instance_of Oystercard
    end

    describe "#balance" do
        it "should be able to view balance" do
            expect(subject.balance).to eq 0
        end
    end

    describe "#add_money" do
        it "add_money should return a response" do
            expect(subject).to respond_to (:add_money)
        end

        it "should be able to add money to a card" do
            subject.add_money(50)
            expect(subject.balance).to eq 50
        end

        it "it should error if more that the limit is added" do
            expect{subject.add_money(91)}.to raise_error "£#{Oystercard::LIMIT}limit reached"
        end
    end
    describe "#deduct_money" do
      it "deduct_money should return a response" do
        expect(subject).to respond_to (:deduct_money)
      end
      it "should be able to deduct money to a card" do
          subject.add_money(50)
          subject.deduct_money(50)
          expect(subject.balance).to eq 0
        end
    end


    describe "#touch_out" do
      it "responds to touch out" do
        expect(subject).to respond_to(:touch_out)
      end
      it "should return true" do
        expect(subject.touch_out).to eq false
      end
    end

    describe "#in_journey?" do
        it "should know if the user has touched in" do
            subject.touch_in()
            expect(subject.journey).to eq true
        end

        it "should know if the user has touched out" do
            subject.touch_out()
            expect(subject.journey).to eq false
        end
    end

    describe "#checking_balance" do
        it "should respond checking_balance" do
            expect(subject).to respond_to(:checking_balance)
        end
    end
end

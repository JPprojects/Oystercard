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

    describe "#touch_in" do
      it "responds to touch in" do
        expect(subject).to respond_to(:touch_in)
      end
    end
end

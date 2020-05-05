require "touch.rb"

require "oystercard.rb"

describe Touch do
  let(:oystercard) { double :oystercard, balance: 5, deduct_money: 1 }
  let(:skint_card) { double :oystercard, balance: 0 }
  describe '#touch_in' do
    it "responds to touch in" do
      card_1 = Touch.new(oystercard)
      expect(card_1).to respond_to(:touch_in)
    end
    it "should return true" do
      card_1 = Touch.new(oystercard)
      expect(card_1.touch_in).to eq true
    end
    it "should fail if touch in is called twice" do
      card_1 = Touch.new(oystercard)
      card_1.touch_in
      expect{ card_1.touch_in }.to raise_error "In use"
    end
    it "should fail on touch in if balance is > £1" do
      card_2 = Touch.new(skint_card)
      expect{ card_2.touch_in }.to raise_error "Insufficient Funds"
    end
  end

  describe "#touch_out" do
    it "responds to touch out" do
      card_1 = Touch.new(oystercard)
      expect(card_1).to respond_to(:touch_out)
    end
    it "should return true" do
      card_1 = Touch.new(oystercard)
      expect(card_1.touch_out).to eq false
    end
    it "deducts minimum fare on touch out" do
      oystercardy = Oystercard.new
      card_1 = Touch.new(oystercardy)
      card_1.touch_out
      expect(card_1.balance).to eq 6
    end
  end
  describe "#in_journey?" do
      it "should know if the user has touched in" do
        card_1 = Touch.new(oystercard)
        card_1.touch_in
        expect(card_1.journey).to eq true
      end

      it "should know if the user has touched out" do
        card_1 = Touch.new(oystercard)
        card_1.touch_out
        expect(card_1.journey).to eq false
      end
  end
end

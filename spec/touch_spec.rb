require "touch.rb"

describe Touch do
  let(:oystercard) { double :oystercard, balance: 5 }
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
end

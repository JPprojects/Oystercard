require "touch.rb"
require "oystercard.rb"

describe Touch do
  let(:oystercard) { double :oystercard, balance: 5, deduct_money: 1 }
  let(:skint_card) { double :oystercard, balance: 0 }
  let(:old_street) { double :station }

  describe '#touch_in' do
    it "responds to touch in" do
      card_1 = Touch.new(oystercard)
      expect(card_1).to respond_to(:touch_in)
    end

    it "should fail if touch in is called twice" do
      card_1 = Touch.new(oystercard)
      card_1.touch_in(old_street)
      expect{ card_1.touch_in(old_street) }.to raise_error "In use"
    end

    it "should fail on touch in if balance is > £1" do
      card_2 = Touch.new(skint_card)
      expect{ card_2.touch_in(old_street) }.to raise_error "Insufficient Funds"
    end

    it "should take in stattion" do
      card_1 = Touch.new(oystercard)
      card_1.touch_in(old_street)
      expect(card_1.entry_station).to eq old_street
    end

    it "should update journey log" do 
      card_1 = Touch.new(oystercard)
      card_1.touch_in(old_street)
      expect(card_1.log.history).to eq([old_street])
    end
  end

  describe "#touch_out" do
    it "responds to touch out" do
      card_1 = Touch.new(oystercard)
      expect(card_1).to respond_to(:touch_out)
    end

    it "deducts minimum fare on touch out" do
      oystercardy = Oystercard.new
      card_1 = Touch.new(oystercardy)
      expect(card_1.touch_out).to eq -1
    end

    it "should forget the entry station on touch out" do
      card_1 = Touch.new(oystercard)
      card_1.touch_in(old_street)
      card_1.touch_out
      expect(card_1.entry_station).to eq nil
    end

  end
end

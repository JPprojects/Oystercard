require "journey.rb"
require "station.rb"

describe Journey do
  # let(:old_street) { double :station("oldstreet", 1)
  old_street = Station.new("oldstreet", 1)
  it "should create a new instance of its self" do
    journ = Journey.new(old_street)
    expect(journ).to be_instance_of Journey
  end

  describe "#start_journey" do
    it "should respond to start journey" do
      journey = Journey.new(old_street)
      expect(journey).to respond_to(:start_journey)
    end

    it "should keep track of station and zone" do
      journey = Journey.new(old_street)
      expect(journey.start_journey(old_street)).to eq true
    end
  end

  describe "#finish_journey" do
    it "should respond to finish journey" do
      journey = Journey.new(old_street)
      expect(journey).to respond_to(:finish_journey)
    end
  end

  describe "#calculating" do
    it "should respond to calculating" do
      journey = Journey.new(old_street)
      expect(journey).to respond_to(:calculating)
    end
  end

  describe "#journey_complete?" do
    it "should respond to journey_complete?" do
      journey = Journey.new(old_street)
      expect(journey).to respond_to(:journey_complete?)
    end
  end

  describe "#penalty" do
    it "should respond to penalty" do
      journey = Journey.new(old_street)
      expect(journey).to respond_to(:penalty)
    end
  end
end
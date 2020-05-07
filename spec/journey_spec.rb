require "journey.rb"

describe Journey do
  it "should create a new instance of its self" do
    journ = Journey.new
    expect(journ).to be_instance_of Journey
  end

  describe "#start_journey" do
    it "should respond to start journey" do
      expect(subject).to respond_to(:start_journey)
    end
  end

  describe "#finish_journey" do
    it "should respond to finish journey" do
      expect(subject).to respond_to(:finish_journey)
    end
  end

  describe "#calculating" do
    it "should respond to calculating" do
      expect(subject).to respond_to(:calculating)
    end
  end

  describe "#journey_complete?" do
    it "should respond to journey_complete?" do
      expect(subject).to respond_to(:journey_complete?)
    end
  end

  describe "#penalty" do
    it "should respond to penalty" do
      expect(subject).to respond_to(:penalty)
    end
  end
end
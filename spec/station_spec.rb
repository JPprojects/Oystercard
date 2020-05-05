require "station.rb"

describe Station do
  it "should create a new instance of itself" do
    oldstreet = Station.new
    expect(oldstreet).to be_instance_of Station
  end
end
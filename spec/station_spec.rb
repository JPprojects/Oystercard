require "station.rb"

describe Station do
  it "should create a new instance of itself" do
    oldstreet = Station.new("old_street", "zone_1")
    expect(oldstreet).to be_instance_of Station
  end
  it 'should initialize a name instance variable' do
    oldstreet = Station.new("old_street", "zone_1")
    expect(oldstreet.name).to eq("old_street")
  end
    it 'should initialize a zone instance variable' do
      oldstreet = Station.new("old_street", "zone_1")
      expect(oldstreet.zone).to eq("zone_1")
    end
end

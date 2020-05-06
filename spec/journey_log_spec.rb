require 'journey_log.rb'

describe JourneyLog do
  describe '#journey log' do
    let(:old_street) { double :station }
    
    it 'creates a new instance of itself' do
      log = JourneyLog.new
      expect(log).to be_instance_of JourneyLog
    end

    it 'creates empty array' do
      log = JourneyLog.new
      expect(log.history).to eq([])
    end

    it 'creates empty array' do
      log = JourneyLog.new
      log.update(old_street)
      expect(log.history).to eq([old_street])
    end

  end
end

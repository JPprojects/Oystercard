class JourneyLog
attr_reader :history
  def initialize
    @history = []
  end

  def update(station)
    @history << station
  end
end

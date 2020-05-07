class Journey
  attr_reader :start
  attr_reader :finish
  def initialize(log)
    @journey_log = log
    @start = []
    @finish = []
  end

  def start_journey(station)
    @start << station.station
    @journey_log.update(@start)
    #keep track of station and zone
    #pass this to journey log
    #pass this to calculating method
  end

  def finish_journey
    @finish << station.station
    @journey_log.update(@finish)
    #keep track of station and zone
    #pass this into journey log
    #pass this to calculating method
  end

  def calculating
    #know the start of the journey zones
    #know the finish of the jouney zones
    #fare = station{:zone} - station{:zone}
  end

  def journey_complete?
  end

  def penalty
  end
end

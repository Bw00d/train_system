class Stop
  attr_reader :id, :line_id, :station_id, :all

  def initialize(attributes)
    @line_id    = attributes[:line_id]
    @station_id = attributes[:station_id]
    @id         = attributes[:id]
  end

  def self.all
    results = DB.exec("SELECT * FROM  stops;")
    stops   = []
    results.each do |result|
      line_id    = result['line_id'].to_i
      station_id = result['station_id'].to_i
      id         = result['id'].to_i
      stops << Stop.new({ :line_id => line_id, :station_id => station_id, :id => id })
    end
    stops
  end

  def save
    result =DB.exec("INSERT INTO stops (line_id, station_id) VALUES (#@line_id, #@station_id) RETURNING id;")
      @id = result.first['id'].to_i
  end

  def ==(another_stop)
    self.line_id == another_stop.line_id && self.station_id == another_stop.station_id && self.id ==  another_stop.id
  end
end

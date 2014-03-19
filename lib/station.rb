class Station
  attr_reader :name, :id

  def initialize(attributes)
    @name = attributes[:name]
    @id   = attributes[:id]
  end

  def self.create(attributes)
    new_station = Station.new(attributes)
    new_station.save
    new_station
  end

  def self.all
    results  = DB.exec("SELECT * FROM stations;")
    stations = []
    results.each do |result|
      name = result['name']
      id   = result['id'].to_i
      stations << Station.new({ :name => name, :id => id })
    end
    stations
  end

  def save
    result = DB.exec("INSERT INTO stations (name) VALUES ('#@name') RETURNING id;")
    @id    = result.first['id'].to_i
  end

  def delete
    DB.exec("DELETE FROM stations WHERE id = #@id;")
  end

  def modify(attributes)
    if attributes.include?(:name)
      @name = attributes[:name]
      DB.exec("UPDATE stations SET name = '#{attributes[:name]}' WHERE id = #@id;")
    end
  end

  def ==(another_station)
    self.name == another_station.name && self.id == another_station.id
  end

end

class Line
  attr_reader :name, :id, :source, :destination

  def initialize(attributes)
    @name = attributes[:name]
    @id   = attributes[:id]
    @source = attributes[:source_id]
    @destination = attributes[:destination_id]
  end

  def self.all
    results = DB.exec("SELECT * FROM lines;")
    lines = []
    results.each do |result|
      name = result['name']
      id = result['id'].to_i
      source = result['source_id'].to_i
      destination = result['destination_id'].to_i
      lines << Line.new({ :name => name, :id => id, :source_id => source, :destination_id => destination })
    end

    lines
  end

  def save
    result = DB.exec("INSERT INTO lines (name, source_id, destination_id) VALUES ('#@name', #@source, #@destination) RETURNING id;")
    @id = result.first['id'].to_i
  end

  def ==(another_line)
    self.name == another_line.name && self.source == another_line.source && self.destination == another_line.destination && self.id == another_line.id
  end

end

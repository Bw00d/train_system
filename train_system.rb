require './lib/line'
require './lib/station'
require 'pg'

DB = PG.connect({ :dbname => 'train_system' })

@user = nil
@lines = []
def prompt
  print '> '
end

def main_menu
  puts "\n\n"
  puts "Are you an Operator or Rider?"
  prompt
  response = gets.chomp.downcase

  case response
  when "operator"
    @user = "operator"
    operator_menu
  when "rider"
    @user = "rider"
    rider_menu
  when "x"
    exit
  else
    puts "Invalid input!"
    main_menu
  end
end

def operator_menu
  puts "\n\n"
  puts "LS view all lines"
  puts "L a single line"
  puts "AL to add a line"
  puts "ML to modify a line"
  puts "DL to delete a line"
  puts "VS view all stations"
  puts "S view a single station"
  puts "AS add a station"
  puts "MS modify a station"
  puts "DS delete a station"
  puts "M main menu"
  prompt
  response = gets.chomp.downcase

  case response
  when "vs"
    view_stations
  when "as"
    add_station
  when "ms"
    modify_station
  when "ds"
    delete_station
  when "m"
    main_menu
  else
    puts "Invalid inut!\n\n"
    operator_menu
  end
end

def add_station
  puts "Add a Station:"
  puts "Enter the name of the new station:"
  prompt
  new_station = Station.create({ :name => gets.chomp })
  puts " What line is this station on(line id)?"
  prompt
  line = gets.chomp
  new_stop = Stop.new("INSERT INTO stops (line_id, station_id) VALUES (line, new_station.name) RETURNING id;")

  puts "#{new_station.name} on the was added to your database.\n\n"
  operator_menu
end

def view_stations
  puts "\n\n"
  Station.all.each do |station|
    puts "#{station.name}"
  end
  puts "\n\n"
  @user == "operator" ? operator_menu : main_menu
end

def modify_station
end

def delete_station
end

def add_line
  puts "\n\n"
  puts "What is the name of the new line?"
  prompt
  name = gets.chomp
  puts "\nWhat is the source station?"
  prompt
  source = gets.chomp
  puts "what is the destination station?"
  prompt
  destination = gets.chomp
  new_station = Station.create({ :name => name, :source_id => })
end

def view_lines
end

def modify_lines
end

def delete_lines
end



puts "Welcome to the Train System Manager"
main_menu

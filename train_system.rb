require './lib/line'
require './lib/station'

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
    operator_menu
  when "rider"
    rider_menu
  else
    puts "Invalid input!"
    main_menu
  end
end

def operator_menu

end

puts "Welcome to the Train System Manager"
main_menu

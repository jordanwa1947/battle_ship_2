require './lib/computer_ships'
require './lib/board_setup'
require './lib/validate_coords'
require 'pry'

validate_coords = ValidateCoords.new
computer_ships = ComputerShips.new
player_board = BoardSetup.new
computer_board = BoardSetup.new
player_fire_range = BoardSetup.new

invalid = 'please type valid coordinates'
overlap = 'ships may not overlap'

computer_coords = computer_ships.ships_may_not_overlap
computer_coords.each { |coord| computer_board.update_board(coord, '#') }

puts 'I have laid out my ships on the grid.
You now need to layout your two ships.
The first is two units long and the
second is three units long.
The grid has A1 at the top left and D4 at the bottom right.

Enter the squares for the two-unit ship:'

ship2_coords = validate_coords.ship2(gets.chomp.upcase)
while ship2_coords == invalid
  puts invalid
  ship2_coords = validate_coords.ship2(gets.chomp.upcase)
end

coords2_array = ship2_coords.split(' ')
coords2_array.each { |coord| player_board.update_board(coord, '#')}
player_board.display_board

puts 'Now enter the square for the three-unit ship:'
ship3_coords = validate_coords.ship3(ship2_coords, gets.chomp.upcase)

while ship3_coords == invalid or ship3_coords == overlap
  if ship3_coords == invalid
    puts invalid
    ship3_coords = validate_coords.ship3(ship2_coords, gets.chomp.upcase)
  else ship3_coords == overlap
    puts overlap
    puts 'please try again'
    ship3_coords = validate_coords.ship3(ship2_coords, gets.chomp.upcase)
  end
end

coords3_array = ship3_coords.split(' ')
coords3_array.each { |coord| player_board.update_board(coord, '#') }
player_board.display_board

puts 'Choose a coordinate to fire at'
coord = gets.chomp.upcase
valid_invalid = validate_coords.board_coords.include?(coord)
while valid_invalid == false
  puts "sorry, that's not a valid coordinate"
  coord = gets.chomp.upcase
  valid_invalid = validate_coords.board_coords.include?(coord)
end

if computer_coords.include?(coord)
  player_fire_range.update_board(coord, 'H')
  puts 'Hit!'
  player_fire_range.display_board
else
  puts 'You Missed'
  player_fire_range.update_board(coord, 'M')
  player_fire_range.display_board
end

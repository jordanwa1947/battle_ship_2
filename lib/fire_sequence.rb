require './lib/board_setup'
require './lib/validate_coords'

class FireSequence

  def initialize(player_fire_range, player_board, computer_coords,
                                     coords2_array, coords3_array)

      @player_fire_range = player_fire_range
      @player_board = player_board
      @computer_coords = computer_coords
      @coords2_array = coords2_array
      @coords3_array = coords3_array
  end

  def validate_player_coord(validate_coords)
    coord = gets.chomp.upcase
    valid_invalid = validate_coords.board_coords.include?(coord)
    while valid_invalid == false
      puts "sorry, that's not a valid coordinate"
      coord = gets.chomp.upcase
      valid_invalid = validate_coords.board_coords.include?(coord)
    end
    coord
  end

  def player_fire(coord)
    if @computer_coords.include?(coord)
      puts 'Hit!'
      @player_fire_range.update_board(coord, 'H')
      @computer_coords.delete(coord)
      @player_fire_range.display_board
    else
      puts 'You Missed'
      @player_fire_range.update_board(coord, 'M')
      @player_fire_range.display_board
    end
  end

  def computer_fire(validate_coords)
    comp_coord = validate_coords.board_coords.sample
    if @coords3_array.include?(comp_coord) or @coords2_array.include?(comp_coord)
      puts 'I Hit'
      @player_board.update_board(comp_coord, 'H')
      @coords3_array.delete(comp_coord)
      @coords2_array.delete(comp_coord)
      @player_board.display_board
    else
      puts 'I Missed'
      @player_board.update_board(comp_coord, 'M')
      @player_board.display_board
    end
  end
end

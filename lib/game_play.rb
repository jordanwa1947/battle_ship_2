require './lib/computer_ships'
require './lib/board_setup'
require './lib/validate_coords'
require './lib/fire_sequence'
require 'pry'

class GamePlay
  attr_reader :validate_coords, :computer_ships, :player_board,
              :computer_board, :player_fire_range
  def initialize
    @invalid = 'please type valid coordinates'
    @overlap = 'ships may not overlap'
    @validate_coords = ValidateCoords.new
    @computer_ships = ComputerShips.new
    @player_board = BoardSetup.new
    @computer_board = BoardSetup.new
    @player_fire_range = BoardSetup.new
  end

  def game_play
    computer_coords = computer_chooses_ships
    prompt_ship2
    ship2_coords = player_chooses_ship2
    coords3_array = player_chooses_ship3(ship2_coords).split(' ')
    coords2_array = ship2_coords.split(' ')
    fire_sequence = FireSequence.new(@player_fire_range, @player_board,
      @validate_coords, computer_coords, coords2_array, coords3_array)
    fire_sequence.fire_sequence
  end

  def computer_chooses_ships
    computer_coords = @computer_ships.ships_may_not_overlap
    computer_coords.each { |coord| @computer_board.update_board(coord, '#') }
    computer_coords
  end

  def prompt_ship2
    puts    "    I have laid out my ships on the grid.
    You now need to layout your two ships.
    The first is two units long and the
    second is three units long.
    The grid has A1 at the top left and D4 at the bottom right."

    puts "Enter the squares for the two-unit ship:"
  end

  def player_chooses_ship2
    ship2_coords = @validate_coords.ship2(gets.chomp.upcase)
    valid_ship2_coords = correct_invalid_ship_coords(ship2_coords)
    pop_board_with_player_ship2(valid_ship2_coords)
  end

  def correct_invalid_ship_coords(ship2_coords)
    while ship2_coords == @invalid
      puts @invalid
      ship2_coords = @validate_coords.ship2(gets.chomp.upcase)
    end
    ship2_coords
  end

  def pop_board_with_player_ship2(ship2_coords)
    coords2_array = ship2_coords.split(' ')
    coords2_array.each { |coord| @player_board.update_board(coord, '#')}
    @player_board.display_board
    ship2_coords
  end

  def player_chooses_ship3(ship2_coords)
    puts 'Now enter the squares for the three-unit ship:'
    ship3_coords = @validate_coords.ship3(ship2_coords, gets.chomp.upcase)
    valid_ship3_coords = ship3_coords_must_be_valid(ship3_coords, ship2_coords)
    pop_board_with_player_ship3(valid_ship3_coords)
  end

  def ship3_coords_must_be_valid(ship3_coords, ship2_coords)
    while ship3_coords == @invalid or ship3_coords == @overlap
      ship3_coords = ship_placement_error_type(ship3_coords, ship2_coords)
    end
    ship3_coords
  end

  def ship_placement_error_type(ship3_coords, ship2_coords)
    if ship3_coords == @invalid
      puts @invalid
      @validate_coords.ship3(ship2_coords, gets.chomp.upcase)
    else ship3_coords == @overlap
      puts @overlap
      puts 'please try again'
      @validate_coords.ship3(ship2_coords, gets.chomp.upcase)
    end
  end

  def pop_board_with_player_ship3(ship3_coords)
    coords3_array = ship3_coords.split(' ')
    coords3_array.each { |coord| @player_board.update_board(coord, '#') }
    @player_board.display_board
    ship3_coords
  end
end

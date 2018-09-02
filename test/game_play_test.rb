require './test/help_test.rb'
require './lib/computer_ships'
require './lib/board_setup'
require './lib/validate_coords'
require './lib/fire_sequence'


class FireSequenceTest < Minitest::Test

  def test_that_the_fire_sequence_class_exists
    fire_sequence = FireSequence.new
    assert_instance_of FireSequence, fire_sequence
  end

  def test_that_fire_sequence_intakes_user_input
    validate_coords = ValidateCoords.new
    computer_ships = ComputerShips.new
    player_board = BoardSetup.new
    computer_board = BoardSetup.new
    fire_sequence = FireSequence.new

    ship2_coords = validate_coords.ship2('A1 A2')
    ship3_coords = validate_coords.ship3(ship2_coords, 'D1 D3')
    coord_array = (ship2_coords + ' ' + ship3_coords).split(' ')
    coord_array.each { |coord| player_board.update_board(coord, '#') }

    computer_coords = computer_ships.ships_may_not_overlap
    computer_coords.each { |coord| computer_board.update_board(coord, '#') }
    binding.pry
    player_target('A1')

  end
end

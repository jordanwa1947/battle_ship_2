require './test/help_test'
require './lib/fire_sequence'
require './lib/board_setup'
require './lib/validate_coords'

class FireSequenceTest < Minitest::Test

  def test_that_the_fire_sequence_class_exists
    validate_coords = ValidateCoords.new
    computer_ships = ComputerShips.new
    player_board = BoardSetup.new
    computer_board = BoardSetup.new
    game_play = FireSequence.new
  end
end

require './test/help_test.rb'
require './lib/computer_ships'
require './lib/board_setup'
require './lib/validate_coords'
require './lib/game_play'


class GamePlayTest < Minitest::Test

  def test_that_the_game_play_class_exists
    game_play = GamePlay.new
    assert_instance_of GamePlay, game_play
  end

  def test_that_game_play_is_initialized_with_necessary_classes
    game_play = GamePlay.new
    assert_instance_of ValidateCoords, game_play.validate_coords
    assert_instance_of ComputerShips, game_play.computer_ships
    assert_instance_of BoardSetup, game_play.player_board
    assert_instance_of BoardSetup, game_play.player_fire_range
    assert_instance_of ComputerLogic, game_play.computer_logic
  end

  def test_that_prompt_ship_prints_instructions_to_screen
    game_play = GamePlay.new
    assert_equal nil, game_play.prompt_ship2
  end
end

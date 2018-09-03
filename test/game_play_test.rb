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
    assert_instance_of BoardSetup, game_play.computer_board
    assert_instance_of BoardSetup, game_play.player_board
    assert_instance_of BoardSetup, game_play.player_fire_range
  end

  def test_computer_chooses_ships_that_are_valid
    game_play = GamePlay.new
    computer_coords = game_play.computer_chooses_ships
    ship2 = computer_coords[0..1].sort
    if ship2[0][0] < 'D' and ship2[0][1] < '4'
      boolean = (ship2[1] == ship2[0].succ or ship2[1][0] == ship2[0][0].succ)
    elsif ship2[0][0] == 'D' and ship2[0][1] < '4'
      boolean = (ship2[1] == ship2[0].succ)
    else ship2[0][0] >= 'A' and ship2[0][1] == '4'
      boolean = (ship2[1][0] == ship2[0][0].succ)
    end
    assert boolean
  end
end

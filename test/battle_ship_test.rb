require './test/help_test.rb'
require './lib/battle_ship'

class BattleShipTest < Minitest::Test

  def test_that_the_battle_ship_class_exists
    battle_ship = BattleShip.new
    assert_instance_of BattleShip, battle_ship
  end

  def test_that_a_welcome_user_interface_is_created
    battle_ship = BattleShip.new
    expected = battle_ship.welcome
    expected = 'Welcome to BATTLESHIP

    Would you like to (p)lay, read the (i)nstructions, or (q)uit?
    >'
    actual = battle_ship.welcome
    assert_equal expected, actual
  end
end

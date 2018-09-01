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
    assert_equal  expected, actual
  end

  def test_that_user_input_is_entered
    battle_ship = BattleShip.new
    assert_equal 'insert_class', battle_ship.user_input('p')
    assert_equal 'break', battle_ship.user_input('q')
    assert_equal 'instructions', battle_ship.user_input('i')
    assert_equal 'not a valid option', battle_ship.user_input('vjx')
  end
end

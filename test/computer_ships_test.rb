require './test/help_test.rb'
require './lib/computer_ships'


class ComputerShipsTest < Minitest::Test

  def test_that_the_computer_ships_exist
    computer_ships = ComputerShips.new
    assert_instance_of ComputerShips, computer_ships
  end

  def test_that_the_computer_initializes_with_board_coords
    computer_ships = ComputerShips.new
    expected = ["A1", "A2", "A3", "A4",
                "B1", "B2", "B3", "B4",
                "C1", "C2", "C3", "C4",
                "D1", "D2", "D3", "D4"]
    assert_equal expected, computer_ships.board_coords
  end

  def test_that_the_computer_can_choose_a_random_coord_to_start_ship2
    computer_ships = ComputerShips.new
    coord1 = computer_ships.ship2_coord1
    expected = computer_ships.board_coords.include?(coord1)
    assert expected
  end
end

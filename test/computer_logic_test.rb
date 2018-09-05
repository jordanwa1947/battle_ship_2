require './test/help_test.rb'
require './lib/computer_logic'

class ComputerLogicTest < Minitest::Test

  def test_that_it_exists
    computer_logic = ComputerLogic.new
    assert_instance_of ComputerLogic, computer_logic
  end

  def test_that_hit_logic_hub_generates_choices_for_corner_coord_a1
    computer_logic = ComputerLogic.new
    actual = computer_logic.hit_logic_hub(0, 'A1')

    assert_equal ['A2', 'B1'], actual
  end

  def test_that_hit_logic_hub_generates_choices_for_corner_coord_d1
    computer_logic = ComputerLogic.new
    actual = computer_logic.hit_logic_hub(12, 'D1')

    assert_equal ['D2', 'C1'], actual
  end

  def test_that_hit_logic_hub_generates_choices_for_corner_coord_a4
    computer_logic = ComputerLogic.new
    actual = computer_logic.hit_logic_hub(3, 'A4')

    assert_equal ['A3', 'B4'], actual
  end

  def test_that_hit_logic_hub_generates_choices_for_corner_coord_d4
    computer_logic = ComputerLogic.new
    actual = computer_logic.hit_logic_hub(15, 'D4')

    assert_equal ['D3', 'C4'], actual
  end

  def test_that_hit_logic_hub_generates_choices_for_middle_coord
    computer_logic = ComputerLogic.new
    expected = ['B3', 'B1', 'A2', 'C2']
    actual = computer_logic.hit_logic_hub(5, 'B2')

    assert_equal expected, actual
  end

  def test_that_hit_logic_hub_generates_choices_for_top_and_bottom_coords_d_coord
    computer_logic = ComputerLogic.new
    expected = ['D4', 'D2', 'C3']
    actual = computer_logic.hit_logic_hub(14, 'D3')

    assert_equal expected, actual
  end

  def test_that_hit_logic_hub_generates_choices_for_top_and_bottom_coords_a_coord
    computer_logic = ComputerLogic.new
    expected = ['A3', 'A1', 'B2']
    actual = computer_logic.hit_logic_hub(1, 'A2')

    assert_equal expected, actual
  end

  def test_that_hit_logic_hub_generates_choices_for_left_and_right_side_coords
    computer_logic = ComputerLogic.new
    expected = ['C2', 'B1', 'D1']
    actual = computer_logic.hit_logic_hub(8, 'C1')

    assert_equal expected, actual
  end

  def test_that_checker_logic_hub_generates_choices_for_corner_coords
    computer_logic = ComputerLogic.new
    expected = ['B1', 'C2', 'D3']
    actual = computer_logic.checker_logic_hub(12, 'D1')

    assert_equal expected, actual
  end

  def test_that_checker_logic_hub_generates_choices_for_middle_coords
    computer_logic = ComputerLogic.new
    expected = ['D1', 'B3', 'B1', 'D3']
    actual = computer_logic.checker_logic_hub(9, 'C2')

    assert_equal expected, actual
  end

  def test_that_checker_logic_hub_generates_choices_for_left_and_right_side_coords
    computer_logic = ComputerLogic.new
    expected = ['D1', 'B3', 'B1', 'D3']
    actual = computer_logic.checker_logic_hub(9, 'C2')

    assert_equal expected, actual
  end

  def test_that_checker_logic_hub_generates_choices_for_top_and_bottom_side_coords
    computer_logic = ComputerLogic.new
    expected = ['B2', 'B4', 'C3', 'A1']
    actual = computer_logic.checker_logic_hub(2, 'A3')

    assert_equal expected, actual
  end
end

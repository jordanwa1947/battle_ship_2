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

  def test_that_hit_logic_hub_generates_choices_for_left_and_right_side_1_coords
    computer_logic = ComputerLogic.new
    expected = ['C2', 'B1', 'D1']
    actual = computer_logic.hit_logic_hub(8, 'C1')

    assert_equal expected, actual
  end

  def test_that_hit_logic_hub_generates_choices_for_left_and_right_side_4_coords
    computer_logic = ComputerLogic.new
    expected = ['C4', 'B3', 'A4']
    actual = computer_logic.hit_logic_hub(7, 'B4')

    assert_equal expected, actual
  end

  def test_that_checker_logic_hub_generates_choices_for_corner_coords_d1
    computer_logic = ComputerLogic.new
    expected = ['B1', 'C2', 'D3']
    actual = computer_logic.checker_logic_hub(12, 'D1')

    assert_equal expected, actual
  end

  def test_that_checker_logic_hub_generates_choices_for_corner_coords_a1
    computer_logic = ComputerLogic.new
    expected = ['A3', 'C1', 'B2']
    actual = computer_logic.checker_logic_hub(0, 'A1')

    assert_equal expected, actual
  end

  def test_that_checker_logic_hub_generates_choices_for_corner_coords_a4
    computer_logic = ComputerLogic.new
    expected = ['C4', 'B3', 'A2']
    actual = computer_logic.checker_logic_hub(3, 'A4')

    assert_equal expected, actual
  end

  def test_that_checker_logic_hub_generates_choices_for_corner_coords_d4
    computer_logic = ComputerLogic.new
    expected = ['D2', 'C3', 'B4']
    actual = computer_logic.checker_logic_hub(15, 'D4')

    assert_equal expected, actual
  end

  def test_that_checker_logic_hub_generates_choices_for_middle_coords
    computer_logic = ComputerLogic.new
    expected = ['D1', 'B3', 'B1', 'D3']
    actual = computer_logic.checker_logic_hub(9, 'C2')

    assert_equal expected, actual
  end

  def test_that_checker_logic_hub_generates_choices_for_left_side_coords_c1
    computer_logic = ComputerLogic.new
    expected = ['B2', 'D2', 'A1', 'C3']
    actual = computer_logic.checker_logic_hub(8, 'C1')

    assert_equal expected, actual
  end

  def test_that_checker_logic_hub_generates_choices_for_left_side_coord_b1
    computer_logic = ComputerLogic.new
    expected = ["C2", "A2", "D1", "B3"]
    actual = computer_logic.checker_logic_hub(4, 'B1')

    assert_equal expected, actual
  end

  def test_that_checker_logic_hub_generates_choices_for_right_side_coords_b4
    computer_logic = ComputerLogic.new
    expected = ["C3", "A3", "D4", "B2"]
    actual = computer_logic.checker_logic_hub(7, 'B4')

    assert_equal expected, actual
  end

  def test_that_checker_logic_hub_generates_choices_for_right_side_coords_c4
    computer_logic = ComputerLogic.new
    expected = ["D3", "B3", "A4", "C2"]
    actual = computer_logic.checker_logic_hub(11, 'C4')

    assert_equal expected, actual
  end

  def test_that_checker_logic_hub_generates_choices_for_top_side_coord_a3
    computer_logic = ComputerLogic.new
    expected = ['B2', 'B4', 'C3', 'A1']
    actual = computer_logic.checker_logic_hub(2, 'A3')

    assert_equal expected, actual
  end

  def test_that_checker_logic_hub_generates_choices_for_top_side_coord_a2
    computer_logic = ComputerLogic.new
    expected = ["B3", "B1", "C2", "A4"]
    actual = computer_logic.checker_logic_hub(1, 'A2')

    assert_equal expected, actual
  end

  def test_that_checker_logic_hub_generates_choices_for_bottom_side_coord_d3
    computer_logic = ComputerLogic.new
    expected = ["C4", "C2", "B3", "D1"]
    actual = computer_logic.checker_logic_hub(14, 'D3')

    assert_equal expected, actual
  end

  def test_that_checker_logic_hub_generates_choices_bottom_side_coords_d2
    computer_logic = ComputerLogic.new
    expected = ["C1", "C3", "B2", "D4"]
    actual = computer_logic.checker_logic_hub(13, 'D2')

    assert_equal expected, actual
  end
end

require './test/help_test.rb'
require './lib/validate_coords'

class ValidateCoordsTest < Minitest::Test

  def test_that_validate_coords_class_exits
    validate_coords = ValidateCoords.new
    assert_instance_of ValidateCoords, validate_coords
  end

  def test_that_validate_coords_starts_with_board_coords
    validate_coords = ValidateCoords.new
    expected = ["A1", "A2", "A3", "A4",
                "B1", "B2", "B3", "B4",
                "C1", "C2", "C3", "C4",
                "D1", "D2", "D3", "D4"]
    assert_equal expected, validate_coords.board_coords
  end

  def test_that_validate_coords_can_intake_user_input
    validate_coords = ValidateCoords.new
    assert_equal 'A1 A2', validate_coords.ship2('A1 A2')
  end

  def test_that_validate_coords_can_validate_ship2_coords
    validate_coords = ValidateCoords.new
    assert_equal 'please type valid coordinates', validate_coords.ship2('jvowv')
  end

  def test_that_validate_coords_can_validate_the_first_coordinate
    validate_coords = ValidateCoords.new
    assert_equal 'please type valid coordinates', validate_coords.ship2('J1 A2')
  end

  def test_that_validate_coords_can_validate_the_second_coordinate
    validate_coords = ValidateCoords.new
    assert_equal 'please type valid coordinates', validate_coords.ship2('A1 Z2')
  end

  def test_that_validate_coords_can_invalidate_the_coordinates_less_than_four
    validate_coords = ValidateCoords.new
    expected = 'please type valid coordinates'
    actual = validate_coords.validate_ship2(['A1', ' ', 'D3'])
    assert_equal expected, actual
  end
  def test_that_validate_coords_can_validate_the_coordinates_less_than_four
    validate_coords = ValidateCoords.new
    expected = 'D4 D3'
    actual = validate_coords.validate_ship2(['D4', ' ', 'D3'])
    assert_equal expected, actual
  end

  def test_that_validate_coords_can_invalidate_coordinates_equal_to_four
    validate_coords = ValidateCoords.new
    expected = 'please type valid coordinates'
    actual = validate_coords.validate_ship2(['B4', ' ', 'D4'])
    assert_equal expected, actual
  end

  def test_that_validate_coords_can_validate_coordinates_equal_to_four
    validate_coords = ValidateCoords.new
    expected = 'A4 B4'
    actual = validate_coords.validate_ship2(['A4', ' ', 'B4'])
    assert_equal expected, actual
  end

  def test_that_validate_coords_can_fill_horizontal_ship3_coords
    validate_coords = ValidateCoords.new
    validated = validate_coords.ship2('A1 A2')
    assert_equal ('B1 B2 B3'), validate_coords.ship3(validated, 'B1 B3')
  end

  def test_that_validate_coords_can_fill_vertical_ship3_coords_out_of_order
    validate_coords = ValidateCoords.new
    validated = validate_coords.ship2('A1 A2')
    assert_equal ('D4 D3 D2'), validate_coords.ship3(validated, 'D4 D2')
  end

  def test_that_validate_coords_can_fill_vertical_ship3_coords
    validate_coords = ValidateCoords.new
    validated = validate_coords.ship2('A1 A2')
    assert_equal ('B4 C4 D4'), validate_coords.ship3(validated, 'B4 D4')
  end

  def test_that_validate_ship_3_can_stop_overlap
    validate_coords = ValidateCoords.new
    validated = validate_coords.ship2('A1 A2')
    expected = 'please type valid coordinates'
    assert_equal expected, validate_coords.ship3(validated, 'A1 A4')
  end

  def test_that_ships_may_not_overlap
    validate_coords = ValidateCoords.new
    validated = validate_coords.ship2('B1 B2')
    actual = validate_coords.ship3(validated, 'A2 C2')
    assert_equal 'ships may not overlap', actual
  end

  def test_that_invalid_coordinates_are_detected
    validate_coords = ValidateCoords.new
    validated = validate_coords.ship2('B1 B2')
    actual = validate_coords.ship3(validated, 'gkgj')
    assert_equal 'please type valid coordinates', actual
  end
end

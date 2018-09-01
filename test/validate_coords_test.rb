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

  def test_that_validate_coords_can_validate_the_coordinates_less_than_four
    validate_coords = ValidateCoords.new
    expected = 'please type valid coordinates'
    actual = validate_coords.validate_ship2(['A1', ' ', 'D3'])
    assert_equal expected, actual
  end

  def test_that_validate_coords_can_validate_coordinates_equal_to_four
    validate_coords = ValidateCoords.new
    expected = 'please type valid coordinates'
    actual = validate_coords.validate_ship2(['B4', ' ', 'D4'])
    assert_equal expected, actual
  end

  def test_that_validate_coords_can_test_valid_coordinates
    validate_coords = ValidateCoords.new
    expected = ('A1 A2')
    actual = validate_coords.validate_ship2(['A1', ' ', 'A2'])
    assert_equal expected, actual
  end

  def test_that_validate_coords_can_validate_ship3_coords
    validate_coords = ValidateCoords.new
    validated = validate_coords.ship2('A1 A2')
    assert_equal ('B1 B2 B3'), validate_coords.ship3(validated, 'B1 B3')
  end

  def test_that_validate_ship_3_can_stop_overlap
    skip
    validate_coords = ValidateCoords.new
    validated = validate_coords.ship2('A1 A2')
    expected =
    assert_equal expected, validate_coords.ship3('A1 A4')
  end

  def test_that_ships_may_not_overlap
    validate_coords = ValidateCoords.new
    validated = validate_coords.ship2('B1 B2')
    actual = validate_coords.ship3(validated, 'A2 C2')
    assert_equal 'ships may not overlap', actual
  end
end

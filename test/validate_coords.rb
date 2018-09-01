require './test/help_test.rb'
require './lib/validate_coords'

class ValidateCoordsTest < Minitest::Test

  def test_that_validate_coords_class_exits
    validate_coords = ValidateCoords.new
    assert_instance_of ValidateCoords, validate_coords
  end

  def test_that_validate_coords_can_intake_user_input
    validate_coords = ValidateCoords.new
    assert_equal 'A1 A2', validate_coords.ship2('A1 A2')
  end

  def test_that_validate_coords_can_validate_ship2_coords
    validate_coords = ValidateCoords.new
    assert_equal 'please type valid coordinates', validate_coords.ship2('jvowv')
  end
end

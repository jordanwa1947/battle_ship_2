require 'pry'
class ValidateCoords
  attr_reader :board_coords
  def initialize
      @board_coords = ["A1", "A2", "A3", "A4",
                       "B1", "B2", "B3", "B4",
                       "C1", "C2", "C3", "C4",
                       "D1", "D2", "D3", "D4"]
  end

  def ship2(coordinates)
    coord_array = coordinates.partition(' ')
    valid_invalid = check_for_coords(coord_array)
    if valid_invalid == coord_array
      validate_ship2(valid_invalid)
    else
      valid_invalid
    end
  end

  def check_for_coords(coords_array)
    if coords_array[1] != ' '
      'please type valid coordinates'
    elsif !(@board_coords.include?(coords_array[0]))
      'please type valid coordinates'
    elsif !(@board_coords.include?(coords_array[2]))
      'please type valid coordinates'
    else
      coords_array
    end
  end

  def validate_ship2(coord_array)
    sorted_coords = coord_array.sort
    index = @board_coords.index(sorted_coords[1])
    if sorted_coords[1][1].to_i < 4
      coords_less_than_4(index, sorted_coords, coord_array)
    else
      coords_equal_to_4(index, sorted_coords, coord_array)
    end
  end

  def coords_less_than_4(index, coordinates, coord_array)
    boolean1 = @board_coords[index + 1] == coordinates[2]
    boolean2 = @board_coords[index + 4] == coordinates[2]
    if boolean1 or boolean2
      coord_array.join
    else
      'please type valid coordinates'
    end
  end

  def coords_equal_to_4(index, coordinates, coord_array)
    boolean = @board_coords[index + 4] == coordinates[2]
    if boolean
      coord_array.join
    else
      'please type valid coordinates'
    end
  end

  def ship3(ship2_coords, coordinates)
    coord_array = coordinates.partition(' ')
    valid_invalid = check_for_coords(coord_array)
    if valid_invalid == coord_array
      ship3 = validate_ship3(ship2_coords, valid_invalid)
      check_for_overlap(ship2_coords, ship3)
    else
      valid_invalid
    end
  end

  def validate_ship3(ship2_coords, coord_array)
    sorted_coords = coord_array.sort
    index = @board_coords.index(sorted_coords[1])
    if sorted_coords[1][1].to_i < 3
      coords_less_than_3(index, sorted_coords, coord_array)
    else
      coords_greater_than_2(index, sorted_coords, coord_array)
    end
  end

  def coords_less_than_3(index, coordinates, coord_array)
    boolean1 = @board_coords[index + 2] == coordinates[2]
    boolean2 = @board_coords[index + 8] == coordinates[2]
    if boolean1
      filled = coord_array.insert(1, " #{@board_coords[index + 1]}")
      filled.join if filled.class == Array
    elsif boolean2
      coord_array.insert(1, " #{@board_coords[index + 4]}")
      coord_array.join
    else
      'please type valid coordinates'
    end
  end

  def coords_greater_than_2(index, coordinates, coord_array)
    boolean = @board_coords[index + 8] == coordinates[2]
    if boolean
      coord_array.insert(1, " #{@board_coords[index + 4]}")
      coord_array.join
    else
      'please type valid coordinates'
    end
  end

  def check_for_overlap(ship2_coords, ship3_coords)
    ship2_array = ship2_coords.partition(' ')
    ship3 = ship3_coords.split(' ')
    if ship3.include?(ship2_array[0]) or ship3.include?(ship2_array[2])
      'ships may not overlap'
    else
      ship3_coords
    end
  end
end

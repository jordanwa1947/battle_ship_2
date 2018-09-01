require 'pry'
class ValidateCoords
  def initialize
      @board_coords = ["A1", "A2", "A3", "A4",
                       "B1", "B2", "B3", "B4",
                       "C1", "C2", "C3", "C4",
                       "D1", "D2", "D3", "D4"]
  end

  def ship2(coordinates)
    coord_array = coordinates.partition(' ')
    check_for_coords(coord_array)
  end

  def check_for_coords(coords_array)
    if coords_array[1] != ' '
      'please type valid coordinates'
    elsif !(@board_coords.include?(coords_array[0]))
      'please type valid coordinates'
    elsif !(@board_coords.include?(coords_array[2]))
      'please type valid coordinates'
    else
      validate_coords(coords_array)
    end
  end

  def validate_coords(coord_array)
    sorted_coords = coord_array.sort
    index = @board_coords.index(sorted_coords[1])
    if sorted_coords[1][1].to_i < 4
      coords_less_than_4(index, sorted_coords, coord_array)
    else sorted_coords[1][1].to_i == 4
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
    boolean1 = @board_coords[index - 1] == coordinates[2]
    boolean2 = @board_coords[index + 4] == coordinates[2]
    if boolean1 or boolean2
      coord_array.join
    else
      'please type valid coordinates'
    end
  end
end

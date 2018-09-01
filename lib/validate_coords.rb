class ValidateCoords

  def ship2(coordinates)
    coords_array = coordinates.split('')
    coord1(coords_array)
  end

  def coord1(coord_array)
    coords_array = coordinates.split('')
    if coords_array.length != 5 or coords_array[2] != ' '
      'please type valid coordinates'
    elsif !(coords_array[0] =~ /[A-D]/) or !(coords_array =~ /[1-4]/)
      'please type valid coordinates'
    else
      coordinates
    end
  end

  def ship2_coord2

  end
end

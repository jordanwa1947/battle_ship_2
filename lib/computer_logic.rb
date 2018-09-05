class ComputerLogic

  def initialize
    @coords = ["A1", "A2", "A3", "A4",
               "B1", "B2", "B3", "B4",
               "C1", "C2", "C3", "C4",
               "D1", "D2", "D3", "D4"]
  end

  def hit_logic_hub(index, coord)
    if (coord[1] > '1' and coord[1] < '4') and (coord[0] < 'D' and coord[0] > 'A')
      middle_coords(index, coord)
    elsif coord[1] > '1' and coord[1] < '4'
      top_and_bottom_side_coords(index, coord)
    elsif coord[0] > 'A' and coord[0] < 'D'
      right_and_left_side_coords(index, coord)
    else
      corner_coords(index, coord)
    end
  end

  def middle_coords(index, coord)
    choices = [@coords[index + 1], @coords[index - 1],
               @coords[index - 4], @coords[index + 4]]
  end

  def top_and_bottom_side_coords(index, coord)
    if coord[0] == 'A'
      choices = [@coords[index + 1], @coords[index - 1], @coords[index + 4]]
    else coord[0] == 'D'
      choices = [@coords[index + 1], @coords[index - 1], @coords[index - 4]]
    end
  end

  def right_and_left_side_coords(index, coord)
    if coord[1] == '1'
      choices = [@coords[index + 1], @coords[index - 4], @coords[index + 4]]
    else coord[1] == '4'
      choices = [@coords[index + 4], @coords[index - 1], @coords[index - 4]]
    end
  end

  def corner_coords(index, coord)
    if coord[0] == 'A' and coord[1] == '1'
      choices = [@coords[index + 1], @coords[index + 4]]
    elsif coord[0] == 'A' and coord[1] == '4'
      choices = [@coords[index - 1], @coords[index + 4]]
    elsif coord[0] == 'D' and coord[1] == '1'
      choices = [@coords[index + 1], @coords[index - 4]]
    else coord[0] == 'D' and coord[1] == '4'
      choices = [@coords[index - 1], @coords[index - 4]]
    end
  end

  def checker_logic_hub(index, coord)
    if (coord[1] > '1' and coord[1] < '4') and (coord[0] < 'D' and coord[0] > 'A')
      middle_coords2(index, coord)
    elsif coord[1] > '1' and coord[1] < '4'
      top_and_bottom_side_coords2(index, coord)
    elsif coord[0] > 'A' and coord[0] < 'D'
      right_and_left_side_coords2(index, coord)
    else
      corner_coords2(index, coord)
    end
  end

  def middle_coords2(index, coord)
    choices = [@coords[index + 3], @coords[index - 3],
               @coords[index - 5], @coords[index + 5]]
  end

  def top_and_bottom_side_coords2(index, coord)
    if coord[0] == 'A' and coord[1] == '2'
      choices = [@coords[index + 5], @coords[index + 3],
                 @coords[index + 8], @coords[index + 2]]
    elsif coord[0] == 'A' and coord[1] == '3'
      choices = [@coords[index + 3], @coords[index + 5],
                 @coords[index + 8], @coords[index - 2]]
    elsif coord[0] == 'D' and coord[1] == '2'
      choices = [@coords[index - 5], @coords[index - 3],
                 @coords[index - 8], @coords[index + 2]]
    else coord[0] == 'D' and coord[1] == '3'
      choices = [@coords[index - 3], @coords[index - 5],
                 @coords[index - 8], @coords[index - 2]]
    end
  end

  def right_and_left_side_coords2(index, coord)
    if coord[0] == 'B' and coord[1] == '1'
      choices = [@coords[index + 5], @coords[index - 3],
                 @coords[index + 8], @coords[index + 2]]
    elsif coord[0] == 'C' and coord[1] == '1'
      choices = [@coords[index - 3], @coords[index + 5],
                 @coords[index - 8], @coords[index + 2]]
    elsif coord[0] == 'B' and coord[1] == '4'
      choices = [@coords[index + 5], @coords[index - 3],
                 @coords[index + 8], @coords[index - 2]]
    else coord[0] == 'C' and coord[1] == '4'
      choices = [@coords[index + 3], @coords[index - 5],
                 @coords[index - 8], @coords[index - 2]]
    end
  end

  def corner_coords2(index, coord)
    if coord[0] == 'A' and coord[1] == '1'
      choices = [@coords[index + 2], @coords[index + 8], @coords[index + 5]]
    elsif coord[0] == 'A' and coord[1] == '4'
      choices = [@coords[index + 8], @coords[index + 3], @coords[index - 2]]
    elsif coord[0] == 'D' and coord[1] == '1'
      choices = [@coords[index - 8], @coords[index - 3], @coords[index + 2]]
    else coord[0] == 'D' and coord[1] == '4'
      choices = [@coords[index - 2], @coords[index - 5], @coords[index - 8]]
    end
  end
end

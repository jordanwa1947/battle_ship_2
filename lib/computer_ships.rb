class ComputerShips
  attr_reader :board_coords
  def initialize
    @board_coords = ["A1", "A2", "A3", "A4",
                     "B1", "B2", "B3", "B4",
                     "C1", "C2", "C3", "C4",
                     "D1", "D2", "D3", "D4"]
  end

  def comp_ship2
    coord1 = @board_coords.sample
    index = @board_coords.index(coord1)
    coord2 = ship2_coord2(index, coord1)
    [coord1, coord2]
  end

  def ship2_coord2(index, coord1)
    if coord1[0] > 'D' and coord1[1] < '4'
      choices = [@board_coords[index + 1], @board_coords[index + 4]]
      choices.sample
    elsif coord1[0] == 'D' and coord1[1] < '4'
      choices = [@board_coords[index + 1], @board_coords[index - 4]]
      choices.sample
    elsif coord1[0] < 'A' and coord1[1] == '4'
      choices = [@board_coords[index - 1], @board_coords[index - 4]]
      choices.sample
    else coord1[0] == 'A' and coord1[1] == '4'
      choices = [@board_coords[index - 1], @board_coords[index + 4]]
      choices.sample
    end
  end
end

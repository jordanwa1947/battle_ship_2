require 'pry'
require './lib/board_setup'

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

  def ships_may_not_overlap
    ship2 = comp_ship2
    ship3 = comp_ship3
    while ship3.include?(ship2[0]) or ship3.include?(ship2[1])
      ship3 = comp_ship3
    end
    [ship2, ship3]
  end

  def ship2_coord2(index, coord1)
    if coord1[0] < 'D' and coord1[1] < '4'
      choices = [@board_coords[index + 1], @board_coords[index + 4]]
      choices.sample
    elsif coord1[0] == 'D' and coord1[1] < '4'
      choices = [@board_coords[index + 1], @board_coords[index - 4]]
      choices.sample
    elsif coord1[0] > 'A' and coord1[1] == '4'
      choices = [@board_coords[index - 1], @board_coords[index - 4]]
      choices.sample
    else coord1[0] == 'A' and coord1[1] == '4'
      choices = [@board_coords[index - 1], @board_coords[index + 4]]
      choices.sample
    end
  end

  def comp_ship3
    coord1 = @board_coords.sample
    index = @board_coords.index(coord1)
    coord2 = ship3_coord2(index, coord1)
    sorted_array = [coord1, coord2].sort
    sorted_index = @board_coords.index(sorted_array[0])
    fill(sorted_index, sorted_array)
  end

  def fill(index, coord_array)
    boolean1 = @board_coords[index + 2] == coord_array[1]
    boolean2 = @board_coords[index + 8] == coord_array[1]
    if boolean1
      coord_array.insert(1, coord_array[0].succ)
    else boolean2
      coord_array.insert(1, @board_coords[index + 4])
      coord_array
    end
  end


  def ship3_coord2(index, coord1)
    if coord1[0] > 'B' and coord1[1] < '3'
      choices = [@board_coords[index + 2], @board_coords[index - 8]]
      choices.sample
    elsif coord1[0] > 'B' and coord1[1] > '2'
      choices = [@board_coords[index - 2], @board_coords[index - 8]]
      choices.sample
    elsif coord1[0] < 'C' and coord1[1] < '3'
      choices = [@board_coords[index + 2], @board_coords[index + 8]]
      choices.sample
    else coord1[0] < 'C' and coord1[1] > '2'
      choices = [@board_coords[index - 2], @board_coords[index + 8]]
      choices.sample
    end
  end
end

class ComputerShips
  attr_reader :board_coords
  def initialize
    @board_coords = ["A1", "A2", "A3", "A4",
                     "B1", "B2", "B3", "B4",
                     "C1", "C2", "C3", "C4",
                     "D1", "D2", "D3", "D4"]
  end

  def ship2_coord1
    @board_coords.sample 
  end
end

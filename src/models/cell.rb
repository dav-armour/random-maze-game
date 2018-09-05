# Cell model used during maze creation to store available directions for each cell
class Cell
  attr_accessor :available_directions, :visited, :x, :y
  def initialize(x, y)
    # Cell position
    @x = x
    @y = y
    # Available movement directions N,S,E,W
    @available_directions = []
    # Keep track for maze creation
    @visited = false
  end
end

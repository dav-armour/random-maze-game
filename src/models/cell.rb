class Cell
  attr_accessor :available_directions, :visited, :x, :y
  def initialize x, y
    # Available movement directions N,S,E,W
    @available_directions = []
    # Position in maze
    @x = x
    @y = y
    # Keep track for maze creation
    @visited = false
  end
end

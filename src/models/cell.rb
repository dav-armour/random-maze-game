class Cell
  attr_accessor :available_directions, :visited, :x, :y
  def initialize
    # Available movement directions N,S,E,W
    @available_directions = []
    # Keep track for maze creation
    @visited = false
  end
end

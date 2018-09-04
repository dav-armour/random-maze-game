#stuff
class Player
  attr_accessor :x, :y
  def initialize
    @x = 0
    @y = 0
  end

  def move_north(maze)
    if maze.cells[x][y].available_directions.include?('N')
      @y -= 1 unless @y == 0
    end
  end

  def move_south(maze)
    if maze.cells[x][y].available_directions.include?('S')
      @y += 1 unless @y == maze.height - 1 #Fixme
    end
  end

  def move_east(maze)
    if maze.cells[x][y].available_directions.include?('E')
      @x += 1 unless @x == maze.width - 1 #Fixme
    end
  end

  def move_west(maze)
    if maze.cells[x][y].available_directions.include?('W')
      @x -= 1 unless @x == 0 #Fixme
    end
  end
end

#stuff
class Player
  attr_accessor :xpos, :ypos
  def initialize
    @xpos = 0
    @ypos = 0
  end

  def move_north(maze)
    if maze.cells[xpos][ypos].available_directions.include?('N')
      @ypos -= 1 unless @ypos == 0
    end
  end

  def move_south(maze)
    if maze.cells[xpos][ypos].available_directions.include?('S')
      @ypos += 1 unless @ypos == maze.height - 1 #Fixme
    end
  end

  def move_east(maze)
    if maze.cells[xpos][ypos].available_directions.include?('E')
      @xpos += 1 unless @xpos == maze.width - 1 #Fixme
    end
  end

  def move_west(maze)
    if maze.cells[xpos][ypos].available_directions.include?('W')
      @xpos -= 1 unless @xpos == 0 #Fixme
    end
  end
end

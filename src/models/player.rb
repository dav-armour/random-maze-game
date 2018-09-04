#stuff
class Player
  attr_accessor :xpos, :ypos
  def initialize
    @xpos = 0
    @ypos = 0
  end

  def move_north(maze)
    @ypos -= 1 unless @ypos == 0
  end

  def move_south(maze)
    @ypos += 1 unless @ypos == maze.height - 1 #Fixme
  end

  def move_east(maze)
    @xpos += 1 unless @xpos == maze.width - 1 #Fixme
  end

  def move_west(maze)
    @xpos -= 1 unless @xpos == 0 #Fixme
  end
end

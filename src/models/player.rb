#stuff
class Player
  attr_accessor :xpos, :ypos
  def initialize
    @xpos = 0
    @ypos = 0
  end

  def move_north
    @ypos -= 1 unless @ypos == 0
  end

  def move_south
    @ypos += 1 unless @ypos == 10 #Fixme
  end

  def move_east
    @xpos += 1 unless @xpos == 10 #Fixme
  end

  def move_west
    @xpos -= 1 unless @xpos == 0 #Fixme
  end
end

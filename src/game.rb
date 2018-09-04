# Main game file

require_relative 'models/maze'

class Game
  maze = Maze.new
  while true
    puts maze.to_s
    # FIXME: get input from user to move player
    input = 'q'
    if input == 'q'
      break
    end
  end
end

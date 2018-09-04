# Main game file

require_relative 'models/maze'

class Game
  maze = Maze.new
  puts maze.to_s
end

require_relative 'models/maze'
require_relative 'models/player'


maze = Maze.new
# puts "Top Left:"
# p maze.get_choices(0,0)
# puts "Top Right:"
# p maze.get_choices(9,0)
# puts "Bottom left"
# p maze.get_choices(0,9)
# puts "Bottom Right:"
# p maze.get_choices(9,9)
# puts "Middle:"
# p maze.get_choices(5,5)

maze.generate_maze
# puts maze.opposite('N')
# puts maze.opposite('S')
# puts maze.opposite('E')
# puts maze.opposite('W')
@player = Player.new
puts maze.to_s(@player)

# p maze.get_next_cell_pos('N', 0, 0)
# p maze.get_next_cell_pos('S', 0, 0)
# p maze.get_next_cell_pos('E', 0, 0)
# p maze.get_next_cell_pos('W', 0, 0)

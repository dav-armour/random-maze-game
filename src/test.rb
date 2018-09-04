require_relative 'models/maze'

maze = Maze.new
puts "Top Left:"
p maze.create_path_from(0,0)
puts "Top Right:"
p maze.create_path_from(9,0)
puts "Bottom left"
p maze.create_path_from(0,9)
puts "Bottom Right:"
p maze.create_path_from(9,9)
puts "Middle:"
p maze.create_path_from(5,5)


# Main game file
require_relative 'models/player'
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

player = Player.new
# puts "Before: #{player.ypos}"
# player.move_up
# puts "After: #{player.ypos}"
while true
  input = gets.chomp
  case input
  when 'w'
    player.move_north
  when 's'
    player.move_south
  when 'd'
    player.move_east
  when 'a'
    player.move_west
  when 'q'
    break
  else
    puts "wrong input"
  end
  puts "Current position X: #{player.xpos}, Y: #{player.ypos}"
end
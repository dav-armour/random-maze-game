# Main game file
require_relative 'models/player'
require_relative 'models/maze'

class Game
  def run
    @maze = Maze.new
    @player = Player.new
    exit = false
    while true
      system 'clear'
      puts @maze.to_s(@player)
      # FIXME: get input from user to move player
      exit = false
      exit = get_input
      break if exit
      # puts "Current position X: #{player.xpos}, Y: #{player.ypos}"
    end
  end

  def get_input()
    input = gets.chomp
    case input
    when 'w'
      @player.move_north(@maze)
      false
    when 's'
      @player.move_south(@maze)
      false
    when 'd'
      @player.move_east(@maze)
      false
    when 'a'
      @player.move_west(@maze)
      false
    when 'q'
      true
    else
      false
    end
  end
end

Game.new.run
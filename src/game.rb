# Main game file
require 'io/console'
require_relative 'models/player'
require_relative 'models/maze'

class Game
  def run
    @maze = Maze.new(20,10)
    @player = Player.new
    while true
      system 'clear'
      puts @maze.to_s(@player)
      # FIXME: get input from user to move player
      exit = get_input
      break if exit
      # puts "Current position X: #{player.xpos}, Y: #{player.ypos}"
    end
  end

  def get_input()
    char = STDIN.getch
    # Check if special character entered (arrow keys)
    if char == "\e"
      # Retrieve rest of special character
      2.times do
        char += STDIN.getch
      end
    end

    case char
    # Makes wasd and arrow keys move player
    when 'w', "\e[A"
      @player.move_north(@maze)
      false
    when 's', "\e[B"
      @player.move_south(@maze)
      false
    when 'd', "\e[C"
      @player.move_east(@maze)
      false
    when 'a', "\e[D"
      @player.move_west(@maze)
      false
    # Exit game
    when 'q'
      true
    # Ctrl - C to exit game
    when "\u0003"
      exit
    else
      false
    end
  end
end

Game.new.run

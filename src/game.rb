# Main game file
require 'io/console'
require_relative 'models/player'
require_relative 'models/maze'

class Game
  def run(difficulty = :easy)
    @maze = Maze.new
    @player = Player.new
    start_time = Time.now.to_i
    while true
      system 'clear'
      position = [@player.x, @player.y]
      end_x = @maze.width - 1
      end_y = @maze.height - 1
      # Check if they have reached the finish
      if position == [end_x, end_y]
        break
      end
      puts @maze.to_s(@player)
      # FIXME: get input from user to move player
      exit = get_input

      break if exit
      # puts "Current position X: #{player.xpos}, Y: #{player.ypos}"
    end
    end_time = Time.now.to_i
    time_taken = end_time - start_time
    score = get_score(time_taken, difficulty)
    puts "You made it throught the maze in #{time_taken} seconds!"
    puts "Your time bonus is #{score}!"
  end

  def get_score(time_taken, difficulty)
    #Calculate score
    case difficulty
    when :easy
      time_differnce =  15 - time_taken
    when :medium
      time_differnce =  15 - time_taken
    when :hard
      time_differnce =  20 - time_taken
    end
    time_bonus = time_differnce <= 0 ? 0 : time_differnce * 50
    time_bonus
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

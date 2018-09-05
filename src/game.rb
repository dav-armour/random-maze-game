# Main game file
require 'io/console'
require 'rainbow'
require_relative 'models/player'
require_relative 'models/maze'
require_relative 'models/menu'


class Game

  def initialize
    @menus = {}
    system 'clear'
    create_menus
    # @menus[:difficulty_menu].display_menu
    # @menus[:result_menu].display_menu
    # @menus[:maze_menu].display_menu
  end

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
      # p @menus[:maze_menu]
      @menus[:maze_header].display_menu
      print_maze(@player)
      # puts @maze.to_s(@player).center(100)
      @menus[:maze_footer].display_menu

      menu = get_input

      break if menu
      # puts "Current position X: #{player.xpos}, Y: #{player.ypos}"
    end
    end_time = Time.now.to_i
    time_taken = end_time - start_time
    score = get_score(time_taken, difficulty)
    puts "Your time bonus is #{score}!"
  end

  def print_maze(player)
    puts Rainbow('|' + ' '.center(98) + '|').green
    @maze.to_s(player).split("\n").each do |line|
      print Rainbow('|').green
      print line.center(98)
      print Rainbow("|\n").green
    end
    puts Rainbow('|' + ' '.center(98) + '|').green
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
    when 'm'
      true
      # Ctrl - C to exit game
    when "\u0003", "q"
      exit
    else
      false
    end
  end

  def create_menus
    # Difficulty Menu
    header_text = 'Random Maze Game'
    header = { text: header_text, color: :red }
    body_text = "Welcome to our super awesome maze game\n-\nPlease choose a difficulty:\n"
    body_choices = ['Easy', 'Medium', 'Hard']
    body = {text: body_text, choices: body_choices, color: :white }
    footer_text = "Press Q or Ctrl-C to quit"
    footer = { text: footer_text, align: 'rjust', color: :blue }
    difficulty_menu = Menu.new(width: 100, header: header, body: body, footer: footer)
    difficulty_menu.border_color = :green
    @menus[:difficulty_menu] = difficulty_menu

    #Results Menu
    body_text = "Congratulations you finished the maze.\n-\n"
    body_text += "You made it throught the maze in 5 seconds!\n-\n"
    body_text += "Your score is 300!\n-"
    body_text += "\nPlease choose an option:\n"
    body_choices = ['Restart Maze', 'Change Difficulty', 'Exit']
    body = {text: body_text, choices: body_choices, color: :white }
    # body_text = "Congratulations you finished the maze.\n"
    # body_text += "You made it throught the maze in #{time_taken} seconds!\n"
    # body_text += "Your score is #{score}!"
    result_menu = Menu.new(width: 100, header: header, body: body, footer: footer)
    result_menu.border_color = :green
    @menus[:result_menu] = result_menu

    # Maze header
    maze_header = Menu.new(width: 100, header: header)
    maze_header.border_color = :green
    @menus[:maze_header] = maze_header
    # Maze footer
    maze_footer = Menu.new(width: 100, footer: footer)
    maze_footer.border_color = :green
    @menus[:maze_footer] = maze_footer
  end

end

Game.new.run

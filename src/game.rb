# Main application file that controls game logic
# Requires rainbow gem (gem install rainbow)
require 'io/console'
require 'rainbow'
# Project files
require_relative 'models/player'
require_relative 'models/maze'
require_relative 'models/menu'

# Game class controls how game is run
class Game
  def initialize
    # Hash used to store each menu object with associated menu name as key
    @menus = {}
    # Create a new player
    @player = Player.new
    # Create all game menus/screens
    create_menus

  end

  # Starts the game
  def run
    system 'clear'
    # Display first menu to select difficulty
    @menus[:difficulty_menu].display_menu
    # Gets input from user and starts the chosen maze
    get_menu_input('difficulty')
  end

  # Creates maze and shows result menu when finished
  def start_maze(difficulty)
    # Create new maze of given difficulty
    @maze = Maze.new(difficulty)
    # Store starting time: used to calculate maze completion time
    start_time = Time.now.to_i
    # Main game loop. Ends when player reaches finish
    while true
      # Maze gets redrawn after every movement. Need to clear screen
      system 'clear'
      # Store current position to compare with end position
      position = [@player.x, @player.y]
      # Calculate ending position x,y
      end_x = @maze.width - 1
      end_y = @maze.height - 1
      # Check if they have reached the finish
      if position == [end_x, end_y]
        # Reset position
        @player.x = 0
        @player.y = 0
        break
      end
      # Prints out maze with current player position
      print_maze
      get_maze_input
    end
    end_time = Time.now.to_i
    time_taken = end_time - start_time
    show_result(time_taken, difficulty)
  end

  # Shows result of time taken and score after maze finish
  def show_result(time_taken, difficulty)
    # Retrieve score based on time taken and difficulty
    score = get_score(time_taken, difficulty)
    # Add text to result menu
    body_text = "Congratulations you finished the maze!\n-\n"
    body_text += "You made it throught the maze in #{time_taken} seconds!\n-\n"
    body_text += "Your score is #{score}!\n-"
    @menus[:result_menu].body[:text] = body_text
    # Show result menu
    @menus[:result_menu].display_menu

    get_menu_input('result', difficulty)
  end

  # Constant strings used for maze printing
  LEFT_BORDER = Rainbow('|').green
  RIGHT_BORDER = Rainbow("|\n").green
  SPACER_LINE = Rainbow('|' + ' '.center(98) + '|').green

  # Print out maze with header and footer
  def print_maze
    # Show header
    @menus[:maze_header].display_menu
    print LEFT_BORDER
    print Rainbow("Use Arrow or WASD keys to move.".center(98)).blue
    print RIGHT_BORDER
    puts SPACER_LINE
    # Loop through each line of maze so that we can center in game window and add color border
    @maze.to_s(@player).split("\n").each do |line|
      print LEFT_BORDER
      print line.center(98)
      print RIGHT_BORDER
    end
    puts SPACER_LINE
    # Show footer
    @menus[:maze_footer].display_menu
  end

  # Calculate score based on time taken
  def get_score(time_taken, difficulty)
    case difficulty
    when :easy
      time_differnce =  30 - time_taken
    when :medium
      time_differnce =  60 - time_taken
    when :hard
      time_differnce =  90 - time_taken
    end
    # Make score 0 if player took too long to finish
    time_differnce <= 0 ? 0 : time_differnce * 50
    # Returns score
  end

  # Controls what happens when each button is pressed at menus
  def get_menu_input(menu, cur_difficulty =  nil)
    # Get single character (without showing on screen)
    char = STDIN.noecho(&:getch)
    case char
    when '1'
      menu == 'difficulty' ? start_maze(:easy) : start_maze(cur_difficulty)
    when '2'
      menu == 'difficulty' ? start_maze(:medium) : run
    when '3'
      menu == 'difficulty' ? start_maze(:hard) : exit
    # Q or Ctrl - C to exit game
    when "\u0003", "q", "Q"
      exit
    # Repeat if unwanted button pressed
    else
      get_menu_input(menu, cur_difficulty)
    end
  end

  def get_maze_input
    # Get single character (without showing on screen)
    char = STDIN.noecho(&:getch)
    # Check if special character entered (arrow keys)
    if char == "\e"
      # Retrieve rest of special character
      2.times do
        char += STDIN.getch
      end
    end
    # Check what key was entered
    case char
    # Makes WASD and arrow keys move player
    when 'w', "W", "\e[A" # Up arrow
      @player.move_north(@maze)
    when 's', "S", "\e[B" # Down arrow
      @player.move_south(@maze)
    when 'd', "D", "\e[C" # Right arrow
      @player.move_east(@maze)
    when 'a', "A", "\e[D" # Left arrow
      @player.move_west(@maze)
    # Q or Ctrl - C to exit game
    when "\u0003", "q", "Q"
      exit
    # Repeat if unwanted button pressed
    else
      get_maze_input
    end
  end

  # Uses Menu Class to create all game menus that will be used
  # Add all created menus to class variable @menus so they can be used elsewhere
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

    # Result Menu
    body_text = "-" # Gets filled in later when player finishes maze
    body_choices = ['Restart Maze', 'Change Difficulty', 'Exit']
    body = {text: body_text, choices: body_choices, color: :white }
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

# Starts game
begin
  Game.new.run
rescue => e
  puts "Game Crashed :("
end

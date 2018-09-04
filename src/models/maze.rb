# Print grid to screen
require_relative 'cell'
class Maze
  attr_accessor :width, :height, :cells
  def initialize(width = 10, height = 10)
    @width = width
    @height = height
    # @player = { x: 8, y: 2 }
    create_walls
    create_cells
    # Empty stack used for maze creation
    @stack = []
    generate_maze
  end

  def to_s(player)
    # Top Border
    output = '+   +' + '---+' * (@width - 1) + "\n"
    for row in 0...@height
      # Print vertical walls
      output += '|' # Leftside border
      for col in 0...@width
        # Add player symbol
        if col == player.xpos && row == player.ypos
          output += @vert_walls[col][row] ? ' * |' : ' *  '
        else
          output += @vert_walls[col][row] ? '   |' : '    '
        end
      end
      output += "\n+" # Rightside border
      # Print horizontal walls
      for col in 0...@width
        output += @horiz_walls[col][row] ? '---+' : '   +'
      end
      output += "\n"
    end
    output
  end

  def generate_maze
    # Put starting cell onto stack
    @done = false
    @stack << @cells[0][0]
    create_path_from(0, 0)
  end

  private

  def create_path_from(x, y)
    # Maze done when stack is empty
    return if @stack.empty?
    # Mark current cell as visited
    @cells[x][y].visited = true
    choices = get_choices(x, y)
    # puts "X: #{@cells[x][y].x}, Y: #{@cells[x][y].y}"
    # puts "X: #{x}, Y: #{y}"
    # p choices
    if choices.length == 0
      # puts "here"
      prev_cell = @stack.pop
      create_path_from(prev_cell.x, prev_cell.y)
    else
      # Randomly choose direction
      choice = choices[rand(choices.length)]
      # p choice
      new_x, new_y = get_next_cell_pos(choice, x, y)
      # Tell current cell and new cell they can now move in chosen direction
      @cells[x][y].available_directions << choice
      @cells[new_x][new_y].available_directions << opposite(choice)
      # Push current cell onto stack
      @stack << @cells[x][y]
      # Remove wall between current cell and chosen cell
      remove_wall(x, y, choice)
      # puts "here"
      # Restart method with new position
      create_path_from(new_x, new_y)
    end
  end

  def remove_wall(x, y, choice)
    # p choice
    # puts "Pos-: #{x}, #{y}"
    case choice
    when "N"
      # puts "removing wall @ pos: #{x},#{y-1}"
      @horiz_walls[x][y-1] = false
    when "S"
      # puts "removing wall @ pos: #{x},#{y}"
      @horiz_walls[x][y] = false
    when "E"
      # puts "removing wall @ pos: #{x},#{y}"
      @vert_walls[x][y] = false
    when "W"
      # puts "removing wall @ pos: #{x-1},#{y}"
      @vert_walls[x-1][y] = false
    end
  end

  def get_next_cell_pos(choice, x, y)
    # puts "OLD: X: #{x}, OLD Y: #{y}"
    # p choice
    case choice
    when "N"
      y -= 1
    when "S"
      y += 1
    when "E"
      x += 1
    when "W"
      x -= 1
    end
    # puts "New: X: #{x}, New Y: #{y}"
    [x, y]
  end

  def opposite(choice)
    case choice
    when "N"
      "S"
    when "S"
      "N"
    when "E"
      "W"
    when "W"
      "E"
    end
  end

  def get_choices(x, y)
    choices = []
    # Check north cell
    if y > 0
      if @cells[x][y-1].visited == false
        choices << 'N'
      end
    end
    # Check south cell
    if y < @height - 1
      if @cells[x][y+1].visited == false
        choices << 'S'
      end
    end
    # Check east cell
    if x < @width - 1
      if @cells[x+1][y].visited == false
        choices << 'E'
      end
    end
    # Check west cell
    if x > 0
      if @cells[x-1][y].visited == false
        choices << 'W'
      end
    end
    choices
  end

  def create_cells
    # 2 dimensional array rows * columns [x][y] of new cells
    @cells = Array.new(@width) { Array.new(@height) }
    for x in 0...@width
      for y in 0...@height
        @cells[x][y] = Cell.new(x, y)
      end
    end
    # p @cells
  end

  def create_walls
    # Create 2d array of all horizontal walls and set all to true
    @horiz_walls = Array.new(@width) { Array.new(@height) { true } }
    # Same for vertical walls...
    @vert_walls = Array.new(@width) { Array.new(@height) { true } }
    # Remove finish wall
    @horiz_walls[-1][-1] = false
    # Remove walls for testing
    # @vert_walls[5][7] = false
    # @horiz_walls[7][1] = false
  end

end



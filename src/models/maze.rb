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
    create_path_from(0, 0)
  end

  def create_path_from(x, y)
    # Mark current cell as visited
    @cells[x][y].visited = true
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

    #
    #   choices = unvisited surrounding cells
    #   if no choices:
    #     if stack empty:
    #       MAZE DONE
    #     set x, y to previous cell (pop from stack)
    #     restart method
    #   randomly choose one cell from choices
    #   set x, y = chosen cell
    #   add chosen direction to current cell's available directions
    #   push current cell onto stack
    #   remove wall between current cell and chosen cell
    #   restart method
  end

  private

  def create_cells
    # 2 dimensional array rows * columns [x][y] of new cells
    @cells = Array.new(width) { Array.new(@height) { Cell.new } }
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
    @vert_walls[5][7] = false
    @horiz_walls[7][1] = false
  end

end



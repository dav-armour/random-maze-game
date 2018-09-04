# Print grid to screen
require_relative 'cell'
class Maze
  attr_accessor :width, :height
  def initialize (width = 10, height = 10)
    @width = width
    @height = height
    @player = { x: 8, y: 2 }
    create_walls
  end

  def to_s
    # Top Border
    output = '+   +' + '---+' * (@width - 1) + "\n"
    for row in 0...@height
      # Print vertical walls
      output += '|' # Leftside border
      for col in 0...@width
        # Add player symbol
        if col == @player[:x] && row == @player[:y]
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

  def create_cells
    # 2 dimensional array rows * columns [x][y]
    @cells = Array.new(width) { Array.new(@height) }
    @cells.each do |row_arr|
      row_arr.map! { |c| c = Cell.new }
    end
  end

  private

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



# Print grid to screen
require_relative 'cell'

# Grid size
width = 10
height = 10

top_border = '+   +' + '---+' * (width - 1)
# Create 2d array of all horizontal walls and set all to true
horiz_walls = Array.new(width) { Array.new(height) { true } }
# Same for vertical walls...
vert_walls = Array.new(width) { Array.new(height) { true } }
# Remove finish wall
horiz_walls[-1][-1] = false
# Remove walls for testing
vert_walls[5][7] = false
horiz_walls[7][1] = false

player = { x: 0, y: 0 }

puts top_border
for row in 0...height
  # Print vertical walls
  print '|' # Leftside border
  for col in 0...width
    # Add player symbol
    if col == player[:x] && row == player[:y]
      print vert_walls[row][col] ? ' * |' : ' *  '
    else
      print vert_walls[row][col] ? '   |' : '    '
    end
  end
  print "\n+" # Rightside border
  # Print horizontal walls
  for col in 0...width
    print horiz_walls[row][col] ? '---+' : '   +'
  end
  print "\n"
end

# cells_2d_array = Array.new(width - 1) { Array.new(height - 1) }

# cells_2d_array.each do |row_arr|
#   row_arr.map! { |c| c = Cell.new }
# end

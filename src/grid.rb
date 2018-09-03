# Print grid to screen

# Grid size
width = 10
height = 10

# puts top_border
# for row_num in 0...height
#   puts '|' + vertical_walls(row_num) + '|'
#   puts '+' + horizontal_walls(row_num) + '+'
# end
cells_2d_array = Array.new(width) { Array.new(height) }
cells_2d_array.map! { |c| c = '-' }
cells_2d_array.inspect

horizontal_border = "+---" * width + '+'
puts horizontal_border
for row_num in 0...height
  puts "|   " * width + '|'
  puts "+---" * width + '+'
end

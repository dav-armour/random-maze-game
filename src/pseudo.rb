# stack = empty array
# Starting cell = 0, 0
# x, y = starting cell

# method x,y
#   mark current cell as visited
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

# print maze

# Ruby Terminal App - Coder Academy Assignment 1

### By David Armour and Tyson Hofstetter

![Image of Easy Maze](http://i68.tinypic.com/357ewpi.png)

Link to Git Repository: [GitHub](https://github.com/dav-armour/random-maze-game)

## Requirements:
Ruby 2.5.0 [how to install](https://www.ruby-lang.org/en/documentation/installation/)

Rainbow Gem v3.0.0:
```
gem install rainbow
```
RSpec v3.8.0 (only needed for running tests)
```
gem install rspec
```
Screen size: 1440 x 900 for hard difficulty.

## How to Run the Game:
- Download this Git repository.
- Navigate in terminal to the random-maze-game folder.
- Navigate into the src folder.
- Enter 'ruby game.rb' into terminal.
- Play game.

## Purpose:
The Random Maze Game is a Ruby terminal application designed to prevent boredom by entertaining the user. This engages the users problem solving skills and increases their ability to think many moves ahead. The game does this by randomly generating a maze, that the user must quickly navigate through in order to get a score. The faster the user can find their way through the maze, the higher the score they shall recieve. This game is designed for players of all ages.

## Functionality
- Multiple difficulty levels that change the size of the maze
- Score based on difficulty and how fast the maze is completed
- Ability to restart maze at current difficulty or select a different difficulty

#### Planned future functionality:
- Support login for saving data of multiple players
- Show leader board of top players
- Save current maze so that it can be resumed later
- Show maze solution
- External server to store leaderboard

## Instructions For Use:
- To begin playing The Random Maze Game simply select a difficulty level by selecting either "1" for Easy, "2" for Medium, or "3" for Hard. Selecting a difficulty level will bring up the maze.
- Your player icon is "P" it displays the users position in the maze. Move the player icon by using the arrow or WASD keys to navigate through the maze. Your goal is to make your way through the maze as quickly as possible.
- Once you reach the end of the maze another menu screen will appear. This screen will tell how fast you made it through the maze and will also give you a score. However if the player does not reach the end of the maze before time limit runs out the player will recieve a score of 0. The time limit is 20 seconds on Easy, 30 seconds on Medium and 40 seconds on Hard.
- On this screen there will also be 3 options for you to choose. Pressing "1" will recreate the maze at the current difficulty level. Pressing "2" will bring you back to the first option menu where you can change your difficuly level. Pressing "3" will exit the game.

## Files:
- game.rb
  - Main application file that controls game logic.
- maze.rb
  - Model used for maze creation.
- cell.rb
  - Model for each individual cell, stores position and available directions.
- player.rb
  - Model used for player position and movement.
- menu.rb
  - Model used for the game menus.

## Maze Creation Algorithm
Made use of a custom made recursive backtracker algorithm. Based on information obtained from [Wikipedia](https://en.wikipedia.org/wiki/Maze_generation_algorithm#Recursive_backtracker). Uses recursion to keep restarting the method until maze is done.

#### Maze Generation Pseudo Code:
```
stack = empty array
Starting cell = random x, y
x, y = starting cell

method x,y
  mark current cell as visited
  choices = unvisited surrounding cells
  if no choices:
    if stack empty:
      MAZE DONE - exit recursion
    set x, y to previous cell (pop from stack)
    restart method
  randomly choose one cell from choices
  set x, y = chosen cell
  add chosen direction to current cell's available directions
  add opposite direction to new cell's available directions
  push current cell onto stack
  remove wall between current cell and chosen cell
  restart method

print maze
```

## Built With:
- Visual Studio Code.

## Acknowledgments:
- Marcin Kulik and other contributors who made the rainbow ruby gem.

### Difficulty Menu
![Image of Difficulty Menu](http://i67.tinypic.com/29yqiph.png)
### Easy Maze
![Image of Easy Maze](http://i68.tinypic.com/357ewpi.png)
### Medium Maze
![Image of Medium Maze](http://i68.tinypic.com/2napct1.png)
### Hard Maze
![Image of Hard Maze](http://i67.tinypic.com/2lu2ps4.png)
### Results Menu
![Image of Result Menu](http://i65.tinypic.com/nmntqq.png)
### App User Workflow Diagram
![User App Workflow Diagram](http://i63.tinypic.com/f3hxzp.jpg)

## Project Plan & Timeline:
Used Trello to keep track of progress.
[Link to trello board](https://trello.com/b/GvRqDfbp/random-maze-generator)
  ### Start of Day 1
![Image of trello board at start of day 1](http://i63.tinypic.com/2zf07qx.png)
- Day 1:
  - Worked on randomly generating the maze.
  - Worked on player class and player movement.
  - Figured out how to use arrow keys to move player.
  ### Start of Day 2
![Image of trello board at start of day 2](http://i66.tinypic.com/dsajp.png)
- Day 2:
  - Worked on making the players score.
  - Worked timer for game.
  - Worked on game menus.
  - Worked on difficulty levels.
  - Complete documentation and slide show
  ### End of Day 2
![Image of trello board at end of day 2](http://i64.tinypic.com/35i4x04.png)

## Planning & Design:
Conducted brainstorming session to come up with app ideas.
### Ideas List:
- Game menu
- Player score
- Timer
- Difficulty levels

### Stretch Goals:
- Leader board
- Show solution
- Save level
- User names

### Planning code structure
Wrote down structure needed for each class and layout of maze.
![Image of planning stage 1](http://i67.tinypic.com/28a6xiq.jpg)
![Image of planning stage 2](http://i68.tinypic.com/212ybet.jpg)
![Image of planning stage 3](http://i65.tinypic.com/295bi1v.jpg)
![Image of planning stage 4](http://i67.tinypic.com/15n8514.jpg)


## Testing
Used Rspec for testing. Created multiple tests for each model to ensure proper functioning. Also ran repeated user tests while creating the app so that we could find issues as we went.

To run rspec tests:
- Navigate in terminal to the random-maze-game folder.
- Navigate into the src folder.
- Enter 'rspec' into terminal.
![Image of rspec tests](http://i65.tinypic.com/2na5i0i.png)

## Ethical Issues:
- Taking over the world and destroying lives because it is so addictive.
- Excessive playing of this game may result in negative emotional, social and relational consequences.
- [Addiction Help](https://www.psychguides.com/guides/video-game-addiction-symptoms-causes-and-effects/)

## Accessibility Requirements:
- Game requires ability to give input with keyboard.
- Game uses default terminal colour for displaying maze and menu options. Can change your default terminal colour if colour blindness is an issue.
- Game does not require the use of sound.
- Unfortunately game would not work for people with vision problems as text to speech for this kind of game would not be possible.

## Challenges:
- The hardest part was the random maze generation.
- Fixing our endless recursion nightmare.
- Finding out how to use the arrow keys.
- Making the player icon unable to move through the walls.

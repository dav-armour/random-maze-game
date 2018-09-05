# Ruby Terminal App - Coder Academy Assignment 1

### By David Armour and Tyson Hofstetter

![Image of Easy Maze](http://i68.tinypic.com/357ewpi.png)

Link to Git Repository: [GitHub](https://github.com/dav-armour/random-maze-game)

## Requirements:
Ruby 2.5.0 [how to install](https://www.ruby-lang.org/en/documentation/installation/)
Rainbow Gem:
```
gem install rainbow
```
## How to Run the Game:
- Download this Git repository.
- Navigate in terminal to the random-maze-game folder.
- Navigate into the src folder.
- enter 'ruby game.rb' into terminal.
- Play game.

## Game Description
The Random Maze Game is a Ruby terminal application designed to prevent boredom by entertaining the user. The application does this by randomly generating a maze, that the user must quickly navigate through in order to get a score. The faster the user can find their way through the maze, the higher the score they shall recieve. The maze has diffent difficulty levels, designed for players of all ages. The difficulty level changes the size of the maze, so if the user finds the maze to easy or to difficult they can simply change the difficulty level to suit their needs.

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
  - Model used for player icon and movement.
- menu.rb
  - Model used for the game menus.

## Built With:
- Visual Studio Code.

## Acknowledgments:
- Marcin Kulik and other contributors who made the rainbow ruby gem.


![Image of Difficulty Menu](http://i67.tinypic.com/29yqiph.png)
- Difficulty Menu
![Image of Easy Maze](http://i68.tinypic.com/357ewpi.png)
- Easy Maze
![Image of Medium Maze](http://i68.tinypic.com/2napct1.png)
- Medium Maze
![Image of Hard Maze](http://i67.tinypic.com/2lu2ps4.png)
- Hard Maze
![Image of Result Menu](http://i65.tinypic.com/nmntqq.png)
- Results Menu
![User App Workflow Diagram](http://i63.tinypic.com/f3hxzp.jpg)
- App User Workflow Diagram

## Project Plan & Timeline:
Used Trello to keep track of progress
![Image of trello board at start of day 1](http://i63.tinypic.com/2zf07qx.png)
- Day 1:
  - Worked on randomly generating the maze.
  - Worked on player class and player movement.
  - Figured out how to use arrow keys to move player.
![Image of trello board at start of day 1](http://i66.tinypic.com/dsajp.png)
- Day 2:
  - Worked on making the players score.
  - Worked timer for game.
  - Worked on game menus.
  - Worked on difficulty levels.

  - Complete documentation and slide show

## Ideas List:
•	Game menu
•	Player score.
•	Timer
•	Difficulty levels

Stretch Goals:
•	Leader board
•	Show solution
•	Save level
•	User names


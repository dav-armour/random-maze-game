require_relative '../models/player'
require_relative '../models/maze'

describe "Player" do
  it "should exist" do
    player = Player.new
    expect(player).to be_an_instance_of Player
  end

  it "should start at x = 0" do
    player = Player.new
    expect(player.x).to eq(0)
  end

  it "should start at y = 0" do
    player = Player.new
    expect(player.y).to eq(0)
  end

  it "should not move above northern border" do
    player = Player.new
    maze = Maze.new(:easy)
    player.move_north(maze)
    expect(player.y).to eq(0)
  end

  it "should not move left of western border" do
    player = Player.new
    maze = Maze.new(:easy)
    player.move_west(maze)
    expect(player.x).to eq(0)
  end

  it "should not move right of eastern border" do
    player = Player.new
    player.x = 9
    maze = Maze.new(:easy)
    player.move_east(maze)
    expect(player.x).to eq(9)
  end

  it "should not move below southern border" do
    player = Player.new
    player.y = 9
    maze = Maze.new(:easy)
    player.move_south(maze)
    expect(player.y).to eq(9)
  end
end
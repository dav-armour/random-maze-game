require_relative '../models/maze'
require_relative '../models/player'

describe "Maze" do
  it "should exist" do
    maze = Maze.new(:easy)
    expect(maze).to be_an_instance_of Maze
  end

  it "should create easy maze" do
    maze = Maze.new(:easy)
    player = Player.new
    expect(maze.to_s(player)).not_to be_empty
  end

  it "should create medium maze" do
    maze = Maze.new(:medium)
    player = Player.new
    expect(maze.to_s(player)).not_to be_empty
  end

  it "should create hard maze" do
    maze = Maze.new(:hard)
    player = Player.new
    expect(maze.to_s(player)).not_to be_empty
  end

  # row_length = (width * 4) + 2
  # Total = row_length * (height * 2) + 1
  # Easy = 10 * 10
  it "Easy maze should have length of 882" do
    maze = Maze.new(:easy)
    player = Player.new
    expect(maze.to_s(player).length).to eq(882)
  end

  # Medium = 15 * 15
  it " maze should have length of 1922" do
    maze = Maze.new(:medium)
    player = Player.new
    expect(maze.to_s(player).length).to eq(1922)
  end

  # Hard = 20 * 20
  it "Hard maze should have length of 3362" do
    maze = Maze.new(:hard)
    player = Player.new
    expect(maze.to_s(player).length).to eq(3362)
  end

end
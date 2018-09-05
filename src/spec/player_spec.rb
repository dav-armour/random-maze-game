require_relative '../models/player'

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
end
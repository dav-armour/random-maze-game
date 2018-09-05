require_relative '../models/cell'

describe "Cell" do
  it "should exist" do
    cell = Cell.new(0,0)
    expect(cell).to be_an_instance_of Cell
  end

  it "should not be visited when created" do
    cell = Cell.new(0,0)
    expect(cell.visited).not_to be(true)
  end

  it "should start with empty available directions array" do
    cell = Cell.new(0,0)
    expect(cell.available_directions).to be_empty
  end
end
require_relative '../models/menu'

describe "Menu" do
  it "should exist" do
    menu = Menu.new
    expect(menu).to be_an_instance_of Menu
  end
end
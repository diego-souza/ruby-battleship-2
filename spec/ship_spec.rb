# frozen_string_literal: true

require 'ship.rb'

RSpec.describe Ship do

  it "can generate ship oriented to north" do
    ship = Ship.new(2, [1,1], Ship::Orientation::NORTH)
    expect(ship.coords).to eq([[1,1],[1,0]].to_set)
  end

  it "can generate ship oriented to south" do
    ship = Ship.new(2, [1,1], Ship::Orientation::SOUTH)
    expect(ship.coords).to eq([[1,1],[1,2]].to_set)
  end

  it "can generate ship oriented to east" do
    ship = Ship.new(2, [1,1], Ship::Orientation::EAST)
    expect(ship.coords).to eq([[1,1],[2,1]].to_set)
  end

  it "can generate ship oriented to west" do
    ship = Ship.new(2, [1,1], Ship::Orientation::WEST)
    expect(ship.coords).to eq([[1,1],[0,1]].to_set)
  end

  it "can generate ship of multiple sizes" do
    ship = Ship.new(4, [0,0], Ship::Orientation::SOUTH)
    expect(ship.coords).to eq([[0,0],[0,1],[0,2],[0,3]].to_set)
    ship = Ship.new(6, [0,0], Ship::Orientation::SOUTH)
    expect(ship.coords).to eq([[0,0],[0,1],[0,2],[0,3],[0,4],[0,5]].to_set)
  end
end

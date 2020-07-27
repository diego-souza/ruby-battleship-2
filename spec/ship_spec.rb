# frozen_string_literal: true

require 'ship.rb'

RSpec.describe Ship do

  it "can generate ship oriented to north" do
    ship = Ship.new(2, Coord.new(1, 1), Ship::Orientation::NORTH)
    expect(ship.coords).to eq([Coord.new(1, 1), Coord.new(1, 0)])
  end

  it "can generate ship oriented to south" do
    ship = Ship.new(2, Coord.new(1, 1), Ship::Orientation::SOUTH)
    expect(ship.coords).to eq([Coord.new(1, 1), Coord.new(1, 2)])
  end

  it "can generate ship oriented to east" do
    ship = Ship.new(2, Coord.new(1, 1), Ship::Orientation::EAST)
    expect(ship.coords).to eq([Coord.new(1, 1), Coord.new(2, 1)])
  end

  it "can generate ship oriented to west" do
    ship = Ship.new(2, Coord.new(1, 1), Ship::Orientation::WEST)
    expect(ship.coords).to eq([Coord.new(1, 1), Coord.new(0, 1)])
  end

  it "can generate ship of multiple sizes" do
    ship = Ship.new(4, Coord.new(0, 0), Ship::Orientation::SOUTH)
    coords = [Coord.new(0, 0), Coord.new(0, 1), Coord.new(0, 2), Coord.new(0, 3)]
    expect(ship.coords).to eq(coords)
    ship = Ship.new(6, Coord.new(0, 0), Ship::Orientation::SOUTH)
    coords = coords + [Coord.new(0, 4), Coord.new(0, 5)]
    expect(ship.coords).to eq(coords)
  end
end

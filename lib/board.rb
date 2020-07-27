# frozen_string_literal: true

require 'coord'
require 'errors'

class Board
  attr_reader :dim, :ships, :shots

  def initialize(dim = 10)
    @dim = dim
    @ships = []
    @shots = []
  end

  def can_place_ship?(ship)
    coords_inside_board?(ship.coords) && !ship_coords_overlap?(ship.coords)
  end

  def check?
    @ships.to_set.subset?(@shots.to_set)
  end

  def place_ship!(ship)
    coords = ship.coords
    raise ShipOutsideBoardError unless coords_inside_board?(coords)
    raise ShipOverlapError if ship_coords_overlap?(coords)

    @ships += coords
  end

  def sample_position
    Coord.new(rand(@dim), rand(@dim))
  end

  def shoot!(coord)
    raise ShootOutsideBoardError unless coords_inside_board?([coord])

    @shots << coord
  end

  private

  def board_range
    @board_range ||= Range.new(0, @dim - 1)
  end

  def coords_inside_board?(coords)
    coords.all? do |coord|
      board_range.include?(coord.x) && board_range.include?(coord.y)
    end
  end

  def ship_coords_overlap?(coords)
    (@ships & coords).any?
  end
end

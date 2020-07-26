# frozen_string_literal: true

require 'coord'

class Ship
  attr_reader :coords

  module Orientation
    DELTAS = [
      NORTH = Coord.new(0, -1),
      SOUTH = Coord.new(0, 1),
      EAST  = Coord.new(1, 0),
      WEST  = Coord.new(-1, 0)
    ].freeze
  end

  def initialize(size, start_pos, orientation)
    deltas = (0..size - 1).map do |scale|
      Coord.new(orientation.x * scale, orientation.y * scale)
    end
    @coords = deltas.map { |delta| start_pos.add(delta) }.to_set
  end
end

# frozen_string_literal: true

class Ship
  attr_reader :coords

  module Orientation
    DELTAS = [
      NORTH = [0, -1].freeze,
      SOUTH = [0, 1].freeze,
      EAST  = [1, 0].freeze,
      WEST  = [-1, 0].freeze
    ].freeze
  end

  def initialize(size, start_pos, orientation)
    deltas = (0..size - 1).map { |scale| orientation.map { |delta| delta * scale } }
    @coords = deltas.map { |x, y| [x + start_pos[0], y + start_pos[1]] }.to_set
  end
end

# frozen_string_literal: true

require 'forwardable'
require 'board.rb'
require 'ship.rb'

class Game
  extend Forwardable

  SHIP_SIZES = [
    CARRIER = 5,
    BATTLESHIP = 4,
    CRUISER = 3,
    SUBMARINE = 3,
    DESTROYER = 2
  ].freeze

  def_delegators :@board, :check?, :ships, :shoot!, :shots

  def initialize
    @board = Board.new
    @random_tries = 50
  end

  def setup!
    SHIP_SIZES.each do |size|
      ship = generate_random_valid_ship(size)
      @board.place_ship!(ship)
    end
  end

  private

  def generate_random_valid_ship(size)
    @random_tries.times do
      orientation = Ship::Orientation::DELTAS.sample
      ship = Ship.new(size, @board.sample_position, orientation)
      return ship if @board.can_place_ship?(ship)
    end
    raise CouldNotGenerateRandomShip
  end
end

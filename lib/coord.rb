# frozen_string_literal: true

class Coord
  attr_reader :x, :y

  def initialize(x, y)
    @x = x
    @y = y
  end

  def ==(other)
    @x == other.x && @y == other.y
  end

  def eql?(other)
    self == other
  end

  def hash
    [x, y].hash
  end

  def +(other)
    Coord.new(@x + other.x, @y + other.y)
  end
end

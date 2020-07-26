# frozen_string_literal: true

Coord = Struct.new(:x, :y) do
  def add(other)
    Coord.new(x + other.x, y + other.y)
  end
end

# frozen_string_literal: true

class CouldNotGenerateRandomShip < StandardError
end

class ShipOutsideBoardError < StandardError
end

class ShootOutsideBoardError < StandardError
end

class ShipOverlapError < StandardError
end

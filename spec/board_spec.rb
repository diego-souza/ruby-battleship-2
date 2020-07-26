require 'board.rb'

RSpec.describe Board do
  before(:each) do
    @new_board = Board.new
  end

  context "Board initialization" do
    it "starts with no ships" do
      expect(@new_board.ships).to be_empty
    end

    it "starts with no shots" do
      expect(@new_board.shots).to be_empty
    end

    it "has 10 as default dimension" do
      expect(@new_board.dim).to eq(10)
    end
  end

  context "Ship placement" do
    it "can place a ship with coords inside the board" do
      coords = Set.new([Coord.new(0, 0)])
      ship = double("Ship", :coords => coords)
      @new_board.place_ship!(ship)
      expect(@new_board.ships).to eq(coords)
    end

    it "raises error if ship has coords outside the board" do
      coords = Set.new([Coord.new(0, 10)])
      ship = double("Ship", :coords => coords)
      expect { @new_board.place_ship!(ship) }.to raise_error(ShipOutsideBoardError)
    end

    context "has one ship already placed" do
      before(:each) do
        first_coords = Set.new([Coord.new(0, 0)])
        first_ship = double("First Ship", :coords => first_coords)
        @new_board.place_ship!(first_ship)
      end

      it "can place multiple ships" do
        first_coords = Set.new([Coord.new(0, 0)])
        second_coords = Set.new([Coord.new(2, 2), Coord.new(2, 3), Coord.new(2, 4)])
        second_ship = double("Second Ship", :coords => second_coords)
        @new_board.place_ship!(second_ship)
        expect(@new_board.ships).to include(second_coords)
      end

      it "raises error if ship overlaps with another ship", focus: true do
        second_coords = Set.new([Coord.new(0, 0), Coord.new(0, 1), Coord.new(0, 2)])
        second_ship = double("Second Ship", :coords => second_coords)
        expect { @new_board.place_ship!(second_ship) }.to raise_error(ShipOverlapError)
      end
    end
  end

  context "Shooting" do
    it "can place a shot coord inside the board" do
      coord = Coord.new(0, 0)
      expect(@new_board.shoot!(coord)).to include(coord)
      expect(@new_board.shots).to eq(Set.new([coord]))
    end

    it "raises error if shot has coord outside the board" do
      coord = Coord.new(0, 10)
      expect { @new_board.shoot!(coord) }.to raise_error(ShootOutsideBoardError)
    end

    it "can shoot multiple coords" do
      first_coord = Coord.new(0, 0)
      second_coord = Coord.new(0, 1)
      expect(@new_board.shoot!(first_coord)).to include(first_coord)
      expect(@new_board.shots).to include(first_coord)
      expect(@new_board.shoot!(second_coord)).to include(first_coord)
      expect(@new_board.shots).to include(second_coord)
    end
  end

  context "checking if game is over" do
    it "says game is over when there are no ships" do
      expect(@new_board.check?).to be true
    end

    it "says game is over when there are shots in every ship position" do
      first_coord = Coord.new(0, 0)
      coords = Set.new([first_coord])
      ship = double("Ship", :coords => coords)
      @new_board.place_ship!(ship)
      @new_board.shoot!(first_coord)
      expect(@new_board.check?).to be true
    end

    it "says game is not over when there are ships positions not shot" do
      first_coord = [0,0]
      first_coord = Coord.new(0, 0)
      coords = Set.new([first_coord, Coord.new(0,1)])
      ship = double("Ship", :coords => coords)
      @new_board.place_ship!(ship)
      @new_board.shoot!(Coord.new(0,0))
      @new_board.shoot!(Coord.new(1,0))
      @new_board.shoot!(Coord.new(1,1))
      expect(@new_board.check?).to be false
    end
  end
end

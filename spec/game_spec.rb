# frozen_string_literal: true

require 'game.rb'

RSpec.describe Board do
  before(:each) do
    @new_game = Game.new
  end

  it "can generate a randomly setup board" do
    @new_game.setup!
    expect(@new_game.ships.size).to eq Game::SHIP_SIZES.sum
  end

  it "can shoot" do
    @new_game.setup!
    coord = [0,0]
    @new_game.shoot!(coord)
    expect(@new_game.shots).to include(coord)
  end

  it "can check if game is over" do
    @new_game.setup!
    expect(@new_game.check?).to eq false
    @new_game.ships.each do |coord|
      @new_game.shoot!(coord)
    end
    expect(@new_game.check?).to eq true
  end
end

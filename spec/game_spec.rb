require_relative "../lib/game.rb"

describe Game do 
  subject(:game) { described_class.new }
  let(:player) { double("player") }

  describe "#create_players" do 
    it "calls New on the Player class twice" do
      expect(Player).to receive(:new).twice
      game.create_player
    end
  end
end
require_relative "../lib/player.rb"

describe Player do 
  subject(:player) { described_class.new }

  describe "#assign_symbol" do 
    context "if symbol is red circle" do 
      it "assigns red circle to player symbol" do 
        player.assign_symbol("\u26d4")
        expect(player.player_symbol).to eq("\u26d4")
      end
    end

    context "if symbol is white circle" do 
      it "assigns white circle to player symbol" do 
        player.assign_symbol("\u26aa")
        expect(player.player_symbol).to eq("\u26aa")
      end
    end
  end
end
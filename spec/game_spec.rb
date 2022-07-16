require_relative "../lib/game.rb"

describe Game do 
  subject(:game) { described_class.new }
  let(:player) { double("player") }

  describe "#create_players" do 
    it "calls New on the Player class twice, with 1 and 2 player_number arg" do
      expect(Player).to receive(:new).with(1)
      expect(Player).to receive(:new).with(2)
      game.create_players
    end
  end

  describe "#get_player1_symbol" do 
    context "when player1 selects 'r'" do 
      before do 
        allow(game).to receive(:gets).and_return("r")
      end
      it "returns red unicode symbol" do 
        expect(game.get_player1_symbol).to eq("\u26d4")
      end
    end

    context "when player1 selects 'w'" do 
      before do 
        allow(game).to receive(:gets).and_return("w")
      end
      it "returns white unicode symbol" do 
        expect(game.get_player1_symbol).to eq("\u26aa")
      end
    end

    context "when player1 selects invalid input twice, then 'w'" do 
      before do 
        allow(game).to receive(:gets).and_return("232", "wwed", "w")
      end
      it "outputs message to 'try again' twice, then returns" do 
        error_msg = "That wasn't a choice. Please try again."
        expect(game).to receive(:puts).with(error_msg).twice
        game.get_player1_symbol
      end
    end
  end

  describe "#get_player2_symbol" do 
    context "if player1 symbol is white" do 
      it "returns red symbol for player2" do 
        expect(game.get_player2_symbol("\u26aa")).to eq("\u26d4")
      end
    end

    context "if player1 symbol is red" do 
      it "returns white symbol for player2" do 
        expect(game.get_player2_symbol("\u26d4")).to eq("\u26aa")
      end
    end
  end

  describe "#get_column_choice" do 
    context "when player enters column 1" do 
      before do 
        allow(game).to receive(:gets).and_return(1)
      end
      it "returns 0 (adjust for 0-array)" do 
        expect(game.get_column_choice).to eq(0)
      end 
    end

    context "when player enters column 6" do 
      before do 
        allow(game).to receive(:gets).and_return(6)
      end
      it "returns 5" do 
        expect(game.get_column_choice).to eq(5)
      end 
    end

    context "when player enters 2 invalid column inputs before a valid one" do 
      before do 
        allow(game).to receive(:gets).and_return("dd", "0", "2")
      end
      it "returns error message twice" do 
        error_msg = "Please enter a column between 1 and 7."
        expect(game).to receive(:puts).with(error_msg).twice
        game.get_column_choice
      end 
    end
  end

  describe "#place_column_choice" do 
    array = [[" ", " ", " ", " ", " ", " ", " "],
            [" ", " ", " ", " ", " ", " ", " "],
            [" ", " ", " ", " ", " ", " ", " "],
            [" ", " ", " ", " ", " ", " ", " "],
            [" ", " ", " ", " ", " ", " ", " "],
            [" ", " ", " ", " ", " ", " ", " "]]

    let(:board) { double("board", board: array)}

    it "fills the appropriate column" do 
      updated_array = [[" ", " ", " ", " ", " ", " ", " "],
                      [" ", " ", " ", " ", " ", " ", " "],
                      [" ", " ", " ", " ", " ", " ", " "],
                      [" ", " ", " ", " ", " ", " ", " "],
                      [" ", " ", " ", " ", " ", " ", " "],
                      [" ", " ", "\u26d4", " ", " ", " ", " "]]

      game.place_column_choice(2, array, "\u26d4")
      expect(board.board).to eq(updated_array)
    end
  end
end
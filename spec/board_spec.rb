require_relative "../lib/board.rb"

describe Board do 
  subject(:board) { described_class.new }
  describe "#generate_board" do 
    it "returns an array of 6 arrays with 7 ' ' elements" do 
      array = [["  ", "  ", "  ", "  ", "  ", "  ", "  "],
               ["  ", "  ", "  ", "  ", "  ", "  ", "  "],
               ["  ", "  ", "  ", "  ", "  ", "  ", "  "],
               ["  ", "  ", "  ", "  ", "  ", "  ", "  "],
               ["  ", "  ", "  ", "  ", "  ", "  ", "  "],
               ["  ", "  ", "  ", "  ", "  ", "  ", "  "]]
      
      expect(board.generate_board).to eq(array)
    end
  end

  describe "#board_full?" do 
    context "when the board is completely filled with symbols" do 
      before do 
        board.board = [["\u26aa", "\u26aa", "\u26aa", "\u26aa", "\u26aa", "\u26aa", "\u26aa"],
                      ["\u26aa", "\u26aa", "\u26aa", "\u26aa", "\u26aa", "\u26aa", "\u26aa"],
                      ["\u26aa", "\u26aa", "\u26aa", "\u26aa", "\u26aa", "\u26aa", "\u26aa"],
                      ["\u26aa", "\u26aa", "\u26aa", "\u26aa", "\u26aa", "\u26aa", "\u26aa"],
                      ["\u26aa", "\u26aa", "\u26aa", "\u26aa", "\u26aa", "\u26aa", "\u26aa"],
                      ["\u26aa", "\u26aa", "\u26aa", "\u26aa", "\u26aa", "\u26aa", "\u26aa"]]
      end
      it "returns true" do 
        expect(board.board_full?).to be true
      end
    end

    context "when the board is NOT completely filled with symbols" do 
      before do 
        board.board = [["\u26aa", "\u26aa", "\u26aa", "\u26aa", "\u26aa", "\u26aa", "\u26aa"],
                      ["\u26aa", "\u26aa", "\u26aa", "\u26aa", "\u26aa", "\u26aa", "\u26aa"],
                      ["\u26aa", "\u26aa", "  ", "\u26aa", "\u26aa", "\u26aa", "\u26aa"],
                      ["\u26aa", "\u26aa", "\u26aa", "\u26aa", "  ", "\u26aa", "\u26aa"],
                      ["\u26aa", "\u26aa", "\u26aa", "\u26aa", "\u26aa", "\u26aa", "\u26aa"],
                      ["\u26aa", "  ", "\u26aa", "\u26aa", "\u26aa", "\u26aa", "\u26aa"]]
      end
      it "returns false" do 
        expect(board.board_full?).to be false
      end
    end

    context "when the board is empty" do 
      before do 
        board.board = [["  ", "  ", "  ", "  ", "  ", "  ", "  "],
                      ["  ", "  ", "  ", "  ", "  ", "  ", "  "],
                      ["  ", "  ", "  ", "  ", "  ", "  ", "  "],
                      ["  ", "  ", "  ", "  ", "  ", "  ", "  "],
                      ["  ", "  ", "  ", "  ", "  ", "  ", "  "],
                      ["  ", "  ", "  ", "  ", "  ", "  ", "  "]]
      end
      it "returns false" do 
        expect(board.board_full?).to be false
      end
    end
  end

  describe "#four_horizontally" do 
    context "when there are four red symbols horizontally connected" do 
      before do 
        board.board = [["  ", "  ", "  ", "  ", "  ", "  ", "  "],
                      ["  ", "  ", "  ", "  ", "  ", "  ", "  "],
                      ["  ", "  ", "  ", "  ", "  ", "  ", "  "],
                      ["  ", "  ", "  ", "  ", "  ", "  ", "  "],
                      ["  ", "  ", "  ", "  ", "  ", "  ", "  "],
                      ["  ", "  ", "  ", "\u26d4", "\u26d4", "\u26d4", "\u26d4"]]
      end
      it "returns true" do 
        expect(board.four_horizontally?).to be true
      end
    end

    context "when there are four white symbols horizontally connected" do 
      before do 
        board.board = [["  ", "  ", "  ", "  ", "  ", "  ", "  "],
                      ["  ", "\u26aa", "\u26aa", "\u26aa", "\u26aa", "  ", "  "],
                      ["  ", "  ", "  ", "  ", "  ", "  ", "  "],
                      ["  ", "  ", "  ", "  ", "  ", "  ", "  "],
                      ["  ", "  ", "  ", "  ", "  ", "  ", "  "],
                      ["  ", "  ", "  ", "  ", "  ", "  ", "  "]]
      end
      it "returns true" do 
        expect(board.four_horizontally?).to be true
      end
    end

    context "when there is no four across of any symbol" do 
      before do 
        board.board = [["  ", "  ", "  ", "  ", "  ", "  ", "  "],
                      ["  ", "\u26aa", "\u26aa", "\u26aa", "  ", "  ", "  "],
                      ["  ", "  ", "  ", "  ", "  ", "  ", "  "],
                      ["\u26aa", "\u26aa", "  ", "  ", "  ", "  ", "  "],
                      ["  ", "  ", "  ", "  ", "  ", "  ", "  "],
                      ["  ", "  ", "\u26aa", "  ", "\u26aa", "  ", "  "]]
      end
      it "returns false" do 
        expect(board.four_horizontally?).to be false
      end
    end

    context "when there is four across but it's not the same symbol connected" do 
      before do 
        board.board = [["  ", "  ", "  ", "  ", "  ", "  ", "  "],
                      ["  ", "\u26aa", "\u26aa", "\u26aa", "\u26d3", "\u26d3", "  "],
                      ["  ", "  ", "  ", "  ", "  ", "  ", "  "],
                      ["\u26aa", "\u26aa", "  ", "  ", "  ", "  ", "  "],
                      ["  ", "  ", "  ", "  ", "  ", "  ", "  "],
                      ["  ", "  ", "\u26aa", "  ", "\u26aa", "  ", "  "]]
      end
      it "returns false" do 
        expect(board.four_horizontally?).to be false
      end
    end
  end

  describe "#four_vertically?" do 
    context "when there are four red symbols vertically connected" do 
      before do 
        board.board = [["  ", "  ", "  ", "  ", "  ", "  ", "  "],
                      ["  ", "  ", "  ", "  ", "  ", "  ", "  "],
                      ["  ", "  ", "  ", "\u26d4", "  ", "  ", "  "],
                      ["  ", "  ", "  ", "\u26d4", "  ", "  ", "  "],
                      ["  ", "  ", "  ", "\u26d4", "  ", "  ", "  "],
                      ["  ", "  ", "  ", "\u26d4", "  ", "  ", "  "]]
      end
      it "returns true" do 
        expect(board.four_vertically?).to be true
      end
    end

    context "when there are four white symbols vertically connected" do 
      before do 
        board.board = [["  ", "  ", "  ", "  ", "  ", "  ", "  "],
                      ["  ", "  ", "  ", "  ", "  ", "  ", "\u26aa"],
                      ["  ", "  ", "  ", "  ", "  ", "  ", "\u26aa"],
                      ["  ", "  ", "  ", "  ", "  ", "  ", "\u26aa"],
                      ["  ", "  ", "  ", "  ", "  ", "  ", "\u26aa"],
                      ["  ", "  ", "  ", "  ", "  ", "  ", "  "]]
      end
      it "returns true" do 
        expect(board.four_vertically?).to be true
      end
    end

    context "when there are no symbols vertically connected by four" do 
      before do 
        board.board = [["  ", "  ", "  ", "  ", "  ", "  ", "  "],
                      ["  ", "  ", "\u26aa", "  ", "  ", "  ", "  "],
                      ["  ", "  ", "  ", "  ", "  ", "  ", "\u26aa"],
                      ["  ", "  ", "\u26aa", "  ", "  ", "  ", "\u26aa"],
                      ["  ", "\u26aa", "  ", "  ", "  ", "  ", "\u26aa"],
                      ["  ", "\u26aa", "  ", "  ", "  ", "  ", "  "]]
      end
      it "returns true" do 
        expect(board.four_vertically?).to be false
      end
    end

    context "when there are four symbols vertically connected that are not the same" do 
      before do 
        board.board = [["  ", "  ", "  ", "  ", "  ", "  ", "\u26aa"],
                      ["  ", "  ", "  ", "  ", "  ", "  ", "\u26d3"],
                      ["  ", "  ", "  ", "  ", "  ", "  ", "\u26aa"],
                      ["  ", "  ", "  ", "  ", "  ", "  ", "\u26d3"],
                      ["  ", "  ", "  ", "  ", "  ", "  ", "\u26aa"],
                      ["  ", "  ", "  ", "  ", "  ", "  ", "\u26aa"]]
      end
      it "returns false" do 
        expect(board.four_vertically?).to be false
      end
    end
  end
end
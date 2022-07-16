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
end
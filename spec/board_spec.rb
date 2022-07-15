require_relative "../lib/board.rb"

describe Board do 
  subject(:board) { described_class.new }
  describe "#generate_board" do 
    it "returns an array of 6 arrays with 7 ' ' elements" do 
      array = [[" ", " ", " ", " ", " ", " ", " "],
               [" ", " ", " ", " ", " ", " ", " "],
               [" ", " ", " ", " ", " ", " ", " "],
               [" ", " ", " ", " ", " ", " ", " "],
               [" ", " ", " ", " ", " ", " ", " "],
               [" ", " ", " ", " ", " ", " ", " "]]
      
      expect(board.generate_board).to eq(array)
    end
  end
end
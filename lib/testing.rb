# THIS FILE IS FOR DEBUGGING PURPOSES ONLY

class Board_1
  attr_accessor :board
  
  def initialize(board) 
    @board = board
  end

  def four_down_diagonally_col?
    for i in 0..2
      count = 0
      n = 0
      for x in i..4
        unless @board[x][n] == "  "
          if @board[x][n] == @board[x + 1][n + 1]
            count += 1
            return true if count == 3
          else
            count = 0
          end
        end
        n += 1
      end
    end

    false
  end
end

arr = [["  ", "  ", "  ", "  ", "  ", "  ", "  "],
      ["\u26d3", "  ", "  ", "  ", "  ", "  ", "  "],
      ["  ", "\u26d3", "  ", "  ", "  ", "  ", "  "],
      ["  ", "  ", "  ", "  ", "  ", "  ", "  "],
      ["  ", "  ", "  ", "\u26d3", "  ", "  ", "  "],
      ["\u26d3", "  ", "  ", "  ", "  ", "  ", "  "]]

board = Board_1.new(arr)
board.four_down_diagonally_col?
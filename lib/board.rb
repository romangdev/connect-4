# frozen_string_literal: true

class Board 
  attr_accessor :board

  def initialize
    @board = nil
  end

  def generate_board 
    @board = Array.new(6) { Array.new(7, "  ") }
  end

  def display_board
    @board.each do |row|
      print "#{row}\n\n"
    end
  end

  def board_full?
    @board.each do |row|
      row.each do |column| 
        return false if column == "  "
      end
    end

    true
  end

  def four_horizontally?
    count = 0

    @board.each do |row|
      for i in 0..row.length - 2
        unless row[i] == "  "
          if row[i] == row[i + 1]
            count += 1 
            return true if count == 3

          else 
            count = 0
          end
        end
      end
    end

    false
  end

  def four_vertically?
    count = 0

    for i in 0..board.length
      for n in 0..board.length - 2
        unless board[n][i] == "  "
          if board[n][i] == board[n + 1][i]
            count += 1
            return true if count == 3
  
          else
            count = 0
          end
        end
      end 
    end

    false
  end
end
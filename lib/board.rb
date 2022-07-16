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
end
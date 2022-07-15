# frozen_string_literal: true

class Board 
  def initialize
    @board = nil
  end

  def generate_board 
    @board = Array.new(6, Array.new(7, " "))
  end

  def display_board
    @board.each do |row|
      print "#{row}\n\n"
    end
  end
end
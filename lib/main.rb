# frozen_string_literal: true

require_relative "board"

red = "\u26d4"
puts red

white = "\u26aa"
puts white

board = Board.new
board.generate_board
board.display_board
# frozen_string_literal: true

require_relative "board"
require_relative "player"
require_relative "game"

board = Board.new
board.generate_board
board.display_board

game = Game.new
game.create_players
game.prompt_player1_for_symbol
player1_symbol = game.get_player1_symbol
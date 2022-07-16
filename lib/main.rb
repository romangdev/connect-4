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
player2_symbol = game.get_player2_symbol(player1_symbol)

player1 = game.player1
player2 = game.player2
player1.assign_symbol(player1_symbol)
puts "Player 1, you are playing as #{player1.player_symbol}"
player2.assign_symbol(player2_symbol)
puts "Player 2, you are playing as #{player2.player_symbol}"

#start of game loop
while true do 
  column_space = false
  until column_space
    board.display_board
    puts "Player 1 , choose your column (1 - 7):"
    p1_choice = game.get_column_choice
    column_space = game.place_column_choice(p1_choice, board.board, player1.player_symbol)
  end

  column_space = false
  until column_space
    board.display_board
    puts "Player 2, choose your column (1 - 7):"
    p2_choice = game.get_column_choice
    column_space = game.place_column_choice(p2_choice, board.board, player2.player_symbol)
  end
end
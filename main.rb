# frozen_string_literal: true

require_relative 'lib/board'
require_relative 'lib/player'
require_relative 'lib/game'

board = Board.new
board.generate_board
board.display_board

# create the players and get their symbols (game pieces)
game = Game.new
game.create_players
game.prompt_player1_for_symbol
player1_symbol = game.get_player1_symbol
player2_symbol = game.get_player2_symbol(player1_symbol)

# assign chosen game pieces to both players
player1 = game.player1
player2 = game.player2
player1.assign_symbol(player1_symbol)
puts "Player 1, you are playing as #{player1.player_symbol}"
player2.assign_symbol(player2_symbol)
puts "Player 2, you are playing as #{player2.player_symbol}"

# start the game loop
while true
  column_space = false
  until column_space
    column_space = game.player_turn(board, player1)

    next unless board.game_over?

    board.display_board
    game.check_winner(board.winner_symbol, player1.player_symbol, player2.player_symbol)
    return false
  end

  column_space = false
  until column_space
    column_space = game.player_turn(board, player2)

    next unless board.game_over?

    board.display_board
    game.check_winner(board.winner_symbol, player1.player_symbol, player2.player_symbol)
    return false
  end
end

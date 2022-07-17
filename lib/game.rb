# frozen_string_literal: true

require_relative 'player'
require_relative 'board'

class Game
  attr_accessor :player1, :player2

  def initialize(player1 = nil, player2 = nil)
    @player1 = player1
    @player2 = player2
  end

  def create_players
    @player1 = Player.new(1)
    @player2 = Player.new(2)
  end

  def prompt_player1_for_symbol
    puts <<~HEREDOC
      Player1 - type 'R' if you want to play red pieces
      Or 'W' if you want to play white pieces.\n
    HEREDOC
  end

  def get_player1_symbol
    player1_symbol = false

    until player1_symbol
      player1_choice = gets.chomp.upcase
      if player1_choice == 'R'
        return player1_symbol = "\u26d4"
      elsif player1_choice == 'W'
        return player1_symbol = "\u26aa"
      else
        puts "That wasn't a choice. Please try again."
      end
    end
  end

  def get_player2_symbol(player1_symbol)
    player2_symbol = if player1_symbol == "\u26aa"
                       "\u26d4"
                     else
                       "\u26aa"
                     end
  end

  # find out which column the player wants to place their symbol
  def get_column_choice
    flag = false

    until flag == true
      column = gets.to_i
      flag = validate_column_choice(column)
    end

    column - 1
  end

  # place the player's symbol in their column of choice
  def place_column_choice(player_choice, board, player_symbol)
    for i in 5.downto(0)
      if board[i][player_choice] == "\u26d4" || board[i][player_choice] == "\u26aa"
        next
      else
        board[i][player_choice] = player_symbol
        return board
      end
    end

    puts 'That column is full! Please try again.'
    false
  end

  # used when "game_over" is triggered to check which player won, or if board is full
  def check_winner(winner_symbol, player1_symbol, player2_symbol)
    if winner_symbol == player1_symbol
      puts 'Player 1 is the winner!'
    elsif winner_symbol == player2_symbol
      puts 'Player 2 is the winner!'
    else
      puts "The board is filled - it's a tie!"
    end
  end

  # runs one turn for a player
  def player_turn(board, player)
    board.display_board
    puts "Player #{player.player_number} #{player.player_symbol}, choose your column (1 - 7):"
    p1_choice = get_column_choice
    place_column_choice(p1_choice, board.board, player.player_symbol)
  end

  private

  def validate_column_choice(column)
    if column > 0 && column < 8
      true
    else
      puts 'Please enter a column between 1 and 7.'
      false
    end
  end
end

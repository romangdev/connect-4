# frozen_string_literal: true

require_relative "player"

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
    puts <<-HEREDOC
Player1 - type 'R' if you want to play red pieces
Or 'W' if you want to play white pieces.\n
HEREDOC
  end

  def get_player1_symbol
    player1_symbol = false

    until player1_symbol
      player1_choice = gets.chomp.upcase
      if player1_choice == "R"
        return player1_symbol = "\u26d4"
      elsif player1_choice == "W"
        return player1_symbol = "\u26aa"
      else
        puts "That wasn't a choice. Please try again."
      end
    end
  end

  def get_player2_symbol(player1_symbol)
    if player1_symbol == "\u26aa"
      return player2_symbol = "\u26d4"
    else 
      return player2_symbol = "\u26aa"
    end
  end

  def get_column_choice
    flag = false

    until flag == true
      column = gets.to_i
      flag = validate_column_choice(column)
    end

    column - 1
  end

  def place_column_choice(player_choice, board, player_symbol)
    for i in 5.downto(0)
      if board[i][player_choice] == "\u26d4" || board[i][player_choice] == "\u26aa"
        next
      else
        board[i][player_choice] = player_symbol
        return board
      end
    end

    puts "That column is full! Please try again."
    return false
  end

  private 

  def validate_column_choice(column)
    if column > 0 && column < 8
      return true
    else 
      puts "Please enter a column between 1 and 7."
      return false
    end
  end
end
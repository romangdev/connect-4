# frozen_string_literal: true

require_relative "player"

class Game
  attr_accessor :player1, :player2

  def initialize(player1 = nil, player2 = nil)
    @player1 = player1
    @player2 = player2
  end

  def create_players
    @player1 = Player.new
    @player2 = Player.new
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
end
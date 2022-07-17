# frozen_string_literal: true

class Board
  attr_accessor :board, :winner_symbol

  def initialize
    @board = nil
    @winner_symbol = nil
  end

  def generate_board
    @board = Array.new(6) { Array.new(7, '  ') }
  end

  def display_board
    @board.each do |row|
      print "#{row}\n\n"
    end
  end

  # check if the board has been completely filled with symbols (no more open spots)
  def board_full?
    @board.each do |row|
      row.each do |column|
        return false if column == '  '
      end
    end

    true
  end

  # check if four of same symbols are connected horizontally
  def four_horizontally?
    count = 0

    @board.each do |row|
      for i in 0..row.length - 2
        unless row[i] == '  '
          if row[i] == row[i + 1]
            count += 1
            if count == 3
              @winner_symbol = row[i]
              return true
            end
          else
            count = 0
          end
        end
      end
    end

    false
  end

  # check if four of same symbols are connected vertically
  def four_vertically?
    count = 0

    for i in 0..@board.length
      for n in 0..@board.length - 2
        unless @board[n][i] == '  '
          if @board[n][i] == @board[n + 1][i]
            count += 1
            if count == 3
              @winner_symbol = @board[n][i]
              return true
            end
          else
            count = 0
          end
        end
      end
    end

    false
  end

  # check if four of same symbols are connected diagaonally
  def four_diagonally?
    return true if four_down_diagonally?
    return true if four_up_diagonally?

    false
  end

  def game_over?
    return true if four_diagonally? || four_horizontally? || four_vertically?
    return true if board_full?

    false
  end

  private

  # used in a public method to check four any rising diagonal win
  def four_down_diagonally?
    for i in 0..2
      for n in 0..3
        unless @board[i][n] == '  '
          if @board[i][n] == @board[i + 1][n + 1] &&
             @board[i][n] == @board[i + 2][n + 2] &&
             @board[i][n] == @board[i + 3][n + 3]

            @winner_symbol = @board[i][n]
            return true
          else
            next
          end
        end
      end
    end

    false
  end

  # used in a public method to check four any falling diagonal win
  def four_up_diagonally?
    for i in 5.downto(3)
      for n in 0..3
        unless @board[i][n] == '  '
          if @board[i][n] == @board[i - 1][n + 1] &&
             @board[i][n] == @board[i - 2][n + 2] &&
             @board[i][n] == @board[i - 3][n + 3]

            @winner_symbol = @board[i][n]
            return true
          else
            next
          end
        end
      end
    end

    false
  end
end

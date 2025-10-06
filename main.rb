# frozen_string_literal: true

=begin
Requirements:

GameBoard
- Display board
- Place piece at lowest space in column

Player
- Has a piece
- Make turn (using a board)

ConnectFourGame
- Get Player Names
- Start Game (loop)
  - Keep track of turns
- Check for win (using board)
- Game Over method that prints winner's name
=end


class GameBoard
  def initialize(rows = 6, columns = 7)
    @board = Array.new(rows) { Array.new(columns) { '*' } }
  end

  def print_board
    @board.each do |row|
      puts row.join(" ")
    end
  end

  def place_piece
    #code this
  end

  end
end

class Player
  def initalize(name, piece)
    @name = name
    @piece = piece
  end
end

class ConnectFourGame
  # not yet
end

puts '㉧ ㉨'
puts '㉧ ㉨'
puts '㉧ ㉨'
puts '㉧ ㉨'
puts '㉧ ㉨'
puts '㉧ ㉨'
puts

game_board = GameBoard.new
# game_board.print_board
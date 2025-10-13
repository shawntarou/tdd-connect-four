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
  attr_reader :board

  def initialize(rows = 6, columns = 7)
    @board = Array.new(rows) { Array.new(columns) { '*' } }
  end

  def print_board
    @board.each do |row|
      puts row.join(" ")
    end
  end

  def place_piece(column_num, piece)
    board_column_num = column_num - 1

    @board.reverse_each.with_index do |row, index|
      if row[board_column_num] == "*" 
        row[board_column_num] = piece 
        return
      end
    end
  end
end

class Player
  attr_accessor :name, :player_num

  def initialize(name, piece, player_num)
    @name = name
    @piece = piece
    @player_num = player_num
  end
end

class ConnectFourGame
  def initalize
    @board = GameBoard.new
    @player_one = Player.new('Player 1', '㉧', 1)
    @player_two = Player.new('Player 2', '㉨', 2)
  end


  def start_game

  end
  
  private
  
  def get_player_name(player)
    puts "Player #{player.player_num} Name:"
    puts "Press Enter For Default Name - \"#{player.name}\""
    print '> '
    entered_name = gets.chomp
    unless entered_name == ''
      player.name = entered_name
    end
  end
  
  def valid_move?(column_num)
    @board.reverse_each.with_index do |row, index|
      if row[board_column_num] == "*" 
        return true
      end
    end

    false
  end
end



# puts '㉧ ㉨'
# puts '㉧ ㉨'
# puts '㉧ ㉨'
# puts '㉧ ㉨'
# puts '㉧ ㉨'
# puts '㉧ ㉨'
# puts

# game_board = GameBoard.new
# game_board.print_board

player_one = Player.new('George', '%', 1)
game = ConnectFourGame.new
game.get_player_name(player_one)
puts
puts player_one.name


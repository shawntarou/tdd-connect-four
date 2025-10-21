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

require 'colorize'

class GameBoard
  attr_reader :board, :rows, :columns

  def initialize(rows = 6, columns = 7)
    @rows = rows
    @columns = columns
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
  attr_accessor :name, :player_num, :piece

  def initialize(name, piece, player_num)
    @name = name
    @piece = piece
    @player_num = player_num
  end
end

class ConnectFourGame
  attr_accessor  :player_one, :player_two

  def initalize
    @board = GameBoard.new
    @player_one = Player.new('Player 1', '㉧', 1)
    @player_two = Player.new('Player 2', '㉨', 2)
  end


  def start_game

  end
  
  def win?(board, player)
    # horizontal check
    (board.rows).times do |i|
      (board.columns - 3).times do |j|
        if board.board[i][j] == player.piece && board.board[i][j+1] == player.piece && board.board[i][j+2] == player.piece && board.board[i][j+3] == player.piece
          return true
        end
      end
    end

    # vertical check
    (board.rows - 3).times do |i|
      (board.columns).times do |j|
        if board.board[i][j] == player.piece && board.board[i+1][j] && board.board[i+2][j] && board.board[i+3][j]
          return true
        end
      end
    end

    # ascending diagonal check
    # (board.rows).times do |i|
    #   (board.columns - 3).times do |j|

    #   end
    # end

    false
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

player = Player.new('Player 1', '*', 1)
game = ConnectFourGame.new
horizontal_board = GameBoard.new
(1...5).each do |i|
  horizontal_board.place_piece(i ,'*'.colorize(:blue))
end

vertical_board = GameBoard.new
4.times do 
  vertical_board.place_piece(4 ,'*'.colorize(:red))
end

horizontal_board.print_board
puts
vertical_board.print_board
puts "Horizontal Check: #{game.win?(horizontal_board, player)}"
puts "Vertical Check: #{(game.win?(vertical_board, player))}"
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
require_relative 'player.rb'
require_relative 'gameboard.rb'

class ConnectFourGame
  attr_accessor  :player_one, :player_two

  def initialize
    @board = GameBoard.new
    @player_one = Player.new('Player 1', '^'.colorize(:red), 1)
    @player_two = Player.new('Player 2', '^'.colorize(:blue), 2)
  end

  # def start_game
  #   get_player_name(@player_one)
  #   get_player_name(@player_two)

  #   puts
  #   puts "#{@player_one.name} VS #{@player_two.name}"
  #   puts "----START----\n".colorize(:red)

  #   round_num = 0
  #   loop do
  #     puts "ROUND #{round_num += 1} - #{player_one.name}"

  #     # PLAYER 1 TURN
  #     @board.print_board
  #     puts
  #     puts "Pick from columns 1 - #{@board.columns}"
  #     print '> '
  #     player_choice = Integer(gets.chomp)
  #     unless (valid_move?(player_choice))
  #       puts "Pick from columns 1 - #{@board.columns}"
  #       print '> '
  #       player_choice = Integer(gets.chomp)
  #     end
  #     @board.place_piece(player_choice, @player_one.piece)

      

  #     break
  #   end
  # end

  private
  
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
        if board.board[i][j] == player.piece && board.board[i+1][j] == player.piece && board.board[i+2][j] == player.piece && board.board[i+3][j] == player.piece
          return true
        end
      end
    end

    # ascending diagonal check (bottom left -> top right)
    (3...board.rows).each do |i|
      (board.columns - 3).times do |j|
        if board.board[i][j] == player.piece && board.board[i-1][j+1] == player.piece && board.board[i-2][j+2] == player.piece && board.board[i-3][j+3] == player.piece
          return true
        end
      end
    end

    # descending diagonal check (bottom right -> top left)
    (3...board.rows).each do |i|
      (board.columns).times do |j|
        if board.board[i][j] == player.piece && board.board[i-1][j-1] == player.piece && board.board[i-2][j-2] == player.piece && board.board[i-3][j-3] == player.piece
          return true
        end
      end
    end

    false
  end
  
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
    @board.board.reverse_each.with_index do |row, index|
      if row[column_num] == "*" 
        return true
      end
    end

    false
  end
end

# game = ConnectFourGame.new
# game.start_game


# game_board = GameBoard.new
# game_board.print_board

# player_sign = '^'.colorize(:blue)
# player = Player.new('Player 1', player_sign, 1)
# game = ConnectFourGame.new
# horizontal_board = GameBoard.new
# (1...5).each do |i|
#   horizontal_board.place_piece(i, player_sign)
# end

# vertical_board = GameBoard.new
# 4.times do 
#   vertical_board.place_piece(4 , player_sign)
# end

# ascending_diagonal_board = GameBoard.new
# ascending_diagonal_board.board = [['*', '*', '*', '*', '*', '*', '*'], 
#                                   ['*', '*', '*', '*', '*', '*', '*'], 
#                                   ['*', '*', '*', player_sign, '*', '*', '*'], 
#                                   ['*', '*', player_sign, '*', '*', '*', '*'], 
#                                   ['*', player_sign, '*', '*', '*', '*', '*'], 
#                                   [player_sign, '*', '*', '*', '*', '*', '*']]

# descending_diagonal_board = GameBoard.new
# descending_diagonal_board.board = [['*', '*', '*', player_sign, '*', '*', '*'], 
#                                   ['*', '*', '*', '*', player_sign, '*', '*'], 
#                                   ['*', '*', '*', '*', '*', player_sign, '*'], 
#                                   ['*', '*', '*', '*', '*', '*', player_sign], 
#                                   ['*', '*', '*', '*', '*', '*', '*'], 
#                                   ['*', '*', '*', '*', '*', '*', '*']]


# horizontal_board.print_board
# puts
# vertical_board.print_board
# puts
# ascending_diagonal_board.print_board
# puts
# descending_diagonal_board.print_board

# puts "Horizontal Check: #{game.win?(horizontal_board, player)}"
# puts "Vertical Check: #{(game.win?(vertical_board, player))}"
# puts "Ascending Diag Check: #{(game.win?(ascending_diagonal_board, player))}"
# puts "Descending Diag Check: #{(game.win?(descending_diagonal_board, player))}"
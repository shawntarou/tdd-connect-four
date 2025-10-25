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
  attr_accessor  :player_one, :player_two, :board

  def initialize
    @player_one = Player.new('Player 1', '^'.colorize(:red), 1)
    @player_two = Player.new('Player 2', '^'.colorize(:blue), 2)
  end

  def start_game
    system "clear" 
    get_player_name(@player_one)
    system "clear" 
    get_player_name(@player_two)
    system "clear" 

    board_size_list = get_board_size_list
    rows = board_size_list[0]
    columns = board_size_list[1]
    @board = GameBoard.new(rows, columns)

    puts @board.rows
    puts @board.columns
    
    system "clear"

    puts "#{@player_one.name} VS #{@player_two.name}"
    puts "LOADING BOARD\n".colorize(:yellow)
    sleep(1)
    puts "----START----\n".colorize(:red)
    sleep(0.5)

    round_num = 1
    won = false
    winner = nil
    tied = false

    #GAME LOOP
    loop do
      system "clear"

      puts "#{@player_one.name} VS #{@player_two.name}\n\n"
      # PLAYER 1 TURN
      puts "ROUND #{round_num} - #{player_one.name}"
      @board.print_board
      puts
      player_choice = get_valid_choice

      @board.place_piece(player_choice, @player_one.piece)

      if win?(@board, @player_one)
        won = true
        winner = @player_one
        break
      end
      
      if tie?(@board, @player_one, @player_two)
        tied = true
        break
      end
      
      system "clear" 

      puts "#{@player_one.name} VS #{@player_two.name}\n\n"
      # PLAYER 2 TURN
      puts "ROUND #{round_num} - #{player_two.name}"
      @board.print_board
      puts
      player_choice = get_valid_choice

      @board.place_piece(player_choice, @player_two.piece)

      if win?(@board, @player_two)
        won = true
        winner = @player_two
        break
      end
      
      if tie?(@board, @player_one, @player_two)
        tied = true
        break
      end

      system "clear" 

      round_num += 1
    end

    system "clear" 

    puts 'GAME OVER'
    @board.print_board
    
    if won
      print_win_message(winner)
    end
    
    if tied
      print_tie_message
    end

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
      (3...board.columns).each do |j|
        if board.board[i][j] == player.piece && board.board[i-1][j-1] == player.piece && board.board[i-2][j-2] == player.piece && board.board[i-3][j-3] == player.piece
          return true
        end
      end
    end

    false
  end
  
  def tie?(board, player_one, player_two)
    if win?(board, player_one) == false && win?(board, player_two) == false && board.full?
      return true
    end

    false
  end

  private

  def print_win_message(winner)
    3.times do
      puts "#{winner.name} IS THE WINNER!!".colorize(:green)
      sleep(0.1)
    end
  end
  
  def print_tie_message
    puts 'TIE - NO CONTEST'
  end
  
  def get_valid_choice
    puts "Pick from columns 1 - #{@board.columns}"
    print '> '

    while player_choice = gets.chomp 
      if player_choice.to_i.to_s == player_choice && player_choice.to_i >= 1 && player_choice.to_i <= @board.columns && @board.column_full?(player_choice.to_i) == false
        player_choice = player_choice.to_i
        break
      else
        puts "Pick from columns 1 - #{@board.columns}"
        print '> '
      end
    end
    
    puts

    player_choice
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

  def get_board_size_list
    puts "Board Size:"
    puts "Press Enter For Default Board Size - 6x7"
    print '> '
    entered_size_list = [6, 7]

    while entered_size = gets.chomp
      if entered_size == ''
        break
      end

      if (entered_size.include? 'x') && Integer(entered_size_list[0], exception: false) && Integer(entered_size_list[1], exception: false)
        entered_size_list = entered_size.split('x').map(&:to_i)
        break
      else
        puts "Board Size:"
        puts "Press Enter For Default Board Size - 6x7"
        print '> '
      end
    end

    entered_size_list
  end
end


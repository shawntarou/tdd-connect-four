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
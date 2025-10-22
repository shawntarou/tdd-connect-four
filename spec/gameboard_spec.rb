require_relative '../gameboard.rb'

describe GameBoard do 
  describe '#print_board' do
    subject(:board) { described_class.new() }

    context 'when there are no pieces on the board' do
      it 'prints expected board' do
        expected_output = <<~HEREDOC 
          * * * * * * *
          * * * * * * *
          * * * * * * *
          * * * * * * *
          * * * * * * *
          * * * * * * *
        HEREDOC

        expect { board.print_board }.to output(expected_output).to_stdout
      end
    end
  end

  describe '#place_piece' do
    subject(:board) { described_class.new() }

    context 'when there are no pieces on the board' do
      it 'places the piece in the bottom row' do
        expected_board = [['*', '*', '*', '*', '*', '*', '*'], 
                          ['*', '*', '*', '*', '*', '*', '*'], 
                          ['*', '*', '*', '*', '*', '*', '*'], 
                          ['*', '*', '*', '*', '*', '*', '*'], 
                          ['*', '*', '*', '*', '*', '*', '*'], 
                          ['*', '*', '*', '*', '*', '*', '1']]

        board.place_piece(7, '1')
        expect(board.board).to eq(expected_board)
      end
    end

    context 'when there are three pieces already in selected column' do
      it 'places piece in third row' do
        expected_board = [['*', '*', '*', '*', '*', '*', '*'], 
                          ['*', '*', '*', '*', '*', '*', '*'], 
                          ['*', '*', '*', '1', '*', '*', '*'], 
                          ['*', '*', '*', '1', '*', '*', '*'], 
                          ['*', '*', '*', '1', '*', '*', '*'], 
                          ['*', '*', '*', '1', '*', '*', '*']]
        
        4.times do
          board.place_piece(4, '1')
        end

        expect(board.board).to eq(expected_board)
      end
    end
  end

  describe '#full?' do
    subject(:board) { described_class.new() }

    context 'when the board is full' do
      it 'returns true' do
        board.board = [['^', '1', '1', '^', '^', '1', '^'], 
                      ['1', '^', '1', '1', '1', '^', '1'], 
                      ['1', '1', '^', '^', '^', '1', '1'], 
                      ['^', '^', '^', '1', '1', '^', '^'], 
                      ['1', '1', '^', '^', '^', '1', '^'], 
                      ['^', '^', '1', '1', '1', '^', '1']]

        expect(board.full?).to be(true)
      end
    end

    context 'when the board is not full'do
      it 'returns false' do
        board.board = [['*', '1', '1', '^', '^', '1', '^'], 
                      ['1', '^', '1', '1', '1', '^', '1'], 
                      ['1', '1', '^', '^', '^', '1', '1'], 
                      ['^', '^', '^', '1', '1', '^', '^'], 
                      ['1', '1', '^', '^', '^', '1', '^'], 
                      ['^', '^', '1', '1', '1', '^', '1']]


        expect(board.full?).to be(false)
      end
    end
  end

  describe '#column_full?' do
    subject(:board) { described_class.new() }

    context 'when selected column is full' do
      it 'returns true' do
        board.board = [['*', '*', '*', '*', '*', '*', '1'], 
                      ['*', '*', '*', '*', '*', '*', '1'], 
                      ['*', '*', '*', '*', '*', '*', '1'], 
                      ['*', '*', '*', '*', '*', '*', '1'], 
                      ['*', '*', '*', '*', '*', '*', '1'], 
                      ['*', '*', '*', '*', '*', '*', '1']]

        expect(board.column_full?(7)).to be (true)
      end
    end

    context 'when selected column is not full' do
      it 'returns false' do
        board.board = [['*', '*', '*', '*', '*', '*', '*'], 
                      ['*', '*', '*', '*', '*', '*', '*'], 
                      ['*', '*', '*', '*', '*', '*', '1'], 
                      ['*', '*', '*', '*', '*', '*', '1'], 
                      ['*', '*', '*', '*', '*', '*', '1'], 
                      ['*', '*', '*', '*', '*', '*', '1']]

        expect(board.column_full?(7)).to be (false)
      end
    end
  end
end
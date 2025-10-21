require_relative '../connectfourgame.rb'

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
                          ['*', '*', '*', '*', '*', '*', '㉧']]

        board.place_piece(7, '㉧')
        expect(board.board).to eq(expected_board)
      end
    end

    context 'when there are three pieces already in selected column' do
      it 'places piece in third row' do
        expected_board = [['*', '*', '*', '*', '*', '*', '*'], 
                          ['*', '*', '*', '*', '*', '*', '*'], 
                          ['*', '*', '*', '㉧', '*', '*', '*'], 
                          ['*', '*', '*', '㉧', '*', '*', '*'], 
                          ['*', '*', '*', '㉧', '*', '*', '*'], 
                          ['*', '*', '*', '㉧', '*', '*', '*']]
        
        4.times do
          board.place_piece(4, '㉧')
        end

        expect(board.board).to eq(expected_board)
      end
    end
  end

  describe 'full?' do
    subject(:board) { described_class.new() }

    context 'when the board is full of pieces' do
      it 'returns true' do
        board.board = [['^', '㉧', '㉧', '^', '^', '㉧', '^'], 
                      ['㉧', '^', '㉧', '㉧', '㉧', '^', '㉧'], 
                      ['㉧', '㉧', '^', '^', '^', '㉧', '㉧'], 
                      ['^', '^', '^', '㉧', '㉧', '^', '^'], 
                      ['㉧', '㉧', '^', '^', '^', '㉧', '^'], 
                      ['^', '^', '㉧', '㉧', '㉧', '^', '㉧']]

        expect(board.full?).to eq(true)
      end
    end

    context 'when the board has room for pieces'do
      it 'returns false' do
        board.board = [['*', '㉧', '㉧', '^', '^', '㉧', '^'], 
                      ['㉧', '^', '㉧', '㉧', '㉧', '^', '㉧'], 
                      ['㉧', '㉧', '^', '^', '^', '㉧', '㉧'], 
                      ['^', '^', '^', '㉧', '㉧', '^', '^'], 
                      ['㉧', '㉧', '^', '^', '^', '㉧', '^'], 
                      ['^', '^', '㉧', '㉧', '㉧', '^', '㉧']]


        expect(board.full?).to eq(false)
      end
    end
  end
end
require_relative '../main.rb'

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
end

describe ConnectFourGame do
  subject(:game) { described_class.new() }
  describe '#get_player_name' do
    context 'when player presses enter' do
      it 'uses default name' do
        allow($stdin).to receive(:gets).and_return('')
        expect()
      end
    end
  end
end
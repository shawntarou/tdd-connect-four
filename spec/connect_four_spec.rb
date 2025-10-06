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
end
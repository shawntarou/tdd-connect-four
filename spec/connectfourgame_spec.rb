require_relative '../connectfourgame.rb'

describe ConnectFourGame do
  describe('#win?') do
    subject(:game) { described_class.new() }
    
    context 'when player one wins vertically' do
      it 'returns true' do
        game.board.board = [['*', '*', '*', '*', '*', '*', '*'], 
                            ['*', '*', '*', '*', '*', '*', '*'], 
                            ['*', '*', '*', '*', '*', '*', '1'], 
                            ['*', '*', '*', '*', '*', '*', '1'], 
                            ['*', '*', '*', '*', '*', '*', '1'], 
                            ['*', '*', '*', '*', '*', '*', '1']]

        game.player_one.piece = '1'
        
        expect(game.win?(game.board, game.player_one)).to be(true)
      end
    end

    context 'when player one wins horizontally' do
      it 'returns true' do
        game.board.board = [['*', '*', '*', '*', '*', '*', '*'], 
                            ['*', '*', '*', '*', '*', '*', '*'], 
                            ['*', '*', '*', '*', '*', '*', '*'], 
                            ['*', '*', '*', '*', '*', '*', '*'], 
                            ['*', '*', '*', '*', '*', '*', '*'], 
                            ['*', '*', '*', '1', '1', '1', '1']]

        game.player_one.piece = '1'
        
        expect(game.win?(game.board, game.player_one)).to be(true)
      end
    end

    context 'when player one wins diagonal up' do
      it 'returns true' do
        game.board.board = [['*', '*', '*', '*', '*', '*', '*'], 
                            ['*', '*', '*', '*', '*', '*', '*'], 
                            ['*', '*', '*', '*', '*', '*', '1'], 
                            ['*', '*', '*', '*', '*', '1', '*'], 
                            ['*', '*', '*', '*', '1', '*', '*'], 
                            ['*', '*', '*', '1', '*', '*', '*']]

        game.player_one.piece = '1'
        
        expect(game.win?(game.board, game.player_one)).to be(true)
      end
    end

    context 'when player one wins diagonal down' do
      it 'returns true' do
        game.board.board = [['*', '*', '*', '*', '*', '*', '*'], 
                            ['*', '*', '*', '*', '*', '*', '*'], 
                            ['1', '*', '*', '*', '*', '*', '*'], 
                            ['*', '1', '*', '*', '*', '*', '*'], 
                            ['*', '*', '1', '*', '*', '*', '*'], 
                            ['*', '*', '*', '1', '*', '*', '*']]

        game.player_one.piece = '1'
        
        expect(game.win?(game.board, game.player_one)).to be(true)
      end
    end

    context 'when the game is a tie' do
      it 'returns false' do
        game.board.board = [['^', '1', '1', '^', '^', '1', '^'], 
                            ['1', '^', '1', '1', '1', '^', '1'], 
                            ['1', '1', '^', '^', '^', '1', '1'], 
                            ['^', '^', '^', '1', '1', '^', '^'], 
                            ['1', '1', '^', '^', '^', '1', '^'], 
                            ['^', '^', '1', '1', '1', '^', '1']]

        game.player_one.piece = '1'
        
        expect(game.win?(game.board, game.player_one)).to be(false)
      end
    end
    
    context 'when the board is empty' do
      it 'returns false' do
        expect(game.win?(game.board, game.player_one)).to be(false)
      end
    end
  end

  describe('#tie?') do
    subject(:game) { described_class.new() }

    context 'when the game is a tie' do
      it 'returns true' do
        game.board.board = [['^', '1', '1', '^', '^', '1', '^'], 
                            ['1', '^', '1', '1', '1', '^', '1'], 
                            ['1', '1', '^', '^', '^', '1', '1'], 
                            ['^', '^', '^', '1', '1', '^', '^'], 
                            ['1', '1', '^', '^', '^', '1', '^'], 
                            ['^', '^', '1', '1', '1', '^', '1']]
        game.player_one.piece = '1'
        game.player_two.piece = '^'
        
        expect(game.tie?(game.board, game.player_one, game.player_two)).to be (true)
      end
    end
    
    context 'when the game is not a tie' do
      it 'returns false' do
        game.board.board = [['^', '1', '1', '^', '^', '1', '^'], 
                            ['1', '^', '1', '1', '1', '^', '1'], 
                            ['1', '1', '^', '^', '^', '1', '1'], 
                            ['^', '^', '^', '1', '1', '^', '^'], 
                            ['1', '1', '^', '1', '^', '1', '^'], 
                            ['^', '^', '1', '1', '1', '^', '1']]
        game.player_one.piece = '1'
        game.player_two.piece = '^'
      
        expect(game.tie?(game.board, game.player_one, game.player_two)).to be (false)
      end
    end
  end
end

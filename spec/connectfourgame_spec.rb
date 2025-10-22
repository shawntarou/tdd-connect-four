require_relative '../connectfourgame.rb'
require_relative '../gameboard.rb'
require_relative '../player.rb'

describe ConnectFourGame do
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
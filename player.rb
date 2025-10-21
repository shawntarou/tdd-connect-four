class Player
  attr_accessor :name, :player_num, :piece

  def initialize(name, piece, player_num)
    @name = name
    @piece = piece
    @player_num = player_num
  end
end
class Game
  attr_reader :player_one, :player_two, :current_player

  def initialize
    @player_one = Player.new('X')
    @player_two = Player.new('O')
    @current_player = player_one
    @board = Board.new
  end
end

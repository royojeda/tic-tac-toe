class Player
  attr_reader :mark
  attr_accessor :move

  def initialize(mark)
    @mark = mark
  end

  def update_move(player_input)
    self.move = player_input
  end
end

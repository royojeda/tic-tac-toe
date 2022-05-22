class Player
  attr_reader :mark, :move

  def initialize(mark)
    @mark = mark
  end

  def update_move(player_input)
    self.move = player_input
  end

  private

  attr_writer :move
end

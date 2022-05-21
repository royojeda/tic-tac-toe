class Board
  attr_reader :spaces

  def initialize
    @spaces = Array.new(9, ' ')
  end

  def taken?(move)
    spaces[move - 1] != ' '
  end

  def record(player)
    spaces[player.move - 1] = player.mark
    p spaces
  end
end

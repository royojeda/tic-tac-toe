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

  def full?
    spaces.none?(' ')
  end

  def three_in_a_row?
    columns?
  end

  def columns?
    left_column? || middle_column? || right_column?
  end

  def left_column?
    spaces[0] != ' ' && spaces[0] == spaces[3] && spaces[3] == spaces[6]
  end

  def middle_column?
    spaces[1] != ' ' && spaces[1] == spaces[4] && spaces[4] == spaces[7]
  end

  def right_column?
    spaces[2] != ' ' && spaces[2] == spaces[5] && spaces[5] == spaces[8]
  end
end

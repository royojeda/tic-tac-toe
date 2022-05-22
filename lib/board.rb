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
    columns? || rows? || diagonals?
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

  def rows?
    top_row? || middle_row? || bottom_row?
  end

  def top_row?
    spaces[0] != ' ' && spaces[0] == spaces[1] && spaces[1] == spaces[2]
  end

  def middle_row?
    spaces[3] != ' ' && spaces[3] == spaces[4] && spaces[4] == spaces[5]
  end

  def bottom_row?
    spaces[6] != ' ' && spaces[6] == spaces[7] && spaces[7] == spaces[8]
  end

  def diagonals?
    downward_diagonal? || upward_diagonal?
  end

  def downward_diagonal?
    spaces[0] != ' ' && spaces[0] == spaces[4] && spaces[4] == spaces[8]
  end

  def upward_diagonal?
    spaces[6] != ' ' && spaces[6] == spaces[4] && spaces[4] == spaces[2]
  end
end

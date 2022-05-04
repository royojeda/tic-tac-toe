class Move
  @@board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

  def initialize(player, move)
    @player = player
    @move = move
    make_move
    show_board
  end

  def show_board
    puts " #{@@board[0]} | #{@@board[1]} | #{@@board[2]} "
    puts '---|---|---'
    puts " #{@@board[3]} | #{@@board[4]} | #{@@board[5]} "
    puts '---|---|---'
    puts " #{@@board[6]} | #{@@board[7]} | #{@@board[8]} "
  end

  private

  attr_accessor :player, :move

  def make_move
    @@board[self.move - 1] = player
  end
end

turn1 = Move.new("X", 5)
puts "---------------------------------"
turn2 = Move.new("O", 3)

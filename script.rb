class Move
  @@board = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
  @@current_player = 'X'

  def initialize(player, move)
    @player = player
    @move = move.to_i
    make_move
    show_board
  end

  def show_board
    system 'clear'
    puts " #{@@board[0]} | #{@@board[1]} | #{@@board[2]} "
    puts '---|---|---'
    puts " #{@@board[3]} | #{@@board[4]} | #{@@board[5]} "
    puts '---|---|---'
    puts " #{@@board[6]} | #{@@board[7]} | #{@@board[8]} "
  end

  def self.finished?
    false
  end

  def self.new_turn
    puts "Player #{@@current_player}'s turn. Please enter your move: "
    move = gets.chomp
    Move.new(@@current_player, move)
    @@current_player = @@current_player == 'X' ? 'O' : 'X'
  end

  private

  attr_reader :player, :move

  def make_move
    @@board[move - 1] = player
  end
end

Move.new_turn until Move.finished?

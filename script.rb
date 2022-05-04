class Move
  @@board = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
  @@current_player = 'X'

  def self.show_board
    system 'clear'
    puts " #{@@board[0]} | #{@@board[1]} | #{@@board[2]} "
    puts '---|---|---'
    puts " #{@@board[3]} | #{@@board[4]} | #{@@board[5]} "
    puts '---|---|---'
    puts " #{@@board[6]} | #{@@board[7]} | #{@@board[8]} "
  end

  def initialize(player, move)
    @player = player
    @move = move.to_i
    make_move
    Move.show_board
  end

  def self.finished?
    check_column_one || check_column_two || check_column_three ||
    check_row_one || check_row_two || check_row_three
  end

  def self.new_turn
    puts "Player #{@@current_player}'s turn. Please enter your move: "
    move = gets.chomp
    Move.new(@@current_player, move)
    @@current_player = @@current_player == 'X' ? 'O' : 'X'
  end

  def self.check_column_one
    if @@board[0] != ' ' &&
       @@board[3] == @@board[0] &&
       @@board[6] == @@board[3]
      return true
    end

    false
  end

  def self.check_column_two
    if @@board[1] != ' ' &&
       @@board[4] == @@board[1] &&
       @@board[7] == @@board[4]
      return true
    end

    false
  end

  def self.check_column_three
    if @@board[2] != ' ' &&
       @@board[5] == @@board[2] &&
       @@board[8] == @@board[5]
      return true
    end

    false
  end

  def self.check_row_one
    if @@board[0] != ' ' &&
       @@board[1] == @@board[0] &&
       @@board[2] == @@board[1]
      return true
    end

    false
  end

  def self.check_row_two
    if @@board[3] != ' ' &&
       @@board[4] == @@board[3] &&
       @@board[5] == @@board[4]
      return true
    end

    false
  end

  def self.check_row_three
    if @@board[6] != ' ' &&
       @@board[7] == @@board[6] &&
       @@board[8] == @@board[7]
      return true
    end

    false
  end

  private

  attr_reader :player, :move

  def make_move
    @@board[move - 1] = player
  end
end

Move.show_board
Move.new_turn until Move.finished?

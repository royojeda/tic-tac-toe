class Player
  attr_reader :mark, :move

  def initialize(mark)
    @mark = mark
    @move = nil
  end

  def update_move(player_input)
    self.move = player_input
  end

  def make_move
    puts "Player #{mark}'s turn. Please enter your move: "
    self.move = gets.chomp.to_i
  end

  private

  attr_writer :move
end

class Game
  def initialize
    @players = [Player.new('X'), Player.new('O')]
    @current_player = players[0]
    @board = Board.new
    @error = nil
  end

  def play
    turn until over?
    show_result
  end

  private

  attr_reader :board
  attr_accessor :players, :current_player, :error

  def turn
    valid_move
    board.update(current_player)
    players.rotate!
    self.current_player = players[0]
  end

  def valid_move
    loop do
      display
      current_player.make_move

      if valid?(current_player.move)
        self.error = nil
        break
      end
    end
  end

  def display
    system 'clear'
    puts error
    board.status
  end

  def valid?(input)
    if accepted_value?(input)
      return true unless board.taken?(input)

      self.error = 'That space is taken. Please enter a different move.'
    else
      self.error = 'Invalid move. Please enter a number between 1 and 9 (inclusive).'
    end
    false
  end

  def accepted_value?(value)
    value.between?(1, 9)
  end

  def over?
    board.full? || board.three_in_a_row?
  end

  def show_result
    display
    if board.full? && !board.three_in_a_row?
      puts "GAME OVER! It's a draw."
    else
      winning_player = players[1]
      puts "GAME OVER! Player #{winning_player.mark} has won!"
    end
  end
end

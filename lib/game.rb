class Game
  def initialize
    @players = [Player.new('X'), Player.new('O')]
    @current_player = players[0]
    @board = Board.new
  end

  def play
    turn until over?
    show_result
  end

  private

  attr_reader :current_player, :board
  attr_accessor :players

  def turn
    current_player.make_move
    board.update(current_player) if valid?(current_player.move)
    players.rotate!
    @current_player = players[0]
  end

  def valid?(input)
    if accepted_value?(input)
      return input unless board.taken?(input)

      system 'clear'
      puts 'That space is taken. Please enter a different move.'
    else
      system 'clear'
      puts 'Invalid move. Please enter a number between 1 and 9 (inclusive).'
    end
    turn
  end

  def accepted_value?(value)
    value.between?(1, 9)
  end

  def over?
    board.full? || board.three_in_a_row?
  end

  def show_result
    if board.full?
      puts "GAME OVER! It's a draw."
    else
      winning_player = players[1]
      puts "GAME OVER! Player #{winning_player.mark} has won!"
    end
  end
end

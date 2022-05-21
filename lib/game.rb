class Game
  attr_reader :player_one, :player_two, :current_player

  def initialize
    @player_one = Player.new('X')
    @player_two = Player.new('O')
    @current_player = player_one
    @board = Board.new
  end

  def start
    validated_move = take_move
  end

  def take_move
    loop do
      puts "Player #{current_player}'s turn. Please enter your move: "
      player_input = current_player.move
      return player_input if valid?(player_input)

      system 'clear'
      puts 'Invalid move. Please enter a number between 1 and 9 (inclusive).'
    end
  end

  def valid?(input)
    input.match?(/^[1-9]$/)
  end
end

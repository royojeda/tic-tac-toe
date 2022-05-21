class Game
  attr_reader :current_player, :board
  attr_accessor :move, :players

  def initialize
    @players = [Player.new('X'), Player.new('O')]
    @current_player = players[0]
    @board = Board.new
  end

  def start
    play_turn until over?
  end

  def play_turn
    valid_move = take_move
    current_player.update_move(valid_move)
    board.record(current_player)
    players.rotate!
    @current_player = players[0]
  end

  def take_move
    loop do
      player_input = prompt_input
      if value_valid?(player_input)
        integer_input = player_input.to_i
        return integer_input unless board.taken?(integer_input)

        system 'clear'
        puts 'That space is taken. Please enter a different move.'
        next
      else
        system 'clear'
        puts 'Invalid move. Please enter a number between 1 and 9 (inclusive).'
      end
    end
  end

  def value_valid?(input)
    input.match?(/^[1-9]$/)
  end

  def prompt_input
    puts "Player #{current_player}'s turn. Please enter your move: "
    gets.chomp
  end

  def over?
    board.spaces.none?(' ')
  end
end

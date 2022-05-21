class Game
  attr_reader :player_one, :player_two, :current_player, :board
  attr_accessor :move

  def initialize
    @player_one = Player.new('X')
    @player_two = Player.new('O')
    @current_player = player_one
    @board = Board.new
  end

  def start
    loop do
      valid_move = take_move
      current_player.update_move(valid_move)
      board.record(current_player)
    end
  end

  def take_move
    loop do
      puts "Player #{current_player}'s turn. Please enter your move: "
      player_input = gets.chomp
      if value_valid?(player_input)
        integer_input = player_input.to_i
        return integer_input unless board.taken?(integer_input)

        system 'clear'
        puts 'That space is taken. Please enter a different move.'
        next
      end

      system 'clear'
      puts 'Invalid move. Please enter a number between 1 and 9 (inclusive).'
    end
  end

  def value_valid?(input)
    input.match?(/^[1-9]$/)
  end
end

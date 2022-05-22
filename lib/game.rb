class Game
  attr_reader :current_player, :board
  attr_accessor :move, :players

  def initialize
    @players = [Player.new('X'), Player.new('O')]
    @current_player = players[0]
    @board = Board.new
  end

  def play
    turn until over?
    show_result
  end

  def turn
    valid_move = take_move
    current_player.update_move(valid_move)
    board.record(current_player)
    players.rotate!
    @current_player = players[0]
  end

  def take_move
    player_input = prompt_input
    if value_valid?(player_input)
      return player_input unless board.taken?(player_input)

      system 'clear'
      puts 'That space is taken. Please enter a different move.'
    else
      system 'clear'
      puts 'Invalid move. Please enter a number between 1 and 9 (inclusive).'
    end
    take_move
  end

  def value_valid?(input)
    input.between?(1, 9)
  end

  def prompt_input
    puts "Player #{current_player}'s turn. Please enter your move: "
    gets.chomp.to_i
  end

  def over?
    board.full?
  end

  def show_result
    puts "GAME OVER! It's a draw." if board.full?
  end
end

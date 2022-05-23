require './lib/game'

describe Game do
  describe '#play' do
    subject(:play_game) { described_class.new }

    before do
      allow(play_game).to receive(:turn)
      allow(play_game).to receive(:show_result)
    end

    context 'when #over is false once' do
      before do
        allow(play_game).to receive(:over?).and_return(false, true)
      end

      it 'calls #turn once' do
        expect(play_game).to receive(:turn).once
        play_game.play
      end

      it 'calls #show_result once' do
        expect(play_game).to receive(:show_result).once
        play_game.play
      end
    end

    context 'when #over is false 5 times' do
      before do
        allow(play_game).to receive(:over?).and_return(false, false, false, false, false, true)
      end

      it 'calls #turn 5 times' do
        expect(play_game).to receive(:turn).exactly(5).times
        play_game.play
      end

      it 'calls #show_result once' do
        expect(play_game).to receive(:show_result).once
        play_game.play
      end
    end
  end

  describe '#turn' do
    subject(:turn_game) { described_class.new(board: test_board, player_one: test_player) }

    let(:test_board) { instance_double(Board) }
    let(:test_player) { instance_double(Player, move: 3) }

    before do
      allow(turn_game).to receive(:valid_move)
      allow(test_board).to receive(:update)
    end

    it 'sends Board#update' do
      turn_game.turn
      expect(test_board).to have_received(:update).with(test_player)
    end
  end

  describe '#over?' do
    subject(:test_game) { described_class.new(board: test_board) }

    let(:test_board) { instance_double(Board) }

    before do
      allow(test_board).to receive(:full?)
      allow(test_board).to receive(:three_in_a_row?)
    end

    it 'sends Board#full?' do
      test_game.over?
      expect(test_board).to have_received(:full?)
    end

    it 'sends Board#three_in_a_row?' do
      test_game.over?
      expect(test_board).to have_received(:three_in_a_row?)
    end
  end

  describe '#valid?' do
    subject(:move_game) { described_class.new(board: test_board) }

    let(:test_board) { instance_double(Board) }

    context 'when Player#move is not an accepted value' do
      it "writes the 'invalid move' error to @error" do
        player_move = 0
        error_message = 'Invalid move. Please enter a number between 1 and 9 (inclusive).'
        move_game.valid?(player_move)
        expect(move_game.error).to eql(error_message)
      end
    end

    context 'when Player#move is an accepted value and board space is not taken' do
      before do
        allow(test_board).to receive(:taken?).and_return(false)
      end

      it '@error is nil' do
        player_move = 3
        move_game.valid?(player_move)
        expect(move_game.error).to be_nil
      end
    end

    context 'when Player#move is an accepted value and board space is taken' do
      before do
        allow(test_board).to receive(:taken?).and_return(true)
      end

      it "writes the 'space is taken' error to @error" do
        player_move = 3
        error_message = 'That space is taken. Please enter a different move.'
        move_game.valid?(player_move)
        expect(move_game.error).to eql(error_message)
      end
    end
  end
end

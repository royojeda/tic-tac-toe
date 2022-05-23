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

  describe '#over?' do
    let(:test_board) { instance_double(Board) }

    subject(:test_game) { described_class.new(test_board) }

    before do
      allow(test_board).to receive(:full?)
      allow(test_board).to receive(:three_in_a_row?)
    end

    it 'sends Board#full?' do
      expect(test_board).to receive(:full?)
      test_game.over?
    end

    it 'sends Board#three_in_a_row?' do
      expect(test_board).to receive(:three_in_a_row?)
      test_game.over?
    end
  end
end

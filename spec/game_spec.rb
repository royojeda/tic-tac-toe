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
end

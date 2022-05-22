require './lib/player'

describe Player do
  describe '#make_move' do
    subject(:player_move) { described_class.new('X') }
    context 'when given a valid input' do
      before do
        valid_input = '7'
        allow(player_move).to receive(:gets).and_return(valid_input)
      end

      it 'writes thte integer value of the input to @move' do
        expect { player_move.make_move }.to change { player_move.instance_variable_get(:@move) }.to(7)
      end
    end
  end
end

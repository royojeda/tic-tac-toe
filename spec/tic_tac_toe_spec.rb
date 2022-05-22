require './lib/player'

describe Player do
  describe '#make_move' do
    subject(:player_move) { described_class.new('X') }

    context 'when given an integer input' do
      before do
        input = '7'
        allow(player_move).to receive(:puts)
        allow(player_move).to receive(:gets).and_return(input)
      end

      it 'writes the integer value of the input to @move' do
        expect { player_move.make_move }.to change { player_move.instance_variable_get(:@move) }.to(7)
      end
    end
    context 'when given a non-integer input' do
      before do
        input = 'd'
        allow(player_move).to receive(:puts)
        allow(player_move).to receive(:gets).and_return(input)
      end

      it 'writes the integer 0 to @move' do
        expect { player_move.make_move }.to change { player_move.instance_variable_get(:@move) }.to(0)
      end
    end
  end
end

require './lib/board'

describe Board do
  describe '#full?' do
    context 'when the board is empty' do
      subject(:empty_board) do
        described_class.new([' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '])
      end

      it 'returns false' do
        expect(empty_board.full?).to be false
      end
    end

    context 'when the board is full' do
      subject(:full_board) do
        described_class.new(['X', 'X', 'O', 'X', 'O', 'O', 'O', 'X', 'x'])
      end

      it 'returns true' do
        expect(full_board.full?).to be true
      end
    end

    context 'when the board is partially filled' do
      subject(:ongoing_board) do
        described_class.new(['X', ' ', 'O', 'X', 'O', ' ', 'O', 'X', ' '])
      end

      it 'returns false' do
        expect(ongoing_board.full?).to be false
      end
    end
  end
end

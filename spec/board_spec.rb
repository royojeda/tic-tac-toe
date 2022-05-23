require './lib/board'

describe Board do
  describe '#taken?' do
    subject(:taken_board) do
      described_class.new([' ', ' ', ' ', 'X', ' ', ' ', ' ', ' ', ' '])
    end

    context 'when the space is taken' do
      it 'returns true' do
        space = 4
        expect(taken_board.taken?(space)).to be true
      end
    end

    context 'when the space is not taken' do
      it 'returns false' do
        space = 3
        expect(taken_board.taken?(space)).to be false
      end
    end
  end

  describe '#update' do
    subject(:game_board) { described_class.new }

    let(:test_player) { instance_double(Player, mark: 'X', move: 5) }

    it 'writes Player mark to @spaces where Player move specifies' do
      specified_space = test_player.move - 1
      expect { game_board.update(test_player) }.to change { game_board.spaces[specified_space] }.to(test_player.mark)
    end

    it 'does not change other elements of @spaces' do
      other_space = test_player.move
      expect { game_board.update(test_player) }.not_to(change { game_board.spaces[other_space] })
    end
  end

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
        described_class.new(%w[X X O X O O O X X])
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

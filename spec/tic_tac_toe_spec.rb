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
    let(:test_player) { double('Player', mark: 'X', move: 5) }
    subject(:game_board) { described_class.new }

    it "writes Player mark to @spaces where Player move specifies" do
      expect { game_board.update(test_player) }.to change { game_board.spaces[test_player.move - 1] }.to(test_player.mark)
    end

    it "does not change other elements of @spaces" do
      expect { game_board.update(test_player) }.not_to change { game_board.spaces[test_player.move] }
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

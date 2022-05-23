require './lib/player'

# describe Player do
#   describe '#make_move' do
#     subject(:player_move) { described_class.new('X') }

#     context 'when given an integer input' do
#       before do
#         input = '7'
#         allow($stdin).to receive(:gets).and_return(input)
#       end

#       it 'writes the integer value of the input to @move' do
#         expect { player_move.make_move }.to change(player_move.move).to(7)
#       end
#     end

#     context 'when given a non-integer input' do
#       before do
#         input = 'd'
#         allow(player_move).to receive(:puts)
#         allow(player_move).to receive(:gets).and_return(input)
#       end

#       it 'writes the integer 0 to @move' do
#         expect { player_move.make_move }.to change { player_move.instance_variable_get(:@move) }.to(0)
#       end
#     end
#   end
# end

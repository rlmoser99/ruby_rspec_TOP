# frozen_string_literal: true

require_relative '../lib/number_game'
require_relative '../lib/game_board'

# describe NumberGame do
#   it { is_expected.to respond_to(:game_solution, :count, :board) }

#   context '#update_board' do
#     context 'when using real object' do
#       it 'is 5' do
#         subject.game_solution = 7
#         subject.board = GameBoard.new
#         subject.update_board('4')
#         expect(subject.board.min).to eq(5)
#       end
#     end

#     context 'when using board double' do
#       it 'is 5' do
#         subject.game_solution = 7
#         subject.board = instance_double(GameBoard)
#         # What is the point of the and_return???
#         allow(subject.board).to receive(:min=).with(5).and_return(5)
#         expect(subject.update_board('4')).to eq(5)
#       end
#     end

#     context 'when using board double' do
#       it 'is 5' do
#         # Still confusing wording to me...
#         subject.game_solution = 7
#         subject.board = instance_double(GameBoard)
#         allow(subject.board).to receive(:min=).with(5)
#         expect(subject.update_board('4')).to eq(5)
#       end
#     end
#   end
# end

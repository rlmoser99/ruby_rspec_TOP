# frozen_string_literal: true

require_relative '../lib/15_binary_search'
require_relative '../lib/15_random_number'
require_relative '../lib/15_display_data'

# The files for this example (#15) builds on the TDD files from #14.
# The FindNumber class is now called BinarySearch, which is a more accurate
# description.

# After TDD is complete, the classes and methods that were used as a test
# double, should be updated to be a 'verifying double' Using a 'verifying
# double' is preferred, because they will produce an error if does not exist
# on the actual class.

# https://relishapp.com/rspec/rspec-mocks/v/3-9/docs/verifying-doubles

# It is common for method and variable names to change during development.
# For example, random_number.value could change to rand_num.number

# Therefore, using a 'verifying double' makes a test more stable.

# Unit testing relies on using doubles to test the object in isolation (not
# dependant on any other object). One important concept to understand is the
# BinarySearch or FindNumber class doesn't care if it is given an actual
# random_number class object. It only cares that it is given an object that
# can respond to certain methods. This concept is called polymorphism
# https://www.geeksforgeeks.org/polymorphism-in-ruby/

# In the file, 14_find_number, you wrote tests for #make_guess, #game_over?, and
# #update_range. We will not re-write them for this example. If you'd like to
# see them again, they are at the bottom of this file.
# before do
#   game.instance_variable_set(:@answer, instance_double(RandomNumber))
#   game.instance_variable_set(:@display, instance_double(DisplayData))
# end

describe BinarySearch do
  subject(:game) { described_class.new(0, 9) }

  before do
    game.instance_variable_set(:@answer, double(RandomNumber))
    # game.instance_variable_set(:@display, instance_double(DisplayData))
    # game.instance_variable_set(:@display, double(DisplayData))
  end

  describe '#max_guesses' do
    context 'when min = 0 and max = 9' do
      it 'is 4' do
        max_guesses = game.max_guesses
        # Better name here?
        expect(max_guesses).to be(4)
      end
    end

    context 'when min = 1 and max = 100' do
      before do
        game.instance_variable_set(:@min, 1)
        game.instance_variable_set(:@max, 100)
      end

      it 'is 7' do
        max_guesses = game.max_guesses
        # better_name here!
        expect(max_guesses).to be(7)
      end
    end
  end

  describe '#start' do
    before do
      # game.instance_variable_set(:@answer, instance_double(RandomNumber))
    end

    it 'shows range' do
      game.instance_variable_set(:@display, double(DisplayData))
      # allow(game.answer).to receive(:value).and_return(4)
      allow(game).to receive(:computer_turns)
      # allow(game.display).to receive(:show_range).with(0, 9)
      # allow(game.display).to receive(:show_answer).with(4)
      # allow(game.display).to receive(:show_count).with(1)
      expect(game.display).to receive(:show_range).with(0, 9)
      game.start
    end
  end

  # describe '#computer_turns' do
  #   context 'when first guess is correct' do
  #     before do
  #       allow(game.answer).to receive(:value).and_return(4)
  #       allow(game.display).to receive(:show_guess).with(1, 4)
  #       allow(game).to receive(:make_guess).and_return(4)
  #       allow(game).to receive(:game_over?).and_return(true)
  #     end

  #     it 'loops one time' do
  #       expect(game.display).to receive(:show_guess).with(1, 4)
  #       game.computer_turns
  #       # expect(game.answer.value).to eq(4)
  #     end
  #   end
  # end

  # describe '#computer_turns' do
  #   before do
  #     game.instance_variable_set(:@answer, instance_double(RandomNumber))
  #     game.instance_variable_set(:@display, instance_double(DisplayData))
  #     # game.instance_variable_set(:@guess, 7)
  #     allow(game).to receive(:make_guess).and_return(4, 8)
  #     allow(game.display).to receive(:show_guess).with(1, 4)
  #     allow(game.display).to receive(:show_guess).with(2, 8)
  #     allow(game.answer).to receive(:value).and_return(8)
  #     allow(game).to receive(:game_over?).and_return(true, false)
  #     allow(game).to receive(:update_range)
  #   end

  #   context 'when using a stub for display_guess' do
  #     context 'when random_number value is 8' do
  #       it 'will loop until guess equals 8' do
  #         expect(game.display).to receive(:show_guess).with(1, 4)
  #         expect(game.display).to receive(:show_guess).with(2, 8)
  #         # expect(game.display).to receive(:show_guess).with(1, 4)
  #         # expect(game.display).to receive(:show_guess).with(2, 7)
  #         # expect(game.display).to receive(:show_guess).with(3, 8)
  #         game.computer_turns
  #         # expect(game.answer.value).to eq(8)
  #       end
  #     end
  #   end
  # end
end

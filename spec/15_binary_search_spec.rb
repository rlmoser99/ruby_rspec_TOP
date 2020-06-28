# frozen_string_literal: true

require_relative '../lib/15_binary_search'
require_relative '../lib/15_random_number'

# rubocop:disable Layout/LineLength, Metrics/BlockLength

# This file is a 'Work In Progress'

# The files for this example (#15) builds on the TDD files from #14.
# The FindNumber class is now called BinarySearch, which is a more accurate description.

# After TDD is complete, the classes and methods that were used as a test double, should be updated to a 'verifying double'
# Using a 'verifying double' is preferred, because they will produce an error if does not exist on the actual class.
# https://relishapp.com/rspec/rspec-mocks/v/3-9/docs/verifying-doubles

# It is common for method and variable names to change during development (random_number.value could change to rand_num.number)
# Therefore, using a 'verifying double' makes a test more stable.

# Unit testing relies on using doubles because it needs test the object in isolation (not dependant on any other object).
# The BinarySearch or FindNumber class doesn't care if it is given an actual class object.
# It only cares that it is given an object that can respond to certain methods.
# This concept is called polymorphism
# https://www.geeksforgeeks.org/polymorphism-in-ruby/

# In the file, 14_find_number, you wrote tests for #make_guess, #game_over?, and #update_range.
# We will not re-write them for this example, but the answer tests are at the bottom of this file, since FindNumber is now called BinarySearch

describe BinarySearch do
  subject(:game) { described_class.new(0, 9, random_number) }
  # A class called RandomNumber now exists, therefore it should be updated to an 'verifying double', like an 'instance_double'
  # https://relishapp.com/rspec/rspec-mocks/v/3-9/docs/verifying-doubles/using-an-instance-double
  let(:random_number) { instance_double('random_number', value: 8) }

  # The #computer_guess method calls 4 different methods (#make_guess, #display_guess, #game_over? and #update_range).

  # The #display_guess method is a protected method and does not need to be tested in unit testing.
  # For this test, the #display_guess method an example of a method may take a long time to complete, such as connecting to a database.
  # To test #computer_guess, we are going to stub #display_guess so that this unit test can run quickly and efficently.
  # https://relishapp.com/rspec/rspec-mocks/v/2-99/docs/method-stubs

  describe '#computer_guess' do
    it 'should loop until guess equals 8' do
      # These 3 lines are stubs of the #display_guess method. For this test, a loop will call this method 3 times.
      allow(game).to receive(:display_guess).with(1) # the turn count = 1
      allow(game).to receive(:display_guess).with(2) # the turn count = 2
      allow(game).to receive(:display_guess).with(3) # the turn count = 3
      game.computer_guess
      guess = game.guess
      expect(guess).to eq(8)
    end
    # Now comment out the 3 stubs above and re-run the test.
    # The #display guess method includes sleep(3) to mimic a method that takes a long time to complete, such as connecting to a database.

    # ASSIGNMENT

    # Change the #make_guess method (lib/15_binary_search) to include sleep, with any number that you'd like.
    # Then create a method stub for it that will return the correct value of each guess.
    # By providing the return values to test, the time of the test is shortened.

    it 'should loop until guess equals 8' do
      # Make 1 stub for #make_guess that will return the correct value of each guess.
      allow(game).to receive(:make_guess).and_return(4, 7, 8) # REMOVE
      # These 3 lines are a stub of the #display_guess method.
      allow(game).to receive(:display_guess).with(1)
      allow(game).to receive(:display_guess).with(2)
      allow(game).to receive(:display_guess).with(3)
      game.computer_guess
      guess = game.guess
      expect(guess).to eq(8)
    end
  end

  # STUB puts so that it doesn't show up when test runs.
  describe '#start' do
    it 'should loop until guess equals 8' do
      allow(game).to receive(:puts).twice # REMOVE
      allow(game).to receive(:display_guess).with(1) # REMOVE
      allow(game).to receive(:display_guess).with(2) # REMOVE
      allow(game).to receive(:display_guess).with(3) # REMOVE
      game.start
      guess = game.guess
      expect(guess).to eq(8)
    end
  end
end

# These tests are from spec_answers/14_find_number_answer (with instance_double)

# describe BinarySearch do
#   describe '#make_guess' do
#     subject(:game) { described_class.new(0, 9, random_number) }
#     let(:random_number) { instance_double('random_number', value: 8) }

#     context 'when min is 0 and max is 9' do
#       it 'should be 4' do
#         guess = game.make_guess
#         expect(guess).to eq(4)
#       end
#     end

#     context 'when min is 5 and max is 9' do
#       it 'should be 7' do
#         game.min = 5
#         guess = game.make_guess
#         expect(guess).to eq(7)
#       end
#     end

#     context 'when min is 8 and max is 9' do
#       it 'should be 8' do
#         game.min = 8
#         guess = game.make_guess
#         expect(guess).to eq(8)
#       end
#     end

#     context 'when min is 0 and max is 3' do
#       it 'should be 1' do
#         game.max = 3
#         guess = game.make_guess
#         expect(guess).to eq(1)
#       end
#     end

#     context 'when min and max both equal 3' do
#       it 'should be 3' do
#         game.min = 3
#         game.max = 3
#         guess = game.make_guess
#         expect(guess).to eq(3)
#       end
#     end
#   end

#   describe '#game_over?' do
#     let(:random_number) { instance_double('random_number', value: 3) }
#     subject(:game) { described_class.new(0, 9, random_number) }

#     context 'when guess and random_number.value equal' do
#       it 'should be game over' do
#         game.guess = 3
#         expect(game).to be_game_over
#       end
#     end

#     context 'when guess and random_number.value is not equal' do
#       it 'should not be game over' do
#         game.guess = 4
#         expect(game).to_not be_game_over
#       end
#     end
#   end

#   describe '#update_range' do
#     let(:random_number) { instance_double('random_number', value: 8) }
#     subject(:game) { described_class.new(0, 9, random_number) }

#     context 'when the guess is 4' do
#       it 'should only update min' do
#         game.guess = 4
#         game.update_range
#         minimum = game.min
#         maximum = game.max
#         expect(minimum).to eq(5)
#         expect(maximum).to eq(9)
#       end
#     end

#     context 'when the guess is 9' do
#       it 'should only update max' do
#         game.guess = 9
#         game.update_range
#         minimum = game.min
#         maximum = game.max
#         expect(minimum).to eq(0)
#         expect(maximum).to eq(8)
#       end
#     end

#     context 'when the guess is 7, with min=5 and max=8' do
#       it 'should update min to the same value as max' do
#         game.min = 5
#         game.max = 8
#         game.guess = 7
#         game.update_range
#         minimum = game.min
#         maximum = game.max
#         expect(minimum).to eq(8)
#         expect(maximum).to eq(8)
#       end
#     end
#   end
# end

# rubocop:enable Layout/LineLength, Metrics/BlockLength

# frozen_string_literal: true

require_relative '../lib/15_binary_search'
require_relative '../lib/15_random_number'

# rubocop:disable Layout/LineLength, Metrics/BlockLength

# The files for this example (#15) builds on the TDD files from #14.
# The FindNumber class is now called BinarySearch, which is a more accurate description.

# After TDD is complete, the classes and methods that were used as a test double, should be updated to be a 'verifying double'
# Using a 'verifying double' is preferred, because they will produce an error if does not exist on the actual class.
# https://relishapp.com/rspec/rspec-mocks/v/3-9/docs/verifying-doubles

# It is common for method and variable names to change during development (random_number.value could change to rand_num.number)
# Therefore, using a 'verifying double' makes a test more stable.

# Unit testing relies on using doubles to test the object in isolation (not dependant on any other object).
# One important concept to understand is the BinarySearch or FindNumber class doesn't care if it is given an actual random_number class object.
# It only cares that it is given an object that can respond to certain methods.
# This concept is called polymorphism
# https://www.geeksforgeeks.org/polymorphism-in-ruby/

# In the file, 14_find_number, you wrote tests for #make_guess, #game_over?, and #update_range.
# We will not re-write them for this example. If you'd like to see them again, they are at the bottom of this file.

describe BinarySearch do
  describe '#max_guesses' do
    subject(:game_six) { described_class.new(0, 9, random_six) }
    # A class called RandomNumber now exists, therefore it should be updated to an 'verifying double', like an 'instance_double'
    # https://relishapp.com/rspec/rspec-mocks/v/3-9/docs/verifying-doubles/using-an-instance-double
    let(:random_six) { instance_double('random_number', value: 6) }

    # ASSIGNMENT

    # Write one test for #max_guesses (hint: it will be 4 with the above game subject & let variable)
    # This is using the formula to calculate the maximum number of guesses for a binary search
    context 'when max is 9 and min is 0' do
    end
  end

  # The #computer_turns method calls 4 different methods (#make_guess, #display_guess, #game_over? and #update_range).

  # The #display_guess method is a protected method and does not need to be tested in unit testing.
  # For this test, the #display_guess method an example of a method may take a long time to complete, such as connecting to a database.
  # To test #computer_turns, we are going to stub #display_guess so that this unit test can run quickly and efficiently.
  # https://relishapp.com/rspec/rspec-mocks/v/2-99/docs/method-stubs

  describe '#computer_turns' do
    subject(:game_eight) { described_class.new(0, 9, random_eight) }
    let(:random_eight) { instance_double('random_number', value: 8) }

    context 'when using a stub for display_guess' do
      context 'when random_number value is 8' do
        it 'will loop until guess equals 8' do
          # These 3 lines are stubs of the #display_guess method. For this test, a loop will call this method 3 times.
          allow(game_eight).to receive(:display_guess).with(1) # for the turn count = 1 loop
          allow(game_eight).to receive(:display_guess).with(2) # for the turn count = 2 loop
          allow(game_eight).to receive(:display_guess).with(3) # for the turn count = 3 loop
          game_eight.computer_turns
          guess = game_eight.guess
          expect(guess).to eq(8)
        end
        # Now comment out the 3 stubs above and re-run the test.
        # The #display guess method includes sleep(3) to mimic a method that takes a long time to complete, such as connecting to a database.
      end
    end

    # ASSIGNMENT

    # Change the #make_guess method in the file: lib/15_binary_search to include sleep, with any number that you'd like.

    # Create a method stub for #make_guess that will return the correct value of 3 guesses.
    # In the display_guess stub the return value of the method was not neccesary
    # The stub for #make_guess requires a return value to break the loop in #computer_turns.

    context 'when using a stub for display_guess and make_guess' do
      context 'when random_number value is 8' do
        # remove the 'x' before running this test
        xit 'will loop until guess equals 8' do
          # Make 1 stub for #make_guess that will return the values of 4, 7, 8 (the mid-point of min & max)

          # Write the 3 stubs for #display_guess

          game_eight.computer_turns
          guess = game_eight.guess
          expect(guess).to eq(8)
        end
      end
    end
  end

  # ASSIGNMENT

  # Write at least 1 test for the #start method.
  # Bonus: Can you remove the two puts statements from outputting when the test is run?

  describe '#start' do
  end
end

# These tests are updated from the previous #14 example (with instance_doubles)

# describe BinarySearch do
#   describe '#make_guess' do
#     subject(:game) { described_class.new(0, 9, random_number) }
#     let(:random_number) { instance_double('random_number', value: 8) }

#     context 'when min is 0 and max is 9' do
#       it 'returns 4' do
#         guess = game.make_guess
#         expect(guess).to eq(4)
#       end
#     end

#     context 'when min is 5 and max is 9' do
#       it 'returns 7' do
#         game.instance_variable_set(:@min, 5)
#         guess = game.make_guess
#         expect(guess).to eq(7)
#       end
#     end

#     context 'when min is 8 and max is 9' do
#       it 'returns 8' do
#         game.instance_variable_set(:@min, 8)
#         guess = game.make_guess
#         expect(guess).to eq(8)
#       end
#     end

#     context 'when min is 0 and max is 3' do
#       it 'returns 1' do
#         game.instance_variable_set(:@max, 3)
#         guess = game.make_guess
#         expect(guess).to eq(1)
#       end
#     end

#     context 'when min and max both equal 3' do
#       it 'returns 3' do
#         game.instance_variable_set(:@min, 3)
#         game.instance_variable_set(:@max, 3)
#         guess = game.make_guess
#         expect(guess).to eq(3)
#       end
#     end
#   end

#   describe '#game_over?' do
#     let(:random_three) { instance_double('random_number', value: 3) }
#     subject(:game_three) { described_class.new(0, 9, random_three) }

#     context 'when guess and random_number equal' do
#       it 'is game over' do
#         game_three.instance_variable_set(:@guess, 3)
#         expect(game_three).to be_game_over
#       end
#     end

#     context 'when guess and random_number does not equal' do
#       it 'is not game over' do
#         game_three.instance_variable_set(:@guess, 4)
#         expect(game_three).to_not be_game_over
#       end
#     end
#   end

#   describe '#update_range' do
#     let(:random_eight) { double('random_number', value: 8) }
#     subject(:game_eight) { described_class.new(0, 9, random_eight) }

#     context 'when the guess is 4' do
#       before do
#         game_eight.instance_variable_set(:@guess, 4)
#         game_eight.update_range
#       end

#       it 'updates min' do
#         minimum = game_eight.min
#         expect(minimum).to eq(5)
#       end

#       it 'does not update max' do
#         maximum = game_eight.max
#         expect(maximum).to eq(9)
#       end
#     end

#     context 'when the guess is 9' do
#       before do
#         game_eight.instance_variable_set(:@guess, 9)
#         game_eight.update_range
#       end

#       it 'updates max' do
#         maximum = game_eight.max
#         expect(maximum).to eq(8)
#       end

#       it 'does not update min' do
#         minimum = game_eight.min
#         expect(minimum).to eq(0)
#       end
#     end

#     context 'when the guess is 7, with min=5 and max=8' do
#       before do
#         game_eight.instance_variable_set(:@min, 5)
#         game_eight.instance_variable_set(:@max, 8)
#         game_eight.instance_variable_set(:@guess, 7)
#         game_eight.update_range
#       end

#       it 'updates min to the same value as max' do
#         minimum = game_eight.min
#         expect(minimum).to eq(8)
#       end

#       it 'does not update max' do
#         maximum = game_eight.max
#         expect(maximum).to eq(8)
#       end
#     end
#   end
# end

# rubocop:enable Layout/LineLength, Metrics/BlockLength

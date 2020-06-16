# frozen_string_literal: true

# rubocop:disable Layout/LineLength

# If you need to test a condition that does not have a built-in matcher, you can create your own.
# Use the satisfy matcher with a block that returns true.
# https://relishapp.com/rspec/rspec-expectations/v/3-9/docs/built-in-matchers/satisfy-matcher
describe 'satisfy matcher' do
  context 'when comparing excluding or providing a failure message' do
    subject { 3627 }

    it 'should be divisable by 3' do
      # rubocop (Lint/AmbiguousBlockAssociation) does not like one-line satisfy without failure message
      # expect(subject).to satisfy { |num| (num % 3).zero? }
      expect(subject).to satisfy do |num|
        (num % 3).zero?
      end
    end

    # The default failure message is not very descriptive or helpful.
    # Therefore, you can provide your own description as an argument.
    it 'should be divisable by 3' do
      expect(subject).to satisfy('be a multiple of 3') { |num| (num % 3).zero? }
    end

    # Change both of the above tests so they fail and compare the differences of the failing tests.
  end

  context 'when using all and satisfy together' do
    subject(:numbers) { [3627, 822, 2601] }
    it 'should all be divisable by 3' do
      expect(numbers).to all satisfy('all be a multiple of 3') { |num| (num % 3).zero? }
    end
  end
end

# ASSIGNMENT

describe 'simple word palindrome test' do
  let(:racecar) { 'racecar' }
  let(:spaceship) { 'spaceship' }
  # Write a test that expresses each of the following statements

  context 'when racecar is used' do
    # remove the 'x' before running this test
    it 'should be a palindrome' do
      expect(racecar).to satisfy('be a palindrome') { |word| word == word.reverse } # REMOVE
    end
  end

  context 'when spaceship is used' do
    # remove the 'x' before running this test
    it 'should not be a palindrome' do
      expect(spaceship).not_to satisfy('be a palindrome') { |word| word == word.reverse } # REMOVE
    end
  end
end

# rubocop:enable Layout/LineLength

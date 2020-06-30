# frozen_string_literal: true

# rubocop:disable Layout/LineLength

# If you need to test a condition that does not have a built-in matcher, you can create your own.
# https://relishapp.com/rspec/rspec-expectations/v/3-9/docs/custom-matchers

describe 'defining custom matchers' do
  context 'when reusing a matcher that is in scope' do
    matcher :be_divisible_by_four do
      match { |num| (num % 4).zero? }
    end

    it 'is divisible by 4' do
      expect(12).to be_divisible_by_four
    end

    # You can test for the inverse of the matcher
    it 'is not divisible by 4' do
      expect(99).not_to be_divisible_by_four
    end

    # You can even use a custom matcher with 'all'
    it 'works with multiple values' do
      expect([12, 100, 800]).to all(be_divisible_by_four)
    end
  end
end

# ASSIGNMENT

describe 'simple word palindrome test' do
  let(:racecar) { 'racecar' }
  let(:spaceship) { 'spaceship' }
  let(:rotator) { 'rotator' }
  let(:palindrome) { 'palindrome' }

  # Write one custom matcher for a simple word palindrome that will pass all of the following tests

  context 'when racecar and rotator is used' do
    # remove the 'x' before running this test
    xit 'is a palindrome' do
      expect(racecar).to be_a_palindrome
      expect(rotator).to be_a_palindrome
    end
  end

  context 'when spaceship and palindrome is used' do
    # remove the 'x' before running this test
    xit 'is not a palindrome' do
      expect(spaceship).not_to be_a_palindrome
      expect(palindrome).not_to be_a_palindrome
    end
  end
end

# rubocop:enable Layout/LineLength

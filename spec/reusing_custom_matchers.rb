# frozen_string_literal: true

# rubocop:disable Layout/LineLength
  
# You can also create a matcher to reuse
# https://relishapp.com/rspec/rspec-expectations/v/3-9/docs/custom-matchers

describe 'defining custom matchers' do
  context 'reusing a matcher that is in scope' do
    matcher :be_divisible_by_four do
      match { |num| (num % 4).zero? }
    end
  
    it 'is divisible by 4' do
      expect(12).to be_divisible_by_four
    end

    it 'is not divisible by 4' do
      expect(99).not_to be_divisible_by_four
    end

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
  # Let's revisit the palindrome test you used in the previous lesson
  # Write one custom matcher that you can use to pass all tests

  matcher :be_a_palindrome do
    match { |string| string.reverse == string }
  end

  context 'when racecar is used' do
    # remove the 'x' before running this test
    it 'should be a palindrome' do
      expect(racecar).to be_a_palindrome
    end
  end

  context 'when spaceship is used' do
    # remove the 'x' before running this test
    it 'should not be a palindrome' do
      expect(spaceship).not_to be_a_palindrome
    end
  end

  context 'when rotator is used' do
    # remove the 'x' before running this test
    it 'should be a palindrome' do
      expect(rotator).to be_a_palindrome
    end
  end

  context 'when palindrome is used' do
    # remove the 'x' before running this test
    it 'should not be a palindrome' do
      expect(palindrome).not_to be_a_palindrome
    end
  end
end

# rubocop:enable Layout/LineLength
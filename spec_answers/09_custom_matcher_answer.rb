# frozen_string_literal: true

# rubocop:disable Layout/LineLength

# ASSIGNMENT

describe 'simple word palindrome test' do
  let(:racecar) { 'racecar' }
  let(:spaceship) { 'spaceship' }
  let(:rotator) { 'rotator' }
  let(:palindrome) { 'palindrome' }

  # Write one custom matcher for a simple word palindrome that will pass all of the following tests

  matcher :be_a_palindrome do
    match { |string| string.reverse == string }
  end

  context 'when racecar and rotator is used' do
    # remove the 'x' before running this test
    it 'is a palindrome' do
      expect(racecar).to be_a_palindrome
      expect(rotator).to be_a_palindrome
    end
  end

  context 'when spaceship and palindrome is used' do
    # remove the 'x' before running this test
    it 'is not a palindrome' do
      expect(spaceship).not_to be_a_palindrome
      expect(palindrome).not_to be_a_palindrome
    end
  end
end

# rubocop:enable Layout/LineLength

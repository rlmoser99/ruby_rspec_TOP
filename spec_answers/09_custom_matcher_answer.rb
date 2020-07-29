# frozen_string_literal: true

# ASSIGNMENT

describe 'one word palindrome test' do
  let(:racecar) { 'racecar' }
  let(:spaceship) { 'spaceship' }
  let(:rotator) { 'rotator' }
  let(:palindrome) { 'palindrome' }

  # Write one custom matcher for a one word palindrome that will pass all
  # of the following tests.

  matcher :be_a_palindrome do
    match { |string| string.reverse == string }
  end

  context 'when a palindrome is used' do
    # remove the 'x' before running this test
    it 'is a palindrome' do
      expect(racecar).to be_a_palindrome
    end

    # remove the 'x' before running this test
    it 'is a palindrome' do
      expect(rotator).to be_a_palindrome
    end
  end

  context 'when a palindrome is not used' do
    # remove the 'x' before running this test
    it 'is not a palindrome' do
      expect(spaceship).not_to be_a_palindrome
    end

    # remove the 'x' before running this test
    it 'is not a palindrome' do
      expect(palindrome).not_to be_a_palindrome
    end
  end
end

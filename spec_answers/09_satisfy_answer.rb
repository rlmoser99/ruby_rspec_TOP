# frozen_string_literal: true

# rubocop:disable Layout/LineLength

describe 'simple word palindrome test' do
  let(:racecar) { 'racecar' }
  let(:spaceship) { 'spaceship' }
  # Write a test that expresses each of the following statements

  context 'when racecar is used' do
    # remove the 'x' before running this test
    it 'should be a palindrome' do
      expect(racecar).to satisfy('be a palindrome') { |word| word == word.reverse }
    end
  end

  context 'when spaceship is used' do
    # remove the 'x' before running this test
    it 'should not be a palindrome' do
      expect(spaceship).not_to satisfy('be a palindrome') { |word| word == word.reverse }
    end
  end
end

# rubocop:enable Layout/LineLength

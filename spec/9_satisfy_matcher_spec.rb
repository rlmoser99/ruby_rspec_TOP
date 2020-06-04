# frozen_string_literal: true

# https://relishapp.com/rspec/rspec-expectations/v/3-9/docs/built-in-matchers/satisfy-matcher

describe 'create your own matcher with satisfy' do
  subject(:numbers) { [3627, 822, 2601] }

  context 'when needing to know if numbers are divisable by 3' do
    it 'divisable by 3' do
      expect(numbers).to all satisfy { |v| v % 3 == 0 }
    end
  end
end

# expect(10).to satisfy { |v| v % 5 == 0 }
# expect(7).not_to satisfy { |v| v % 5 == 0 }
# expect(10).to satisfy("be a multiple of 5") do |v|
#   v % 5 == 0
# end

# it 'can accept a custom error message' do
#   expect(subject).to satisfy('be a palindrome') do |value|
#     value == value.reverse
#   end
# end

# frozen_string_literal: true

# rubocop:disable Layout/LineLength

# Do not use 'be_truthy' or 'be_falsey' for methods that should only be evaluated into a Boolean
# https://eddyluten.com/rspec-be_truthy-exists-or-be-true
describe 'truthy and falsy' do
  context 'almost everything is truthy' do
    it 'should be truthy' do
      expect('foo').to be_truthy
      expect(7).to be_truthy
      expect(0).to be_truthy
      expect(-100).to be_truthy
      expect(3.14159).to be_truthy
      expect([]).to be_truthy
      expect({}).to be_truthy
      expect(:any_symbol).to be_truthy
      expect(true).to be_truthy
    end
  end

  context 'only false and nil are falsy' do
    it 'should be falsy' do
      expect(false).to be_falsy
      expect(nil).to be_falsy
    end
  end
end
# rubocop:enable Layout/LineLength

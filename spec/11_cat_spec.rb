# frozen_string_literal: true

require_relative '../lib/11_cat'
require_relative '../spec/11_shared_example_spec'

# Not only will the class being tested be located in a different file,
# but there are multiple classes for this example. All files begin with '11_'

describe Cat do
  subject(:oscar) { described_class.new('Oscar', 'Maine Coon') }

  context 'when Cat is a superclass of Pet' do
    include_examples 'a pet object'
  end

  context 'when cat has name and breed, but no color' do
    # https://relishapp.com/rspec/rspec-expectations/v/3-9/docs/built-in-matchers/have-attributes-matcher
    it 'should have name, breed & color attributes' do
      expect(subject).to have_attributes(name: 'Oscar', breed: 'Maine Coon', color: nil)
    end
  end
end

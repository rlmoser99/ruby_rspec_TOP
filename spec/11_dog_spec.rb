# frozen_string_literal: true

require_relative '../lib/11_dog'
require_relative '../spec/11_shared_example_spec'

# Not only will the class being tested be located in a different file,
# but there are multiple classes for this example. All files begin with '11_'

describe Dog do
  subject(:toby) { described_class.new('Toby', nil, 'brown') }

  context 'when Dog is a superclass of Pet' do
    include_examples 'a pet object'
  end

  context 'when Dog has duck-typing methods' do
    include_examples 'duck-typing method'
  end

  context 'when dog has name and color, but no breed' do
    it 'should have name, breed & color attributes' do
      expect(subject).to have_attributes(name: 'Toby', breed: nil, color: 'brown')
    end
  end
end

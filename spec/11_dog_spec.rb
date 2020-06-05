# frozen_string_literal: true

require_relative '../lib/11_dog'
require_relative '../spec/11_shared_example_spec'

describe Dog do
  subject(:oscar) { described_class.new('Toby', 'Yorkshire Terrier') }

  context 'when Dog is a superclass of Pet' do
    include_examples 'a pet object'
  end

  it 'should have name, breed & color attributes' do
    expect(subject).to have_attributes(name: 'Toby', breed: 'Yorkshire Terrier', color: nil)
  end
end

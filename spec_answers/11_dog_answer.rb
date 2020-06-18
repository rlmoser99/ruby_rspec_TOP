# frozen_string_literal: true

require_relative '../lib/11_dog'
require_relative '../spec/11_shared_example_spec'

# rubocop:disable Layout/LineLength

describe Dog do
  # create a subject with your choice of cat name and optional breed/color
  subject(:ollie) { described_class.new('Ollie', nil, 'white') }

  # write a test using the second shared_example to test that dog should respond to talk
  context 'when Dog has method name shared with other classes' do
    include_examples 'shared method name'
  end

  # remove the 'x' before running this test
  it 'should like to run' do
    expect(ollie.likes_to_run?).to be true
  end
end
# rubocop:enable Layout/LineLength

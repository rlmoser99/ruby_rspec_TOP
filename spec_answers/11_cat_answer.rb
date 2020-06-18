# frozen_string_literal: true

require_relative '../lib/11_cat'
require_relative '../spec/11_shared_example_spec'

# rubocop:disable Layout/LineLength

# ASSIGNMENT - complete either Cat or Dog assignment

describe Cat do
  # create a subject with your choice of cat name and optional breed/color
  subject(:lucy) { described_class.new('Lucy', 'British Shorthair') }

  # write a test using the second shared_example to test that cat should respond to talk
  context 'when Cat has method name shared with other classes' do
    include_examples 'shared method name'
  end

  # remove the 'x' before running this test
  it 'should like to nap' do
    expect(lucy.likes_to_nap?).to be true
  end
end
# rubocop:enable Layout/LineLength

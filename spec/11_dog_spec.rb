# frozen_string_literal: true

require_relative '../lib/11_dog'
require_relative '../spec/11_shared_example_spec'

# rubocop:disable Layout/LineLength

# There are two classes and multiple files for this example.
# All files begin with '11_'

describe Dog do
  subject(:toby) { described_class.new('Toby', nil, 'brown') }

  # Check out the file: 11_shared_examples_spec.rb
  # This test references that file's first test in the 'include_examples' line
  # The shared_example_spec file has further information
  context 'when Dog is a child class of Pet' do
    include_examples 'base class method name'
  end

  context 'when dog has name and color, but no breed' do
    # https://relishapp.com/rspec/rspec-expectations/v/3-9/docs/built-in-matchers/have-attributes-matcher
    it 'has name, breed & color attributes' do
      expect(toby).to have_attributes(name: 'Toby', breed: nil, color: 'brown')
    end
  end
end

# ASSIGNMENT - complete either Cat or Dog assignment (see 11_cat_spec.rb for Cat assignment)

describe Dog do
  # create a subject with your choice of dog name and optional breed/color

  # write a test using the second shared_example to test that dog should respond to talk
  context '' do
  end

  # remove the 'x' before running this test
  xit 'is not barking' do
  end

  # remove the 'x' before running this test
  xit 'is sleeping' do
  end
end
# rubocop:enable Layout/LineLength

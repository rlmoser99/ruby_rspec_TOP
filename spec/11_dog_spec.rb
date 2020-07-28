# frozen_string_literal: true

require_relative '../lib/11_dog'
require_relative '../spec/11_shared_example_spec'

# This example has a 'Pet' class with two sub-classes 'Cat' and 'Dog'.
# There is a spec file for cat & dog (each file begins with '11_').

# In addition, there is a third spec file called '11_shared_example'.
# This file has two tests that are used in both the cat & dog spec files.

describe Dog do
  subject(:toby) { described_class.new('Toby', nil, 'brown') }

  # Check out the file: 11_shared_examples_spec.rb.
  # This test references that file's first test in the 'include_examples' line.
  # The shared_example_spec file has further information.
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

# ASSIGNMENT - complete either Cat or Dog assignment
# (see 11_cat_spec.rb for Cat assignment)

describe Dog do
  # Create a subject with your choice of dog name and optional breed/color.

  # Write a test using the second shared_example to test that dog should
  # respond to talk ('WOOF!').
  context '' do
  end

  # remove the 'x' before running this test
  xit 'is not barking' do
  end

  # remove the 'x' before running this test
  xit 'is sleeping' do
  end
end

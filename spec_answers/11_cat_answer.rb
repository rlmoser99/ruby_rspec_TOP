# frozen_string_literal: true

require_relative '../lib/11_cat'
require_relative '../spec/11_shared_example_spec'

# This example has a 'Pet' class with two sub-classes 'Cat' and 'Dog'.
# There is a spec file for cat & dog (each file begins with '11_').

# In addition, there is a third spec file called '11_shared_example'.
# This file has two tests that are used in both the cat & dog spec files.

describe Cat do
  subject(:oscar) { described_class.new('Oscar', 'Maine Coon') }

  # Check out the file: 11_shared_examples_spec.rb.
  # This test references that file's first test in the 'include_examples' line.
  # The shared_example_spec file has further information.
  context 'when Cat is a child class of Pet' do
    include_examples 'base class method name'
  end

  context 'when cat has name and breed, but no color' do
    # https://relishapp.com/rspec/rspec-expectations/v/3-9/docs/built-in-matchers/have-attributes-matcher
    it 'has name, breed & color attributes' do
      expect(oscar).to have_attributes(name: 'Oscar', breed: 'Maine Coon', color: nil)
    end
  end
end

# ASSIGNMENT - complete either Cat or Dog assignment

describe Cat do
  # Create a subject with your choice of cat name and optional breed/color.
  subject(:lucy) { described_class.new('Lucy', 'British Shorthair') }

  # Write a test using the second shared_example to test that cat responds to
  # talk ('meow').
  context 'when Cat has method name shared with other classes' do
    include_examples 'shared method name'
  end

  # remove the 'x' before running this test
  it 'is not hungry' do
    expect(lucy).to_not be_hungry
  end

  # remove the 'x' before running this test
  it 'is hiding' do
    expect(lucy).to be_hiding
  end
end

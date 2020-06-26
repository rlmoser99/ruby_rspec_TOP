# frozen_string_literal: true

require_relative '../lib/11_cat'
require_relative '../spec/11_shared_example_spec'

# rubocop:disable Layout/LineLength

# Not only will the class being tested be located in a different file,
# but there are multiple classes for this example. All files begin with '11_'

describe Cat do
  subject(:oscar) { described_class.new('Oscar', 'Maine Coon') }

  # Check out the file: 11_shared_examples_spec.rb
  # This test references that file's first test in the 'include_examples' line
  # The shared_example_spec file has further information
  context 'when Cat is a child class of Pet' do
    include_examples 'base class method name'
  end

  context 'when cat has name and breed, but no color' do
    # When using a method that returns a boolean value & does not take any parameters, you can use magic matchers
    # https://relishapp.com/rspec/rspec-expectations/v/3-9/docs/built-in-matchers/have-attributes-matcher
    it 'should have name, breed & color attributes' do
      expect(subject).to have_attributes(name: 'Oscar', breed: 'Maine Coon', color: nil)
    end
  end

  context 'when using magic matchers' do
    # http://testing-for-beginners.rubymonstas.org/rspec/matchers.html
    it 'should be hiding' do
      expect(oscar).to be_hiding
    end
  end
end

# ASSIGNMENT - complete either Cat or Dog assignment

describe Cat do
  # create a subject with your choice of cat name and optional breed/color
  subject(:lucy) { described_class.new('Lucy', 'British Shorthair') }

  # write a test using the second shared_example to test that cat should respond to talk
  context 'when Cat has method name shared with other classes' do
    include_examples 'shared method name'
  end

  # remove the 'x' before running this test
  it 'should not be hungry' do
    expect(lucy).to_not be_hungry
  end
end
# rubocop:enable Layout/LineLength

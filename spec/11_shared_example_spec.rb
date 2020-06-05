# frozen_string_literal: true

# Not only will the class being tested be located in a different file,
# but there are multiple classes for this example. All files begin with '11_'

# Polymorphism

RSpec.shared_examples 'a pet object' do
  # https://relishapp.com/rspec/rspec-expectations/v/3-9/docs/built-in-matchers/respond-to-matcher
  it 'should respond to meal_time and talk' do
    expect(subject).to respond_to(:meal_time, :talk)
  end
end

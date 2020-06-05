# frozen_string_literal: true

# Not only will the class being tested be located in a different file,
# but there are multiple classes for this example. All files begin with '11_'

# Polymorphism
# Make a 'owner' class that interacts with cat/dog to show duck-typing.

# Instead of inheriting, you can use a module that is included in both classes.

RSpec.shared_examples 'a pet object' do
  # https://relishapp.com/rspec/rspec-expectations/v/3-9/docs/built-in-matchers/respond-to-matcher
  context 'when method is from the base class' do
    it 'should respond to meal_time' do
      expect(subject).to respond_to(:meal_time)
    end
  end
end

RSpec.shared_examples 'duck-typing method' do
  context 'when method is shared in multiple classes' do
    it 'should respond to talk' do
      expect(subject).to respond_to(:talk)
    end
  end
end

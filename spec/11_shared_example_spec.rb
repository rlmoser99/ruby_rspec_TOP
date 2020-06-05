# frozen_string_literal: true

RSpec.shared_examples 'a pet object' do
  # https://relishapp.com/rspec/rspec-expectations/v/3-9/docs/built-in-matchers/respond-to-matcher
  it 'should respond to meal_time and talk' do
    expect(subject).to respond_to(:meal_time, :talk)
  end
end

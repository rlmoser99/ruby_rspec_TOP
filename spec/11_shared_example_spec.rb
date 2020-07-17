# frozen_string_literal: true

# rubocop:disable Layout/LineLength

# Not only will the class being tested be located in a different file,
# but there are multiple classes for this example. All files begin with '11_'

# To learn more about the use of shared examples, check out the documentation:
# https://relishapp.com/rspec/rspec-core/docs/example-groups/shared-examples

# These tests are dependent on using the implicit 'subject' when they are included in a spec file.
RSpec.shared_examples 'base class method name' do
  # This test can be used in Cat and Dog because the method comes from the base class.
  # https://relishapp.com/rspec/rspec-expectations/v/3-9/docs/built-in-matchers/respond-to-matcher
  context 'when method is from the base class' do
    it 'responds to meal_time' do
      expect(subject).to respond_to(:meal_time)
    end
  end
end

RSpec.shared_examples 'shared method name' do
  # This test can be used in Cat and Dog because the same method name is used in both classes
  context 'when method name is the same in multiple classes' do
    it 'responds to talk' do
      expect(subject).to respond_to(:talk)
    end
  end
end

# rubocop:enable Layout/LineLength

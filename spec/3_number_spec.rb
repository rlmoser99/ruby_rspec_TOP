# frozen_string_literal: true

describe Integer do
  # Can explicitly define subject. (the integer class does not work with an implicit subject)
  subject { 3 }

  # Comparison matchers are self explanatory
  # https://relishapp.com/rspec/rspec-expectations/v/3-9/docs/built-in-matchers/comparison-matchers
  it { is_expected.to be < 10 }
  it { is_expected.to be > 0 }
  it { is_expected.to be >= 3 }

  # Instead of using .to, you can use the inverse built in matcher .not_to
  it { is_expected.not_to eq(5) }
  it { is_expected.not_to be_even }
  it { is_expected.not_to be < 0 }

  # Clarification: one-line tests are only recommended when the matcher aligns exactly with the doc string.
  # However, many ruby-ists prefer explicitly writing it out & not using one-line syntex at all.
end

# WIP
# ASSIGNMENT

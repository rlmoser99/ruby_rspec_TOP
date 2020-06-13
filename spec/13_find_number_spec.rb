# frozen_string_literal: true

require_relative '../lib/13_find_number'

describe FindNumber do
  it { is_expected.to respond_to(:answer, :guess) }
end

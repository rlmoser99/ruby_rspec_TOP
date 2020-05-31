# frozen_string_literal: true

require_relative '../lib/user_input'

describe NumberGame do
  context '#verify_input' do
    it 'should return valid number guess' do
      expect(subject.verify_input('3')).to eq('3')
    end
  end
end

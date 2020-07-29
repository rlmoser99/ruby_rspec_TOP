# frozen_string_literal: true

require_relative '../lib/16_caesar_translator'

# Please see file 16_caesar_breaker_spec.rb for the assignments to complete.

# This spec file is for the CaesarTranslator class, which is used by the
# CaesarBreaker class.

describe CaesarTranslator do
  # Incoming Query -> Assert the result
  describe '#translate' do
    context 'when phrase has punctuation' do
      subject(:punctuation_phrase) { described_class.new('Ebiil, Tloia!') }

      it 'shifts entire phrase' do
        punctuation_shift = 1
        punctuation_result = punctuation_phrase.translate(punctuation_shift)
        expect(punctuation_result).to eq('Fcjjm, Umpjb!')
      end
    end
  end
end

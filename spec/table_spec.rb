# frozen_string_literal: true

require_relative '../lib/table'

RSpec.describe Table do
  subject { described_class.new(width: 5, height: 5) }

  describe '#valid_position?' do
    it 'returns true for positions within bounds' do
      expect(subject.valid_position?(0, 0)).to be true
      expect(subject.valid_position?(4, 4)).to be true
    end

    it 'returns false for positions out of bounds' do
      expect(subject.valid_position?(-1, 0)).to be false
      expect(subject.valid_position?(5, 5)).to be false
    end
  end
end

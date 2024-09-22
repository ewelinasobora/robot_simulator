require_relative '../lib/table'

RSpec.describe Table do
  subject { described_class.new(width: 5, height: 5) }

  describe '#initialize' do
    it 'sets the width' do
      expect(subject.width).to eq(5)
    end

    it 'sets the height' do
      expect(subject.height).to eq(5)
    end
  end
end

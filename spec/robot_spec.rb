require_relative '../lib/robot'

RSpec.describe Robot do
  subject { described_class.new() }

  describe '#place' do
    it 'places the robot at the specified position and direction' do
      subject.place(1, 2, 'NORTH')
      expect(subject.x_coordinate).to eq(1)
      expect(subject.y_coordinate).to eq(2)
      expect(subject.facing).to eq('NORTH')
    end

    it 'returns false when placement is invalid' do
      expect(subject.place(-1, 2, 'NORTH')).to be_falsey
    end
  end
end

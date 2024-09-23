require_relative '../lib/robot'

RSpec.describe Robot do
  subject { described_class.new }

  describe '#initialize' do
    it 'initializes with nil coordinates and facing direction' do
      expect(subject.x_coordinate).to be_nil
      expect(subject.y_coordinate).to be_nil
      expect(subject.facing).to be_nil
    end
  end

  describe '#place' do
    it 'places the robot at the given coordinates and facing direction' do
      subject.place(1, 2, 'EAST')
      expect(subject.x_coordinate).to eq(1)
      expect(subject.y_coordinate).to eq(2)
      expect(subject.facing).to eq('EAST')
    end

    it 'does not place the robot if the position is invalid' do
      subject.place(-1, 2, 'EAST')
      expect(subject.x_coordinate).to be_nil
      expect(subject.y_coordinate).to be_nil
      expect(subject.facing).to be_nil
    end

    it 'does not place the robot if the facing direction is invalid' do
      subject.place(1, 2, 'UP')
      expect(subject.x_coordinate).to be_nil
      expect(subject.y_coordinate).to be_nil
      expect(subject.facing).to be_nil
    end
  end

  describe '#move' do
    it 'moves the robot one unit forward in the direction it is currently facing' do
      subject.place(0, 0, 'NORTH')
      subject.move
      expect(subject.y_coordinate).to eq(1)
      expect(subject.x_coordinate).to eq(0)
    end

    it 'does not move the robot if it is not placed' do
      subject.move
      expect(subject.x_coordinate).to be_nil
      expect(subject.y_coordinate).to be_nil
    end
  end

  describe '#rotate' do
    before do
      subject.place(0, 0, 'NORTH')
    end

    it 'rotates the robot 90 degrees to the left' do
      subject.rotate('LEFT')
      expect(subject.facing).to eq('WEST')
    end

    it 'rotates the robot 90 degrees to the right' do
      subject.rotate('RIGHT')
      expect(subject.facing).to eq('EAST')
    end

    it 'does not rotate the robot if the direction is invalid' do
      subject.rotate('DOWN')
      expect(subject.facing).to eq('NORTH')
    end
  end
end

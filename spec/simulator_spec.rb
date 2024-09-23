require_relative '../lib/robot'
require_relative '../lib/table'
require_relative '../lib/simulator'

RSpec.describe Simulator do
  let(:table) { Table.new(width: 5, height: 5) }
  let(:robot) { Robot.new }
  subject { described_class.new(table: table, robot: robot) }

  describe '#place_robot' do
    it 'executes robot valid placement' do
      subject.place_robot(0,0,'NORTH')
      expect(robot.x_coordinate).to eq(0)
      expect(robot.y_coordinate).to eq(0)
      expect(robot.facing).to eq('NORTH')
      expect(subject.report).to eq('0,0,NORTH')
    end

    it 'raises error for invalid placement' do
      expect { subject.place_robot(6,6,'NORTH') }.to raise_error('Invalid position: (6, 6) is outside the table bounds.')
    end
  end

  describe '#move_robot' do
    it 'executes robot valid movement' do
      subject.place_robot(0,0,'NORTH')
      subject.move_robot
      expect(subject.report).to eq('0,1,NORTH')
    end

    it 'does not move robot if not placed' do
      subject.move_robot
      expect(subject.report).to be_nil
    end

    it 'does not move robot if it would fall off the table' do
      subject.place_robot(0,0,'SOUTH')
      subject.move_robot
      expect(subject.report).to eq('0,0,SOUTH')
    end
  end

  describe '#rotate_robot' do
    it 'rotates robot to the left' do
      subject.place_robot(0,0,'NORTH')
      subject.rotate_robot('LEFT')
      expect(subject.report).to eq('0,0,WEST')
    end

    it 'rotates robot to the right' do
      subject.place_robot(0,0,'NORTH')
      subject.rotate_robot('RIGHT')
      expect(subject.report).to eq('0,0,EAST')
    end
  end

  describe 'complex movements' do
    it 'executes a sequence of movements and rotations' do
      subject.place_robot(1,2,'EAST')
      subject.move_robot
      subject.move_robot
      subject.rotate_robot('LEFT')
      subject.move_robot
      expect(subject.report).to eq('3,3,NORTH')
    end
  end
end

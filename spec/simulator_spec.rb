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
end

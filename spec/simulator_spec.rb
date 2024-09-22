require_relative '../lib/robot'
require_relative '../lib/table'
require_relative '../lib/simulator'

RSpec.describe Simulator do
  let(:table) { Table.new(width: 5, height: 5) }
  let(:robot) { Robot.new }
  subject { described_class.new(table: table, robot: robot) }
end

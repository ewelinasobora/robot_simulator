# frozen_string_literal: true

module Errors
  # Base error class for the robot simulator
  class RobotSimulatorError < StandardError; end

  class InvalidPositionError < RobotSimulatorError
    def initialize(x_coordinate, y_coordinate)
      super("Invalid position: (#{x_coordinate}, #{y_coordinate}) is outside the table bounds.")
    end
  end

  class InvalidDirectionError < RobotSimulatorError
    def initialize(direction)
      super("Invalid direction: #{direction} is not a valid direction.")
    end
  end

  class RobotNotPlacedError < RobotSimulatorError
    def initialize
      super('Robot is not placed on the table.')
    end
  end

  class MoveIgnoredError < RobotSimulatorError
    def initialize
      super('Move ignored to prevent falling off the table.')
    end
  end
end

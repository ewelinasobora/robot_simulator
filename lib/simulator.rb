# frozen_string_literal: true

require_relative '../errors/error_messages'
require_relative '../errors/error_handler'

class Simulator
  include ErrorHandler

  attr_reader :table, :robot

  def initialize(table:, robot:)
    @table = table
    @robot = robot
  end

  def place_robot(x_position, y_position, direction)
    handle_errors do
      unless table.position_within_bounds?(x_position, y_position)
        raise Errors::InvalidPositionError.new(x_position, y_position)
      end

      raise Errors::InvalidDirectionError, direction unless Robot::DIRECTIONS.include?(direction)

      robot.place(x_position, y_position, direction)
    end
  end

  def move_robot
    handle_errors do
      raise Errors::RobotNotPlacedError unless placed?

      new_x, new_y = next_position

      raise Errors::MoveIgnoredError unless table.position_within_bounds?(new_x, new_y)

      robot.move
    end
  end

  def rotate_robot(direction)
    handle_errors do
      raise Errors::RobotNotPlacedError unless placed?

      robot.rotate(direction)
    end
  end

  def report
    handle_errors do
      raise Errors::RobotNotPlacedError unless placed?

      "#{robot.x_coordinate},#{robot.y_coordinate},#{robot.facing}"
    end
  end

  private

  def next_position
    case robot.facing
    when 'NORTH'
      [robot.x_coordinate, robot.y_coordinate + 1]
    when 'EAST'
      [robot.x_coordinate + 1, robot.y_coordinate]
    when 'SOUTH'
      [robot.x_coordinate, robot.y_coordinate - 1]
    when 'WEST'
      [robot.x_coordinate - 1, robot.y_coordinate]
    end
  end

  def placed?
    robot.x_coordinate && robot.y_coordinate && robot.facing
  end
end

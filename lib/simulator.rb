# frozen_string_literal: true

require_relative '../errors/error_messages'

class Simulator
  attr_reader :table, :robot

  def initialize(table:, robot:)
    @table = table
    @robot = robot
  end

  def place_robot(x_position, y_position, direction)
    unless table.position_within_bounds?(x_position, y_position)
      raise Errors::InvalidPositionError.new(x_position, y_position)
    end

    raise Errors::InvalidDirectionError, direction unless Robot::DIRECTIONS.include?(direction)

    robot.place(x_position, y_position, direction)
  end

  def move_robot
    raise Errors::RobotNotPlacedError unless placed?

    new_x, new_y = next_position

    raise Errors::MoveIgnoredError unless table.position_within_bounds?(new_x, new_y)

    robot.move
  end

  def rotate_robot(direction)
    raise Errors::RobotNotPlacedError unless placed?

    robot.rotate(direction)
  end

  def report
    raise Errors::RobotNotPlacedError unless placed?

    "#{robot.x_coordinate},#{robot.y_coordinate},#{robot.facing}"
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

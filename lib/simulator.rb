# frozen_string_literal: true

class Simulator
  attr_reader :table, :robot

  def initialize(table:, robot:)
    @table = table
    @robot = robot
  end

  def place_robot(x, y, direction)
    raise "Invalid position: (#{x}, #{y}) is outside the table bounds." unless @table.valid_position?(x, y)

    robot.place(x, y, direction)
  end

  def move_robot
    return unless placed?

    new_x, new_y = next_position

    if table.valid_position?(new_x, new_y)
      robot.move
    else
      puts 'Move ignored to prevent falling off the table'
    end
  end

  def rotate_robot(direction)
    return unless placed?

    robot.rotate(direction)
  end

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

  def report
    return unless placed?

    "#{robot.x_coordinate},#{robot.y_coordinate},#{robot.facing}"
  end

  private

  def placed?
    robot.x_coordinate && robot.y_coordinate && robot.facing
  end
end

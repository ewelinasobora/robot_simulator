class Simulator
  attr_reader :table, :robot

  def initialize(table:, robot:)
    @table = table
    @robot = robot
  end

  def place_robot(x, y, direction)
    if @table.valid_position?(x, y)
      robot.place(x, y, direction)
    else
      raise "Invalid position: (#{x}, #{y}) is outside the table bounds."
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

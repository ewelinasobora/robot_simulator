class Robot
  DIRECTIONS = %w(NORTH EAST SOUTH WEST)

  attr_accessor :x_coordinate, :y_coordinate, :facing

  def initialize(x_coordinate: nil, y_coordinate: nil, facing: nil)
    @x_coordinate = x_coordinate
    @y_coordinate = y_coordinate
    @facing = facing
  end

  def place(x, y, f)
    return unless valid_position?(x, y) && DIRECTIONS.include?(f)

    @x_coordinate = x
    @y_coordinate = y
    @facing = f
  end

  private
  def valid_position?(x, y)
    x >= 0 && y >= 0
  end
end
